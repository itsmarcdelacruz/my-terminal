---

### **Microsoft.Powershell_profile.ps1**

```powershell
# =====================================================================
# POWERSHELL Profile - Marc Delacruz Template
# =====================================================================

# --- [ 1. WELCOME BANNER ] ---
# Displays system information on startup.
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    $logoPath = "$env:USERPROFILE\Documents\logo.txt"
    if (Test-Path $logoPath) {
        fastfetch --logo $logoPath --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Display:Terminal:CPU:GPU:Memory:Disk:Colors
    } else {
        fastfetch --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Display:Terminal:CPU:GPU:Memory:Disk:Colors
    }
}

# --- [ 2. PROMPT THEME (CACHED FOR SPEED) ] ---
# Generates the prompt script once and reads it from a text file to eliminate web/rendering latency on startup.
$OmpCache = "$env:LOCALAPPDATA\oh-my-posh.ps1"
if (!(Test-Path $OmpCache)) {
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\thecyberden.omp.json" --print | Out-File -FilePath $OmpCache -Encoding utf8
}
. $OmpCache

# --- [ 3. SHELL ENHANCEMENTS & NAVIGATION ] ---
# Zoxide: Smarter 'cd' based on frequent/recent habits
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

# FZF: Fuzzy find for history search (Press Ctrl+r)
Import-Module PSFzf -ErrorAction SilentlyContinue
if (Get-Command Invoke-Fzf -ErrorAction SilentlyContinue) {
    Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
}

# PSReadLine: Predictive Typing with Dropdown list
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# --- [ 4. VISUAL UTILITIES ] ---
# Loads icons for files and folders for 'ls' and 'dir'.
Import-Module Terminal-Icons -ErrorAction SilentlyContinue

# --- [ 5. CUSTOM ALIASES & FUNCTIONS ] ---
# Edit this profile
function conf { notepad $PROFILE }

# Reload the profile safely
function reload { . $PROFILE }

# Clear Oh My Posh cache and reload (Use this if you change your theme!)
function update-prompt { 
    Remove-Item $OmpCache -ErrorAction SilentlyContinue
    . $PROFILE 
    Write-Host "Prompt cache cleared and reloaded!" -ForegroundColor Green
}
