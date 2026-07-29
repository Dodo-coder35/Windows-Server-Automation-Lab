# Windows Client Domain Join

## Objective

The objective of this step is to join the Windows 11 client to the Active Directory domain (`lab.local`) hosted on the Windows Server 2022 Domain Controller.

---

## Environment

| Component               | Value          |
| ----------------------- | -------------- |
| Domain Controller       | SRV-DC01       |
| Domain                  | lab.local      |
| Server IP Address       | 192.168.11.101 |
| Client Operating System | Windows 11 Pro |

---

## Initial Configuration

Before joining the domain, the client was configured with a temporary static network configuration.

| Setting              | Value          |
| -------------------- | -------------- |
| IP Address           | 192.168.11.116 |
| Subnet Mask          | 255.255.255.0  |
| Default Gateway      | 192.168.11.1   |
| Preferred DNS Server | 192.168.11.101 |

> **Important:** The preferred DNS server must point to the Domain Controller. Active Directory relies on DNS to locate domain services.

---

## Joining the Domain

The following steps were performed:

1. Open **System Properties**.
2. Select **Computer Name**.
3. Click **Change**.
4. Choose **Domain**.
5. Enter the domain name:

   ```
   lab.local
   ```
6. Authenticate using the Domain Administrator account.
7. Restart the client computer.

After the restart, the workstation successfully joined the Active Directory domain.

---

## DHCP Configuration

Once the client successfully joined the domain, the temporary static configuration was removed.

The network adapter was reconfigured to:

* Obtain an IP address automatically.
* Obtain DNS server address automatically.

The client then received its network configuration from the Windows Server DHCP service.

The DHCP scope provides:

* IP Address
* Subnet Mask
* Default Gateway
* DNS Server (192.168.11.101)
* DNS Domain Name (lab.local)

This configuration follows enterprise best practices by allowing centralized network management while ensuring proper communication with the Domain Controller.

---

## Validation

The following checks confirmed the successful domain join:

* The client successfully authenticated to **lab.local**.
* The computer appeared in **Active Directory Users and Computers**.
* DNS name resolution for **lab.local** was successful.
* The client continued to receive its IP configuration from the DHCP server.

---

## Result

The Windows 11 client successfully joined the **lab.local** Active Directory domain while using the Windows Server DHCP service for automatic network configuration.

This validates the correct integration of:

* Active Directory Domain Services (AD DS)
* DNS
* DHCP
* Windows 11 Client


Organizing Computer Objects

After the client successfully joined the domain, the computer object was moved from the default Computers container to the Workstations Organizational Unit (OU).

This follows Active Directory best practices by allowing Group Policy Objects (GPOs) and administrative settings to be applied specifically to workstation computers.

Organizing computer accounts into dedicated OUs improves scalability, simplifies administration, and enables centralized policy management.