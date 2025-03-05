<#
.SYNOPSIS
    This PowerShell script restricts enhanced diagnostic data collection for Windows Analytics.

.NOTES
    Author          : Dametrius Norris
    LinkedIn        : linkedin.com/in/dametrius-norris/
    GitHub          : github.com/dametriusnorris28
    Date Created    : 2025-03-05
    Last Modified   : 2025-03-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000204

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000204.ps1 
#>


# Define the registry path
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"

# Define the registry value name and data
$ValueName = "LimitEnhancedDiagnosticDataWindowsAnalytics"
$ValueData = 1  # 1 = Limits Enhanced Diagnostic Data for Windows Analytics

# Ensure the registry path exists
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -Type DWord

# Output confirmation
Write-Host "Windows Data Collection policy has been configured successfully."
