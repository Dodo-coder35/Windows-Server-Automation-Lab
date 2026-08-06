# Organizational Units (OU) Creation and Automation - Windows Server 2025

## 1. Introduction

Organizational Units (OUs) are Active Directory containers used to organize directory objects such as users, groups, computers, and service accounts.

Unlike default Active Directory containers, Organizational Units provide administrative flexibility by allowing administrators to:

- Delegate permissions
- Apply Group Policy Objects (GPOs)
- Organize resources according to the organization's structure

In this lab, Organizational Units were created using two approaches:

1. Manual creation through Active Directory Users and Computers
2. Automated creation using PowerShell scripts

This approach demonstrates both graphical administration skills and infrastructure automation capabilities.

---

# 2. Opening Active Directory Users and Computers

The Active Directory management console was opened from:

```
Server Manager
→ Tools
→ Active Directory Users and Computers
```

The Active Directory domain used in this laboratory is:

```
lab.local
```

---

# 3. Default Active Directory Containers

After the Domain Controller installation, Active Directory automatically creates several default containers.

Examples include:

- Builtin
- Computers
- Domain Controllers
- ForeignSecurityPrincipals
- Managed Service Accounts
- Users

These objects are created by Active Directory and should not be recreated manually.

Because some default containers already exist, creating Organizational Units with the same names is not possible.

For example:

```
Users
Computers
```

already exist as default containers.

---

# 4. Manual Organizational Unit Creation

The first Organizational Units were created manually to understand the Active Directory graphical administration process.

Creation path:

```
lab.local
→ Right Click
→ New
→ Organizational Unit
```

The following Organizational Units were created manually:

```
Employees
Departments
```

---

# 5. Purpose of Manually Created Organizational Units

## Employees

The **Employees** OU is designed to contain user accounts belonging to the organization.

Future automation scripts will create and manage user accounts inside this OU.

---

## Departments

The **Departments** OU is used to organize users according to their business department.

Examples:

```
Departments
│
├── IT
├── Human Resources
├── Finance
└── Management
```

Additional department structures can be created automatically using PowerShell.

---

# 6. PowerShell Automation of Organizational Units

After validating the manual creation process, PowerShell was used to automate the deployment of the Active Directory OU structure.

The automation script:

```
01-create-organizational-units.ps1
```

was created to automatically create required Organizational Units.

The script uses the Active Directory PowerShell module:

```powershell
Import-Module ActiveDirectory
```

and the command:

```powershell
New-ADOrganizationalUnit
```

to create OU objects.

---

# 7. Automation Features

The PowerShell script includes several administration best practices:

## Verification Before Creation

Before creating an OU, the script checks if it already exists.

This prevents duplicate objects and allows the script to be executed multiple times safely.

Example:

```
[INFO] OU 'Employees' already exists.
```

---

## Automatic OU Creation

The script automatically creates missing Organizational Units.

Created automatically:

```
Servers
Workstations
Security Groups
Service Accounts
```

Example:

```
[SUCCESS] OU 'Servers' created.
```

---

## Accidental Deletion Protection

The created Organizational Units are protected against accidental deletion:

```powershell
-ProtectedFromAccidentalDeletion $true
```

This helps prevent unwanted removal of important Active Directory objects.

---

# 8. Final Active Directory Structure

After manual creation and PowerShell automation, the final structure is:

```
lab.local
│
├── Employees
├── Departments
├── Servers
├── Workstations
├── Security Groups
└── Service Accounts
```

---

# 9. Automation Script Execution Result

The script execution was successful.

Example output:

```
[INFO] OU 'Employees' already exists.
[INFO] OU 'Departments' already exists.
[SUCCESS] OU 'Servers' created.
[SUCCESS] OU 'Workstations' created.
[SUCCESS] OU 'Security Groups' created.
[SUCCESS] OU 'Service Accounts' created.

Organizational Units deployment completed successfully.
```

---

# 10. Conclusion

The Organizational Unit structure was successfully deployed using both manual administration and PowerShell automation.

The manual phase helped validate the Active Directory organization process, while the PowerShell script provides a repeatable and scalable deployment method.

The next automation steps will include:

- Creating security groups with PowerShell
- Creating users from CSV files
- Assigning users to groups automatically
- Generating Active Directory reports