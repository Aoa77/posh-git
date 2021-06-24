function POSHGITX_ALIASES([bool] $removeMode) {
    POSHGITX_ALIAS -removeMode $removeMode "GitX_Branch"                   "gb";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_BranchAll"                "gba";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_BranchPurge"              "gbp";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_BranchRemote"             "gbr";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_BranchVerbose"            "gbv";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_Checkout"                 "gcx";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_CheckoutNew"              "gcxn";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_Clean"                    "gc";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_CleanForce"               "gcf";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_CleanInteractive"         "gci";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_CleanPreview"             "gcp";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_Fetch"                    "gf";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_MergeAbort"               "gma";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_MergeOurs"                "gmo";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_MergeTheirs"              "gmt";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_Pull"                     "gp";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_PullForce"                "gpf";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_PullOrigin"               "gpo";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_PullOriginForce"          "gpof";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_Push"                     "gpx";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_PushForce"                "gpxf";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_PushQuick"                "gpxq";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_Remote"                   "gr";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_Status"                   "gs";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_SetLocation"              "cd";
    POSHGITX_ALIAS -removeMode $removeMode "GitX_SetLocationPrevious"      "cz";
}
function POSHGITX_ALIAS ([bool] $removeMode, [string] $method, [string] $alias) {
    if ($removeMode) {
        Remove-Alias $alias -Force -Scope Global -ErrorAction "SilentlyContinue";
    }
    else {
        Set-Alias -Force -Option AllScope -Scope Global -Value $method -Name $alias;
    }
}

