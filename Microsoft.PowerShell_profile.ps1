<#
<\\-- Custom PowerShell profile --//>
#>
Set-ExecutionPolicy `
    -ExecutionPolicy Unrestricted `
    -Scope LocalMachine `
    -Force;
$DebugPreference = `
    [System.Management.Automation.ActionPreference]::SilentlyContinue;
$ErrorActionPreference = `
    [System.Management.Automation.ActionPreference]::Stop;
$WarningPreference = `
    [System.Management.Automation.ActionPreference]::SilentlyContinue;
<#
<\\-- import posh-gitx --//>
#>
Import-Module "~\posh-gitx\PROFILE-IMPORT.psm1" -Force;
