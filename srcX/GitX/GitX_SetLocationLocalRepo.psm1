function GitX_SetLocationLocalRepo {
    $root = "C:\work";
    $dirs = [System.IO.Directory]::GetDirectories($root);
    $repos = [System.Collections.Generic.List[string]]::new();
    $dirs | ForEach-Object {
        $git = [System.IO.Directory]::GetDirectories($_, ".git");
        if ($git.Length -eq 1) {
            $repos.Add($_.Replace($root, ""));
        }
    };
    $menu = (ConsoleX_Menu "GitX - choose repository folder." $repos);
    Push-Location;
    Set-Location $dirs[$menu];
}
