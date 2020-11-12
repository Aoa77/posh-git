function Console-Invoke([string] $command, [string] $logPath) {
    Clear-Host;
    Write-Host $(Get-Location);
    Write-Host "";
    Write-Splash $command;
    Invoke-Expression -Command $command;

    $logFile = $logPath.TrimEnd('\') + '\';
    $logFile += $command.Replace(" ", "-");
    $logFile += "_$([System.DateTime]::UtcNow.Ticks).html";

    Console-DumpToHtml -logFile $logFile;
    Write-Splash $logFile;
    chrome $logFile;
}
