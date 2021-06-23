function ahk_Hotkeys {
    Start-Process $(ahk_ExePath) "$PSScriptRoot\Hotkeys.ahk";
}
ahk_Hotkeys;
