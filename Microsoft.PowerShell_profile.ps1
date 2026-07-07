# =====================================================================
# POWERSHELL Profile - Marc Delacruz Template
# =====================================================================

# --- [ 1. WELCOME BANNER ] ---
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    $logoPath = "$env:USERPROFILE\Documents\logo.txt"
    if (Test-Path $logoPath) {
        fastfetch --logo $logoPath --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Display:Terminal:CPU:GPU:Memory:Disk:Colors
    } else {
        fastfetch --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Display:Terminal:CPU:GPU:Memory:Disk:Colors
    }
}

# --- [ 2. PROMPT THEME (CACHED FOR SPEED) ] ---
$OmpCache = "$env:LOCALAPPDATA\oh-my-posh.ps1"
if (!(Test-Path $OmpCache)) {
    oh-my-posh init pwsh --config "$env:LOCALAPPDATA\thecyberden.omp.json" --print | Out-File -FilePath $OmpCache -Encoding utf8
}
. $OmpCache

# --- [ 3. SHELL ENHANCEMENTS & NAVIGATION ] ---
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

Import-Module PSFzf -ErrorAction SilentlyContinue
if (Get-Command Invoke-Fzf -ErrorAction SilentlyContinue) {
    Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
}

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# --- [ 4. VISUAL UTILITIES ] ---
Import-Module Terminal-Icons -ErrorAction SilentlyContinue

# --- [ 5. CUSTOM ALIASES & FUNCTIONS ] ---
function conf { notepad $PROFILE }
function reload { . $PROFILE }
function update-prompt { 
    Remove-Item $OmpCache -ErrorAction SilentlyContinue
    . $PROFILE 
    Write-Host "Prompt cache cleared and reloaded!" -ForegroundColor Green
}
