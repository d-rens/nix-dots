#!/usr/bin/env python3

import os
import subprocess

# Define the parent folder
parent_folder = "/home/daniel/documents/"

# Define the depth of subdirectory search
depth = 10

# Function to recursively get subdirectories up to a specified depth
def get_subdirectories(folder, current_depth):
    subdirectories = []
    if current_depth > depth:
        return subdirectories
    for name in os.listdir(folder):
        path = os.path.join(folder, name)
        if os.path.isdir(path):
            subdirectories.append(path)
            subdirectories.extend(get_subdirectories(path, current_depth + 1))
    return subdirectories

# Get a list of subdirectories within the parent folder up to the specified depth
subdirectories = get_subdirectories(parent_folder, 1)

# Use rofi to display the list and get the selected directory
selected_directory = subprocess.run(["rofi", "-dmenu", "-p", "cd: ", "-i"],
                                    input="\n".join(subdirectories),
                                    capture_output=True, text=True).stdout.strip()

# Output the selected directory
print(selected_directory)

