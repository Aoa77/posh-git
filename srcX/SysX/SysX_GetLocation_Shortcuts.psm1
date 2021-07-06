function SysX_GetLocation_EtcHosts([switch] $cd, [switch] $code) {
    $loc = "C:\Windows\System32\drivers\etc\hosts";
    if ($cd.IsPresent) {
        Sysx_Set
    }
    return $loc;
}
