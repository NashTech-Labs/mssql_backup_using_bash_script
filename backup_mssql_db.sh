#!/bin/bash

# Prompt user for SQL Server details
read -p "Enter SQL Server name: " SERVER_NAME
read -p "Enter SQL Server username: " USERNAME
read -sp "Enter SQL Server password: " PASSWORD
echo ""
read -p "Enter database name: " DATABASE_NAME
read -p "Enter backup file path (e.g., /path/to/backup): " BACKUP_DIR

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Delete older backup files in the specified directory
echo "Deleting old backup files in $BACKUP_DIR..."
rm -f "$BACKUP_DIR"/*.bak

# Set the current date and time
NOW=$(date +"%Y-%m-%d-%H-%M-%S")

# Set the backup file name and location
BACKUP_FILE="$BACKUP_DIR/mssql-$NOW.bak"

# Create the backup
echo "Starting database backup..."
sqlcmd -S "$SERVER_NAME" -U "$USERNAME" -P "$PASSWORD" -Q "BACKUP DATABASE [$DATABASE_NAME] TO DISK = '$BACKUP_FILE'"
if [ $? -eq 0 ]; then
    echo "Database backup completed successfully. Backup file is located at $BACKUP_FILE"
else
    echo "Database backup failed."
fi
