function Nav-Location {
    [CmdletBinding()]
    Param (
        [Parameter()]
        [string] $LOCATION,

        [Parameter()]
        [switch] $BACK
    )
    if ($BACK.IsPresent) {
        Pop-Location;
        return;
    }
    if (![string]::IsNullOrWhiteSpace($LOCATION)) {
        Push-Location;
        Set-Location $location;
        return;
    }

    $pindices = [System.Collections.Generic.List[string]]::new();
    $places = [System.Collections.Generic.Dictionary[string, string]]::new();
    Get-ChildItem -Path "~" -Directory | ForEach-Object {
        if ([System.IO.Directory]::Exists($_.FullName + "\.git")) {
            $pindices.Add($_.Name);
            $places.Add($_.Name, $_.FullName);
        }
    }

    while ($true) {
        $option = (Console-Menu "places" ("git repositories", "vscode workspaces", "vs solutions"));
        if ($option -lt 0) {
            break;
        }
        switch ($option) {
            0 {
                $pindex = (Console-Menu "git repositories" $pindices.ToArray());
                if ($pindex -lt 0) {
                    break;
                }
                Push-Location;
                Set-Location $places[$pindices[$pindex]];
                return;
            }
            1 {
                $file = (menuList $places "*.code-workspace" "vscode workspaces" 3);
                if ([string]::IsNullOrWhiteSpace($file)) {
                    break;
                }
                code $file;
                return;
            }
            2 {
                $file = (menuList $places "*.sln" "vs solutions" 3);
                if ([string]::IsNullOrWhiteSpace($file)) {
                    break;
                }
                devenv $file;
                return;
            }
            default { return; }
        }
    }
}

function menuList([System.Collections.Generic.Dictionary[string, string]] $places, [string] $filter, [string] $title, [uint] $depth) {

    $windices = [System.Collections.Generic.List[string]]::new();
    $workspaces = [System.Collections.Generic.Dictionary[string, string]]::new();
    $places.Values | ForEach-Object {
        Get-ChildItem -Path $_ -File -Filter $filter -Recurse -Depth $depth | ForEach-Object {
            $key = $_.Name;
            if ($workspaces.ContainsKey($key)) {
                $key = $_.FullName;
            }
            $windices.Add($key);
            $workspaces.Add($key, $_.FullName);
        };
    };
    $windex = (Console-Menu $title $windices.ToArray());
    if ($windex -lt 0) {
        return "";
    }
    $workspace = $workspaces[$windices[$windex]];
    $directory = ([System.IO.FileInfo]::new($workspace)).DirectoryName;
    Push-Location;
    Set-Location (GitX-Util-Repo-Root $directory);
    return $workspace;
}
