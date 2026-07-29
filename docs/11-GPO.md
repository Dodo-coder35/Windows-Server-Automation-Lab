# Group Policy Object (GPO) Configuration

## Objective

The objective of this step is to configure a Group Policy Object (GPO) in the Active Directory environment in order to apply centralized security and configuration settings to domain computers.

In this lab, a GPO was created and linked to the **Workstations** Organizational Unit (OU) to manage workstation policies.

---

## Why Use Group Policy Objects?

Group Policy Objects (GPOs) are a feature of Active Directory that allows administrators to centrally manage users and computers within a domain.

Instead of manually configuring each computer individually, administrators can define policies once on the Domain Controller and automatically apply them to targeted computers or users.

GPOs are commonly used in enterprise environments for:

* Enforcing security policies.
* Restricting user access to certain Windows features.
* Configuring operating system settings.
* Deploying software and scripts.
* Managing user and computer configurations.

Using GPOs improves:

* Centralized administration.
* Security management.
* Configuration consistency.
* Scalability in large environments.

---

## GPO Implementation

### Environment

| Component         | Value                                |
| ----------------- | ------------------------------------ |
| Domain            | lab.local                            |
| Domain Controller | SRV-DC01                             |
| Target OU         | Workstations                         |
| GPO Name          | Workstations - Disable Control Panel |

---

## Creating the GPO

The Group Policy Management Console was opened from:

```
Server Manager
→ Tools
→ Group Policy Management
```

A new GPO was created and linked to the **Workstations** Organizational Unit.

The GPO was named:

```
Workstations - Disable Control Panel
```

Linking the GPO to the Workstations OU ensures that all computers placed inside this OU automatically receive this policy.

---

## Configured Policy

The following policy was enabled:

```
User Configuration
    → Policies
        → Administrative Templates
            → Control Panel
                → Prohibit access to Control Panel and PC settings
```

The policy state was configured as:

```
Enabled
```

---

## Applying the GPO

After creating the policy, the client computer was forced to refresh its Group Policy settings using:

```cmd
gpupdate /force
```

This command immediately requests the latest policies from the Domain Controller.

---

## Validation

The GPO application was verified on the Windows client.

Expected behavior:

* The user cannot open the Control Panel.
* Windows Settings access is restricted.
* The restriction is automatically applied by Active Directory.

---

## Result

The Group Policy Object was successfully created and applied to the Workstations OU.

This demonstrates the integration of:

* Active Directory Domain Services (AD DS)
* Organizational Units (OU)
* Group Policy Management
* Centralized workstation administration

The implementation provides a foundation for applying additional enterprise security policies such as password policies, software deployment, security restrictions, and workstation hardening.
