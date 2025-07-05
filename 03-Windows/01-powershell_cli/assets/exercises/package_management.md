# Powershell Package Management

It's time to start installing softwares and keep them updated. We will see how to use Chocolatey and how to use Windows Updates.

* Instructions

- Get Windows updates
    - Install the `PSWindowsUpdate` module
    - Type `Get-WindowsUpdate` to check for updates
    - Type `Install-WindowsUpdate` to install updates
- Manage Packages
    - Install `Chocolatey`
    - Install `VLC` from `Chocolatey`
    - Upgrade `VLC` to the latest version (it should already be but it's your first use)
    - Remove the `VLC` package using `Chocolatey`
    - Could you use `Chocolatey` on already installed software? How?
- Manage Windows Features
    - Get installed windows features with the command `Get-WindowsFeature`
    - Install a new feature such as hyper-v with `Install-WindowsFeature`

> **WARGNING**: This exercise **will only work on Windows** since it's specific to the way windows manages packages.

# 📦 PowerShell Package Management – Answers

> ⚠️ WARNING: This exercise only works on **Windows** since it's specific to the way Windows manages packages and features.

---

## 🔄 Get Windows Updates

### ✅ Install the PSWindowsUpdate module

```powershell
Install-Module -Name PSWindowsUpdate -Force
```

You might need to allow NuGet and adjust execution policy:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

### ✅ Check for updates

```powershell
Get-WindowsUpdate
```

---

### ✅ Install updates

```powershell
Install-WindowsUpdate
```

May require confirmation or system restart.

---

## 🍫 Manage Packages with Chocolatey

### ✅ Install Chocolatey

Run this in an **elevated (Admin) PowerShell** session:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

---

### ✅ Install VLC with Chocolatey

```powershell
choco install vlc -y
```

---

### ✅ Upgrade VLC to the latest version

```powershell
choco upgrade vlc -y
```

---

### ✅ Remove VLC package

```powershell
choco uninstall vlc -y
```

---

### ❓ Can you use Chocolatey on already installed software?

✅ Yes, **if the software matches a Chocolatey package**.  
To manage it via Chocolatey, reinstall or upgrade it with Chocolatey:

```powershell
choco install firefox -y --force
```

This registers the app under Chocolatey's control.

---

## ⚙️ Manage Windows Features

### ✅ List installed Windows features

```powershell
Get-WindowsFeature
```

---

### ✅ Install a new feature like Hyper-V

```powershell
Install-WindowsFeature -Name Hyper-V -IncludeAllSubFeature -IncludeManagementTools
```

🖥️ This will enable the Hyper-V feature, which may require a restart.
