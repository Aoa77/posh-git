# function WriteX_InvokeBlock([ScriptBlock] $sb, [Object[]] $argList) {
#     WriteX_NewLine 1;
#     Write-Host $sb.ToString().Replace("        ", "") -ForegroundColor Green;
#     Write-Host $argList -ForegroundColor Yellow;
#     WriteX_NewLine 2;
#     Invoke-Command -ScriptBlock $sb -ArgumentList $argList;
# }
