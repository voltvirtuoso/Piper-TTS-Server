#!/bin/bash

# URL of your TTS server
TTS_SERVER_URL="http://localhost:5000"

# Prompt user for input
read -p "Enter text to speak: " TEXT_INPUT

# Check if input is not empty
if [ -z "$TEXT_INPUT" ]; then
  echo "No text entered."
  exit 1
fi

# Use curl to send POST request and pipe audio to ffplay
curl -s -X POST \
  -H "Content-Type: text/plain" \
  --data "$TEXT_INPUT" \
  "$TTS_SERVER_URL" | ffplay -nodisp -autoexit -
