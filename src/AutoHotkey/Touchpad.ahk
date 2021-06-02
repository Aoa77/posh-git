#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

CapsLock::
    MouseClick, left,,, 1, 0, D
return

^+LButton::
    Click, Right
return

^!LButton::
    Click, Middle
return
