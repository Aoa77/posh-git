# AutoHotkey commands #
#-----------------------------------------------------------------------------------------
$Global:ahk_path = "C:\Program Files\AutoHotkey\AutoHotkey.exe";
#-----------------------------------------------------------------------------------------
function ahk-Hotkeys {
    Start-Process $Global:ahk_path "$PSScriptRoot\Hotkeys.ahk";
}
function ahk-KeepAwake {
    Start-Process $Global:ahk_path "$PSScriptRoot\KeepAwake.ahk";
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
ahk-KeepAwake;
ahk-MouseGlide;
ahk-Touchpad;
#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
