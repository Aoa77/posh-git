Write-Host "== " -ForegroundColor DarkBlue -NoNewline;
Write-Host "Initializing posh-gitX..." -ForegroundColor Cyan -NoNewline;
Write-Host " ==" -ForegroundColor DarkBlue;

$importing = "WriteX";
Write-Host "";
Write-Host "<< $importing >>" -ForegroundColor Cyan;
Get-ChildItem -Path "$PSScriptRoot\$importing" -Filter "*.ps1" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    Write-Host $out -ForegroundColor DarkMagenta;
    Import-Module $_.FullName -Force;
}

$importing = "GitX";
WriteX-SidewaysBuffer-Reset;
WriteX-NewLine 1;
Write-Host "<< $importing >>" -ForegroundColor Cyan;
Import-Module "$PSScriptRoot\posh-git.psd1" -Force;
Get-ChildItem -Path "$PSScriptRoot\$importing" -Filter "*.ps1" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    WriteX-Sideways -out $out -fg DarkMagenta;
    Import-Module $_.FullName -Force;
}

$importing = "ConsoleX";
WriteX-SidewaysBuffer-Reset;
WriteX-NewLine 2;
Write-Host "<< $importing >>" -ForegroundColor Cyan;
Get-ChildItem -Path "$PSScriptRoot\$importing" -Filter "*.ps1" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    WriteX-Sideways -out $out -fg DarkMagenta;
    Import-Module $_.FullName -Force;
}

$importing = "AutoHotkey";
WriteX-SidewaysBuffer-Reset;
WriteX-NewLine 2;
Write-Host "<< $importing >>" -ForegroundColor Cyan;
Import-Module "$PSScriptRoot\AutoHotkey\_profile.psm1" -Force;
Get-ChildItem -Path "$PSScriptRoot\$importing" -Filter "*.ahk" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    WriteX-Sideways -out $out -fg DarkMagenta;
}

WriteX-SidewaysBuffer-Reset;
WriteX-NewLine 1;
WriteX-HR;
Start-Sleep -Milliseconds 1;
WriteX-Splash "Welcome to posh-gitX :)";
