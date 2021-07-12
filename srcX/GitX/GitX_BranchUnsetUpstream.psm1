function GitX_Branch {
    WriteX_NewLine;
    WriteX_Splash "git branch --unset-upstream";
    git branch --unset-upstream;
}
