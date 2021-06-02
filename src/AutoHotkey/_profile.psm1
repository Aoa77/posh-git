# AutoHotkey commands #
#-----------------------------------------------------------------------------------------
$Global:ahk_path = "C:\Program Files\AutoHotkey\AutoHotkey.exe";
#-----------------------------------------------------------------------------------------
function ahk-Hotkeys {
    Start-Process $Global:ahk_path "$PSScriptRoot\Hotkeys.ahk";
}
function ahk-PreventTeamsAwayIdle {
    Start-Process $Global:ahk_path "$PSScriptRoot\PreventTeamsAwayIdle.ahk";
}
function ahk-Touchpad {
    Start-Process $Global:ahk_path "$PSScriptRoot\Touchpad.ahk";
}
function ahk-MouseGlide {
    Push-Location;
    Set-Location "~";
    Start-Process $Global:ahk_path "$PSScriptRoot\MouseGlide.ahk"
    Pop-Location;
}
#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
ahk-Hotkeys;
ahk-Touchpad;
#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
