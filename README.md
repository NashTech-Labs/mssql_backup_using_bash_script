# MSSQL Database Backup and Restore Scripts

This repository contains Bash scripts to backup and restore Microsoft SQL Server databases locally.

## Backup Script

### Usage

1. Make sure you have the necessary permissions to access the SQL Server and perform database backups.

2. Run the following command to set executable permissions for the backup script:

    ```bash
    chmod +x backup_mssql_db.sh
    ```

3. Run the script `backup_mssql_db.sh` using the following command:

    ```bash
    ./backup_mssql_db.sh
    ```

4. Follow the prompts to provide the SQL Server details, database name, and backup file path.

5. Once completed, the script will create a backup of the specified database in the specified directory.

### Important Note

- Make sure to review and customize the script according to your specific requirements, such as backup directory, naming conventions, and SQL Server authentication method.

## Restore Script

### Usage

1. Make sure you have the necessary permissions to access the SQL Server and perform database restores.

2. Run the following command to set executable permissions for the restore script:

    ```bash
    chmod +x restore_mssql_db.sh
    ```

3. Run the script `restore_mssql_db.sh` using the following command:

    ```bash
    ./restore_mssql_db.sh
    ```

4. Follow the prompts to provide the SQL Server details, database name, and full path to the backup file.

5. Once confirmed, the script will restore the specified database from the provided backup file.

### Important Note

- Make sure to review and customize the script according to your specific requirements, such as backup file path, SQL Server authentication method, and confirmation prompt.
