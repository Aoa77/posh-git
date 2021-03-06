#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function GitX-Checkout-New {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    if ([string]::IsNullOrWhiteSpace($branch)) {
        $branch = [System.Guid]::NewGuid().ToString();
    }
    git checkout -b $branch;
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
