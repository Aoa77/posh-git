function GitX-Clean-Force {
    [CmdletBinding()]
    Param ()
    Write-Host "#############################" -ForegroundColor DarkBlue;
    Write-Host "== GitX-Clean-Force (fxd) =="    -ForegroundColor Red;
    Write-Host "#############################" -ForegroundColor DarkBlue;
    GitX-Clean -flags "fxd";
}
