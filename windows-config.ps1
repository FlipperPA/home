# This script sets up Windows 10 the way I like it.
# It should be run in Administrator mode from PowerShell.

# Uninstall the crapware that comes with Windows 10
Get-AppxPackage *3dbuilder* | Remove-AppxPackage
Get-AppxPackage *windowsalarms* | Remove-AppxPackage
Get-AppxPackage *windowscalculator* | Remove-AppxPackage
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage *windowscamera* | Remove-AppxPackage
Get-AppxPackage *officehub* | Remove-AppxPackage
Get-AppxPackage *skypeapp* | Remove-AppxPackage
Get-AppxPackage *getstarted* | Remove-AppxPackage
Get-AppxPackage *zunemusic* | Remove-AppxPackage
Get-AppxPackage *windowsmaps* | Remove-AppxPackage
Get-AppxPackage *solitairecollection* | Remove-AppxPackage
Get-AppxPackage *bingfinance* | Remove-AppxPackage
Get-AppxPackage *zunevideo* | Remove-AppxPackage
Get-AppxPackage *bingnews* | Remove-AppxPackage
Get-AppxPackage *onenote* | Remove-AppxPackage
Get-AppxPackage *people* | Remove-AppxPackage
Get-AppxPackage *windowsphone* | Remove-AppxPackage
Get-AppxPackage *bingsports* | Remove-AppxPackage
Get-AppxPackage *soundrecorder* | Remove-AppxPackage
Get-AppxPackage *bingweather* | Remove-AppxPackage
Get-AppxPackage *xboxapp* | Remove-AppxPackage

# Set the Windows Taskbar to never combine items (Windows 7 style)
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarGlomLevel -Value 2
# Set the Windows Taskbar to use small icons
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarSmallIcons -Value 1
# Disable Cortana Button
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowCortanaButton -Value 0
# Disable Task View Button
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowTaskViewButton -Value 0
# Don't track or show recent documents
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Start_TrackDocs -Value 0

# Finally, stop explorer; it will auto-restart
Get-Process -Name explorer | Stop-Process
