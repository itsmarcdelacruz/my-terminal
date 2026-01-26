# =====================================================================
# POWERSHELL Profile - Marc Delacruz Template
# =====================================================================

# --- [ 1. WELCOME BANNER ] ---
# Displays system information on startup. 
# Requires: 'winget install fastfetch'
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
	fastfetch --logo "C:\Users\Marc\Documents\logo.txt" --structure 	Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Display:Terminal:CPU:GPU:Memory:Disk:Colors
}

# --- [ 2. PROMPT THEME ] ---
# Initialize Oh My Posh with 'TheCyberDen' theme.
# Loaded via URL to ensure it works on any machine instantly.
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/thecyberden.omp.json' | Invoke-Expression

# --- [ 3. SHELL ENHANCEMENTS ] ---
# Enables "Predictive Typing" (Right arrow to accept suggestions).
Set-PSReadLineOption -PredictionSource History

# --- [ 4. VISUAL UTILITIES ] ---
# Loads icons for files and folders for 'ls' and 'dir'.
# Requires: 'Install-Module Terminal-Icons'
if (Get-Module -ListAvailable -Name Terminal-Icons) {
    Import-Module Terminal-Icons
}

# --- [ 5. CUSTOM ALIASES ] ---
# Shortcut to edit this profile quickly
function conf { notepad $PROFILE }
# Shortcut to reload the profile after changes
function reload { &$PROFILE }
