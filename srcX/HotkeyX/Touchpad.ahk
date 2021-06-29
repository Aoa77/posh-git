#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

CapsLock::
    MouseClick, left,,, 1, 0, D
Return

^+LButton::
    Click, Right
Return

^!LButton::
    Click, Middle
Return
