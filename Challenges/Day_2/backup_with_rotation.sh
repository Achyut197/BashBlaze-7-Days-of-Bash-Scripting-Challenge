#!/bin/bash

# Source directory to be backed up
source_dir="/path/to/source"

# Backup directory where backups will be stored
backup_dir="/path/to/backup"

# Get current date and time in YYYYMMDD_HHMMSS format
timestamp=$(date +"%A-%F-%R")

# Create a backup filename with timestamp
backup_filename="backup_${timestamp}.tar.gz"

# Navigate to the source directory
cd "$source_dir" || exit

# Create a compressed archive of the source directory
tar -czvf "${backup_dir}/${backup_filename}" .
 backups=$(ls -d "$backup_dir"/* | sort)
num_backups=$(echo "$backups" | wc -l)

    if [ "$num_backups" -gt 3 ]; then
        # Calculate the number of backups to delete
        num_to_delete=$((num_backups - 3))
echo "$backups" | head -n "$num_to_delete" | xargs rm -rf
    fi
}

echo "Backup completed: ${backup_filename} created in ${backup_dir}"

