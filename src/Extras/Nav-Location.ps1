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

    $option = (Console-Menu "places" ("git repositories", "vscode workspaces", "vs solutions"));

    switch ($option) {
        0 {
            $pindex = (Console-Menu "git repositories" $pindices.ToArray());
            Push-Location;
            Set-Location $places[$pindices[$pindex]];
            break;
        }
        1 {
            code (menuList $places "*.code-workspace" "vscode workspaces" 3);
            break;
        }
        2 {
            devenv (menuList $places "*.sln" "vs solutions" 3);
            break;
        }
        default { break; }
    }
}

function menuList([System.Collections.Generic.Dictionary[string, string]] $places, [string] $filter, [string] $title,[uint] $depth) {

    $windices = [System.Collections.Generic.List[string]]::new();
    $workspaces = [System.Collections.Generic.Dictionary[string, string]]::new();
    $places.Values | ForEach-Object {
        Get-ChildItem -Path $_ -File -Filter $filter -Recurse -Depth $depth | ForEach-Object {
            $key = $_.Name;
            while ($workspaces.ContainsKey($key)) {
                $key += "_";
            }
            $windices.Add($key);
            $workspaces.Add($key, $_.FullName);
        };
    };
    $windex = (Console-Menu $title $windices.ToArray());
    $workspace = $workspaces[$windices[$windex]];
    $directory = ([System.IO.FileInfo]::new($workspace)).DirectoryName;
    Push-Location;
    Set-Location (GitX-Util-Repo-Root $directory);
    return $workspace;
}
