 function GitX_CleanInteractive {
    [CmdletBinding()]
    Param ()
    Write-Host "###################################" -ForegroundColor DarkBlue;
    Write-Host "== GitX_CleanInteractive (fxdi) ==" -ForegroundColor Yellow;
    Write-Host "###################################" -ForegroundColor DarkBlue;
    GitX_Clean flags "fxdi";
}
