<#
.SYNOPSIS
    This PowerShell script disables convenience PIN sign-in.

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
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000370).ps1 
#>

# YOUR CODE GOES HERE
# Requires admin rights
# STIG: WN10-CC-000370 - Disable convenience PIN sign-in

# Disable Windows Hello for Business (PassportForWork)
$path1 = 'HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork'
$name1 = 'Enabled'
$value1 = 0
New-Item -Path $path1 -Force | Out-Null
New-ItemProperty -Path $path1 -Name $name1 -Value $value1 -PropertyType DWord -Force | Out-Null
Write-Host "Set $name1 to $value1 under $path1 (Windows Hello disabled)."
