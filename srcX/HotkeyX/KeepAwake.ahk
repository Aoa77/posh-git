#SingleInstance, Force
#Persistent
SetTimer, KeepAwake, 1000
return

KeepAwake:
    If ( A_TimeIdle > 300000 ) {
        Send, ^!2
    }
return
