#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <path>"
  exit 1
fi

path="$1"

if [ -d "$path" ]; then
  echo "Directory listing for '$path':"
  ls -l "$path"
elif [ -f "$path" ]; then
  extension="${path##*.}"
  case "$extension" in
    txt|js)
      echo "Displaying content of $path:"
      cat "$path"
      ;;
    *)
      echo "Error: File type '$extension' not supported for display."
      ;;
  esac
else
  echo "Error: Path not found."
fi
