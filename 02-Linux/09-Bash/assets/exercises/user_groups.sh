#!/bin/bash

user="${1:-$USER}"

if ! id "$user" &>/dev/null; then
  echo "User '$user' does not exist."
  exit 1
fi

groups=$(id -nG "$user")

for group in $groups; do
  echo "$user is part of the group $group"
done
