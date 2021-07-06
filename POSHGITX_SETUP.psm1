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
function POSHGITX_BOOKEND ([string] $action, [switch] $altColor) {
    $dark = "DarkGreen";
    $color = "Green";
    if ($altColor.IsPresent) {
        $dark = "DarkMagenta";
        $color = "Magenta";
    }
    Write-Host;
    Write-Host "== " -ForegroundColor $dark -NoNewline;
    Write-Host $action -ForegroundColor $color -NoNewline;
    Write-Host " ==" -ForegroundColor $dark;
}
function POSHGITX_ACTION ([string] $action) {
    Write-Host;
    Write-Host "== " -ForegroundColor DarkBlue -NoNewline;
    Write-Host $action -ForegroundColor Cyan -NoNewline;
    Write-Host " ==" -ForegroundColor DarkBlue;
}
function POSHGITX_IMPORT ([string] $module) {
    Import-Module -Force -Scope "Global" -Name $module;
}
function POSHGITX_IMPORT_ADDONS ([string] $path) {
    [System.IO.Directory]::GetFiles($path, "*.psm1") | ForEach-Object {
        if (!$_.Contains("posh-git")) {
            LOG_DEBUG $_;
            Import-Module -Force -Scope "Global" -Name "$_";
        }
    };
}
function POSHGITX_IMPORT_FOLDER ([string] $path) {
    [System.IO.Directory]::GetFiles($path, "*.psm1") | ForEach-Object {
        LOG_DEBUG $_;
        Import-Module -Force -Scope "Global" -Name "$_";
    };
}
function POSHGITX_SETUP {
    Set-Location            $PSScriptRoot;
    POSHGITX_BOOKEND        "posh-gitX setup script";
    POSHGITX_CORE;
    Set-Location            "..\";
    POSHGITX_ADDONS;
    POSHGITX_BOOKEND        "posh-gitX setup complete :)";
}
function POSHGITX_CORE {
    POSHGITX_action         "resetting alias definitions";
    POSHGITX_IMPORT         ".\POSHGITX_ALIASES.psm1";
    POSHGITX_ALIASES        $true;

    POSHGITX_action         "importing the original posh-git";
    POSHGITX_IMPORT         "$PSScriptRoot\src\posh-git.psd1";

    POSHGITX_action         "importing WriteX modules";
    POSHGITX_IMPORT_FOLDER  "$PSScriptRoot\srcX\WriteX\";

    POSHGITX_action         "importing SysX modules";
    POSHGITX_IMPORT_FOLDER  "$PSScriptRoot\srcX\SysX\";

    POSHGITX_action         "importing GitX modules";
    POSHGITX_IMPORT_FOLDER  "$PSScriptRoot\srcX\GitX\";

    POSHGITX_action         "importing ConsoleX modules";
    POSHGITX_IMPORT_FOLDER  "$PSScriptRoot\srcX\ConsoleX\";

    POSHGITX_action         "importing HotkeyX modules";
    POSHGITX_IMPORT_FOLDER  "$PSScriptRoot\srcX\HotkeyX\";

    POSHGITX_action         "creating alias definitions";
    POSHGITX_ALIASES        $false;
}
function POSHGITX_ADDONS {
    POSHGITX_action         "importing adjacent project add-on modules";
    [System.IO.Directory]::GetDirectories($(Get-Location)) | ForEach-Object {
        POSHGITX_IMPORT_ADDONS $_;
    };
}