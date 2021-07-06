
; timers
timer(_n)
{
    switch _n {
        case 0: return 0.01
        case 1: return 0.09
        case 2: return 0.25
        case 3: return 1.0
        case 4: return 3.0
        case 5: return 7.0
        case 6: return 15.0
    }
}