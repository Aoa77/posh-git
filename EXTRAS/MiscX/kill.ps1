
function Kill-Process {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string] $Name,
        [Parameter(Mandatory = $false)]
        [string] $Path,
        [Parameter(Mandatory = $false)]
        [switch] $Preview
    )
    $_list = [System.Diagnostics.Process]::GetProcessesByName($Name);
    foreach ($_process in $_list) {
        $_path = $_process.Path;
        if (!$_path.Contains($Path)) {
            continue;
        }
        Write-Host $_process;
        if ($Preview.IsPresent) {
            continue;
        }
        try {
            $_process.Kill();
        }
        catch {
            $ERROR | ForEach-Object { Write-Verbose $_ -Verbose; }
            $ERROR.Clear();
        }
    }

}
Set-Alias -Force -Option AllScope -Scope Global -Value Kill-Process -Name "KP";
