# https://stackov   erflow.com/a/3364506/931513
function GitX-Merge-Ours {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX-Util-Input-Branch -b $branch);
    git merge -s ours $branch;
}