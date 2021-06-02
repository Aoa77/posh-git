<#
<\\-- Custom PowerShell profile --//>
#>
Set-ExecutionPolicy `
    -ExecutionPolicy Unrestricted `
    -Scope LocalMachine `
    -Force;
$DebugPreference = `
    [System.Management.Automation.ActionPreference]::SilentlyContinue;
$ErrorActionPreference = `
    [System.Management.Automation.ActionPreference]::Stop;
$WarningPreference = `
    [System.Management.Automation.ActionPreference]::SilentlyContinue;

<#
<\\-- make the buffer bigger --//>
#>
while ($true) {
    try {
        [Console]::BufferHeight += 1000;
    }
    catch {
        break;
    }
}
[Console]::WriteLine("BufferHeight is $([Console]::BufferHeight)");
[System.Threading.Thread]::Sleep(50);
#[Console]::ReadLine();
[Console]::Clear();

<#
<\\-- import posh-gitx --//>
#>
Import-Module "~\posh-gitx\src\posh-gitx.psm1" -Force;
