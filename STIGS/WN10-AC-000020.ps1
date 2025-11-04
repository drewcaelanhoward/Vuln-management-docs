<#
.SYNOPSIS
    This PowerShell script enforces password history: 24 passwords remembered

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
    PS C:\> .\__remediation_template(STIG-ID-WN10-AC-000020).ps1 
#>

# YOUR CODE GOES HERE
# Requires admin rights
# STIG: WN10-AC-000020 - Enforce password history: 24 passwords remembered

$required = 24
$current = [int](net accounts | Select-String "Password history" | ForEach-Object { ($_ -split ":")[1].Trim() -replace '\D','' })

if ($current -lt $required) {
    net accounts /uniquepw:$required
    Write-Host "Password history set to $required passwords remembered."
} else {
    Write-Host "Password history already $current; compliant."
}
