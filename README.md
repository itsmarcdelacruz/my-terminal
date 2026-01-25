# 💻 TheCyberDen Terminal Setup

A modern, high-performance PowerShell 7 configuration featuring a "Cyberpunk" aesthetic, predictive typing, and rich icon support.

## ✨ Features
* **Shell:** PowerShell 7.5.4 (Core)
* **Engine:** [Oh My Posh](https://ohmyposh.dev/) with `TheCyberDen` theme.
* **IntelliSense:** History-based predictive text (Fish-shell style).
* **Icons:** [Terminal-Icons](https://github.com/devblackops/Terminal-Icons) for a rich file-system view.
* **System Info:** `fastfetch` for a clean hardware overview on startup.

## 🚀 One-Shot Installation

Open **PowerShell 7** as Administrator and run the following:

```powershell
# 1. Install Oh My Posh & Fastfetch
winget install JanDeDobbeleer.OhMyPosh -e
winget install fastfetch

# 2. Install Terminal Icons
Install-Module -Name Terminal-Icons -Repository PSGallery -Force

# 3. Install Required Nerd Font
oh-my-posh font install JetBrainsMono
