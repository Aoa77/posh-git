function Console-Menu () {
    Param(
        [Parameter(Mandatory = $true)][String]$MenuTitle,
        [Parameter(Mandatory = $true)][array]$MenuOptions
    )
    $MaxValue = $MenuOptions.count - 1;
    $Selection = 0;
    $EnterPressed = $false;
    while ($EnterPressed -eq $false) {
        Clear-Host;
        Write-Splash $MenuTitle;
        for ($i = 0; $i -le $MaxValue; $i++) {
            if ($i -eq $Selection) {
                Write-Host -BackgroundColor Cyan -ForegroundColor Black "[ $($MenuOptions[$i]) ]";
            }
            else {
                Write-Host "  $($MenuOptions[$i])  ";
            }
        }
        $KeyInput = $host.ui.rawui.readkey("NoEcho,IncludeKeyDown").virtualkeycode;
        #Write-Host "`$KeyInput: $KeyInput";
        switch ($KeyInput) {
            13 {
                $EnterPressed = $true
                return $Selection;
            }
            27 {
                return -1;
            }
            38 {
                if ($Selection -eq 0) {
                    $Selection = $MaxValue;
                }
                else {
                    $Selection -= 1;
                }
                break;
            }
            40 {
                if ($Selection -eq $MaxValue) {
                    $Selection = 0;
                }
                else {
                    $Selection += 1;
                }
                break;
            }
            default { break; }
        }
    }
}
function SwitchTo-Window {
    Param(
        [string] $proc = "C:\Program Files (x86)\Citrix\ICA Client\concentr.exe",
        [string] $adm
    )
    Clear-Host

    Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class WinAp {
      [DllImport("user32.dll")]
      [return: MarshalAs(UnmanagedType.Bool)]
      public static extern bool SetForegroundWindow(IntPtr hWnd);

      [DllImport("user32.dll")]
      [return: MarshalAs(UnmanagedType.Bool)]
      public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    }
"@
    $p = Get-Process | Where-Object { $_.mainWindowTitle } |
    Where-Object { $_.Name -like "$proc" }
    if (($p -eq $null) -and ($adm -ne "")) {
        Start-Process "$proc" -Verb runAs
    }
    elseif (($p -eq $null) -and ($adm -eq "")) {
        Start-Process "$proc"
    }
    else {
        $h = $p.MainWindowHandle
        [void] [WinAp]::SetForegroundWindow($h)
        [void] [WinAp]::ShowWindow($h, 3)
    }
}
