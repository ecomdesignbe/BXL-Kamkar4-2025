#!/bin/bash

# =============================================================================
# DAEMON DE SURVEILLANCE CONTINUE
# Surveillance en arrière-plan avec alertes automatiques
# =============================================================================

# Configuration
DAEMON_NAME="system_monitor_daemon"
PID_FILE="/var/run/${DAEMON_NAME}.pid"
LOG_FILE="/var/log/${DAEMON_NAME}.log"
ALERT_LOG="/var/log/${DAEMON_NAME}_alerts.log"
CHECK_INTERVAL=60  # Intervalle en secondes entre les vérifications

# Seuils d'alerte
CPU_ALERT_THRESHOLD=85
MEMORY_ALERT_THRESHOLD=90
DISK_ALERT_THRESHOLD=95
LOAD_ALERT_THRESHOLD=5.0

# Configuration des alertes
ALERT_EMAIL="admin@localhost"
ENABLE_EMAIL_ALERTS=false
ENABLE_SYSLOG_ALERTS=true

# =============================================================================
# FONCTIONS UTILITAIRES
# =============================================================================

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_alert() {
    local message="ALERT: $1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a "$ALERT_LOG"
    
    # Envoi vers syslog
    if [ "$ENABLE_SYSLOG_ALERTS" = true ]; then
        logger -t "$DAEMON_NAME" "$message"
    fi
    
    # Envoi par email (si configuré)
    if [ "$ENABLE_EMAIL_ALERTS" = true ] && command -v mail &> /dev/null; then
        echo "$message" | mail -s "System Alert - $(hostname)" "$ALERT_EMAIL"
    fi
    
    log_message "$message"
}

# =============================================================================
# FONCTIONS DE SURVEILLANCE
# =============================================================================

check_cpu_usage() {
    local cpu_usage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk -F'id,' -v prefix="" '{split($1, vs, ","); v=vs[length(vs)]; sub("%", "", v); print 100 - v}')
    
    if (( $(echo "$cpu_usage > $CPU_ALERT_THRESHOLD" | bc -l) )); then
        log_alert "CPU usage high: ${cpu_usage}% (threshold: ${CPU_ALERT_THRESHOLD}%)"
        
        # Capture des processus consommant beaucoup de CPU
        echo "Top CPU processes at $(date):" >> "$ALERT_LOG"
        ps aux --sort=-%cpu | head -6 >> "$ALERT_LOG"
        echo "---" >> "$ALERT_LOG"
    fi
}

check_memory_usage() {
    local memory_usage
    memory_usage=$(free | grep Mem | awk '{printf "%.1f", ($3/$2) * 100.0}')
    
    if (( $(echo "$memory_usage > $MEMORY_ALERT_THRESHOLD" | bc -l) )); then
        log_alert "Memory usage high: ${memory_usage}% (threshold: ${MEMORY_ALERT_THRESHOLD}%)"
        
        # Capture des processus consommant beaucoup de mémoire
        echo "Top Memory processes at $(date):" >> "$ALERT_LOG"
        ps aux --sort=-%mem | head -6 >> "$ALERT_LOG"
        echo "---" >> "$ALERT_LOG"
    fi
}

check_disk_usage() {
    while read -r line; do
        local usage partition
        usage=$(echo "$line" | awk '{print $5}' | sed 's/%//')
        partition=$(echo "$line" | awk '{print $6}')
        
        if [ "$usage" -gt "$DISK_ALERT_THRESHOLD" ]; then
            log_alert "Disk usage high on $partition: ${usage}% (threshold: ${DISK_ALERT_THRESHOLD}%)"
        fi
    done < <(df -h | grep -E '^/dev/' | grep -v 'tmpfs')
}

check_load_average() {
    local load_avg
    load_avg=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | sed 's/,//')
    
    if (( $(echo "$load_avg > $LOAD_ALERT_THRESHOLD" | bc -l) )); then
        log_alert "Load average high: ${load_avg} (threshold: ${LOAD_ALERT_THRESHOLD})"
    fi
}

