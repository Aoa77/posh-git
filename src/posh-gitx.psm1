#-------------------------------------------------------------------------------------------
Import-Module "$PSScriptRoot\posh-git.psd1" -Force;
#-------------------------------------------------------------------------------------------
Get-ChildItem -Path "$PSScriptRoot\Extras" -Filter "*.ps1" -Recurse | ForEach-Object {
    Import-Module $_.FullName -Force;
}
#-------------------------------------------------------------------------------------------
Write-Splash "Initializing posh-gitX...";
#-------------------------------------------------------------------------------------------
Get-ChildItem -Path "$PSScriptRoot\GitX" -Filter "*.ps1" -Recurse | ForEach-Object {
    $out = $_.Name.Split('.')[0];
    Write-Sideways -out $out -fg DarkMagenta;
    Import-Module $_.FullName -Force;
}
#-------------------------------------------------------------------------------------------
Write-NewLine;
Write-HR;
Reset-SidewaysBuffer;
Start-Sleep -Milliseconds 2500;
Clear-Host;
#-------------------------------------------------------------------------------------------
Write-Splash "Welcome to posh-gitX :)";
#-------------------------------------------------------------------------------------------
