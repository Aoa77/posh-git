#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function WriteX-InvokeBlock([ScriptBlock] $sb, [Object[]] $argList) {
    WriteX-HR-DarkGreen;
    Write-Host $sb.ToString().Replace("        ", "") -ForegroundColor Green;
    Write-Host $argList -ForegroundColor Yellow;
    WriteX-HR-DarkGreen;
    WriteX-NewLine;
    Invoke-Command -ScriptBlock $sb -ArgumentList $argList;
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
