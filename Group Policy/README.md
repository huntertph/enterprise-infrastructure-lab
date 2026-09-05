
# Group Policy Configuration

This portion of the lab focused on using Group Policy to centrally manage Windows workstation settings within the `bsmentlab.local` domain.

## Purpose

Group Policy allows administrators to apply configuration and security settings to multiple domain-joined systems from a central location.

For this lab, the main GPO created was:

`Workstation Security Baseline`

## GPO Scope

The `Workstation Security Baseline` GPO was linked to the `Workstations` Organizational Unit.

This allowed the policy to apply to domain joined Windows workstations without affecting other systems such as servers.

## Configured Policy

The GPO was configured to display an authorized-use login banner on Windows workstations.

The policy configured:

- A custom login message title
- A custom login message body
- Computer-level policy processing

This provided a simple way to verify that the GPO was successfully applying to domain-joined endpoints.

## Validation

After linking the GPO to the Workstations OU, policy application was tested from a Windows 11 workstation.

The following commands were used:

```powershell
gpupdate /force
gpresult /r /scope computer
```

`gpupdate /force` was used to force the workstation to refresh its Group Policy settings.

`gpresult /r /scope computer` was used to verify which computer policies were currently applied.

The `Workstation Security Baseline` GPO appeared in the applied policy results as expected, which signaled my GPO application was successful.

The workstation was then restarted and the login banner was visually confirmed.


## Why OU Placement Matters

Group Policy scope is heavily affected by where users and computers are located inside Active Directory.

By placing workstation computer objects inside the `Workstations` OU, workstation specific policies can be applied without affecting unrelated systems.

This helps keep policy management organized and predictable.

## Future Improvements

Future Group Policy additions may include:

- Windows Defender settings
- Windows Firewall policies
- Screen lock and inactivity policies
- Audit policies
- Local administrator restrictions
- Windows Update configuration
- Removable storage restrictions

## Key Takeaways

This portion of the lab provided hands-on experience with:

- Group Policy Management
- GPO creation and linking
- Organizational Unit targeting
- Computer Configuration policies
- Policy refresh and validation
- `gpupdate`
- `gpresult`
- GPO troubleshooting
- Centralized Windows endpoint configuration
