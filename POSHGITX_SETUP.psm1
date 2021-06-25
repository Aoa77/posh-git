[string] $POSHGITX_action = "";
[string] $POSHGITX_folder = "";
[string] $POSHGITX_file = "";

function POSHGITX_ACTION {
    Write-Host;
    Write-Host "== " -ForegroundColor DarkBlue -NoNewline;
    Write-Host $POSHGITX_action -ForegroundColor Cyan -NoNewline;
    Write-Host " ==" -ForegroundColor DarkBlue;
}
function POSHGITX_CONCAT {
    $concat = [string]::Concat($PSScriptRoot, $POSHGITX_folder, $POSHGITX_file);
    Write-Debug "POSHGITX_CONCAT: $concat";
    return $concat;
}
function POSHGITX_IMPORT {
    Import-Module -Force -Verbose -Scope "Global" -Name "$(POSHGITX_CONCAT)";
}
function POSHGITX_CHILDREN([bool] $logSideways) {
    Write-Debug "POSHGITX_CHILDREN -logSideways: $logSideways";
    $children = (Get-ChildItem -Path "$(POSHGITX_CONCAT)" -Filter "*.psm1");
    $children | ForEach-Object {
        Write-Debug $_;
        Import-Module -Force -Verbose -Scope "Global" -Name "$_";
        Write-Verbose "";
    };
}

function POSHGITX_SETUP {
    $POSHGITX_action = "posh-gitX setup script";
    POSHGITX_ACTION;

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
    POSHGITX_CHILDREN $false;

    $POSHGITX_action = "importing GitX modules";
    $POSHGITX_folder = "\srcX\GitX\";
    $POSHGITX_file = "";
    WriteX_SidewaysBufferReset;
    WriteX_NewLine 1;
    POSHGITX_ACTION;
    POSHGITX_CHILDREN $false;

    $POSHGITX_action = "importing ConsoleX modules";
    $POSHGITX_folder = "\srcX\ConsoleX\";
    $POSHGITX_file = "";
    WriteX_SidewaysBufferReset;
    WriteX_NewLine 2;
    POSHGITX_ACTION;
    POSHGITX_CHILDREN $false;

    $POSHGITX_action = "importing HotkeyX modules";
    $POSHGITX_folder = "\srcX\HotkeyX\";
    $POSHGITX_file = "";
    WriteX_SidewaysBufferReset;
    WriteX_NewLine 2;
    POSHGITX_ACTION;
    POSHGITX_CHILDREN $false;

    $POSHGITX_action = "creating alias definitions";
    POSHGITX_ACTION;
    POSHGITX_ALIASES $false;

    $POSHGITX_action = "posh-gitX setup complete :)";
    WriteX_SidewaysBufferReset;
    WriteX_NewLine 1;
    Start-Sleep -Milliseconds 1;
    WriteX_NewLine 2;
    WriteX_Splash $POSHGITX_action;
}
