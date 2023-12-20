# Active Directory proxyAddresses Bulk Update

## Overview

This repository contains PowerShell scripts to facilitate bulk updates of proxyAddresses in Active Directory. Administrators can use these scripts to generate a CSV file that contains user data, make required updates to the user information, and apply bulk changes to the corresponding user accounts in Active Directory.

## Features

- **CSV Format:** The CSV file should include columns for Display Name, SamAccountName, and proxyAddresses.
- **proxyAddresses Format:** Multiple proxy addresses can be separated by a semicolon (`;`). Ensure that each proxy address has the correct format, e.g., `smtp:user@example.com`.

## Prerequisites

- **Active Directory Module:** Ensure that the Active Directory module is available on the machine where the scripts will be executed.

```powershell
Set-ExecutionPolicy RemoteSigned
Import-Module ActiveDirectory
```

## Usage

1. **Fetch Users from AD:**

   Execute the `fetch_AD_proxyAddresses.ps1` script to generate an initial CSV file containing user data.

   ```powershell
   .\fetch_AD_proxyAddresses.ps1
   ```

   The generated CSV file will be located at `C:\Temp\AD_users_proxyAddresses.csv`.

2. **Update proxyAddresses:**

   Edit the generated CSV file (`AD_users_proxyAddresses.csv`) with the required changes. Once the CSV is updated, execute the `update_AD_proxyAddresses.ps1` script.

   ```powershell
   .\update_AD_proxyAddresses.ps1
   ```

   The script will read the updated CSV and update proxyAddresses in Active Directory.

## Important Notes

- **Backup:** Before running the update script in a production environment, ensure that you have a backup or a way to rollback changes.
- **Testing:** Test the scripts in a controlled environment before applying changes to production.
- **Permissions:** The account running the script must have the necessary permissions to update user accounts in Active Directory.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
