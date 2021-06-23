function GitX_Checkout {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX_UtilInput-Branch -b $branch);
    git checkout $branch;
}
