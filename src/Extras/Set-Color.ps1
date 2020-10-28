#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
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
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
