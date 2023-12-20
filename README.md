# Active Directory User ProxyAddresses Update

This project consists of two PowerShell scripts for managing Active Directory user ProxyAddresses: one for fetching user information and another for bulk updating ProxyAddresses using a CSV file.

## Prerequisites

- PowerShell installed on your machine.
- Sufficient permissions to execute PowerShell scripts and update Active Directory user properties.

## Scripts

### 1. Fetch AD Users Script

#### Description

This script fetches Active Directory user information, including names, SamAccountNames, and ProxyAddresses, and exports the data to a CSV file.

#### Usage

1. Open PowerShell.
2. Set the execution policy: `Set-ExecutionPolicy RemoteSigned`.
3. Import the Active Directory module: `Import-Module ActiveDirectory`.
4. Run the script: `.\fetch_AD_Users.ps1`.

### 2. Bulk Update ProxyAddresses Script

#### Description

This script reads an updated CSV file containing user information and updates their ProxyAddresses in Active Directory.

#### Usage

1. Open PowerShell.
2. Set the execution policy: `Set-ExecutionPolicy RemoteSigned`.
3. Import the Active Directory module: `Import-Module ActiveDirectory`.
4. Run the script: `.\update_Proxy_Address.ps1`.

## Instructions

1. Run the "Fetch AD Users" script to retrieve user information and generate the initial CSV file (`AD_Users.csv`).
2. Manually update the CSV file with the desired changes to the ProxyAddresses column.
3. Run the "Bulk Update ProxyAddresses" script to apply the changes to Active Directory.

## Notes

- Ensure that you have the necessary permissions to execute these scripts and update Active Directory user properties.
- Make backups or test in a non-production environment before applying changes to production.

## License

This project is licensed under the [MIT License](LICENSE).
