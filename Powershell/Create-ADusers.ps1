Import-Module ActiveDirectory

$users = Import-Csv ".\users-example.csv"

$domain = "DC=bsmentlab,DC=local"
$userBaseOU = "OU=User Accounts,$domain"

# Prompt for a temporary password instead of storing one in the script
$password = Read-Host "Enter temporary password for new users" -AsSecureString

foreach ($user in $users) {

    switch ($user.Department) {

        "IT" {
            $ouPath = "OU=IT,$userBaseOU"
            $groupName = "IT-Admins"
        }

        "HR" {
            $ouPath = "OU=HR,$userBaseOU"
            $groupName = "HR-Users"
        }

        "Sales" {
            $ouPath = "OU=Sales,$userBaseOU"
            $groupName = "Sales-Users"
        }

        default {
            Write-Host "ERROR: Unknown department for $($user.Username)"
            continue
        }
    }

    try {

        $existingUser = Get-ADUser `
            -Filter "SamAccountName -eq '$($user.Username)'" `
            -ErrorAction SilentlyContinue

        if ($existingUser) {
            Write-Host "SKIPPED: $($user.Username) already exists"
            continue
        }

        New-ADUser `
            -Name "$($user.FirstName) $($user.LastName)" `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -SamAccountName $user.Username `
            -UserPrincipalName "$($user.Username)@bsmentlab.local" `
            -Path $ouPath `
            -AccountPassword $password `
            -Enabled $true `
            -ChangePasswordAtLogon $true `
            -ErrorAction Stop

        Add-ADGroupMember `
            -Identity $groupName `
            -Members $user.Username `
            -ErrorAction Stop

        Write-Host "SUCCESS: $($user.Username) created and added to $groupName"
    }

    catch {
        Write-Host "ERROR: $($user.Username) - $($_.Exception.Message)"
    }
}
