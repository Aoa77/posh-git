[string] $Global:GITX_MAIN_BRANCH = "???";
function GitX_GlobalConfig {
    git config --global pager.branch false;

    git config --global diff.tool vscode;
    git config --global difftool.vscode.cmd "code --wait --diff $LOCAL $REMOTE";
    git config --global difftool.prompt false;

    git config --global merge.tool vscode
    git config --global mergetool.vscode.cmd "code --wait $MERGED";
    git config --global mergetool.keepBackup false;
}
GitX_GlobalConfig;
