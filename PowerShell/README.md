# PowerShell Automation

This portion of the lab focused on using PowerShell to automate repetitive Active Directory administration tasks.

The main automation built for the environment was a user provisioning script that creates Active Directory users from CSV data and places them into the correct Organizational Units and security groups.

## Purpose

Creating users manually through Active Directory Users and Computers works for a small number of accounts, but it becomes repetitive and inefficient as the number of users increases.

The PowerShell script was created to make the provisioning process faster, more consistent, and less dependent on manual data entry.

## CSV-Based User Provisioning

User information is stored in a CSV file containing fields such as:

```text
FirstName
LastName
Username
Department
```

The script imports the CSV file and processes each user individually.

## Provisioning Process

For each user, the script:

1. Imports the user's information from the CSV file
2. Reads the user's department
3. Determines the appropriate Organizational Unit and the appropriate security group
5. Checks whether the account already exists
6. Creates the Active Directory user account
7. Enables the account
8. Requires a password change at first login
9. Adds the user to the correct security group
10. Reports whether the operation succeeded, failed, or was skipped

## Department Mapping

The script uses the user's department to determine where the account should be created.

Example mapping:

| Department | Organizational Unit | Security Group |
|---|---|---|
| IT | `User Accounts/IT` | `IT-Admins` |
| HR | `User Accounts/HR` | `HR-Users` |
| Sales | `User Accounts/Sales` | `Sales-Users` |

This allows the same script to provision users across multiple departments without manually changing the destination OU or group for each account.

## Error Handling

The script includes checks and error handling to prevent common provisioning problems.

For example, before creating a user, the script checks whether an account with the same username already exists.

Existing accounts are skipped instead of being recreated.

The script also reports errors when a user contains an unknown department or when an Active Directory operation fails.

Example output:

```text
SUCCESS: user created and added to group
SKIPPED: user already exists
ERROR: unknown department
```

## Active Directory PowerShell Module

The script uses the Active Directory PowerShell module to interact with the domain.

Important commands used include:

```powershell
Import-Module ActiveDirectory
Import-Csv
Get-ADUser
New-ADUser
Add-ADGroupMember
```

These commands allow Active Directory accounts and group memberships to be managed directly through PowerShell instead of relying entirely on graphical administration tools.



## Future Improvements

Planned improvements to the PowerShell portion of the lab include:

- Active Directory reporting scripts
- Automated user auditing
- Group membership reporting
- Disabled account reporting
- Additional validation of CSV input

## Key Takeaways

This portion of the lab provided hands-on experience with:

- PowerShell scripting
- Active Directory automation
- CSV data processing
- User provisioning
- Security group management
- Organizational Unit targeting
- Error handling
- Reducing repetitive administrative work
