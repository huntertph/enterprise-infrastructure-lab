# Active Directory Configuration 

This portion of the lab focused on building a centralized access managent enviroment using Active Directory Domain Services (AD DS) on Windows Server.

The Active Directory domain I chose was:

***bsmentlab.local***

The Windows Server ***LAB-DC01*** acts as the domain controller for the enviroment. 

# Organizational Unit Structure 

I created Organizational Units to separate users and the endpoints based on their role within my environment. 




This structure separates user accounts from computer objects and allows policies and administrative tasks to be targeted toward specific parts of the environment.

For example, Window workstations were placed within the Workstations OU, allowing workstation specific Group Policies be applied without affecting servers or other objects.


### Security Groups

Security groups were created for the different departments within the simulated enterprise environment.

-***IT Admins***
-***HR Users***
-***Sales Users***

Users were assigned to these groups based off the department they were apart of.

Using security groups provides a centralized way to manage access based on a user's role rather than individually to each account.

### User Provisioning

Several test users were created to represent employees across the IT, HR, and Sales departments. 

Rather than creating every account manually through Active Directory Users and Computers, the provisioning process was automated using PowerShell and a CSV file. 

The script:

1. Reads user information from the CSV file
2. Identifies the user's department
3. Selects the appropriate OU
4. Creates the Active Directory account
5. Assigns the account to the appropriate security group
6. Enables the account and requires a password change at first login

The PowerShell script and example CSV struture are documented in the ***powershell*** portion of this repository.

### Domain-Joined Workstations 

Windows 11 Pro workstations were joined to the bsmentlab.local domain.

After joining the domain, computer objects were organized within the Endpoints OU.

Domain authentication was tested by signing into the workstations using Active Directory user accounts.

This demonstrated centralized authentication, where user identities and credentials are managed by the domain rather than independently on each workstation.

### Key Takeaways

This portion allowed me to develop hands on experience with:

- Active Directory Domain Services
- Domain Controllers
- Organizational Unit design
- User and computer objects
- Domain authentication
- Role based access management
- PowerShell based account provisioning
- Organizing Active Directory for Group Policy management 

