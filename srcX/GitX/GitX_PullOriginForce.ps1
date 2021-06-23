function GitX_PullOrigin-Force {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX_UtilInput-Branch -b $branch);
    git pull origin $branch --force;
}
