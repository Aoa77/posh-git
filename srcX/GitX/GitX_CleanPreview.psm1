function GitX_CleanPreview {
    [CmdletBinding()]
    Param ()
    Write-Host "###############################" -ForegroundColor DarkBlue;
    Write-Host "== GitX_CleanPreview (fxdn) ==" -ForegroundColor Cyan;
    Write-Host "###############################" -ForegroundColor DarkBlue;
    GitX_Clean; # default is preview
}
