function GitX_SetLocationLocalRepo {
    $repos = [System.Collections.Generic.List[string]]::new();
    $roots = ("C:\sc\", "C:\Users\Albert.Albers\");
    $menu = (ConsoleX_Menu "GitX - choose root folder." $roots);
    $root = $roots[$menu];
    $dirs = [System.IO.Directory]::GetDirectories($root);
    $dirs | ForEach-Object {
        $git = [System.IO.Directory]::GetDirectories($_, ".git");
        if ($git.Length -eq 1) {
            $repos.Add($_.Replace($root, ""));
        }
    };
    $menu = (ConsoleX_Menu "GitX - choose local repository under `"$root`"" $repos);
    Push-Location;
    Set-Location $dirs[$menu];
}
