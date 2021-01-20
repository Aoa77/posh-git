function Window-Switch {
    Param(
        [string] $proc = "C:\Program Files (x86)\Citrix\ICA Client\concentr.exe",
        [string] $adm
    )
    #Clear-Host

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
