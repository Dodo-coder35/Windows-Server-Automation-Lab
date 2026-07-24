# 02 - Network Configuration

## Virtual Network Configuration

All virtual machines are configured using VirtualBox Bridged Adapter mode.

The following machines are connected:

- SRV-DC01 (Windows Server 2022)
- Client_Windows (Windows 11)
- Client_Windows 2 (Windows 11)

## VirtualBox Network Settings

Network mode:
- Bridged Adapter

Purpose:
- Allow virtual machines to communicate with the physical network.
- Provide network connectivity during the initial configuration phase.

## Network Verification

The network connectivity was verified using the ipconfig and ping commands.

Results:
- SRV-DC01 : 192.168.11.101
- CLIENT01 : 192.168.11.116
- CLIENT02 : 192.168.11.117