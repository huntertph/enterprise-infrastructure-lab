# Enterprise Infrastructure Lab

Home Lab built to simulate enterprise IT environments using Windows Server, Active Directory, Group Policy, Power shell, Windows 11, and Ubuntu Server administration skills/

## Overview 

This project was created to refreshen my Ubuntu Server skills, and strengthen my practical infrastructure and systems administration skills by building and troubleshooting a small multi-system environment from the ground up.

### The Lab includes:
Windows Server Domain Controller
Active Directory Domain Services
Organizational Units and Security Groups
Powershell-based user provisioning 
Group policy management 
Domain-joined Windows 11 workstation's
Ubuntu Server administration
SSH remote access
Linux users, groups, and permissions

Lab Architecture 

System        Role                                          IP Address
LAB-DC01      Windows Server Domain Controller, AD DS, DNS. 192.168.153.128
IT-WS01       Windows 11 Domain Workstation for IT Admin    192.168.153.129
LAB-UBUNTU01. Ubuntu Server                                 192.168.153.132

Domain: bsmentlab.local

Active Directory

The domain controller provided centralized authentication and identity management for the environment. 

The Active Directory structure includes Organizational units for users, workstations, servers, and security groups.

For a more detailed look at the Active Directory structure and security groups I created for this environment, take a look at the Active Directory folder.


## PowerShell Automation

Powershell was used to automate Active Directory user creation from CSV data.

The scripts process was as follows:

1. Imports user information from a CSV file
2. Determines the correct department OU
3. Creates the Active Directory account
4. Assigns the correct security group
5. Enables the user account
6. Requires a password change at first log in

This pattern reduced repetitive manual data entry and administration, also provided more familiarity with Powershell and command-line Active Directory automation.

## DNS

Alongside acting as the ADDC, LAB-DC01 also acted as the DNS server for all domain systems. 

Clients within the domain can use the domain controller for DNS to resolve internal Active Directory resources.

External DNS requests are forwarded to public DNS servers and Active Directory authentication and service discovery. 

## Windows 11 Workstations

There were several Windows 11 Pro virtual machines joined to the bsmentlab.local domain.

These workstations were joined to the Active Directory
Moved into the Workstations OU
Tested using a domain user account from earlier Powershell scripts
Managed through Group Policy

## Group Policy:

The main Group Policy Object (GPO) I used in this environment was titled Workstation Security Baseline. 

This was an overarching GPO that linked to all User Groups inside of the domain. It was configured to use an authorized-use login banner on domain workstations.

This group policy was validated on user endpoints using 
gpupdate /force
gpresult /r /scope computer 

This provided experience troubleshooting GPO application, OU placement, permissions, and computer level processing. 

## Ubuntu Server

For this lab a Ubuntu Server virtual machine was also added to the enviroment for Linux administration practice.

Configuration as follows:

1. OpenSSH Server
2. Remote SSH administration
3. Linux User management
4. Group-based permissions
5. Dedicated application directory
6. Standard Linux ownership and permission configuration

More in depth explanation of this server and how I handled the set-up is located in the Ubuntu folder.

## Skills demonstrated

- Windows Server administration
- Active Directory
- DNS
- Powershell
- Windows domain administration
- Linux administration
- SSH
- Linux permissions
- Virtualization
- Troubleshooting
- Identity and access management
- Infrastructure automation


## Planned additions include:

- SSH key-based authentication
- Additional PowerShell reporting scripts
- Linux service management with systemd
- Additional security orientated Group Policies






