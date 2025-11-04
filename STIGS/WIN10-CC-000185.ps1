<#
.SYNOPSIS
    This PowerShell script disables automatic running of media (USB, CD, etc.).

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
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000185).ps1 
#>

# YOUR CODE GOES HERE
# STIG: WN10-CC-000185 - Prevent Autorun commands

$path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'
$name = 'NoAutorun'
$value = 1

New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name $name -Value $value -PropertyType DWord -Force | Out-Null
Write-Host "Set $name to $value under $path (Autorun disabled)."
