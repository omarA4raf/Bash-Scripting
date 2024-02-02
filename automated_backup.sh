#!/bin/bash

backup_dir="/path/to/backup/directory"

# Create backup directory if it doesn't exist
mkdir -p $backup_dir

# Backup /home directory
rsync -av --delete /home/ $backup_dir
echo "Backup completed successfully at $(date)."
