function GitX_CleanForce {
    [CmdletBinding()]
    Param ()
    Write-Host "#############################" -ForegroundColor DarkBlue;
    Write-Host "== GitX_CleanForce (fxd) =="    -ForegroundColor Red;
    Write-Host "#############################" -ForegroundColor DarkBlue;
    GitX_Clean flags "fxd";
}
