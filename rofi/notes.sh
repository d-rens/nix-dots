#!/bin/bash

notes_dir="~/documents/docs/LaTeX/notes/"

selected_file=$(find "$notes_dir" -type f | rofi -dmenu -p "Select a notes file:")

if [[ -n $selected_file ]]; then
    vim "$selected_file"
fi

