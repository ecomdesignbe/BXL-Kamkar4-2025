#!/bin/bash

# ==============================================================
# hids_check.sh - Basic Host Intrusion Detection via Bash
# ==============================================================
# Detect suspicious activities: file changes, new ports, new users, etc.
# Détecte des activités suspectes : changements de fichiers, ports, utilisateurs, etc.
# ==============================================================

ALERT_FILE="alerts/hids_alert_$(date +%Y%m%d_%H%M%S).log"
mkdir -p alerts

echo "HIDS Report — $(date)" > "$ALERT_FILE"

# ----------------------------------------
# Monitor critical system file integrity
# Monitor integrity of sensitive system files
# Vérifie l'intégrité des fichiers système critiques
# ----------------------------------------
echo "Checking system file integrity..." >> "$ALERT_FILE"

declare -A files_to_watch=(
  ["/etc/passwd"]="passwd"
  ["/etc/shadow"]="shadow"
  ["/bin/bash"]="bash"
)

for file in "${!files_to_watch[@]}"; do
  HASH=$(sha256sum "$file" 2>/dev/null | awk '{print $1}')
  HASH_FILE="scripts/.${files_to_watch[$file]}.hash"

  if [[ -f "$HASH_FILE" ]]; then
    OLD_HASH=$(cat "$HASH_FILE")
    if [[ "$HASH" != "$OLD_HASH" ]]; then
      echo "WARNING: $file has changed!" >> "$ALERT_FILE" # File has changed
                                                          # Le fichier a été modifié
    fi
  else
    echo "$HASH" > "$HASH_FILE" # Save initial hash if not present
                                # Enregistre l'empreinte si absente
  fi
done

# -----------------------------------------
# Detect suspicious new users
# Detect any new user accounts added
# Détecte les nouveaux comptes utilisateurs
# -----------------------------------------
echo "Checking for new user accounts..." >> "$ALERT_FILE"
CURRENT_USERS=$(cut -d: -f1 /etc/passwd)
USER_LIST_FILE="scripts/.user_list.txt"

if [[ -f "$USER_LIST_FILE" ]]; then
  NEW_USERS=$(comm -13 <(sort "$USER_LIST_FILE") <(echo "$CURRENT_USERS" | sort))
  if [[ -n "$NEW_USERS" ]]; then
    echo "New user(s) detected: $NEW_USERS" >> "$ALERT_FILE" # New users detected
                                                             # Nouveaux utilisateurs détectés
  fi
else
  echo "$CURRENT_USERS" > "$USER_LIST_FILE" # Save initial list of users
                                            # Enregistre la liste initiale
fi

# -----------------------------------------
# Check for newly opened listening ports
# Monitor for new listening ports
# Surveille l'apparition de nouveaux ports à l'écoute
# -----------------------------------------
echo "Checking for new open ports..." >> "$ALERT_FILE"
PORTS_FILE="scripts/.open_ports.txt"
CURRENT_PORTS=$(ss -tuln | awk '/LISTEN/ {print $5}' | sort)

if [[ -f "$PORTS_FILE" ]]; then
  NEW_PORTS=$(comm -13 "$PORTS_FILE" <(echo "$CURRENT_PORTS"))
  if [[ -n "$NEW_PORTS" ]]; then
    echo "New open port(s) detected:" >> "$ALERT_FILE" # New open ports found
    echo "$NEW_PORTS" >> "$ALERT_FILE"                 # Nouveaux ports ouverts détectés
  fi
else
  echo "$CURRENT_PORTS" > "$PORTS_FILE" # Save initial list of ports
                                        # Enregistre la liste initiale
fi

# ---------------------------------------
# External IP connections check
# Check established connections to external IPs
# Vérifie les connexions établies vers des IP externes
# ---------------------------------------
echo "Checking external established connections..." >> "$ALERT_FILE"
ss -tn state established | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr >> "$ALERT_FILE"

# ---------------------------------------
# Unusual sudo activity (last 10)
# Check last 10 sudo commands for suspicious use
# Vérifie les 10 dernières commandes sudo
# ---------------------------------------
echo "Checking recent sudo commands..." >> "$ALERT_FILE"
grep 'COMMAND=' /var/log/auth.log 2>/dev/null | tail -n 10 >> "$ALERT_FILE"

# ---------------------------------------
# Finish and notify
# Scan complete - report saved
# Scan terminé - rapport sauvegardé
# ---------------------------------------
echo "HIDS scan complete. Report saved to: $ALERT_FILE"
