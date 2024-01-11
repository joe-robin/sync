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



while true; do
  read -rp "Enter Source Directory: " source_dir
  read -rp "Enter Destination Directory: " destination_dir
  if [[ -d "$source_dir" && -d "$destination_dir" ]]; then
    echo "Thie Files Will be synced from $source_dir to $destination_dir"
    # Initiate synchronization
    sync $source_dir $destination_dir
    break;
  else 
    echo "Invalid path(s). Please enter valid directories"
    
  fi
done
