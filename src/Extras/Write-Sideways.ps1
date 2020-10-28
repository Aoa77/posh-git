
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
#------------------------------------------------------------------------------
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
