<#
.SYNOPSIS
    This PowerShell script enables Group Policy processing even if policies haven't changed by setting.

.NOTES
    Author          : Dametrius Norris
    LinkedIn        : linkedin.com/in/dametrius-norris/
    GitHub          : github.com/dametriusnorris28
    Date Created    : 2025-03-03
    Last Modified   : 2025-03-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000090
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000090.ps1 
#>

# Define the correct registry path
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"

# Define the registry values and expected data
$Values = @{
    "NoBackgroundPolicy" = 0  # Ensures policy applies even in the background
    "NoGPOListChanges"   = 0  # Forces processing even if GPOs haven't changed
}

# Ensure the registry path exists
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Apply each registry value
foreach ($Name in $Values.Keys) {
    Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Values[$Name] -Type DWord
}

Write-Host "Registry settings for Group Policy processing have been successfully configured."
