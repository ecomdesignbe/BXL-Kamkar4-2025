#!/bin/bash

# ==========================================================
# monitor_network.sh - Basic Linux network monitoring script
# ==========================================================
# This script displays active network connections, open ports,
#     and basic traffic statistics.
# Ce script affiche les connexions réseau actives, les ports
#     ouverts, et des statistiques de trafic simples.
# ==========================================================

echo "Starting network monitoring..."
echo "=============================="

# ------------------------------------------
# Display active TCP/UDP network sessions
# ------------------------------------------
# Shows who is connected to or from this machine.
# Affiche qui est connecté à ou depuis cette machine.
echo "Active network connections:"
ss -tunap 2>/dev/null || netstat -tunap
echo "------------------------------"

# ----------------------------
# List open listening ports
# ----------------------------
# Shows which programs are listening on which ports.
# Montre quels programmes écoutent sur quels ports.
echo "Open listening ports:"
sudo lsof -i -P -n | grep LISTEN
echo "------------------------------"

# ---------------------------------------
# Show live network traffic statistics
# ---------------------------------------
# Displays how much data is being sent and received.
# Affiche la quantité de données envoyées et reçues.
echo "Network traffic statistics:"
if command -v ifstat >/dev/null; then
    echo "(Using ifstat for 5 seconds)"
    ifstat 1 5
elif command -v vnstat >/dev/null; then
    echo "(Using vnstat)"
    vnstat --oneline
else
    echo "ifstat or vnstat not found. Install with: sudo apt install ifstat"
fi
echo "------------------------------"

# ----------------------------------------------------
# List remote IPs with established connections (Top)
# ----------------------------------------------------
# 🇬🇧 Helps identify potential suspicious IP addresses.
# 🇫🇷 Aide à repérer des IP suspectes connectées à la machine.
echo "Top remote IP addresses (established connections):"
ss -tn state established | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head -n 10
echo "------------------------------"

# End of monitoring
# Script completed.
# Script terminé.
echo "Network monitoring finished."
