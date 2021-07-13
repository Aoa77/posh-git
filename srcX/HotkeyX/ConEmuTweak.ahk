#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#!;::
    Send, #!p
    Sleep, 1000
    Click, 102 122
    Sleep, 250
    Click, 497 213
    Sleep, 250
    Send, 99{Enter}
Return
