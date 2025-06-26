#!/bin/bash

# Convertir tous les fichiers en format Unix (fin de ligne)
find . -type f -exec dos2unix {} +

# Donner les droits d'exécution aux scripts nécessaires
chmod +x ./monitor.sh
chmod +x ./scripts/*.sh

# Installer ifstat si non installé
if ! command -v ifstat &> /dev/null; then
  echo "Installation de ifstat..."
  sudo apt update
  sudo apt install -y ifstat
else
  echo "ifstat est déjà installé."
fi

./monitor.sh
