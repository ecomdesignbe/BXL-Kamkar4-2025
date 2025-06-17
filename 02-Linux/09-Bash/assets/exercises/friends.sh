#!/bin/bash

JOKE_FILE="./jokes.txt"

# Function to tell a joke
tell_joke() {
  if [[ -f "$JOKE_FILE" ]]; then
    shuf -n 1 "$JOKE_FILE"
  else
    echo "I can't find my jokes file 😢"
  fi
}

# Function to tell the time
tell_time() {
  echo "🕒 The current time is: $(date)"
}

# Function to calculate math expressions
calculate() {
  result=$(echo "$1" | bc 2>/dev/null)
  if [[ $? -eq 0 ]]; then
    echo "🧮 The result is: $result"
  else
    echo "That doesn't look like a valid math expression!"
  fi
}

# Function to get weather
get_weather() {
  curl -s wttr.in?format=3
}

# Function to speak (optional)
say() {
  command -v espeak >/dev/null && espeak "$1"
}

# Interactive mode
interactive_mode() {
  echo "👋 Hello! I'm your terminal buddy. Ask me something (type 'exit' to quit):"
  while true; do
    read -rp "You: " input
    handle_input "$input"
  done
}

# Handler for input (interactive & non-interactive)
handle_input() {
  case "$1" in
    *joke*) tell_joke ;;
    *time*) tell_time ;;
    *[0-9]*[+*/%-]*[0-9]*) calculate "$1" ;;
    *weather*) get_weather ;;
    exit) echo "Goodbye 👋"; exit 0 ;;
    *) echo "🤖 I don't understand. Try: tell me a joke, what's the time, 4 + 5, or weather" ;;
  esac
}

# MAIN
if [[ -t 0 ]]; then
  # Interactive mode
  interactive_mode
else
  # Non-interactive mode
  while read -r line; do
    handle_input "$line"
  done
fi
