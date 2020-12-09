#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function Write-InvokeBlock([ScriptBlock] $sb, [Object[]] $argList) {
    Write-HR-DarkGreen;
    Write-Host $sb.ToString().Replace("        ", "") -ForegroundColor Green;
    Write-Host $argList -ForegroundColor Yellow;
    Write-HR-DarkGreen;
    Write-NewLine;
    Invoke-Command -ScriptBlock $sb -ArgumentList $argList;
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
