<#
.SYNOPSIS
    This PowerShell script ensures the prevention of the use of the camera on the Windows lock screen, enchances security ensuring
    the camera cannot be accessed without logging in.

.NOTES
    Author          : Dametrius Norris
    LinkedIn        : linkedin.com/in/dametrius-norris/
    GitHub          : github.com/dametriusnorris28
    Date Created    : 2025-03-05
    Last Modified   : 2025-03-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000005.ps1 
#>

# Define the registry path
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Define the registry value name and data
$ValueName = "NoLockScreenCamera"
$ValueData = 1  # 1 = Disables the lock screen camera

# Ensure the registry path exists
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -Type DWord

# Output confirmation
Write-Host "Lock screen camera has been disabled successfully."
