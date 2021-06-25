function ahk_MouseGlide {
    Push-Location;
    Set-Location "~";
    Start-Process $(ahk_ExePath) "$PSScriptRoot\MouseGlide.ahk"
    Pop-Location;
}
ahk_MouseGlide;
