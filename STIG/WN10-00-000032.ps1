<#
.SYNOPSIS
    This PowerShell script ensures that a 6-digit minimum PIN for BitLocker pre-boot authentication is enforced.

.NOTES
    Author          : Dametrius Norris
    LinkedIn        : linkedin.com/in/dametrius-norris/
    GitHub          : github.com/dametriusnorris28
    Date Created    : 2025-03-04
    Last Modified   : 2025-03-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000032

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-00-000032.ps1 
#>


# Define the registry path
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Define the registry value name and data
$ValueName = "MinimumPIN"
$ValueData = 6  # Requires a minimum 6-digit PIN for BitLocker

# Ensure the registry path exists
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -Type DWord

# Output confirmation
Write-Host "BitLocker Minimum PIN policy has been configured successfully."
