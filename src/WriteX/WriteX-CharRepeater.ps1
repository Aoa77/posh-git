function WriteX-CharRepeater {
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
    $fg = WriteX-SetColor -value $fg -fg;
    $bg = WriteX-SetColor -value $bg -bg;
    $out = "";
    while ($out.Length -lt $count) {
        $out += $ch;
    }
    Write-Host $out -ForegroundColor $fg -BackgroundColor $bg -NoNewline;
}
