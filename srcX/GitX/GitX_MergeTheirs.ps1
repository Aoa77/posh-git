function GitX_MergeTheirs {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX_UtilInput-Branch -b $branch);
    git merge -X theirs $branch;
}
