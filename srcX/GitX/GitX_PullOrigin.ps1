function GitX_PullOrigin {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX_UtilInputBranch -b $branch);
    git pull origin $branch;
}
