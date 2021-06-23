function ahk_KeepAwake {
    Start-Process $(ahk_ExePath) "$PSScriptRoot\KeepAwake.ahk";
}
ahk_KeepAwake;
