<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

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
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE
# Requires admin rights
# STIG: WN10-AC-000005 - Account lockout duration must be 15 minutes or greater

$min = 15
$current = [int](net accounts | Select-String "Lockout duration" | ForEach-Object { ($_ -split ":")[1].Trim() -replace '\D','' })

if ($current -lt $min) {
    net accounts /lockoutduration:$min
    Write-Host "Lockout duration set to $min minutes."
} else {
    Write-Host "Lockout duration already $current minute(s); compliant."
}
