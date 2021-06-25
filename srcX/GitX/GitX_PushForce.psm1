function GitX_PushForce {
    [CmdletBinding()]
    Param ( )
    [string] $currentBranch = (git rev-parse --abbrev-ref HEAD);
    [string] $status = '';
    $status = $(git status -sb); $status;
    if ($status.Contains('...')) {
        git push;
    }
    else {
        git push --set-upstream origin $currentBranch;
    }
}