check_failed_services() {
    local failed_services
    failed_services=$(systemctl list-units --failed --no-pager --no-legend | wc -l)
    
    if [ "$failed_services" -gt 0 ]; then
        log_alert "Failed services detected: $failed_services"
        systemctl list-units --failed --no-pager >> "$ALERT_LOG"
        echo "---" >> "$ALERT_LOG"
    fi
}

check_authentication_failures() {
    local auth_failures
    # Vérifier les échecs d'authentification dans les 5 dernières minutes
    auth_failures=$(grep "$(date '+%b %d %H:%M' -d '5 minutes ago')" /var/log/auth.log 2>/dev/null | grep -c "authentication failure\|Failed password" || echo 0)
    
    if [ "$auth_failures" -gt 5 ]; then
        log_alert "Multiple authentication failures detected: $auth_failures in last 5 minutes"
        
        # Capture des IPs suspectes
        echo "Suspicious IPs at $(date):" >> "$ALERT_LOG"
        grep "$(date '+%b %d %H:%M' -d '5 minutes ago')" /var/log/auth.log 2>/dev/null | \
        grep "Failed password" | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | \
        sort | uniq -c | sort -nr >> "$ALERT_LOG"
        echo "---" >> "$ALERT_LOG"
    fi
}

check_zombie_processes() {
    local zombie_count
    zombie_count=$(ps aux | awk '{print $8}' | grep -c Z)
    
    if [ "$zombie_count" -gt 0 ]; then
        log_alert "Zombie processes detected: $zombie_count"
        ps aux | grep -E 'Z|<defunct>' >> "$ALERT_LOG"
        echo "---" >> "$ALERT_LOG"
    fi
}

#Patch 1.1
check_swap_usage() {
    local swap_used
    swap_used=$(free | awk '/Swap:/ {if ($2 != 0) printf "%.1f", ($3/$2)*100; else print 0}')
    
    if (( $(echo "$swap_used > 10.0" | bc -l) )); then
        log_alert "Swap usage high: ${swap_used}%"
    fi
}

check_cpu_temperature() {
    if command -v sensors &>/dev/null; then
        local temp
        temp=$(sensors | grep -m 1 'Package id 0:' | grep -o '[0-9]\{2,\}\.[0-9]' | head -n 1)
        
        if [ -n "$temp" ] && (( $(echo "$temp > 75.0" | bc -l) )); then
            log_alert "CPU temperature high: ${temp}°C"
        fi
     else
        log_message "sensors command not found or CPU temperature info unavailable"   
    fi
}

check_disk_io_wait() {
    if command -v iostat &>/dev/null; then
        local io_wait
        io_wait=$(iostat -c 1 2 | awk '/^ / {print $4}' | awk 'NR==2')
        
        if (( $(echo "$io_wait > 20.0" | bc -l) )); then
            log_alert "High disk I/O wait: ${io_wait}%"
        fi
    fi
}


check_network_anomalies() {
    # Vérifier les connexions réseau suspectes
    local suspicious_connections
    suspicious_connections=$(netstat -an | grep ESTABLISHED | grep -v -E ':22|:80|:443|:53|:25|:110|:143|:993|:995' | wc -l)
    
    if [ "$suspicious_connections" -gt 10 ]; then
        log_alert "Suspicious network connections detected: $suspicious_connections"
        echo "Suspicious connections at $(date):" >> "$ALERT_LOG"
        netstat -an | grep ESTABLISHED | grep -v -E ':22|:80|:443|:53|:25|:110|:143|:993|:995' >> "$ALERT_LOG"
        echo "---" >> "$ALERT_LOG"
    fi
}

MAX_LOG_SIZE=500000  # en octets (~500 Ko)

rotate_logs() {
    for file in "$LOG_FILE" "$ALERT_LOG"; do
        if [ -f "$file" ] && [ "$(stat -c%s "$file")" -gt "$MAX_LOG_SIZE" ]; then
            rm -f "${file}.old"
            mv "$file" "${file}.old"
            touch "$file"
            log_message "Log file $file rotated"
        fi
    done
}


