#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function GitX-Fetch {
    [CmdletBinding()]
    Param (
        [switch] $prune_local
    )
    git fetch --all --prune --tags;
    $regex = [System.Text.RegularExpressions.Regex]::new("^(.*?)\[origin/(.*?): gone\](.*?)$", [System.Text.RegularExpressions.RegexOptions]::Multiline);
    if ($prune_local.IsPresent) {
        git branch -ravv | ForEach-Object { if ($regex.IsMatch($_)) {
                git branch -D $($regex.Match($_).Groups[2].Value);
            }
        };
    }
    GitX-Branch-All;
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
