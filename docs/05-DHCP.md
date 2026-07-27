# DHCP Server Configuration - Windows Server 2025

## 1. Introduction

The Dynamic Host Configuration Protocol (DHCP) is a network service used to automatically assign IP configuration parameters to client machines.

In this lab, the DHCP Server role was installed on the Windows Server 2025 Domain Controller.

The objective is to provide automatic network configuration to domain clients, including:

- IP address
- Subnet mask
- Default gateway
- DNS server
- Active Directory domain information

The DHCP service is integrated with the Active Directory domain:

```
lab.local
```

---

# 2. Installing DHCP Server Role

The DHCP Server role was installed from:

```
Server Manager
→ Manage
→ Add Roles and Features
```

The installation type selected was:

```
Role-based or feature-based installation
```

The following role was selected:

```
DHCP Server
```

After selecting the role, the required features were automatically added.

The installation was completed successfully.

---

# 3. DHCP Post-Installation Configuration

After installing the DHCP role, Windows Server displayed the notification:

```
Configuration required for DHCP Server at SRV
```

The post-installation configuration was started from:

```
Server Manager
→ Notifications
→ Complete DHCP configuration
```

---

# 4. DHCP Server Authorization

Because the server is part of an Active Directory domain, the DHCP Server must be authorized before distributing IP addresses.

The authorization step required domain administrator credentials.

Configured account:

```
LAB\Administrator
```

The configuration was committed successfully.

Result:

```
Configuration successful
```

---

# 5. Creating DHCP Scope

A DHCP Scope defines the range of IP addresses that can be assigned to client machines.

A new scope was created from:

```
DHCP Manager
→ IPv4
→ New Scope
```

---

# 6. Scope Configuration

## Scope Name

The scope was named:

```
LAB-Network-Scope
```

Description:

```
DHCP scope for lab.local domain
```

---

## IP Address Range

The network used in this laboratory is:

```
Network:
192.168.11.0/24
```

The DHCP address pool was configured as:

```
Start IP Address:
192.168.11.100

End IP Address:
192.168.11.200

Subnet Mask:
255.255.255.0
```

This range allows DHCP clients to automatically receive addresses within the local network.

---

# 7. DHCP Address Exclusion

The Domain Controller uses a static IP address:

```
192.168.11.101
```

This address was excluded from the DHCP pool to prevent another device from receiving the same IP address.

Exclusion range:

```
Start IP Address:
192.168.11.101

End IP Address:
192.168.11.101
```

---

# 8. Lease Duration

The DHCP lease duration was kept with the default value:

```
8 days
```

This defines how long a client can use an assigned IP address before renewal.

---

# 9. DHCP Options Configuration

The option:

```
Yes, I want to configure these options now
```

was selected.

The following DHCP options were configured.

---

## Default Gateway (Router)

The default gateway was configured as:

```
192.168.11.1
```

This corresponds to the physical router connected to the network.

The gateway allows clients to communicate with external networks.

---

## DNS Server

The DNS server was configured as:

```
192.168.11.101
```

The Windows Server acts as the Active Directory DNS server.

Clients must use this DNS server to locate the domain:

```
lab.local
```

---

## Domain Name

The Active Directory domain name was configured as:

```
lab.local
```

This allows DHCP clients to automatically receive the domain information.

---

# 10. DHCP Scope Activation

After configuration, the DHCP scope was activated.

The final DHCP structure is:

```
DHCP
 └── IPv4
      └── LAB-Network-Scope
           ├── Address Pool
           ├── Address Leases
           └── Scope Options
```

---

# 11. Network Configuration Summary

The final network configuration is:

```
Domain Controller:
192.168.11.101

Gateway:
192.168.11.1

DNS Server:
192.168.11.101

Domain:
lab.local

DHCP Range:
192.168.11.100 - 192.168.11.200
```

---

# 12. Conclusion

The DHCP Server has been successfully installed and configured on Windows Server 2025.

The server is now able to automatically provide network configuration to client machines joining the Active Directory domain.

The next steps of the laboratory will include:

- Creating Organizational Units (OU)
- Creating users and groups
- Automating Active Directory administration with PowerShell
- Joining client machines to the domain