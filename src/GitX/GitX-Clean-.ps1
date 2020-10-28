#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
 function GitX-Clean {
    [CmdletBinding()]
    Param (
        [string] $flags
    )
    if ($flags.Length -lt 1) {
        $flags = "fdxn;"   # default is preview
    }
    $flags = $flags.TrimStart('-');
    $commandExpression = "git clean -$flags";
    $invokeResult = '';
    Invoke-Expression -Command $commandExpression -OutVariable invokeResult;
    Write-Information $invokeResult;
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
