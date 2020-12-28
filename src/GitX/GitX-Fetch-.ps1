#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function GitX-Fetch {
    [CmdletBinding()]
    Param (
        [switch] $prune_local
    )
    Write-NewLine;
    Write-Splash "git fetch --all --prune --tags";
    git fetch --all --prune --tags;
    $regex = [System.Text.RegularExpressions.Regex]::new("^(.*?)\[origin/(.*?): gone\](.*?)$", [System.Text.RegularExpressions.RegexOptions]::Multiline);

    $to_prune = [System.Collections.Generic.List[string]]::new();
    git branch -ravv | ForEach-Object {
        if ($regex.IsMatch($_)) {
            $to_prune.Add($($regex.Match($_).Groups[2].Value));
        };
    }
    if ($to_prune.Count -gt 0) {
        Write-NewLine;
        Write-Splash "Local Orphaned Branches";
        $to_prune | ForEach-Object {
            Write-Host "- " -ForegroundColor "Gray" -NoNewline;
            Write-Host $_ -ForegroundColor "Yellow" -NoNewline;
            if ($prune_local.IsPresent) {
                git branch -D $_;
                Write-Host " *** PRUNED ***" -ForegroundColor "Red" -NoNewline;
            }
            Write-NewLine;
        }
    }
    GitX-Branch-All;
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
