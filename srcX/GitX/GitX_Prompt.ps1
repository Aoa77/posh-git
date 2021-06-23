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
function PROMPT {
    WriteX_SidewaysBufferInit;
    WriteX_NewLine 2;

    $loc = GitX_Prompt;

    [int] $max = 5;
    [int] $count = 0;
    $dir = [System.IO.DirectoryInfo]::new($loc);
    $dirs = $dir.GetDirectories();
    $files = $dir.GetFiles();

    WriteX_SidewaysBufferReset;
    $count = 0;
    foreach ($dir in $dirs) {
        if (++$count -gt $max) {
            break;
        }
        WriteX_Sideways -out $dir.Name -fg "DarkMagenta";
    }
    if ($dirs.Count -gt 0) {
        if ($dirs.Count -gt $max) {
            WriteX_Sideways -out "[more]" -fg "Magenta";
        }
        WriteX_NewLine;
    }

    WriteX_SidewaysBufferReset;
    $count = 0;
    foreach ($file in $files) {
        if (++$count -gt $max) {
            break;
        }
        WriteX_Sideways -out $file.Name -fg "DarkBlue";
    }
    if ($files.Count -gt 0) {
        if ($files.Count -gt $max) {
            WriteX_Sideways -out "[more]" -fg "Blue";
        }
        WriteX_NewLine;
    }
    if ($files.Count -gt 0 -OR $dirs.Count -gt 0) {
        #WriteX_NewLine;
    }
    Write-Host ">:" -NoNewline;
    return " ";
}
