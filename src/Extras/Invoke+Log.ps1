function Invoke-Plog([string] $command, [string] $logFile) {
    Clear-Host;
    Write-Host $(Get-Location);
    Write-Host "";
    Write-Splash $command;
    Invoke-Expression -Command $command;
    $logFile = $(Console-DumpToHtml -logFile $logFile -prefix $command);
    Write-Splash $logFile;
    chrome $logFile;
}
