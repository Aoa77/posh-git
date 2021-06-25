function GitX_SetLocationPrevious {
    Write-Host "";
    Write-Host "...navigating to previous location in history..." -ForegroundColor "Yellow";
    Set-Location $(Pop-Location);
}
