function GitX_BranchPurge {
    Write-Warning "Will purge all local branches!";
    GitX_Checkout;
    git branch | ForEach-Object {
        Invoke-Expression "git branch -D $_";
    }
}
