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
