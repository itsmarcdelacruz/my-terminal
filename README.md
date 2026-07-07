# 💻 My Terminal Setup

A modern, high-performance PowerShell 7 configuration featuring a "Cyberpunk" aesthetic, predictive typing, rich icon support, and elite power-user navigation tools.

## ✨ Features

* **Shell:** PowerShell 7 (Latest)
* **Engine:** Oh My Posh with 'TheCyberDen' theme (Cached for zero-latency startup).
* **Smart Navigation:** Zoxide (teleport to folders) and FZF (Ctrl+R fuzzy history search).
* **Elevation:** `gsudo` allows for Linux-style instant admin privileges in the current tab.
* **IntelliSense:** History-based predictive text with a dropdown view.
* **Icons & UI:** Terminal-Icons for a rich file-system view and Fastfetch for hardware overview.

## 🚀 One-Shot Installation

Open **Windows PowerShell** as Administrator and run the following command block:

```powershell
# 1. Allow scripts to run (Required for PowerShell profiles)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# 2. Install Core Tools (PowerShell 7, Oh My Posh, Fastfetch)
winget install Microsoft.PowerShell -e --source winget
winget install JanDeDobbeleer.OhMyPosh -e
winget install fastfetch -e

# 3. Install Power-User Tools (Zoxide, FZF, gsudo)
winget install zoxide -e
winget install fzf -e
winget install gerardog.gsudo -e

# 4. Install PowerShell Modules (Icons & FZF Integration)
Install-Module -Name Terminal-Icons, PSFzf -Repository PSGallery -Force -Scope CurrentUser

# 5. Install Required Nerd Font (May require a terminal restart first)
oh-my-posh font install JetBrainsMono
