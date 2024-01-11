#!/bin/bash

# Function to synchronize files between two directories using rsync
function sync() {
  # $1: Source directory
  # $2: Destination directory

  # Continuously monitor for changes in the source directory
  while true; do
    inotifywait -r -e modify,create,delete,move $1  # Monitor for file changes

    # Perform rsync with efficient options:
    rsync -vhzr --progress --partial --inplace --delete $1/ $2
    # -v: Verbose output
    # -h: Human-readable file sizes
    # -z: Compress files during transfer (for efficiency)
    # -r: Recursively copy subdirectories
    # --progress: Show progress bar
    # --partial: Preserve partially transferred files
    # --inplace: Update files in-place, avoiding unnecessary copies
    # --delete: Delete extraneous files in the destination
  done
}

# Function to get a valid directory path from user input
function get_valid_path() {
  while true; do
    read -rp "$1 path: " path
    if [[ -d "$path" ]]; then
      echo "$path is a valid directory."
      return 0  # Exit successfully
    else
      echo "Invalid path. Please enter a valid directory."
    fi
  done
}

# Get source and destination paths from user input
get_valid_path "Enter source" sourceDir
get_valid_path "Enter destination" destinationDir

# Initiate synchronization
sync $sourceDir $destinationDir
