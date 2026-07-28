# Security Groups Creation and Automation - Windows Server 2025

## 1. Introduction

Security Groups are Active Directory objects used to organize users and assign permissions to resources.

Unlike Organizational Units (OUs), which are used to organize directory objects and apply administrative policies, Security Groups are used to simplify permission management.

In this lab, Security Groups were created using two approaches:

1. Manual creation using Active Directory Users and Computers
2. Automated creation using PowerShell

The objective is to demonstrate both graphical administration and automation of Active Directory management tasks.

---

# 2. Understanding Group Type and Group Scope

When creating an Active Directory group, two important options must be configured:

## Group Type

The group type defines the purpose of the group.

Available options:

- Security
- Distribution

In this lab, Security Groups are used because they can be assigned permissions on network resources.

Example:

```
Group type: Security
```

---

## Group Scope

The group scope defines where the group can be used.

Available options:

- Domain Local
- Global
- Universal

In this lab, Global groups are used.

Example:

```
Group scope: Global
```

Configuration used:

```
Group type  : Security
Group scope : Global
```

---

# 3. Security Group Organizational Unit

To maintain a clean Active Directory structure, security groups are stored inside a dedicated Organizational Unit.

The OU created for this purpose is:

```
Security Group
```

Active Directory structure:

```
lab.local
│
└── Security Group
    │
    ├── IT-Admins
    ├── HR-Users
    ├── Finance-Users
    ├── Management
    └── Helpdesk
```

This organization makes administration easier and separates groups from default Active Directory containers.

---

# 4. Manual Security Group Creation

The first security groups were created manually using the graphical interface.

Access path:

```
Server Manager
→ Tools
→ Active Directory Users and Computers
```

Creation steps:

```
Security Group OU
→ Right Click
→ New
→ Group
```

The following groups were created manually:

```
IT-Admins
HR-Users
```

Configuration:

```
Group scope : Global
Group type  : Security
```

After creation, the groups were moved into:

```
lab.local
└── Security Group
```

---

# 5. Purpose of Created Groups

## IT-Admins

The IT-Admins group is intended to contain users responsible for system administration tasks.

Examples:

- Server administrators
- Domain administrators
- IT support personnel

---

## HR-Users

The HR-Users group is intended for users belonging to the Human Resources department.

This group can later be used to assign specific permissions to HR resources.

---

# 6. PowerShell Automation

After validating manual group creation, PowerShell was used to automate Security Group deployment.

The automation script created is:

```
02-create-security-groups.ps1
```

The script uses the Active Directory PowerShell module:

```powershell
Import-Module ActiveDirectory
```

and the command:

```powershell
New-ADGroup
```

to create groups automatically.

---

# 7. Automated Security Groups

The script creates the following groups:

```
IT-Admins
HR-Users
Finance-Users
Management
Helpdesk
```

Before creating a group, the script checks if it already exists.

Example:

```
[INFO] Group 'IT-Admins' already exists.
```

Missing groups are automatically created:

```
[SUCCESS] Group 'Finance-Users' created.
[SUCCESS] Group 'Management' created.
[SUCCESS] Group 'Helpdesk' created.
```

---

# 8. PowerShell Script Location

The automation script is stored in the project directory:

```
scripts/
│
└── 02-create-security-groups.ps1
```

The script creates groups inside:

```
OU=Security Group,DC=lab,DC=local
```

---

# 9. Final Active Directory Structure

After manual creation and PowerShell automation, the final structure is:

```
lab.local
│
├── Employees
│
├── Departments
│
├── Servers
│
├── Workstations
│
├── Security Group
│   │
│   ├── IT-Admins
│   ├── HR-Users
│   ├── Finance-Users
│   ├── Management
│   └── Helpdesk
│
└── Service Accounts
```

---

# 10. Result

Security Groups were successfully created and organized in Active Directory.

This step demonstrates:

- Active Directory group management
- Proper OU organization
- Security Group configuration
- PowerShell automation

The next step of the project will focus on creating user accounts automatically and assigning them to the appropriate Security Groups.
---

# Conclusion

The Security Groups implementation combines manual administration and PowerShell automation.

The manual phase provides an understanding of Active Directory management, while automation ensures a faster, repeatable, and scalable deployment process.