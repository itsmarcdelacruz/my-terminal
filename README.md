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
```

## 🔄 2. Switch to the New PowerShell
The winget command above installed PowerShell 7, which is actually a brand-new app on your computer, separate from the old Windows PowerShell you just used.

Close your current terminal window.

Open Windows Terminal again, click the down arrow (v) next to the new tab button, and open PowerShell (the one with the black icon, not the blue one).

## 📝 3. Add Your Profile Code
Now you need to add your custom script so it loads every time.

In your new terminal tab, type this command and press Enter:

PowerShell
notepad $PROFILE
(If Notepad asks if you want to create a new file, click Yes).

Copy and paste the contents of your Microsoft.Powershell_profile.ps1 file into that Notepad window.

Save the file (Ctrl + S) and close Notepad.

Back in the terminal, type . $PROFILE and press Enter to load it.

## ⚙️ 4. Final Setup & Visual Polish
Your script is running, but the font and UI need to be configured so your icons don't render as broken square boxes. Open Windows Terminal Settings (Ctrl + ,) and apply these tweaks:

Set Defaults: In Startup, change the "Default profile" to PowerShell (the black icon) and "Default terminal application" to Windows Terminal. Click Save.

Apply the Font: Go to Profiles > Defaults > Appearance. Change the "Font face" to JetBrainsMono NFM.

Add Breathing Room: Still in the Appearance tab, scroll down to Padding and change it to 8, 8, 8, 8.

Frosted Glass (Optional): Scroll down to Transparency, turn on Enable acrylic material, and set the opacity to 85%. Click Save.

Note: Once you've saved these settings, close Windows Terminal completely and reopen it. You should instantly see your new Cyberpunk prompt and system info banner!

## 🧠 How to Use Your New Superpowers
z <folder>: Replaces cd. Teleport anywhere instantly (e.g., typing z pro takes you directly to your projects folder based on your habits).

Ctrl + R: Opens a blazing-fast fuzzy search of your entire command history. Just start typing to find a command from last week.

gsudo <command>: Run a command as Administrator without opening a new window.

update-prompt: A custom alias to clear your cache and reload the profile if you ever change your Oh My Posh theme.
