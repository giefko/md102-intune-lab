# md102-intune-lab
# MD-102 Intune & Endpoint Administration Lab

## 📌 Overview

This repository contains a hands-on lab environment designed to simulate a hybrid enterprise infrastructure for Microsoft Endpoint Administration, aligned with the MD-102 certification objectives.

The lab demonstrates device lifecycle management, identity integration, security compliance, and application deployment using Microsoft Intune and Microsoft Entra ID in a hybrid Active Directory environment.

---

## 🧱 Lab Architecture

**On-Prem Infrastructure**

* Active Directory Domain Services (AD DS)
* Group Policy Objects (GPO)
* Domain-joined Windows endpoints

**Cloud Integration**

* Microsoft Entra ID (Azure AD)
* Microsoft Intune (MDM/MAM)
* Conditional Access
* Compliance policies

---

## 🖥 Components

| Component            | Role                                |
| -------------------- | ----------------------------------- |
| DC01                 | Domain Controller                   |
| Windows 10/11 VM     | Managed endpoint                    |
| Microsoft 365 Tenant | Cloud identity & device management  |
| Intune               | Endpoint compliance & configuration |

---

## 🔧 Implemented Scenarios

### Identity & Access

* Hybrid identity synchronization
* Azure AD Join
* Multi-Factor Authentication (MFA)

### Device Management

* Intune enrollment
* Device compliance evaluation
* Device lifecycle actions (wipe, retire, reset)

### Security Policies

* BitLocker encryption enforcement
* Microsoft Defender configuration
* Firewall and endpoint protection policies

### Conditional Access

* Require compliant devices
* Require MFA for cloud apps
* Block unmanaged devices

### Application Deployment

* Win32 app packaging
* Required vs available assignments
* Silent software deployment

### Windows Autopilot

* Device provisioning profiles
* Naming conventions
* Zero-touch enrollment simulation

---

## 🗺 Topology Diagram

```
On-Prem AD → Entra ID → Intune → Managed Endpoint
```

(Diagram available in /diagrams folder)

---

## 📂 Repository Structure

```
Vagrantfile              # Lab infrastructure deployment
/scripts                 # AD setup & domain join automation
/intune                  # Policy & deployment documentation
/conditional-access      # Security scenarios
/diagrams                # Topology visuals
```

---

## 🎯 Learning Objectives

* Implement enterprise endpoint management
* Configure compliance & security baselines
* Deploy applications via Intune
* Enforce Conditional Access controls
* Manage hybrid identity devices

---

## 🧪 Skills Demonstrated

* Microsoft Intune Administration
* Microsoft Entra ID
* Endpoint Security & Compliance
* Windows Autopilot
* Hybrid Identity Integration
* PowerShell automation

---

## 📜 Certification Alignment

This lab aligns with:

**Microsoft MD-102 — Endpoint Administrator Associate**

---

## ⚠️ Disclaimer

This is a personal lab environment created for educational and certification preparation purposes. No production or corporate data is included.

---

## 👤 Author

Efstratios Kokkinis


