function GitX_Checkout {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX_UtilInputBranch -b $branch);
    git checkout $branch;
}
