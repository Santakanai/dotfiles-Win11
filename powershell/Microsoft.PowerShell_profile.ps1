#Sakanai powershell profile, check https://github.com/santakanai
# --- PRE-INIT ---
Remove-Item alias:ls -ErrorAction SilentlyContinue #for eza
Remove-Item alias:cat -ErrorAction SilentlyContinue #for bat
Remove-Item alias:cd -ErrorAction SilentlyContinue #for zoxide
# --- INIT ---
Invoke-Expression (&starship init powershell) #initialize starship
Invoke-Expression (& { (zoxide init powershell | Out-String) }) #initialize zoxide
# --- standart functions ---
function ls { eza --icons --group-directories-first --git $args } 
function cat { bat $args }
function notepad { & "C:\Program Files\Notepad++\notepad++.exe" $args }
# --- new functions ---
function ln { param(
        [string]$Target,
        [string]$Source 
		)
    $dir = Split-Path $Target
    if ($dir -and !(Test-Path $dir)) 
	{ New-Item -ItemType Directory -Path $dir | Out-Null }
	
    if (Test-Path $Target) { Remove-Item $Target -Recurse -Force }
	
    New-Item -ItemType SymbolicLink -Path $Target -Target $Source | Out-Null }
# --- aliases ---
set-alias xpl explorer
set-alias cd z
set-alias v nvim