# =============================================================================
# FONCTION PRINCIPALE DE SURVEILLANCE
# =============================================================================

run_monitoring_cycle() {
    rotate_logs
    log_message "Starting monitoring cycle"
    
    # Exécuter toutes les vérifications
    check_cpu_usage
    check_memory_usage
    check_disk_usage
    check_load_average
    check_failed_services
    check_authentication_failures
    check_zombie_processes
    check_network_anomalies
    check_swap_usage
    check_cpu_temperature
    check_disk_io_wait
    
    log_message "Monitoring cycle completed"
}

# =============================================================================
# GESTION DU DAEMON
# =============================================================================

start_daemon() {
    if [ -f "$PID_FILE" ]; then
        local pid
        pid=$(cat "$PID_FILE")
        if kill -0 "$pid" 2>/dev/null; then
            echo "Daemon already running with PID $pid"
            exit 1
        else
            rm -f "$PID_FILE"
        fi
    fi
    
    echo "Starting $DAEMON_NAME..."
    
    # Créer les fichiers de log si nécessaire
    touch "$LOG_FILE" "$ALERT_LOG"
    
    # Démarrer le daemon en arrière-plan
    (
        echo $$ > "$PID_FILE"
        log_message "Daemon started with PID $$"
        
        # Boucle principale
        while true; do
            run_monitoring_cycle
            sleep "$CHECK_INTERVAL"
        done
    ) &
    
    echo "$DAEMON_NAME started with PID $(cat "$PID_FILE")"
}

stop_daemon() {
    if [ ! -f "$PID_FILE" ]; then
        echo "Daemon not running"
        exit 1
    fi
    
    local pid
    pid=$(cat "$PID_FILE")
    
    if kill -0 "$pid" 2>/dev/null; then
        echo "Stopping $DAEMON_NAME (PID: $pid)..."
        kill "$pid"
        rm -f "$PID_FILE"
        log_message "Daemon stopped"
        echo "$DAEMON_NAME stopped"
    else
        echo "Daemon not running (stale PID file)"
        rm -f "$PID_FILE"
    fi
}

status_daemon() {
    if [ -f "$PID_FILE" ]; then
        local pid
        pid=$(cat "$PID_FILE")
        if kill -0 "$pid" 2>/dev/null; then
            echo "$DAEMON_NAME is running (PID: $pid)"
            echo "Log file: $LOG_FILE"
            echo "Alert log: $ALERT_LOG"
            echo "Check interval: ${CHECK_INTERVAL}s"
        else
            echo "$DAEMON_NAME is not running (stale PID file)"
        fi
    else
        echo "$DAEMON_NAME is not running"
    fi
}

show_logs() {
    echo "=== RECENT LOG ENTRIES ==="
    if [ -f "$LOG_FILE" ]; then
        tail -20 "$LOG_FILE"
    else
        echo "No log file found"
    fi
    
    echo -e "\n=== RECENT ALERTS ==="
    if [ -f "$ALERT_LOG" ]; then
        tail -20 "$ALERT_LOG"
    else
        echo "No alert log found"
    fi
}

# =============================================================================
# SCRIPT PRINCIPAL
# =============================================================================

show_usage() {
    echo "Usage: $0 {start|stop|restart|status|logs|test}"
    echo "  start   - Start the monitoring daemon"
    echo "  stop    - Stop the monitoring daemon"
    echo "  restart - Restart the monitoring daemon"
    echo "  status  - Show daemon status"
    echo "  logs    - Show recent logs and alerts"
    echo "  test    - Run one monitoring cycle manually"
}

case "$1" in
    start)
        start_daemon
        ;;
    stop)
        stop_daemon
        ;;
    restart)
        stop_daemon
        sleep 2
        start_daemon
        ;;
    status)
        status_daemon
        ;;
    logs)
        show_logs
        ;;
    test)
        echo "Running test monitoring cycle..."
        run_monitoring_cycle
        echo "Test completed. Check $LOG_FILE and $ALERT_LOG for results."
        ;;
    *)
        show_usage
        exit 1
        ;;
esac