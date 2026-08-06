# Windows Server Automation Lab

## Description

This project consists of building a Windows Server administration laboratory environment and developing PowerShell scripts to automate system administration tasks.

The lab simulates a small enterprise infrastructure with one Windows Server 2025 acting as a Domain Controller and two physical Windows 11 clients that will be integrated into the Active Directory domain.

The project focuses on Active Directory administration, network services configuration, and PowerShell automation for repetitive system administration tasks.

---

# Objectives

The objectives of this project are:

- Deploy and configure a Windows Server 2025 environment
- Configure network settings for a server infrastructure
- Implement Active Directory Domain Services (AD DS)
- Promote the server as a Domain Controller
- Configure DNS and DHCP services
- Design an Active Directory organizational structure using Organizational Units (OUs)
- Manage users and security groups
- Automate administration tasks using PowerShell
- Document system administration procedures

---

# Environment

## Server Infrastructure

- Windows Server 2025
- Domain Controller
- Active Directory Domain Services (AD DS)
- DNS Server
- DHCP Server
- PowerShell
- Oracle VirtualBox

## Client Infrastructure

- Two physical Windows 11 computers
- Domain clients (Active Directory integration planned)

## Network Configuration

- Network: 192.168.11.0/24
- Domain: lab.local
- Server IP Address: 192.168.11.101
- Gateway: 192.168.11.1

---

# Lab Architecture

```
                         +--------------------------------+
                         |      Windows Server 2025       |
                         |            SRV-DC01            |
                         |                                |
                         | Domain Controller              |
                         | Active Directory (lab.local)   |
                         | DNS Server                    |
                         | DHCP Server                   |
                         |                                |
                         | IP: 192.168.11.101             |
                         +---------------+----------------+
                                         |
                                  Local Network
                                  192.168.11.0/24
                                         |
                         +---------------+---------------+
                         |                               |
              +--------------------+          +--------------------+
              | Client01           |          | Client02           |
              | Windows 11         |          | Windows 11         |
              | Domain Client      |          | Domain Client      |
              +--------------------+          +--------------------+

                         Gateway / Router
                              |
                         192.168.11.1
```

---

# Active Directory Structure

The Active Directory domain implemented in this laboratory is: lab.local


Current Organizational Unit structure:

lab.local
│
├── Employees
├── Departments
├── Servers
├── Workstations
├── Security Groups
└── Service Accounts


The first Organizational Units were created manually to understand Active Directory administration.

The remaining structure was automated using PowerShell scripts.

---

# Implemented Features

## Server Configuration

- Windows Server 2025 installation
- Static IP configuration
- Network connectivity configuration

## Active Directory

- Installation of Active Directory Domain Services
- Domain Controller promotion
- Domain creation: lab.local


## DNS

- DNS role installation
- Domain name resolution configuration

## DHCP

- DHCP role installation
- Scope configuration
- IP address distribution management

## Organizational Units

Manual and automated OU creation:

Manual:
Employees
Departments


Automated with PowerShell:
Servers
Workstations
Security Groups
Service Accounts


---

# PowerShell Automation

Automation scripts are stored in: scripts/


Current scripts:

```
scripts/
│
└── 01-create-organizational-units.ps1
```




---

# Project Structure


Windows-Server-Automation-Lab
│
├── docs
│   ├── 00-Active-Directory.md
    ├── 01-lab-setup.md
    ├── O2-Network-Configuration.md
│   ├── O3-Active-Directory-Installation.md
│   ├── 04-Domain-Controller.md
│   ├── 05-DHCP.md
│   ├──06-Organizational-Units.md
|   ├── 07-Security-Groups.md
|   ├──08-Departments-OU-Automation.md
|   ├──09-autmated-users-creation.md
|   ├──10-domain-client01.md 
|   ├──11-Control-Panel-restriction.md  
│   └──12-password-strategy.md 
|
|
|
|
|
|
|
|
|
├── screenshots
│   ├── 01_Server
│   ├── 02_Client_Windows
│   ├── 03_Network_Configuration
│   ├── 04_Active_Directory
│   ├── 05_Domain_Controller
│   ├── 06_DHCP
│   ├── 07_Organizational_Units
|   ├── 08_PowerShell_Automation
|   ├── 09_Security_Groups
|   ├── 10_Create_departments
|   ├── 11_create_users
|   ├── 12_domain_client01
|   ├── 13_Control_Panel_restriction
│   └── 14_Password_strategy
│
|
|
|
|
|
|
|
|
|
├── scripts
│   ├──01-create-organizational-units.ps1
|   ├──02-create-security-groups.ps1
│   ├──03-create-departments-ou.ps1
|   └──04-create-users-from-csv 
|
|
|──CSV
|   └──users.csv
|
|
|
└── README.md






# Conclusion

This project demonstrates the deployment and administration of a Windows Server 2025 enterprise environment.

It combines traditional Windows Server administration with PowerShell automation techniques to create a repeatable and maintainable infrastructure deployment process.