Clear-Host;
Write-Host "Loading profile:" -ForegroundColor "Cyan";
Write-Host $profile -ForegroundColor "Gray";
Write-Host;

Set-ExecutionPolicy `
    -ExecutionPolicy Unrestricted `
    -Scope LocalMachine `
    -Force;

$InformationPreference = `
    [System.Management.Automation.ActionPreference]::Continue;
$DebugPreference = `
    [System.Management.Automation.ActionPreference]::Ignore;
$ErrorActionPreference = `
    [System.Management.Automation.ActionPreference]::Stop;
$VerbosePreference = `
    [System.Management.Automation.ActionPreference]::Ignore;
$WarningPreference = `
    [System.Management.Automation.ActionPreference]::Ignore;


Import-Module -Force -Scope "Global" `
    -Name "C:\work\posh-gitx\POSHGITX_SETUP.psm1";
Write-Host;

LOG_INFO "Testing LOG_* functions.";
LOG_DEBUG "debug msg";
LOG_VERBOSE "verbose msg";
LOG_WARNING "warning msg";
#LOG_ERROR "error msg";
Write-Host;

POSHGITX_SETUP;
Write-Host;
