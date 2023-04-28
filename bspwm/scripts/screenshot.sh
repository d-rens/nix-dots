#!/bin/bash

# Define the screenshot directory and filename
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
SCREENSHOT_FILE="$SCREENSHOT_DIR/screenshot-$(date +%F_%H%M%S).png"

# Create the screenshot directory if it doesn't exist
mkdir -p "$SCREENSHOT_DIR"

# Take the screenshot using scrot and save it to the specified filename
scrot "$SCREENSHOT_FILE"

# Display a notification using dunst (assuming you have it installed)
#dunstify "Screenshot taken and saved to $SCREENSHOT_FILE"
