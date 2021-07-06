#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Include, C:\work\posh-gitx\srcX\HotkeyX\Includes\timer.ahk
#Include, C:\work\posh-gitx\srcX\HotkeyX\Includes\mbox.ahk
#Include, C:\work\posh-gitx\srcX\HotkeyX\Includes\wpin.ahk
#Include, C:\work\posh-gitx\srcX\HotkeyX\Includes\wkill.ahk
#Include, C:\work\posh-gitx\srcX\HotkeyX\Includes\wpswitch.ahk

; Displays a message box
MSG(_message, _timeout)
{
    MsgBox, , AutoHotKey, %_message%, %_timeout%
}

; "Run or Activate" an executable. Switch to app if already running, otherwise run the app.
ROA(_pname, _rname)
{
    Process, Exist, %_pname%
    if (Not ErrorLevel) {
        Run, %_rname%
    }
    WinActivate, ahk_exe %_pname%
}

; Hit the PANIC button.
#Esc::
    MSG("*** AutoHotkey PANIC ***", .25)
    RunWait, pwsh.exe -NoProfile -NoExit -Command "& {.\ahk_PanicButton.ps1}"
Return

; Toggle window transparency on the current window with Win+Escape.
#PrintScreen::
    WinGet, TransLevel, Transparent, A
    if (TransLevel = OFF) {
        WinSet, Transparent, 225, A
    } else {
        WinSet, Transparent, OFF, A
    }
Return


; Togg  le "pin to top" on current window.
#Insert::
    Winset, AlwaysOnTop, , A
Return

#p::
    WinActivate, ahk_class VirtualConsoleClass
Return

; Override Win+S for auto console refresh when developing in vscode.
#s::
    Send, ^s
    Sleep, 88
    WinActivate, ahk_class VirtualConsoleClass
    Sleep, 88
    Send, {Up}
    Sleep, 88
    Send, {Enter}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
; Ctrl+Alt+? - Shortcuts to "Run or Activate" various programs.
^!0::
^!Numpad0::
    ROA("C:\Program Files\AutoHotkey\WindowSpy.ahk", "C:\Program Files\AutoHotkey\WindowSpy.ahk")
Return
^!e::
    WinActivate, ahk_class CabinetWClass ; Switch/activate to File Explorer. Built-in run hotkey is Win+E
Return
^!g::
    ROA("chrome.exe", "chrome.exe")
Return
^!p::
    Send, ^``
Return
^!1::
^!Numpad1::
    ROA("outlook.exe", "outlook.exe")
Return
^!2::
^!Numpad2::
    wmswitch("teams.exe")
Return
^!3::
^!Numpad3::
    ROA("code.exe", "C:\Program Files\Microsoft VS Code\Code.exe")
Return
^!4::
^!Numpad4::
    ROA("devenv.exe", "devenv.exe")
Return
^!5::
^!Numpad5::
    ROA("Docker Desktop.exe", "Docker Desktop.exe")
Return
^!6::
^!Numpad6::
    ROA("bcompare.exe", "bcompare.exe")
Return
^!7::
^!Numpad7::
    ROA("regexbuddy.exe", "regexbuddy.exe")
Return
^!8::
^!Numpad8::
    ROA("postman.exe", "C:\Users\aalbers\AppData\Local\Postman\Postman.exe")
Return
^!9::
^!Numpad9::
    ROA("C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe", "C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe")
Return
