Set-ExecutionPolicy RemoteSigned
# Import Active Directory module
Import-Module ActiveDirectory

# Fetch users from AD and export to CSV
$users = Get-ADUser -Filter * -Properties ProxyAddresses
$users | Select-Object Name, SamAccountName, @{Name='ProxyAddresses';Expression={($_.ProxyAddresses -join ";")}} | Export-Csv -Path "C:\Temp\AD_users_proxyAddresses.csv" -NoTypeInformation