#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function WriteX-InvokeBlock([ScriptBlock] $sb, [Object[]] $argList) {
    WriteX-HR;
    Write-Host $sb.ToString().Replace("        ", "") -ForegroundColor Green;
    Write-Host $argList -ForegroundColor Yellow;
    WriteX-HR;
    WriteX-NewLine;
    Invoke-Command -ScriptBlock $sb -ArgumentList $argList;
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
