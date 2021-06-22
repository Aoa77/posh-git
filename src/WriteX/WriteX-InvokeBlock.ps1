#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
function WriteX-InvokeBlock([ScriptBlock] $sb, [Object[]] $argList) {
    WriteX-NewLine 1;
    Write-Host $sb.ToString().Replace("        ", "") -ForegroundColor Green;
    Write-Host $argList -ForegroundColor Yellow;
    WriteX-NewLine 2;
    Invoke-Command -ScriptBlock $sb -ArgumentList $argList;
}
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
