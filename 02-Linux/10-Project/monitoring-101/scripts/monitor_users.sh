#!/bin/bash

# ==========================================================
# monitor_user.sh - Monitor user logins and activity on Linux
# ==========================================================
# This script shows who is currently logged in, login history,
#     shell activity, and possible suspicious user behaviors.
# Ce script montre qui est connecté, l'historique des connexions,
#     l'activité shell, et des comportements utilisateurs suspects.
# ==========================================================

echo "Starting user activity monitoring..."
echo "=============================="

# ------------------------------------
# List currently logged-in users
# ------------------------------------
# Shows users currently connected to the system.
# Montre les utilisateurs actuellement connectés.
echo "Currently logged-in users:"
who
echo "------------------------------"

# ---------------------------------------------
# Show login/logout history (last 20 entries)
# ---------------------------------------------
# Useful for tracking who logged in and when.
# Utile pour suivre qui s'est connecté et quand.
echo "Last 20 user sessions:"
last -n 20
echo "------------------------------"

# ----------------------------------------
# Check shell command history per user
# ----------------------------------------
# 🇬🇧 Shows recent commands run by users.
# 🇫🇷 Montre les commandes récentes tapées par les utilisateurs.
echo "Last 20 commands from current user's shell history:"
tail -n 20 ~/.bash_history 2>/dev/null || echo "No history file found for this user."
echo "------------------------------"

# -------------------------------------------------------
# Show recently used sudo commands (admin activities)
# -------------------------------------------------------
# See if users have run commands as superuser (root).
# Permet de voir si des commandes ont été lancées en tant que superutilisateur.
echo "Recent sudo commands:"
grep 'COMMAND=' /var/log/auth.log 2>/dev/null | tail -n 10 || echo "No sudo activity or can't read auth.log."
echo "------------------------------"

# Optional: Detect brute force attempts (multiple failed logins)
# Bonus: Detect suspicious login failures.
# Bonus : Détecte les échecs de connexion suspects.
echo "Failed login attempts (last 20):"
grep "Failed password" /var/log/auth.log 2>/dev/null | tail -n 20 || echo "No failed logins found or auth.log not available."
echo "------------------------------"

# End of user monitoring
# Script completed.
# Script terminé.
echo "User monitoring finished."
