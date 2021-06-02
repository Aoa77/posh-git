Write-Host "== " -ForegroundColor DarkBlue -NoNewline;
Write-Host "Initializing posh-gitX..." -ForegroundColor Cyan -NoNewline;
Write-Host " ==" -ForegroundColor DarkBlue;

Write-Host "";
Write-Host "<< Core >>" -ForegroundColor Cyan;
Get-ChildItem -Path "$PSScriptRoot\Core" -Filter "*.ps1" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    Write-Host $out -ForegroundColor DarkMagenta;
    Import-Module $_.FullName -Force;
}

Write-NewLine 1;
Write-Host "<< AutoHotkey >>" -ForegroundColor Cyan;
Import-Module "$PSScriptRoot\AutoHotkey\_profile.psm1" -Force;
Get-ChildItem -Path "$PSScriptRoot\AutoHotkey" -Filter "*.ahk" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    Write-Sideways -out $out -fg DarkMagenta;
}

Write-NewLine 2;
Write-Host "<< GitX >>" -ForegroundColor Cyan;
Import-Module "$PSScriptRoot\posh-git.psd1" -Force;
Get-ChildItem -Path "$PSScriptRoot\GitX" -Filter "*.ps1" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    Write-Sideways -out $out -fg DarkMagenta;
    Import-Module $_.FullName -Force;
}

Write-NewLine 2;
Write-Host "<< Extras >>" -ForegroundColor Cyan;
Get-ChildItem -Path "$PSScriptRoot\Extras" -Filter "*.ps1" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    Write-Sideways -out $out -fg DarkMagenta;
    Import-Module $_.FullName -Force;
}

# --- run configs
GitX-Config;

<#
<\\-- augment common aliases --//>
#>
Remove-Item alias:cd -Force;
function cd([string] $location) {
    Nav-Location -LOCATION $location;
}
function bd() {
    Nav-Location -BACK;
}
function lsf() {
    Get-ChildItem -Force;
}

Write-NewLine;
Write-HR;
Reset-SidewaysBuffer;
Start-Sleep -Milliseconds 1;
#Clear-Host;

#-----------------------------------------------------------------------
Write-Splash "Welcome to posh-gitX :)";
#-----------------------------------------------------------------------
