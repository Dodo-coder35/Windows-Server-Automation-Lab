# 03 - Active Directory Domain Services Installation

## Objective

Install the **Active Directory Domain Services (AD DS)** role on Windows Server 2022 in preparation for promoting the server to a Domain Controller.

---

## Installing the AD DS Role

The Active Directory Domain Services role was installed using **Server Manager**.

### Installation Steps

1. Open **Server Manager**.
2. Click **Manage**.
3. Select **Add Roles and Features**.
4. Choose **Role-based or feature-based installation**.
5. Select the local server.
6. Check **Active Directory Domain Services**.
7. Click **Add Features** when prompted.
8. Continue using the default settings.
9. Click **Install**.
10. Wait until the installation completes successfully.

---

## Installation Verification

After the installation, Server Manager displayed the notification:

> **Promote this server to a domain controller**

This confirms that the AD DS role has been successfully installed and that the server is ready for domain controller promotion.

---

## Screenshots

- Server Manager
- Add Roles and Features Wizard
- Server Selection
- Active Directory Domain Services selected
- Add Features confirmation
- Installation progress
- Installation completed
- "Promote this server to a domain controller" notification 


