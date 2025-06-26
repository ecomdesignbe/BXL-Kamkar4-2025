#!/bin/bash

# ==========================================================
# monitor.sh - Main menu to access all monitoring scripts
# ==========================================================
# This script allows the user to run various monitoring tools.
# Ce script permet à l'utilisateur d'exécuter différents outils de surveillance.
# ==========================================================

while true; do
  clear
  printf "\n"
  printf "========================================\n"
  printf "|                                      |\n"
  printf "|    /\\/\\ 0 /\\/ 1 7 0 R - 1 0 1 by     |\n"
  printf "|                                      |\n"
  printf "|    3MM4 - J3551C4 - 81L3L - 573V3    |\n"
  printf "|                                      |\n"
  printf "========================================\n"
  printf "\n"

  echo "=========================================="
  echo "Linux Monitoring Toolkit"
  echo "=========================================="
  echo "Please choose an option:"
  echo "0) Monitoring Daemon v4"
  echo "1) Monitor User Activity"
  echo "2) Monitor Network Activity"
  echo "3) Send Load Alert (manual check)"
  echo "4) Setup Cron Jobs (automate monitoring)"
  echo "5) Run HIDS Check (detect suspicious activity)"
  echo "6) Stop Cron Jobs (disable automation)"
  echo "7) Exit"
  echo "------------------------------------------"

  read -p "Your choice (0-7): " choice

  case $choice in
    0)
      echo "Monitoring Daemon v4 - Select an action:"
      echo "  1) start   - Start the daemon"
      echo "  2) stop    - Stop the daemon"
      echo "  3) restart - Restart the daemon"
      echo "  4) status  - Show status"
      echo "  5) logs    - Show recent logs"
      echo "  6) test    - Run one monitoring cycle"
      read -p "Choose an action (1-6): " daemon_choice

      case $daemon_choice in
        1) sudo bash scripts/monitoring_daemon_V4.sh start ;;
        2) sudo bash scripts/monitoring_daemon_V4.sh stop ;;
        3) sudo bash scripts/monitoring_daemon_V4.sh restart ;;
        4) sudo bash scripts/monitoring_daemon_V4.sh status ;;
        5) sudo bash scripts/monitoring_daemon_V4.sh logs ;;
        6) sudo bash scripts/monitoring_daemon_V4.sh test ;;
        *) echo "❗ Invalid daemon action." ;;
      esac

      read -p "Press Enter to return to the menu..."
      ;;
    1)
      echo "Launching monitor_users.sh..."
      bash scripts/monitor_users.sh
      read -p "Press Enter to return to the menu..."
      ;;
    2)
      echo "Launching monitor_network.sh..."
      bash scripts/monitor_network.sh
      read -p "Press Enter to return to the menu..."
      ;;
    3)
      echo "Launching send_alerts.sh..."
      bash scripts/send_alerts.sh
      read -p "Press Enter to return to the menu..."
      ;;
    4)
      echo "Launching setup_cron.sh..."
      bash scripts/setup_cron.sh
      read -p "Press Enter to return to the menu..."
      ;;
    5)
      echo "Launching hids_check.sh..."
      bash scripts/hids_check.sh
      read -p "Press Enter to return to the menu..."
      ;;
    6)
      echo "Stopping all monitoring cron jobs..."
      bash scripts/stop_cron.sh
      read -p "Press Enter to return to the menu..."
      ;;
    7)
      echo "Goodbye!"
      exit 0
      ;;
    *)
      echo "❗ Invalid option. Please choose between 1 and 7."
      sleep 2
      ;;
  esac
done
