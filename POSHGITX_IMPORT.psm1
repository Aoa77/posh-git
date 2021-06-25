[string] $action = "";
[string] $folder = "";
[string] $file = "";

function POSHGITX_ACTION {
    Write-Host;
    Write-Host "== " -ForegroundColor DarkBlue -NoNewline;
    Write-Host $action -ForegroundColor Cyan -NoNewline;
    Write-Host " ==" -ForegroundColor DarkBlue;
}
function POSHGITX_CONCAT {
    return [string]::Concat($PSScriptRoot, $folder, $file);
}
function POSHGITX_IMPORT {
    Import-Module -Name "$(POSHGITX_CONCAT)" -Force -Global -Verbose;
}
function POSHGITX_CHILDREN([bool] $logSideways) {
    Get-ChildItem -Path "$(POSHGITX_CONCAT)" -Filter "*.ps1" -Recurse | ForEach-Object {
        [string] $fileName = $_.Name.Split('.')[0];
        Write-Host $fileName -ForegroundColor Magenta;

        [string] $fullName = $_.FullName;
        Import-Module -Name "$fullName"  -Force -Global -Verbose;

        # if ($logSideways) {
        #     # WriteX_Sideways -out $out -fg DarkMagenta;
        #     Import-Module -Name "$_.FullName"  -Force -Global -Verbose;
        # }
        # else {
        #     Import-Module -Name "$_.FullName"  -Force -Global -Verbose;
        # }
    }
}

Clear-Host;
$action = "posh-gitX setup script";
POSHGITX_ACTION;

$action = "resetting alias definitions";
$folder = "\";
$file = "POSHGITX_ALIASES.psm1";
POSHGITX_ACTION;
POSHGITX_IMPORT;
POSHGITX_ALIASES $true;

$action = "importing the original posh-git";
$folder = "\src\";
$file = "posh-git.psd1";
POSHGITX_ACTION;
POSHGITX_IMPORT;
Write-VcsStatus;

$action = "importing WriteX modules";
$folder = "\srcX\WriteX\";
$file = "";
POSHGITX_ACTION;
POSHGITX_CHILDREN $false;

$action = "importing GitX modules";
$folder = "\srcX\GitX\";
$file = "";
#WriteX_SidewaysBufferReset;
WriteX_NewLine 1;
POSHGITX_ACTION;
POSHGITX_CHILDREN $false;

$action = "importing ConsoleX modules";
$folder = "\srcX\ConsoleX\";
$file = "";
#WriteX_SidewaysBufferReset;
WriteX_NewLine 2;
POSHGITX_ACTION;
POSHGITX_CHILDREN $false;

$action = "importing HotkeyX modules";
$folder = "\srcX\HotkeyX\";
$file = "";
#WriteX_SidewaysBufferReset;
WriteX_NewLine 2;
POSHGITX_ACTION;
POSHGITX_CHILDREN $false;

$action = "creating alias definitions";
POSHGITX_ACTION;
POSHGITX_ALIASES $false;

$action = "posh-gitX setup complete :)";
#WriteX_SidewaysBufferReset;
WriteX_NewLine 1;
Start-Sleep -Milliseconds 1;
WriteX_NewLine 2;
WriteX_Splash $action;
