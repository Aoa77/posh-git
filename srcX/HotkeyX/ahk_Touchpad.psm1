function ahk_Touchpad {
    Start-Process $(ahk_ExePath) "$PSScriptRoot\Touchpad.ahk";
}
ahk_Touchpad;
