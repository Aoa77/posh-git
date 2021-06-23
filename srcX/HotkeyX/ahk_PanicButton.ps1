function ahk_PanicButton {
    Write-Host "";
    Write-Host "";
    Write-Host "************************" -ForegroundColor "Red";
    Write-Host "    Autohotkey PANIC    " -ForegroundColor "Yellow";
    Write-Host "************************" -ForegroundColor "Red";
    while ($true) {
        $running = [System.Collections.Generic.List[System.Diagnostics.Process]]::new();
        Get-Process -Name "AutoHotkey" -ErrorAction "SilentlyContinue" | ForEach-Object {
            $running.Add($_);
        };
        if ($running.Count -eq 0) {
            break;
        }
        $running | ForEach-Object {
            Write-Host $_.Id -ForegroundColor "Magenta";
            $_.Kill();
        }
    }
    Write-Host "";
    Write-Host "";
}
