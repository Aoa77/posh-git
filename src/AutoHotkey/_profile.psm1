# AutoHotkey commands #
#-----------------------------------------------------------------------------------------
$Global:ahk_path = "C:\Program Files\AutoHotkey\AutoHotkey.exe";
#-----------------------------------------------------------------------------------------
function ahk-Hotkeys {
    Start-Process $Global:ahk_path "$PSScriptRoot\Hotkeys.ahk";
}
function ahk-KeepAwake {
    Start-Process $Global:ahk_path "$PSScriptRoot\PreventTeamsAwayIdle.ahk";
}
function ahk-MouseGlide {
    Push-Location;
    Set-Location "~";
    Start-Process $Global:ahk_path "$PSScriptRoot\MouseGlide.ahk"
    Pop-Location;
}
function ahk-Touchpad {
    Start-Process $Global:ahk_path "$PSScriptRoot\Touchpad.ahk";
}
#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
ahk-Hotkeys;
ahk-Touchpad;
#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
function ahk-PANIC {
    Write-Host "";
    Write-Host "";
    Write-Host "*****************************" -ForegroundColor "Red";
    Write-Host "Autohotkey PANIC triggered..." -ForegroundColor "Yellow";
    Write-Host "*****************************" -ForegroundColor "Red";
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
