###############################################################################
Write-Host " #############################" -ForegroundColor DarkBlue;
Write-Host "== " -ForegroundColor Blue -NoNewline;
Write-Host "Initializing profile..." -ForegroundColor Cyan -NoNewline;
Write-Host " ==" -ForegroundColor Blue;
Write-Host " #############################" -ForegroundColor DarkBlue;
###############################################################################
###############################################################################
function Write-Colors {
    Write-Host "Black" -ForegroundColor Black;
    Write-Host "Blue" -ForegroundColor Blue;
    Write-Host "Cyan" -ForegroundColor Cyan;
    Write-Host "DarkBlue" -ForegroundColor DarkBlue;
    Write-Host "DarkCyan" -ForegroundColor DarkCyan;
    Write-Host "DarkGray" -ForegroundColor DarkGray;
    Write-Host "DarkGreen" -ForegroundColor DarkGreen;
    Write-Host "DarkMagenta" -ForegroundColor DarkMagenta;
    Write-Host "DarkRed" -ForegroundColor DarkRed;
    Write-Host "DarkYellow" -ForegroundColor DarkYellow;
    Write-Host "Gray" -ForegroundColor Gray;
    Write-Host "Green" -ForegroundColor Green;
    Write-Host "Magenta" -ForegroundColor Magenta;
    Write-Host "Red" -ForegroundColor Red;
    Write-Host "White" -ForegroundColor White;
    Write-Host "Yellow" -ForegroundColor Yellow;
}
function Set-Color {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string] $value,
        [Parameter(Mandatory = $false)]
        [switch] $fg,
        [Parameter(Mandatory = $false)]
        [switch] $bg
    )
    if ([string]::IsNullOrWhiteSpace($value)) {
        if ($fg.IsPresent) {
            return "White";
        }
        if ($bg.IsPresent) {
            return "Black";
        }
    }
    return $value;
}
###############################################################################
###############################################################################
function Reset-SidewaysBuffer {
    $Global:SIDEWAYS_BUFFER = $Global:BUFFER_WIDTH;
}
###############################################################################
###############################################################################
function Init-ConsoleBuffer {
    $Global:BUFFER_WIDTH = ($Host.UI.RawUI.WindowSize.Width - 3);
    $Global:SIDEWAYS_LIST_PADDING = 2;
    Reset-SidewaysBuffer;
}
###############################################################################
###############################################################################
[int] $Global:BUFFER_WIDTH = ($Host.UI.RawUI.WindowSize.Width - 3);
[int] $Global:SIDEWAYS_LIST_PADDING = 2;
[int] $Global:SIDEWAYS_BUFFER = 0;
###############################################################################
Init-ConsoleBuffer;
###############################################################################
function Write-CharRepeater {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string] $ch,
        [Parameter(Mandatory = $false)]
        [int] $count,
        [Parameter(Mandatory = $false)]
        [string] $fg,
        [Parameter(Mandatory = $false)]
        [string] $bg
    )
    $fg = Set-Color -value $fg -fg;
    $bg = Set-Color -value $bg -bg;
    $out = "";
    while ($out.Length -lt $count) {
        $out += $ch;
    }
    Write-Host $out -ForegroundColor $fg -BackgroundColor $bg -NoNewline;
}
function Write-HR {
    Write-CharRepeater "-" $Global:BUFFER_WIDTH -fg "DarkGray";
    Write-NewLine;
}
#------------------------------------------------------------------------------
function Write-NewLine {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [int] $count
    )
    if ($count -eq 0) {
        $count = 1;
    }
    for ($i = 0; $i -lt $count; $i++) {
        Write-Host "";
    }
}
#------------------------------------------------------------------------------
function Write-Sideways {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [ValidateScript( { ![string]::IsNullOrWhiteSpace($_) })]
        [string] $out,
        [Parameter(Mandatory = $false)]
        [string] $fg,
        [Parameter(Mandatory = $false)]
        [string] $bg
    )
    $fg = Set-Color -value $fg -fg;
    $bg = Set-Color -value $bg -bg;
    $padded_length = ($out.Length + $Global:SIDEWAYS_LIST_PADDING);
    $Global:SIDEWAYS_BUFFER -= $padded_length;
    if ($Global:SIDEWAYS_BUFFER -lt 0) {
        Write-NewLine;
        Reset-SidewaysBuffer;
        if ($padded_length -gt $Global:BUFFER_WIDTH) {
            Write-Host $out -ForegroundColor $fg -BackgroundColor $bg;
        }
        else {
            Write-Sideways -out $out -fg $fg -bg $bg;
        }
        return;
    }
    Write-Host $out -ForegroundColor $fg -BackgroundColor $bg -NoNewline;
    Write-CharRepeater -ch " " -count $Global:SIDEWAYS_LIST_PADDING;
}
#-------------------------------------------------------------------------------------------
Write-HR;
[string] $modroot = "$\";
#-------------------------------------------------------------------------------------------
Get-ChildItem -Path $PSScriptRoot -Filter "*.ps1" -Recurse | ForEach-Object {
    if (!$_.Name.Equals("SETUP.ps1") -and !$_.Name.StartsWith("_")) {
        $out = $_.Name.Split('.')[0];
        Write-Sideways -out $out -fg DarkMagenta;
        Import-Module $_.FullName -Force;
    }
}
#-------------------------------------------------------------------------------------------
Write-NewLine;
Write-HR;
Reset-SidewaysBuffer;
#-------------------------------------------------------------------------------------------
Get-ChildItem -Path $PSScriptRoot -Filter "*.ps1" -Recurse | ForEach-Object {
    if ($_.Name.StartsWith("_")) {
        $out = "init$($_.Name.Split('.')[0])";
        Write-Sideways -out $out -fg "Blue";
        Import-Module $_.FullName -Force;
    }
}
##############################################################################################
##############################################################################################
Write-NewLine;
Write-HR;
#Auto-Save;
##############################################################################################
##############################################################################################
Clear-Host;
###############################################################################
Write-Host " #############################" -ForegroundColor DarkBlue;
Write-Host "==  " -ForegroundColor Blue -NoNewline;
Write-Host "Welcome to posh-gitX :)" -ForegroundColor Cyan -NoNewline;
Write-Host "  ==" -ForegroundColor Blue;
Write-Host " #############################" -ForegroundColor DarkBlue;
###############################################################################
##############################################################################################
Write-HR;
##############################################################################################
##############################################################################################
##############################################################################################
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
##############################################################################################
##############################################################################################
