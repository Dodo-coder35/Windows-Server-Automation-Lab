# Password Policy with Group Policy (GPO)

## Project

Windows Server Automation Lab

---

# Objective

The purpose of this task is to improve the security of the Active Directory domain by enforcing password policies through Group Policy Objects (GPO).

The configured policy ensures that all domain users create stronger passwords and follow security best practices.

---

# Environment

- Windows Server 2025
- Active Directory Domain Services (AD DS)
- Domain: lab.local
- Client: CLIENT02 (Domain Joined)

---

# Step 1 – Open Group Policy Management

Open:

```
Server Manager
→ Tools
→ Group Policy Management
```

Expand:

```
Forest: lab.local
└── Domains
    └── lab.local
```

---

# Step 2 – Edit the Default Domain Policy

Right-click:

```
Default Domain Policy
```

Select:

```
Edit
```

---

# Step 3 – Navigate to Password Policy

Go to:

```
Computer Configuration
└── Policies
    └── Windows Settings
        └── Security Settings
            └── Account Policies
                └── Password Policy
```

---

# Step 4 – Configure Password Policy

The following settings were applied.

| Setting | Value |
|----------|-------|
| Enforce password history | 5 passwords remembered |
| Maximum password age | 90 days |
| Minimum password age | 1 day |
| Minimum password length | 8 characters |
| Password must meet complexity requirements | Enabled |
| Store passwords using reversible encryption | Disabled |

---

# Password Complexity

When password complexity is enabled, Windows requires passwords to:

- Meet the minimum password length.
- Contain characters from at least three of the following categories:
  - Uppercase letters (A-Z)
  - Lowercase letters (a-z)
  - Numbers (0-9)
  - Special characters (! @ # $ % ...)

Example:
Temp@12345


This password satisfies the complexity requirements.

---

# Step 5 – Apply the Policy

Run:

powershell
gpupdate /force


This forces the Group Policy update on the server.

---

# Step 6 – Validation

The policy was validated using **CLIENT02**.

Tests performed:

✔ Weak passwords were rejected.

✔ Passwords respecting the configured complexity rules were accepted.

This confirms that the domain password policy is correctly applied.

---

# Result

The Active Directory domain now enforces secure password policies for all users.

This improves authentication security and reduces the risk of weak passwords.

---

# Screenshots

Suggested screenshots:

```
screenshots/
└── 07-group-policy-password-policy/
    ├── 01-group-policy-management.png
    ├── 02-default-domain-policy.png
    ├── 03-password-policy-settings.png
    ├── 04-gpupdate-force.png
    ├── 05-client02-password-test.png
```



# Skills Demonstrated

- Group Policy Management
- Active Directory Administration
- Domain Security
- Password Policy Configuration
- Windows Server 2025
- Client Validation