#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function Write-Splash([string] $msg, [switch] $invert) {
    if ($invert.IsPresent) {
        Write-HR;
    }
    Write-Host "== " -ForegroundColor DarkBlue -NoNewline;
    Write-Host $msg -ForegroundColor Cyan -NoNewline;
    Write-Host " ==" -ForegroundColor DarkBlue;

    if (!$invert.IsPresent) {
        Write-HR;
    }
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function Write-InvokeBlock([ScriptBlock] $sb, [Object[]] $argList) {
    Write-HR-Half;
    Write-Host $sb.ToString().Replace("        ", "") -ForegroundColor Green;
    Write-Host $argList -ForegroundColor Yellow;
    Write-HR-Half;
    Write-NewLine;
    Invoke-Command -ScriptBlock $sb -ArgumentList $argList;
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
