function Write-Splash([string] $msg) {
    ###############################################################################
    Write-Host " #############################" -ForegroundColor DarkBlue;
    Write-Host "== " -ForegroundColor Blue -NoNewline;
    Write-Host $msg -ForegroundColor Cyan -NoNewline;
    Write-Host " ==" -ForegroundColor Blue;
    Write-Host " #############################" -ForegroundColor DarkBlue;
    Write-HR;
}
