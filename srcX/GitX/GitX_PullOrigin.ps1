function GitX_PullOrigin {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX_UtilInput-Branch -b $branch);
    git pull origin $branch;
}
