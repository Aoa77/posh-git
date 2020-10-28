function GitX-Remote {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $Branch,
        [alias("o")]
        [Parameter()]
        [switch] $Open_Web_Browser
    )
    if ([string]::IsNullOrWhiteSpace($branch)) {
        $branch = (git rev-parse --abbrev-ref HEAD);
    }
    Write-NewLine 2;
    [string] $remote = (git config --get remote.origin.url);
    $github = [System.Text.RegularExpressions.Regex]::Split($remote, "github.com:");
    if ($github.Length -eq 2) {
        $remote = "https://github.com/$($github[1])";
        if ($Open_Web_Browser.IsPresent) {
            SysX-WebBrowser -url $remote;
        }
        return $remote;
    }
    $tfs = [System.Text.RegularExpressions.Regex]::Split($remote, "://");
    if ($tfs.Length -ne 2) {
        throw "unknown remote origin url format: $remote";
    }
    $url = [System.Text.StringBuilder]::new("http://");
    [void]$url.Append($tfs[1]);
    [void]$url.Append("?itemVersion=GB");
    [void]$url.Append($branch);
    $remote = "$url";
    $remote = $remote.Replace(":22", ":8080");
    $remote = $remote.Replace(".mpifix.com", "");
    if ($Open_Web_Browser.IsPresent) {
        SysX-WebBrowser -url $remote;
    }
    return $remote;
}