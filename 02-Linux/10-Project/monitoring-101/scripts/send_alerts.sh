#!/bin/bash

# ==========================================================
# send_alert.sh - Send alert if CPU load is too high
# ==========================================================
# This script checks the system load average and sends an alert
#     if the value is above a defined threshold.
# Ce script vérifie la charge CPU moyenne du système et envoie
#     une alerte si elle dépasse un seuil défini.
# ==========================================================

# Set alert threshold (default: 1.00 for 1-minute load average)
# You can adjust this value if needed
# Vous pouvez ajuster cette valeur si nécessaire
THRESHOLD=1.00

# Get current 1-minute load average
LOAD=$(uptime | awk -F 'load average:' '{ print $2 }' | cut -d ',' -f 1 | xargs)

# Compare current load to threshold using bc
# Comparer la charge actuelle avec le seuil avec bc
if (( $(echo "$LOAD > $THRESHOLD" | bc -l) )); then
  MESSAGE="ALERT: High system load detected! Load = $LOAD"
  echo "$MESSAGE"

  # Send the alert to syslog (alternative to mail)
  logger "$MESSAGE"

  # You can also send email if configured
  # echo "$MESSAGE" | mail -s "System Load Alert" your@email.com
else
  echo "System load is normal (Load = $LOAD)"
fi
