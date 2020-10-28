
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function PROMPT {
    Init-ConsoleBuffer;
    Write-NewLine 2;
    [string]$loc = (Get-Location);
    Write-Host $loc -ForegroundColor "DarkGreen";
    Write-HR;


    $repo = (GitX-Util-Repo-Root $loc);
    if ($null -ne $repo) {
        [string] $vcsStatus = Write-VcsStatus;
        Write-Host $vcsStatus -NoNewline;
        $vcsStatus = $vcsStatus -creplace '(?m)\[(\d*?)m', '';
        $vcsStatus = $vcsStatus -creplace '(?m)\[|\]', '';
        [Console]::Title = $vcsStatus;
        Write-CharRepeater " " -count 4;
        Write-NewLine;
        Write-HR;
    }

    [int] $max = 5;
    [int] $count = 0;
    $dir = [System.IO.DirectoryInfo]::new($loc);
    $dirs = $dir.GetDirectories();
    $files = $dir.GetFiles();


    Reset-SidewaysBuffer;
    $count = 0;
    foreach ($dir in $dirs) {
        if (++$count -gt $max) {
            break;
        }
        Write-Sideways -out $dir.Name -fg "DarkMagenta";
    }
    if ($dirs.Count -gt 0) {
        if ($dirs.Count -gt $max) {
            Write-Sideways -out "[more]" -fg "Magenta";
        }
        Write-NewLine;
    }


    Reset-SidewaysBuffer;
    $count = 0;
    foreach ($file in $files) {
        if (++$count -gt $max) {
            break;
        }
        Write-Sideways -out $file.Name -fg "DarkBlue";
    }
    if ($files.Count -gt 0) {
        if ($files.Count -gt $max) {
            Write-Sideways -out "[more]" -fg "Blue";
        }
        Write-NewLine;
    }



    if ($files.Count -gt 0 -OR $dirs.Count -gt 0) {
        Write-HR;
    }
    Write-Host '>>' -NoNewline;
    return ' ';
}
#-------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
