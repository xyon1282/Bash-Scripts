#!/bin/bash

DIR1="/mnt/c/Users/xyon1/Documents/bashscripts/backup/dir1"
DIR2="/mnt/c/Users/xyon1/Documents/bashscripts/backup/dir2"
DIR3="/mnt/c/Users/xyon1/Documents/bashscripts/backup/dir3"

# Define backupfiles as an array with multiple elements
backupfiles=("$DIR1" "$DIR2" "$DIR3")

# Create the backup directory
mkdir -p backup

# Loop through the directories and zip them
for DIR in "${backupfiles[@]}"; do
  # Extract the directory name from the path
  dir_name=$(basename "$DIR")
  
  # Zip the directory into its own zip file
  zip "backup/$dir_name.zip" "$DIR"
done

scp -r backup pi@192.168.1.235:/home/pi
