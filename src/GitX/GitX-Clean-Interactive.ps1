#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
 function GitX-Clean-Interactive {
    [CmdletBinding()]
    Param ()
    Write-Host "###################################" -ForegroundColor DarkBlue;
    Write-Host "== GitX-Clean-Interactive (fxdi) ==" -ForegroundColor Yellow;
    Write-Host "###################################" -ForegroundColor DarkBlue;
    GitX-Clean -flags "fxdi";
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------