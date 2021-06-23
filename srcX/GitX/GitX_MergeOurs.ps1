# https://stackov   erflow.com/a/3364506/931513
function GitX_MergeOurs {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX_UtilInputBranch -b $branch);
    git merge -s ours $branch;
}
