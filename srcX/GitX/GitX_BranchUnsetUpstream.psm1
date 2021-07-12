function GitX_BranchUnsetUpstream {
    WriteX_NewLine;
    WriteX_Splash "git branch --unset-upstream";
    git branch --unset-upstream;
}
