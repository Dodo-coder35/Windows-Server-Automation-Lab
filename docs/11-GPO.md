# Group Policy Object (GPO)

## 📌 Definition
A **Group Policy Object (GPO)** is a set of rules and configurations in Active Directory used to manage and control the behavior of users and computers within a domain.

## 🎯Purpose
- Centralized management**: Apply settings to multiple users or computers from one place.  
- Security enforcement**: Restrict access to features (e.g., disable Control Panel, enforce password policies).  
- Consistency**: Ensure all domain members follow the same standards.  
- Automation**: Reduce manual configuration across devices.

## ⚙️ How GPOs Work
- GPOs are created and managed through the **Group Policy Management Console (GPMC)**.  
- They contain two main categories of settings:
  - **Computer Configuration** → applies to machines regardless of who logs in.  
  - **User Configuration** → applies to user accounts regardless of the machine.  
- GPOs are linked to **Organizational Units (OUs)**, domains, or sites.  
- Application order follows the hierarchy: **Local → Site → Domain → OU**.

## 🔄 Loopback Processing
Loopback processing allows user settings to be applied based on the computer they log into:
- **Merge** → combines normal user GPOs with computer-linked GPOs (computer GPOs override conflicts).  
- **Replace** → ignores normal user GPOs and applies only computer-linked GPOs.

## ✅ Example Use Cases
- Disable **Control Panel** for all users in a department.  
- Enforce a specific homepage in browsers.  
- Deploy software automatically to domain computers.  
- Apply password and security policies consistently.

---

## ⚙️ Procedure I Followed

### 1. Create the GPO
- Open **Group Policy Management Console (GPMC)**.  
- Right-click the domain or OU → **Create a GPO in this domain, and Link it here**.  
- Name the GPO (e.g., *Block Control Panel*).  

### 2. Configure the GPO
- Edit the GPO.  
- Navigate to:  User Configuration → Policies → Administrative Templates → Control Panel

- Enable the policy **Prohibit access to Control Panel and PC settings**.  

### 3. Link the GPO
- Initially, the GPO was linked to the **Workstations OU** (computers).  
- Result: the GPO was detected but refused, because it contained **User Configuration** settings.  

### 4. Correct the Scope
- The GPO was re-linked to the **Departments OU**, where the **user accounts** are located.  
- Result: the GPO applied successfully, and the Control Panel was blocked for users.  

### 5. Verification
- On a client machine, run:  
```cmd
gpupdate /force
gpresult /h report.html
