function PROMPT {
    WriteX_SidewaysBufferInit;
    WriteX_NewLine 2;

    $loc = GitX_Prompt;

    [int] $max = 10;
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

    PGX_LASTDIR_SET;
    Write-Host ">:" -NoNewline;
    return " ";
}
