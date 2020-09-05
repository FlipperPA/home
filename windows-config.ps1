# This script sets up Windows 10 the way I like it.
# It should be run in Administrator mode from PowerShell.

# Set the Windows Taskbar to never combine items (Windows 7 style)
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarGlomLevel -Value 1

# Finally, stop explorer; it will auto-restart
Get-Process -Name explorer | Stop-Process
