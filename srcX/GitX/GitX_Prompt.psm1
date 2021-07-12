function GitX_Prompt {

    [string]$loc = (Get-Location);
    Write-Host $loc -ForegroundColor "DarkGreen";

    $repo = (GitX_UtilRepoRoot $loc);
    if ($null -ne $repo) {
        $(git branch -r) | ForEach-Object {
            $b = $_.Replace("origin/", "").Trim();
            # Write-Host $b -ForegroundColor "DarkBlue";
            if ($b -in ("main", "master")) {
                # Write-Host $b -ForegroundColor "Cyan";
                $Global:GITX_MAIN_BRANCH = $b;
            }
        }
        [string] $vcsStatus = Write-VcsStatus;
        Write-Host $vcsStatus -NoNewline;
        $vcsStatus = $vcsStatus -creplace "(?m)\[(\d*?)m", "";
        $vcsStatus = $vcsStatus -creplace "(?m)\[|\]", "";
        [Console]::Title = $vcsStatus;
        WriteX_CharRepeater " " -count 4;
        WriteX_NewLine;
    }

    return $loc;
}