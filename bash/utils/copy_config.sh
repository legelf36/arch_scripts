#!/bin/bash

# Define the source and destination directories
source_dir="$HOME/.config"
destination_dir="$HOME/wd2tb/Backup"

# Check if the destination directory exists, if not, create it
if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
fi

# Copy the .config directory to the backup directory
cp -r "$source_dir" "$destination_dir"

# Check if the copy was successful
if [ $? -eq 0 ]; then
    echo "Successfully copied $source_dir to $destination_dir"
else
    echo "Failed to copy $source_dir to $destination_dir"
fi
