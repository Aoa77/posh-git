#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function GitX-Branch-Delete {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter(Mandatory = $true)]
        [ValidateScript( { ![string]::IsNullOrWhiteSpace($_) })]
        [string] $branch_name,

        [alias("l")]
        [Parameter(Mandatory = $false)]
        [switch] $local,

        [alias("r")]
        [Parameter(Mandatory = $false)]
        [switch] $remote,

        [alias("rn")]
        [Parameter(Mandatory = $false)]
        [string] $remote_name
    )
    Write-Warning "Will delete the specified branch!";
    if ([string]::IsNullOrWhiteSpace($remoteName)) {
        $remoteName = "origin";
    }
    if ($local.IsPresent) {
        Invoke-Expression "git branch -D $branch_name";
    }
    if ($remote.IsPresent) {
        Invoke-Expression "git push -d $remote_name $branch_name";
    }
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
