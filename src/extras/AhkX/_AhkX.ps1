KP AutoHotKey;
$ahk_path = "C:\Program Files\AutoHotkey\AutoHotkey.exe";
Get-ChildItem $PSScriptRoot -Filter "*.ahk" | ForEach-Object {
    Start-Process $ahk_path $_.FullName;
}