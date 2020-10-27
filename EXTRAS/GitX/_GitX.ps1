[string] $Global:GITX_MAIN_BRANCH = "master";
git config --global pager.branch false;
git config --global diff.tool bc;
git config --global difftool.bc.path "c:/Program Files/Beyond Compare 4/bcomp.exe";
git config --global merge.tool bc;
git config --global mergetool.bc.path "c:/Program Files/Beyond Compare 4/bcomp.exe";
git config --global difftool.prompt false;
git config --global mergetool.keepBackup false;

Pop-Location;


Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Branch -Name "gb";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Branch-All -Name "gba";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Branch-Cleanup-Local -Name "gbc";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Branch-Remote -Name "gbr";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Branch-Verbose -Name "gbv";

Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Checkout -Name "gcx";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Checkout-New -Name "gcxn";

Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Clean -Name "gc";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Clean-Force -Name "gcf";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Clean-Interactive -Name "gci";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Clean-Preview -Name "gcp";

Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Fetch -Name "gf";

Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Merge-Abort -Name "gma";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Merge-Ours -Name "gmo";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Merge-Theirs -Name "gmt";

Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Pull -Name "gp";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Pull-Force -Name "gpf";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Pull-Origin -Name "gpo";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Pull-Origin-Force -Name "gpof";

Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Push -Name "gpx";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Push-Force -Name "gpxf";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Push-Quick -Name "gpxq"

Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Remote -Name "gr";
Set-Alias -Force -Option AllScope -Scope Global -Value GitX-Status -Name "gs";
