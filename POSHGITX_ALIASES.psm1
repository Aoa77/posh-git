function PGX_ALIASES([bool] $removeMode) {
    # GitX aliases
    PGX_ALIAS -removeMode $removeMode "GitX_Branch"                   "gb";
    PGX_ALIAS -removeMode $removeMode "GitX_BranchAll"                "gba";
    PGX_ALIAS -removeMode $removeMode "GitX_BranchPurge"              "gbp";
    PGX_ALIAS -removeMode $removeMode "GitX_BranchRemote"             "gbr";
    PGX_ALIAS -removeMode $removeMode "GitX_BranchUnsetUpstream"      "gbu";
    PGX_ALIAS -removeMode $removeMode "GitX_BranchUnsetUpstream"      "gbuu";
    PGX_ALIAS -removeMode $removeMode "GitX_BranchVerbose"            "gbv";
    PGX_ALIAS -removeMode $removeMode "GitX_Checkout"                 "gcx";
    PGX_ALIAS -removeMode $removeMode "GitX_CheckoutNew"              "gcxn";
    PGX_ALIAS -removeMode $removeMode "GitX_Clean"                    "gc";
    PGX_ALIAS -removeMode $removeMode "GitX_CleanForce"               "gcf";
    PGX_ALIAS -removeMode $removeMode "GitX_CleanInteractive"         "gci";
    PGX_ALIAS -removeMode $removeMode "GitX_CleanPreview"             "gcp";
    PGX_ALIAS -removeMode $removeMode "GitX_Fetch"                    "gf";
    PGX_ALIAS -removeMode $removeMode "GitX_MergeAbort"               "gma";
    PGX_ALIAS -removeMode $removeMode "GitX_MergeOurs"                "gmo";
    PGX_ALIAS -removeMode $removeMode "GitX_MergeTheirs"              "gmt";
    PGX_ALIAS -removeMode $removeMode "GitX_Pull"                     "gp";
    PGX_ALIAS -removeMode $removeMode "GitX_PullForce"                "gpf";
    PGX_ALIAS -removeMode $removeMode "GitX_PullOrigin"               "gpo";
    PGX_ALIAS -removeMode $removeMode "GitX_PullOriginForce"          "gpof";
    PGX_ALIAS -removeMode $removeMode "GitX_Push"                     "gpx";
    PGX_ALIAS -removeMode $removeMode "GitX_PushForce"                "gpxf";
    PGX_ALIAS -removeMode $removeMode "GitX_PushQuick"                "gpxq";
    PGX_ALIAS -removeMode $removeMode "GitX_Remote"                   "gr";
    PGX_ALIAS -removeMode $removeMode "GitX_Status"                   "gs";

    # SysX aliases
    PGX_ALIAS -removeMode $removeMode "SysX_GetLocation_EtcHosts"     "etc";
    PGX_ALIAS -removeMode $removeMode "SysX_SetLocation"              "cd";
    PGX_ALIAS -removeMode $removeMode "SysX_SetLocationPrevious"      "cz";
}
function PGX_ALIAS ([bool] $removeMode, [string] $method, [string] $alias) {
    if ($removeMode) {
        [void] (Remove-Alias $alias -Force -Scope "Global" -ErrorAction ([System.Management.Automation.ActionPreference]::Ignore));
    }
    else {
        Set-Alias -Force -Option AllScope -Scope "Global" -Value $method -Name $alias;
    }
}

