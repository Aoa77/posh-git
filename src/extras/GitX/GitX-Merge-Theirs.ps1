function GitX-Merge-Theirs {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX-Util-Input-Branch -b $branch);
    git merge -X theirs $branch;
}
