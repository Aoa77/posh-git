function GitX_MergeTheirs {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX_UtilInputBranch -b $branch);
    git merge -X theirs $branch;
}
