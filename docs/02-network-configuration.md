# 02 - Network Configuration

## Virtual Network Configuration

All virtual machines are configured using **VirtualBox Bridged Adapter** mode.

The following machines are connected:

- Windows Server 2022
- Windows 11 Client 01
- Windows 11 Client 02

## VirtualBox Network Settings

### Network Mode

- Bridged Adapter

### Purpose

- Allow virtual machines to communicate with the physical network.
- Provide network connectivity during the initial configuration phase.
- Prepare the server for the Active Directory deployment.

## Static IP Configuration

A static IPv4 address was assigned to the Windows Server before installing Active Directory.

| Setting | Value |
|---------|-------|
| IP Address | 192.168.11.101 |
| Subnet Mask | 255.255.255.0 |
| Default Gateway | 192.168.11.1 |
| Preferred DNS Server | 192.168.11.101 |

> **Note:** A static IP address is required before installing Active Directory Domain Services to ensure that the future Domain Controller always uses the same network address.

## Network Verification

The network connectivity was verified using the `ipconfig` and `ping` commands.

### Results

| Machine | IP Address |
|---------|------------|
| Windows Server | 192.168.11.101 |
| CLIENT01 | 192.168.11.116 |
| CLIENT02 | 192.168.11.117 |

The network configuration was successfully verified, and all virtual machines can communicate over the local network.

## Screenshots

- VirtualBox Bridged Adapter configuration
- Static IPv4 configuration
- `ipconfig /all`
- Successful ping test