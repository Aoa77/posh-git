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

WX_INFO "Testing WX_* functions.";
WX_DEBUG "debug msg";
WX_VERBOSE "verbose msg";
WX_WARN "warning msg";
#WX_ERROR "error msg";
Write-Host;

PGX_SETUP;
Write-Host;
