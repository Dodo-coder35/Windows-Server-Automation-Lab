
# Windows Server Automation Lab

## Description

This project consists of building a Windows Server administration laboratory environment and developing PowerShell scripts to automate system administration tasks.

The lab simulates a small enterprise infrastructure with one Windows Server acting as a Domain Controller and two Windows 11 clients connected to the domain.

## Objectives

The objectives of this project are:

- Deploy and configure a Windows Server environment
- Implement Active Directory Domain Services (AD DS)
- Configure and manage users and groups
- Automate administration tasks using PowerShell
- Document system administration procedures

## Environment

- Windows Server 2022
- Two Windows 11 Clients
- Active Directory Domain Services (AD DS)
- PowerShell
- Oracle VirtualBox

## Lab Architecture

```text
                 +-----------------------+
                 |  Windows Server 2022  |
                 |       SRV-DC01        |
                 | Domain Controller     |
                 | AD DS + DNS           |
                 +-----------+-----------+
                             |
                     Internal Network
                             |
              +--------------+--------------+
              |                             |
              |                             |
     +----------------+          +----------------+
     |   Windows 11   |          |   Windows 11   |
     |    CLIENT01    |          |    CLIENT02    |
     | Domain Client  |          | Domain Client  |
     +----------------+          +----------------+
