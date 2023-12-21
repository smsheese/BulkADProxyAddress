Import-Module ActiveDirectory

# Read the updated CSV and update users in AD
$updatedUsers = Import-Csv -Path "C:\Temp\AD_users_proxyAddresses.csv"
foreach ($user in $updatedUsers) {
    # Check if the ProxyAddresses column is not empty
    if (![string]::IsNullOrWhiteSpace($user.ProxyAddresses)) {
        try {
            # Split the ProxyAddresses by ";" and filter out any empty entries
            $proxyAddresses = $user.ProxyAddresses -split ";" | Where-Object { $_ -ne "" }
            # Ensure that each proxy address has the correct format
            $proxyAddresses = $proxyAddresses | ForEach-Object { if ($_ -notmatch '^smtp:') { "smtp:$_" } else { $_ } }
            
            # Convert $proxyAddresses to a string array before updating
            $proxyAddresses = $proxyAddresses | ForEach-Object { $_.Trim() } # Trim whitespace from each address
            
            # Now $proxyAddresses is an array of strings, which is what Set-ADUser expects for the ProxyAddresses field
            Set-ADUser -Identity $user.SamAccountName -Replace @{ProxyAddresses=$proxyAddresses}

        } catch {
            Write-Error "Failed to update user $($user.SamAccountName): $_"
        }
    } else {
        Write-Host "No ProxyAddresses to update for $($user.SamAccountName)"
    }
}
