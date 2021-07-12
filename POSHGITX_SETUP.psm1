# PGX_SETUP.psm1
# Write-(Debug|Error|Information|Verbose|Warning)
function WX_DEBUG ([string] $msg) {
    Write-Debug "$msg";
}
function WX_ERROR ([string] $msg) {
    Write-Error "$msg";
}
function WX_INFO ([string] $msg) {
    Write-Information "INFO: $msg";
}
function WX_VERBOSE ([string] $msg) {
    Write-Verbose "$msg";
}
function WX_WARNING ([string] $msg) {
    Write-Warning "$msg";
}
function PGX_ACTION ([string] $action) {
    Write-Host;
    Write-Host "== " -ForegroundColor DarkBlue -NoNewline;
    Write-Host $action -ForegroundColor Cyan -NoNewline;
    Write-Host " ==" -ForegroundColor DarkBlue;
}
function PGX_ADDONS {
    PGX_action "importing adjacent project add-on modules";
    [System.IO.Directory]::GetDirectories($(Get-Location)) | ForEach-Object {
        PGX_IMPORT_ADDONS $_;
    };
}
function PGX_BOOKEND ([string] $action, [switch] $altColor) {
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
function PGX_CORE {
    PGX_action         "resetting alias definitions";
    PGX_IMPORT         ".\POSHGITX_ALIASES.psm1";
    PGX_ALIASES        $true;

    PGX_action         "importing the original posh-git";
    PGX_IMPORT         "$PSScriptRoot\src\posh-git.psd1";

    PGX_action         "importing WriteX modules";
    PGX_IMPORT_FOLDER  "$PSScriptRoot\srcX\WriteX\";

    PGX_action         "importing SysX modules";
    PGX_IMPORT_FOLDER  "$PSScriptRoot\srcX\SysX\";

    PGX_action         "importing GitX modules";
    PGX_IMPORT_FOLDER  "$PSScriptRoot\srcX\GitX\";

    PGX_action         "importing ConsoleX modules";
    PGX_IMPORT_FOLDER  "$PSScriptRoot\srcX\ConsoleX\";

    PGX_action         "importing HotkeyX modules";
    PGX_IMPORT_FOLDER  "$PSScriptRoot\srcX\HotkeyX\";

    PGX_action         "creating alias definitions";
    PGX_ALIASES        $false;
}
function PGX_CUSTOM_PROMPT () {
    PGX_action         "applying prompt customizations";
    PGX_IMPORT         "$PSScriptRoot\POSHGITX_PROMPT.psm1";
}
function PGX_IMPORT ([string] $module) {
    Import-Module -Force -Scope "Global" -Name $module;
}
function PGX_IMPORT_ADDONS ([string] $path) {
    [System.IO.Directory]::GetFiles($path, "*.psm1") | ForEach-Object {
        if (!$_.Contains("posh-git")) {
            WX_DEBUG $_;
            Import-Module -Force -Scope "Global" -Name "$_" -ArgumentList "$PSScriptRoot\srcX\HotkeyX\Includes";
        }
    };
}
function PGX_IMPORT_FOLDER ([string] $path) {
    [System.IO.Directory]::GetFiles($path, "*.psm1") | ForEach-Object {
        WX_DEBUG $_;
        Import-Module -Force -Scope "Global" -Name "$_";
    };
}
function PGX_LASTDIR_DATA() {
    return "$PSScriptRoot\POSHGITX_LASTDIR.txt";
}
function PGX_LASTDIR_GET () {
    if (![System.IO.File]::Exists($(PGX_LASTDIR_DATA))) {
        PGX_LASTDIR_SET;
    }
    return [System.IO.File]::ReadAllText($(PGX_LASTDIR_DATA));
}
function PGX_LASTDIR_NAV ([string] $action) {
    PGX_action "navigating to last opened location";
    Set-Location $(PGX_LASTDIR_GET);
}
function PGX_LASTDIR_SET () {
    [System.IO.File]::WriteAllText($(PGX_LASTDIR_DATA), $(Get-Location));
}
function PGX_SETUP {
    Set-Location       $PSScriptRoot;
    PGX_BOOKEND        "posh-gitX setup script";
    PGX_CORE;
    Set-Location       "..\";
    PGX_ADDONS;
    PGX_CUSTOM_PROMPT;
    PGX_LASTDIR_NAV;
    PGX_BOOKEND        "posh-gitX setup complete :)";
}