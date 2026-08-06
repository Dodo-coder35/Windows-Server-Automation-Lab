# 1. Introduction

Active Directory Domain Services (AD DS) is Microsoft's centralized directory service used to manage users, computers, groups, and network resources within an enterprise environment.

When Active Directory is installed on Windows Server, it automatically provides directory services based on the Lightweight Directory Access Protocol (LDAP).

In this laboratory, Active Directory was deployed on Windows Server 2025 by promoting the server to a Domain Controller. LDAP services are therefore available by default and are used internally by Active Directory.

---

# 2. What is Active Directory?

Active Directory (AD) is a directory service developed by Microsoft.

It stores and organizes information about network objects such as:

- Users
- Computers
- Groups
- Organizational Units (OUs)
- Printers
- Shared folders
- Servers
- Domain Controllers

The directory provides centralized authentication, authorization, and administration for an organization's IT infrastructure.

---

# 3. Main Components of Active Directory

The Active Directory infrastructure is composed of several logical components.

## Domain

A domain is the main administrative boundary of Active Directory.

In this project, the configured domain is: lab.local


The domain stores all directory objects.

---

## Domain Controller

A Domain Controller (DC) is a Windows Server responsible for hosting Active Directory.

Its responsibilities include:

- User authentication
- Authorization
- Directory replication
- Group Policy management
- LDAP directory services
- DNS integration

The Domain Controller configured in this lab is: SRV-DC01 ( Our server)


---

## Organizational Units (OUs)

Organizational Units are containers used to organize Active Directory objects.

Examples from this project include:

Employees
Departments
Servers
Workstations
Security Group
Service Accounts


OUs simplify administration and allow Group Policy Objects (GPOs) to be applied to specific parts of the directory.

---

## Security Groups

Security Groups are used to organize users according to their roles and simplify permission management.

Examples include:

IT-Admins
HR-Users
Finance-Users
Management


Permissions can then be assigned to groups instead of individual users.

---

# 4. What is LDAP?

LDAP stands for: Lightweight Directory Access Protocol


LDAP is an open protocol used to access and manage directory services.

In Windows Server, Active Directory uses LDAP as its primary communication protocol for directory queries.

Whenever a client searches for users, groups, computers, or other directory objects, LDAP is used behind the scenes.

---

# 5. How LDAP Works

The communication process is illustrated below.


User / Computer
       │
       │ LDAP Request
       ▼
+----------------------+
| Domain Controller    |
| Active Directory     |
| LDAP Directory       |
+----------------------+
       │
       │ Search Result
       ▼
User Information
Group Membership
Computer Objects


LDAP enables clients to search and retrieve information stored inside Active Directory.

---

# 6. LDAP Ports

LDAP communication uses the following TCP ports.

| Protocol | Port | Description |
|----------|-----:|-------------|
| LDAP | 389 | Standard directory communication |
| LDAPS | 636 | Secure LDAP communication using SSL/TLS |

In production environments, LDAPS is recommended because it encrypts directory traffic.

---

# 7. LDAP in This Project

Although LDAP was not installed as a separate server role, it is already available because Active Directory Domain Services (AD DS) has been installed.

The following administrative tasks performed during this project rely on LDAP:

- Creating Organizational Units
- Creating Security Groups
- Creating User Accounts
- Searching Active Directory objects
- Managing directory objects using PowerShell

PowerShell cmdlets such as:

   powershell
Get-ADUser
Get-ADGroup
Get-ADComputer
Get-ADOrganizationalUnit


retrieve information from Active Directory through LDAP services.

---

# 8. Benefits of Active Directory

Active Directory provides numerous advantages for enterprise environments.

## Centralized Administration

Administrators manage all users, computers, and resources from a single location.

---

## Authentication

Users authenticate once to access organizational resources.

---

## Authorization

Access to shared resources is controlled through Security Groups and permissions.

---

## Scalability

Active Directory can manage thousands of users, computers, and servers across multiple domains.

---

## Security

Administrative policies can be enforced using Group Policy Objects (GPOs), while authentication and authorization are centrally managed.

---

## Automation

PowerShell enables administrators to automate repetitive tasks such as:

- User creation
- Group creation
- Organizational Unit deployment
- User provisioning from CSV files
- Permission management

---

# 9. Relationship Between Active Directory and LDAP

The relationship between Active Directory and LDAP can be summarized as follows:

```
Windows Server 2025
        │
        ▼
Active Directory Domain Services (AD DS)
        │
        ├── Authentication
        ├── Authorization
        ├── DNS Integration
        ├── Group Policy
        └── LDAP Services
```

Active Directory is the directory service, while LDAP is the protocol used to communicate with that directory.

---

# 10. Conclusion

Active Directory is the central identity and resource management platform in Microsoft Windows Server environments.

LDAP is the communication protocol that allows clients and administrators to query and manage the Active Directory database.

Throughout this project, every operation involving Organizational Units, Security Groups, and future User Account management relies on LDAP services provided by the Domain Controller.

Understanding the relationship between Active Directory and LDAP is essential for Windows Server administration and enterprise identity management.