

# 1. Promoting the Server to Domain Controller

The promotion process was started from:

```

Server Manager
→ Notifications
→ Promote this server to a domain controller

```

This wizard allows the server to become the first Domain Controller of the Active Directory environment.

---

# 2. Deployment Configuration

Because this server is the first Domain Controller in the environment, the following option was selected:

```

Add a new forest

```

This option creates a new Active Directory forest.

# Root domain name

The domain name configured was:

```

lab.local

```

The domain `lab.local` represents the internal Active Directory domain used in this laboratory environment.

---

# 3. Domain Controller Options

The following options were configured during the Domain Controller setup.

## Forest functional level

Selected:

```

Windows Server 2025

```

## Domain functional level

Selected:

```

Windows Server 2025

```

Functional levels define the Active Directory features available in the domain and forest.

---

## Additional Services

### DNS Server

Enabled:

```

✓ DNS Server

```

The DNS service is required because Active Directory uses DNS for domain name resolution and service discovery.

---

### Global Catalog

Enabled:

```

✓ Global Catalog (GC)

```

The Global Catalog contains information about objects in the Active Directory forest and helps users authenticate efficiently.

---

## Directory Services Restore Mode (DSRM)

A Directory Services Restore Mode password was configured.

The DSRM password is used for Active Directory recovery operations in case of problems with the directory service.

---

# 4. DNS Options

During the DNS configuration step, the following option was not enabled:

```

Create a DNS delegation

```

The option remained unchecked because this server is the first DNS server of the new Active Directory forest.

No existing parent DNS zone was available for delegation.

---

# 5. Additional Options

The NetBIOS domain name was automatically generated:

```

LAB

```

Active Directory identification:

```

DNS Domain Name:
lab.local

NetBIOS Domain Name:
LAB

```

The NetBIOS name provides compatibility with older Windows services and applications.

---

# 6. Active Directory Database and SYSVOL Paths

The default storage locations were kept.

## Database folder

```

C:\Windows\NTDS

```

This folder stores the Active Directory database.

---

## Log files folder

```

C:\Windows\NTDS

```

This folder stores Active Directory transaction logs.

---

## SYSVOL folder

```

C:\Windows\SYSVOL

```

This folder stores:

- Group Policy Objects (GPO)
- Domain scripts
- Public domain files

---

# 7. Review Options

Before starting the installation, Windows Server displayed a summary of all selected configurations.

The following settings were reviewed:

- New Active Directory forest creation
- Domain name: `lab.local`
- DNS Server installation
- Global Catalog activation
- Database and SYSVOL paths

After verification, the installation process was started.

---

# 8. Prerequisites Check

Windows Server performed a validation before the promotion:

```

Prerequisites Check

```

The verification result was: All prerequisite checks passed successfully



This confirmed that the server was ready to become a Domain Controller.

---

# 9. Domain Controller Installation

The installation was launched by clicking:

```

Install

```

Windows Server configured:

- Active Directory Domain Services
- DNS Server
- Active Directory database
- SYSVOL replication

After the configuration, the server automatically restarted.

---

# 10. Verification

After restarting, the server was successfully promoted as a Domain Controller.

Active Directory information:

```

Operating System:
Windows Server 2025

Domain:
lab.local

NetBIOS Name:
LAB

Server Role:
Domain Controller

```

The Active Directory environment is now ready for:

- User and group management
- Organizational Units (OU)
- Group Policy Objects (GPO)
- PowerShell automation
- Windows domain administration

---

# Conclusion

The Windows Server 2025 machine has been successfully configured as the first Domain Controller of the `lab.local` Active Directory domain.

This configuration provides the foundation for the next steps of the laboratory, including user creation, security policies, and administration automation using PowerShell.
