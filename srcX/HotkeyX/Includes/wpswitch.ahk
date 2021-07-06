; wpswitch
; - switches focus to window process if it is already running -OR-
; - launches the window process if it is nor currently running
wpswitch(_processName)
{
    _mboxTitle := "wpswitch" _processName
    Process, Exist, %_processName%
    if (Not ErrorLevel) {
        _mboxText := "Launching " _processName
        mbox(_mboxTitle, _mboxText, timer(1))
        Run, %_processName%
    }
    _mboxText := "Focusing " _processName
    mbox(_mboxTitle, _mboxText, timer(1))
    WinActivate, ahk_exe %_processName%
}

; wmswitch
; - switches focus to window process if it is already running -OR-
; - launches the window process if it is nor currently running
wmswitch(_processName)
{
    _mboxTitle := "wmswitch" _processName
    _menuType := StrSplit(_processName, ".")[0]
    
    Process, Exist, %_processName%
    if (Not ErrorLevel) {
        _mboxText := "Launching " _processName
        mbox(_mboxTitle, _mboxText, timer(1))
        Send, #q
        Sleep, 500
        Send, %_processName%
        Send, {BackSpace 4}
        Sleep, 500
        Send, {Enter}
    }else {
        _mboxText := "Focusing " _processName
        mbox(_mboxTitle, _mboxText, timer(1))
        WinActivate, ahk_exe %_processName%
    }
}