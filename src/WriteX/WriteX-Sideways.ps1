

###############################################################################
###############################################################################
[int] $Global:BUFFER_WIDTH = ($Host.UI.RawUI.WindowSize.Width - 3);
[int] $Global:SIDEWAYS_LIST_PADDING = 2;
[int] $Global:SIDEWAYS_BUFFER = 0;
#------------------------------------------------------------------------------
function WriteX-SidewaysBuffer-Init {
    $Global:BUFFER_WIDTH = ($Host.UI.RawUI.WindowSize.Width - 3);
    $Global:SIDEWAYS_LIST_PADDING = 2;
    WriteX-SidewaysBuffer-Reset;

    $BUFF = $host.UI.RawUI.BufferSize;
    $host.UI.RawUI.BufferSize = `
        New-Object System.Management.Automation.Host.Size($BUFF.Width, $BUFF.Height);
}
#------------------------------------------------------------------------------
function WriteX-SidewaysBuffer-Reset {
    $Global:SIDEWAYS_BUFFER = $Global:BUFFER_WIDTH;
}
#------------------------------------------------------------------------------
function WriteX-Sideways {
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
    $fg = WriteX-SetColor -value $fg -fg;
    $bg = WriteX-SetColor -value $bg -bg;
    $padded_length = ($out.Length + $Global:SIDEWAYS_LIST_PADDING);
    $Global:SIDEWAYS_BUFFER -= $padded_length;
    if ($Global:SIDEWAYS_BUFFER -lt 0) {
        WriteX-NewLine;
        WriteX-SidewaysBuffer-Reset;
        if ($padded_length -gt $Global:BUFFER_WIDTH) {
            Write-Host $out -ForegroundColor $fg -BackgroundColor $bg;
        }
        else {
            WriteX-Sideways -out $out -fg $fg -bg $bg;
        }
        return;
    }
    Write-Host $out -ForegroundColor $fg -BackgroundColor $bg -NoNewline;
    WriteX-CharRepeater -ch " " -count $Global:SIDEWAYS_LIST_PADDING;
}
###############################################################################
###############################################################################
WriteX-SidewaysBuffer-Init;
###############################################################################
###############################################################################
