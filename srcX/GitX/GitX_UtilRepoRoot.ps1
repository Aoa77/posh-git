function GitX_UtilRepoRoot {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [ValidateScript( { ![string]::IsNullOrWhiteSpace($_) })]
        [string] $pathToCheck
    )
    $find = $null;
    [System.IO.DirectoryInfo] $dir = [System.IO.DirectoryInfo]::new($pathToCheck);
    while ($dir -ne $null) {
        $find = $dir.GetDirectories('.git');
        if ($find.Length -gt 0) {
            return $dir.FullName;
        }
        $dir = $dir.Parent;
    }
    return $null;
}
