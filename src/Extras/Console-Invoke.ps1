function Console-Invoke([string] $command, [string] $logPath) {
    Clear-Host;
    Write-Host $(Get-Location);
    Write-Host "";
    Write-Splash $command;
    Invoke-Expression -Command $command;

    if ([string]::IsNullOrWhiteSpace($logPath)) {
        return $null;
    }
    $logFile = $logPath.TrimEnd('\') + '\';
    $logFile += $command.Replace(" ", "-");
    $logFile += "_$([System.DateTime]::UtcNow.Ticks).html";

    return $logFile;
}
