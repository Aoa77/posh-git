
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function Write-Gitx-Prompt {

    [string]$loc = (Get-Location);
    Write-Host $loc -ForegroundColor "DarkGreen";
    WriteX-HR;

    $repo = (GitX-Util-Repo-Root $loc);
    if ($null -ne $repo) {
        [string] $vcsStatus = Write-VcsStatus;
        Write-Host $vcsStatus -NoNewline;
        $vcsStatus = $vcsStatus -creplace '(?m)\[(\d*?)m', '';
        $vcsStatus = $vcsStatus -creplace '(?m)\[|\]', '';
        [Console]::Title = $vcsStatus;
        WriteX-CharRepeater " " -count 4;
        WriteX-NewLine;
        WriteX-HR;
    }

    return $loc;
}
#-----------------------------------------------------------------------
function PROMPT {
    WriteX-SidewaysBuffer-Init;
    WriteX-NewLine 2;

    $loc = Write-Gitx-Prompt;

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
        WriteX-HR;
    }
    Write-Host '>:' -NoNewline;
    return ' ';
}
#-------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
