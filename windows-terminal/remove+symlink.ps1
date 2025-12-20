$wt = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Remove-Item $wt -Force
New-Item -ItemType SymbolicLink -Path $wt -Target "$HOME\.dotfiles\windows-terminal\settings.json"