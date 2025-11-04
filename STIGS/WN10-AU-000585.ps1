<#
.SYNOPSIS
    This PowerShell script enables command line process auditing for failures

.NOTES
    Author          : Drew Howard
    GitHub          : github.com/drewcaelanhoward
    Date Created    : 2025-11-04
    Last Modified   : 2025-11-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000585

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000585).ps1 
#>

# YOUR CODE GOES HERE
# Requires admin rights
# STIG: WN10-AU-000585 - Enable command line process auditing for failures

# 1. Enable "Include command line in process creation events"
$regPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit'
$regName = 'ProcessCreationIncludeCmdLine_Enabled'
$regValue = 1

New-Item -Path $regPath -Force | Out-Null
New-ItemProperty -Path $regPath -Name $regName -Value $regValue -PropertyType DWord -Force | Out-Null
Write-Host "Enabled ProcessCreationIncludeCmdLine_Enabled = 1"

# 2. Enable process creation auditing for failures
# AuditPol cmdlet to enable failure auditing for Process Creation
$auditSubCategory = 'Process Creation'
try {
    # Enable Failure auditing
    AuditPol /set /subcategory:"$auditSubCategory" /failure:enable
    Write-Host "Enabled failure auditing for '$auditSubCategory'"
} catch {
    Write-Error "Failed to set audit policy: $_"
}
