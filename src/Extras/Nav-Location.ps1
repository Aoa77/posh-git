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
    Get-ChildItem -Path "~"  -Directory | ForEach-Object {
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
            $windices = [System.Collections.Generic.List[string]]::new();
            $workspaces = [System.Collections.Generic.Dictionary[string, string]]::new();
            $places.Values | ForEach-Object {
                Get-ChildItem -Path $_ -File -Filter "*.code-workspace" -Recurse | ForEach-Object {

                    $windices.Add($_.Name);
                    $workspaces.Add($_.Name, $_.FullName);
                };
            };
            $windex = (Console-Menu "vscode workspaces" $windices.ToArray());
            code $workspaces[$windices[$windex]];
        }
        default { break; }
    }
}
