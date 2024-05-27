#!/bin/bash

# Prompt user for SQL Server details
read -p "Enter SQL Server name or IP address: " SERVER_NAME
read -p "Enter SQL Server username: " USERNAME
read -sp "Enter SQL Server password: " PASSWORD
echo ""
read -p "Enter the name of the database to restore: " DATABASE_NAME
read -p "Enter the full path to the backup file (e.g., /path/to/backup/mssql-2021-01-01-00-00-00.bak): " BACKUP_FILE

# Check if the backup file exists
if [ ! -f "$BACKUP_FILE" ]; then
    echo "Backup file '$BACKUP_FILE' does not exist. Please provide a valid backup file path."
    exit 1
fi

# Confirm restoration
read -p "Are you sure you want to restore the database '$DATABASE_NAME' from the backup file '$BACKUP_FILE'? (y/n): " CONFIRM_RESTORE
if [ "$CONFIRM_RESTORE" != "y" ]; then
    echo "Database restoration canceled."
    exit 0
fi

# Restore the backup
echo "Starting database restoration..."
sqlcmd -S "$SERVER_NAME" -U "$USERNAME" -P "$PASSWORD" -Q "RESTORE DATABASE [$DATABASE_NAME] FROM DISK = '$BACKUP_FILE' WITH REPLACE"
if [ $? -eq 0 ]; then
    echo "Database restoration completed successfully."
else
    echo "Database restoration failed."
fi
