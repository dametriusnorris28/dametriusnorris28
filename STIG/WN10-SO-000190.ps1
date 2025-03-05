<#
.SYNOPSIS
    This PowerShell script ensures that the Kerberos encryption policy is correctly configured.

.NOTES
    Author          : Dametrius Norris
    LinkedIn        : linkedin.com/in/dametrius-norris/
    GitHub          : github.com/dametriusnorris28
    Date Created    : 2025-03-03
    Last Modified   : 2025-03-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000190

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000190.ps1 
#>

# Define the registry base path
$BaseRegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos"
$ParametersRegistryPath = "$BaseRegistryPath\Parameters"

# Define the registry value name and data
$ValueName = "SupportedEncryptionTypes"
$ValueData = 0x7ffffff8  # Hexadecimal 7FFFFFF8

# Ensure the base registry path exists
if (-not (Test-Path $BaseRegistryPath)) {
    New-Item -Path $BaseRegistryPath -Force | Out-Null
}

# Ensure the Parameters registry path exists
if (-not (Test-Path $ParametersRegistryPath)) {
    New-Item -Path $ParametersRegistryPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $ParametersRegistryPath -Name $ValueName -Value $ValueData -Type DWord

# Output confirmation
Write-Host "Kerberos Supported Encryption Types configured successfully."
