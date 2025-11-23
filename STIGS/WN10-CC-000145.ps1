<#
.SYNOPSIS
    This PowerShell script requires password on resume from sleep (on battery).


.NOTES
    Author          : Drew Howard
    GitHub          : github.com/drewcaelanhoward
    Date Created    : 2025-11-04
    Last Modified   : 2025-11-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000145).ps1 
#>

# YOUR CODE GOES HERE
# STIG: WN10-CC-000145 - Require password on resume from sleep (on battery)

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51'
$name = 'DCSettingIndex'
$value = 1

# Ensure registry key exists and set value
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Host "Password on resume from sleep (on battery) has been enabled (DCSettingIndex = 1)."
