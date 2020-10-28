function GitX-Pull-Origin {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX-Util-Input-Branch -b $branch);
    git pull origin $branch;
}
