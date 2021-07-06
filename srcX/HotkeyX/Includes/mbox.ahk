; mbox()
; - displays a message box with a timeout
; - used to throttle macro steps
mbox(_title, _text, _timeout)
{
    MsgBox, 262144, %_title%, %_text%, %_timeout% ; 262144 pins to top
}