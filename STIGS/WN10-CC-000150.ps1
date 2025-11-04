<#
.SYNOPSIS
    This PowerShell script requires password on resume from sleep (plugged in)

.NOTES
    Author          : Drew Howard
    GitHub          : github.com/drewcaelanhoward
    Date Created    : 2025-11-04
    Last Modified   : 2025-11-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000150).ps1 
#>

# YOUR CODE GOES HERE
# Requires admin rights
# STIG: WN10-CC-000150 - Require password on resume from sleep (plugged in)

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51'
$name = 'ACSettingIndex'
$value = 1

# Create registry key and set the required value
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Host "Password on resume from sleep (plugged in) has been enabled (ACSettingIndex = 1)."
