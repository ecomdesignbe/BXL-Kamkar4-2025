#!/bin/bash

# ==========================================================
# setup_cron.sh - Configure cron to run monitoring scripts
# ==========================================================
# Adds scheduled jobs to run your scripts every 5 minutes
# Ajoute des tâches planifiées pour exécuter tes scripts toutes les 5 minutes
# ==========================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define relative paths
USER_SCRIPT_PATH="$SCRIPT_DIR/monitor_users.sh"
NETWORK_SCRIPT_PATH="$SCRIPT_DIR/monitor_network.sh"
ALERT_SCRIPT_PATH="$SCRIPT_DIR/send_alerts.sh"
HIDS_SCRIPT_PATH="$SCRIPT_DIR/hids_check.sh"

LOG_PATH="$SCRIPT_DIR/../logs"
BACKUP_PATH="$SCRIPT_DIR/../backup"

# Create necessary directories
mkdir -p "$LOG_PATH"
mkdir -p "$BACKUP_PATH"

# Backup current crontab
BACKUP_FILE="$BACKUP_PATH/cron_backup_$(date +%Y%m%d_%H%M%S).bak"
crontab -l > "$BACKUP_FILE" 2>/dev/null

# Add new cron jobs (every 5 minutes)
(
  crontab -l 2>/dev/null
  echo "*/5 * * * * bash $USER_SCRIPT_PATH >> $LOG_PATH/user.log 2>&1"
  echo "*/5 * * * * bash $NETWORK_SCRIPT_PATH >> $LOG_PATH/network.log 2>&1"
  echo "*/5 * * * * bash $ALERT_SCRIPT_PATH >> $LOG_PATH/alerts.log 2>&1"
  echo "*/5 * * * * bash $HIDS_SCRIPT_PATH >> $LOG_PATH/hids.log 2>&1"
) | crontab -

echo "Cron jobs added. Monitoring scripts will run every 5 minutes."
