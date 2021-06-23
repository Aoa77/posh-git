[string] $Global:GITX_MAIN_BRANCH = "???";
function GitX_ZConfig {
    git config --global pager.branch false;
    git config --global diff.tool bc;
    git config --global difftool.bc.path "c:/Program Files/Beyond Compare 4/bcomp.exe";
    git config --global merge.tool bc;
    git config --global mergetool.bc.path "c:/Program Files/Beyond Compare 4/bcomp.exe";
    git config --global difftool.prompt false;
    git config --global mergetool.keepBackup false;

    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_Branch -Name "gb";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_BranchAll -Name "gba";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_BranchPurge -Name "gbp";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_BranchRemote -Name "gbr";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_BranchVerbose -Name "gbv";

    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_Checkout -Name "gcx";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_CheckoutNew -Name "gcxn";

    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_Clean -Name "gc";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_CleanForce -Name "gcf";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_CleanInteractive -Name "gci";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_CleanPreview -Name "gcp";

    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_Fetch -Name "gf";

    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_MergeAbort -Name "gma";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_MergeOurs -Name "gmo";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_MergeTheirs -Name "gmt";

    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_Pull -Name "gp";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_PullForce -Name "gpf";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_PullOrigin -Name "gpo";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_PullOrigin-Force -Name "gpof";

    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_Push -Name "gpx";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_PushForce -Name "gpxf";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_PushQuick -Name "gpxq"

    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_Remote -Name "gr";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_Status -Name "gs";

    Remove-Alias "cd" -Force -Scope Global -ErrorAction "SilentlyContinue";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_SetLocation -Name "cd";
    Set-Alias -Force -Option AllScope -Scope Global -Value GitX_SetLocationPrevious -Name "cz";
}
GitX_ZConfig
