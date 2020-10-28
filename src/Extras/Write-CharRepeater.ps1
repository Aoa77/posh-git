
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
