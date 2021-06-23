function GitX_UtilInputBranch {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    if ([string]::IsNullOrWhiteSpace($branch)) {
        $branch = $Global:GITX_MAIN_BRANCH;
    }
    return $branch;
}
