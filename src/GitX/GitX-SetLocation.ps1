function GitX-SetLocation ([string] $location) {
    if ($location.Length -eq 0) {
        GitX-LocalReposMenu;
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
function GitX-SetLocationPrevious {
    Write-Host "";
    Write-Host "...navigating to previous location in history..." -ForegroundColor "Yellow";
    Set-Location $(Pop-Location);
}
function GitX-LocalReposMenu {
    $repos = [System.Collections.Generic.List[string]]::new();
    $roots = ("C:\sc", "~\");
    $menu = (ConsoleX-Menu "GitX - choose root folder." $roots);
    $root = $roots[$menu];
    $dirs = [System.IO.Directory]::GetDirectories($root);
    $dirs | ForEach-Object {
        $git = [System.IO.Directory]::GetDirectories($_, ".git");
        if ($git.Length -eq 1) {
            $repos.Add($_.Replace($root, ""));
        }
    };
    $menu = (ConsoleX-Menu "GitX - choose local repository under `"$root`"" $repos);
}
