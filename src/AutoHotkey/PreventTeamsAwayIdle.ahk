#SingleInstance, Force
#Persistent
SetTimer, PreventTeamsAwayIdle, 1000
return

PreventTeamsAwayIdle:
    If ( A_TimeIdle > 300000 ) {
        Send, ^!2
    }
return