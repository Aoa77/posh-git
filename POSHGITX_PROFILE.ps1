Clear-Host;
Write-Host "Loading profile:" -ForegroundColor "Cyan";
Write-Host $profile -ForegroundColor "Gray";
Write-Host;

Set-ExecutionPolicy `
    -ExecutionPolicy Unrestricted `
    -Scope LocalMachine `
    -Force;

$DebugPreference = `
    [System.Management.Automation.ActionPreference]::Ignore;
$ErrorActionPreference = `
    [System.Management.Automation.ActionPreference]::Stop;
$InformationPreference = `
    [System.Management.Automation.ActionPreference]::Continue;
$VerbosePreference = `
    [System.Management.Automation.ActionPreference]::Ignore;
$WarningPreference = `
    [System.Management.Automation.ActionPreference]::Inquire;


Import-Module -Force -Scope "Global" -Name "C:\work\posh-gitx\POSHGITX_SETUP.psm1";
PGX_SETUP;