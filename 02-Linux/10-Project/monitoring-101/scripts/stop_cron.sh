#!/bin/bash

# ==========================================================
# stop_cron.sh - Remove cron jobs related to monitoring
# ==========================================================
# Removes the cron tasks set by setup_cron.sh
# Supprime les tâches cron ajoutées par setup_cron.sh
# ==========================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Absolute paths for safe matching
USER_SCRIPT_PATH="$SCRIPT_DIR/monitor_users.sh"
NETWORK_SCRIPT_PATH="$SCRIPT_DIR/monitor_network.sh"
ALERT_SCRIPT_PATH="$SCRIPT_DIR/send_alerts.sh"
HIDS_SCRIPT_PATH="$SCRIPT_DIR/hids_check.sh"

# Backup current crontab
BACKUP_PATH="$SCRIPT_DIR/../backup"
mkdir -p "$BACKUP_PATH"
BACKUP_FILE="$BACKUP_PATH/cron_removed_$(date +%Y%m%d_%H%M%S).bak"
crontab -l > "$BACKUP_FILE" 2>/dev/null

# Remove lines matching any of the script paths
crontab -l 2>/dev/null | grep -v -E "$USER_SCRIPT_PATH|$NETWORK_SCRIPT_PATH|$ALERT_SCRIPT_PATH|$HIDS_SCRIPT_PATH" | crontab -

echo "Monitoring cron jobs removed successfully."
