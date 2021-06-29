function SysX_SetLocation ([string] $location) {
    if ($location.Length -eq 0) {
        GitX_SetLocationLocalRepo;
        return;
    }
    $file = [System.IO.FileInfo]::new($location);
    if ($file.Exists) {
        Push-Location;
        Write-Host "";
        Write-Host "...location is file, navigating to its parent directory..." -ForegroundColor "Yellow";
        Set-Location $file.DirectoryName;
        return;
    }
    $dir = [System.IO.DirectoryInfo]::new($location);
    if ($dir.Exists) {
        Push-Location;
    }
    Set-Location $dir;
}
