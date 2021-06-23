function GitX-Prompt {

    [string]$loc = (Get-Location);
    Write-Host $loc -ForegroundColor "DarkGreen";

    $repo = (GitX-Util-Repo-Root $loc);
    if ($null -ne $repo) {
        git branch -r | ForEach-Object {
            if ($_ -in ("main", "master")) {
                $Global:GITX_MAIN_BRANCH = $_;
            }
        }
        [string] $vcsStatus = Write-VcsStatus;
        Write-Host $vcsStatus -NoNewline;
        $vcsStatus = $vcsStatus -creplace '(?m)\[(\d*?)m', '';
        $vcsStatus = $vcsStatus -creplace '(?m)\[|\]', '';
        [Console]::Title = $vcsStatus;
        WriteX-CharRepeater " " -count 4;
        WriteX-NewLine;
    }

    return $loc;
}
function PROMPT {
    WriteX-SidewaysBuffer-Init;
    WriteX-NewLine 2;

    $loc = GitX-Prompt;

    [int] $max = 5;
    [int] $count = 0;
    $dir = [System.IO.DirectoryInfo]::new($loc);
    $dirs = $dir.GetDirectories();
    $files = $dir.GetFiles();

    WriteX-SidewaysBuffer-Reset;
    $count = 0;
    foreach ($dir in $dirs) {
        if (++$count -gt $max) {
            break;
        }
        WriteX-Sideways -out $dir.Name -fg "DarkMagenta";
    }
    if ($dirs.Count -gt 0) {
        if ($dirs.Count -gt $max) {
            WriteX-Sideways -out "[more]" -fg "Magenta";
        }
        WriteX-NewLine;
    }

    WriteX-SidewaysBuffer-Reset;
    $count = 0;
    foreach ($file in $files) {
        if (++$count -gt $max) {
            break;
        }
        WriteX-Sideways -out $file.Name -fg "DarkBlue";
    }
    if ($files.Count -gt 0) {
        if ($files.Count -gt $max) {
            WriteX-Sideways -out "[more]" -fg "Blue";
        }
        WriteX-NewLine;
    }
    if ($files.Count -gt 0 -OR $dirs.Count -gt 0) {
        #WriteX-NewLine;
    }
    Write-Host '>:' -NoNewline;
    return ' ';
}
