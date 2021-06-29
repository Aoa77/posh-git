#SingleInstance, Force
#Persistent
SetTimer, KeepAwake, 1000
Return

KeepAwake:
    if ( A_TimeIdle > 300000 ) {
        Send, ^!2
    }
Return
