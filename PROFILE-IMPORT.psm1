Clear-Host;
Write-Host "== " -ForegroundColor DarkBlue -NoNewline;
Write-Host "Initializing posh-gitX..." -ForegroundColor Cyan -NoNewline;
Write-Host " ==" -ForegroundColor DarkBlue;

$importing = "posh-git (the original)";
Write-Host "";
Write-Host "<< $importing >>" -ForegroundColor Cyan;
Import-Module "$PSScriptRoot\src\posh-git.psd1" -Force;

$importing = "WriteX";
Write-Host "";
Write-Host "<< $importing >>" -ForegroundColor Cyan;
Get-ChildItem -Path "$PSScriptRoot\srcX\$importing" -Filter "*.ps1" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    Write-Host $out -ForegroundColor DarkMagenta;
    Import-Module $_.FullName -Force;
}

$importing = "GitX";
WriteX_SidewaysBufferReset;
WriteX_NewLine 1;
Write-Host "<< $importing >>" -ForegroundColor Cyan;
Get-ChildItem -Path "$PSScriptRoot\srcX\$importing" -Filter "*.ps1" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    WriteX_Sideways -out $out -fg DarkMagenta;
    Import-Module $_.FullName -Force;
}

$importing = "ConsoleX";
WriteX_SidewaysBufferReset;
WriteX_NewLine 2;
Write-Host "<< $importing >>" -ForegroundColor Cyan;
Get-ChildItem -Path "$PSScriptRoot\srcX\$importing" -Filter "*.ps1" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    WriteX_Sideways -out $out -fg DarkMagenta;
    Import-Module $_.FullName -Force;
}

$importing = "HotkeyX";
WriteX_SidewaysBufferReset;
WriteX_NewLine 2;
Write-Host "<< $importing >>" -ForegroundColor Cyan;
Get-ChildItem -Path "$PSScriptRoot\srcX\$importing" -Filter "*.ps1" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    WriteX_Sideways -out $out -fg DarkMagenta;
    Import-Module $_.FullName -Force;
}

WriteX_SidewaysBufferReset;
WriteX_NewLine 1;
Start-Sleep -Milliseconds 1;
WriteX_NewLine 2;
WriteX_Splash "posh-gitX initialization complete :)";
