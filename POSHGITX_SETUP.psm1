[string] $POSHGITX_action = "";
[string] $POSHGITX_folder = "";
[string] $POSHGITX_file = "";

function LOG_INFO ([string] $msg) {
    Write-Information "INFO: $msg";
}
function LOG_DEBUG ([string] $msg) {
    Write-Debug "$msg";
}
function LOG_VERBOSE ([string] $msg) {
    Write-Verbose "$msg";
}
function LOG_WARNING ([string] $msg) {
    Write-Warning "$msg";
}
function LOG_ERROR ([string] $msg) {
    Write-Error "$msg";
}

function POSHGITX_ACTION {
    Write-Host;
    Write-Host "== " -ForegroundColor DarkBlue -NoNewline;
    Write-Host $POSHGITX_action -ForegroundColor Cyan -NoNewline;
    Write-Host " ==" -ForegroundColor DarkBlue;
}
function POSHGITX_BOOKEND {
    Write-Host;
    Write-Host "== " -ForegroundColor DarkGreen -NoNewline;
    Write-Host $POSHGITX_action -ForegroundColor Green -NoNewline;
    Write-Host " ==" -ForegroundColor DarkGreen;
}
function POSHGITX_CONCAT {
    $concat = [string]::Concat($PSScriptRoot, $POSHGITX_folder, $POSHGITX_file);
    LOG_DEBUG "POSHGITX_CONCAT: $concat";
    return $concat;
}
function POSHGITX_IMPORT {
    Import-Module -Force -Scope "Global" -Name "$(POSHGITX_CONCAT)";
}
function POSHGITX_CHILDREN([) {
    $children = (Get-ChildItem -Path "$(POSHGITX_CONCAT)" -Filter "*.psm1");
    $children | ForEach-Object {
        LOG_DEBUG $_;
        Import-Module -Force -Scope "Global" -Name "$_";
        LOG_DEBUG;
    };
}

function POSHGITX_SETUP {
    $POSHGITX_action = "posh-gitX setup script";
    POSHGITX_BOOKEND;

    $POSHGITX_action = "resetting alias definitions";
    $POSHGITX_folder = "\";
    $POSHGITX_file = "POSHGITX_ALIASES.psm1";
    POSHGITX_ACTION;
    POSHGITX_IMPORT;
    POSHGITX_ALIASES $true;

    $POSHGITX_action = "importing the original posh-git";
    $POSHGITX_folder = "\src\";
    $POSHGITX_file = "posh-git.psd1";
    POSHGITX_ACTION;
    POSHGITX_IMPORT;

    $POSHGITX_action = "importing WriteX modules";
    $POSHGITX_folder = "\srcX\WriteX\";
    $POSHGITX_file = "";
    POSHGITX_ACTION;
    POSHGITX_CHILDREN;

    $POSHGITX_action = "importing GitX modules";
    $POSHGITX_folder = "\srcX\GitX\";
    $POSHGITX_file = "";
    POSHGITX_ACTION;
    POSHGITX_CHILDREN;

    $POSHGITX_action = "importing ConsoleX modules";
    $POSHGITX_folder = "\srcX\ConsoleX\";
    $POSHGITX_file = "";
    POSHGITX_ACTION;
    POSHGITX_CHILDREN;

    $POSHGITX_action = "importing HotkeyX modules";
    $POSHGITX_folder = "\srcX\HotkeyX\";
    $POSHGITX_file = "";
    POSHGITX_ACTION;
    POSHGITX_CHILDREN;

    $POSHGITX_action = "creating alias definitions";
    POSHGITX_ACTION;
    POSHGITX_ALIASES;

    $POSHGITX_action = "posh-gitX setup complete :)";
    POSHGITX_BOOKEND;
}
