function menu {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True)][String]$MenuTitle,
        [Parameter(Mandatory = $True)][array]$MenuItems
    )

    $MaxValue = $MenuItems.count - 1
    $Selection = 0
    $EnterPressed = $False

    Clear-Host

    While ($EnterPressed -eq $False) {

        Write-Host "--------------------------------------" -ForegroundColor DarkGray;
        Write-Host $MenuTitle -ForegroundColor Yellow;
        Write-Host "--------------------------------------" -ForegroundColor DarkGray;

        For ($i = 0; $i -le $MaxValue; $i++) {

            If ($i -eq $Selection) {
                Write-Host -BackgroundColor Cyan -ForegroundColor Black "[ $($MenuItems[$i]) ]"
            }
            Else {
                Write-Host "  $($MenuItems[$i])  "
            }

        }

        $KeyInput = $host.ui.rawui.readkey("NoEcho,IncludeKeyDown").virtualkeycode

        Switch ($KeyInput) {
            13 {
                $EnterPressed = $True
                Return $Selection
                Clear-Host
                break
            }

            38 {
                If ($Selection -eq 0) {
                    $Selection = $MaxValue
                }
                Else {
                    $Selection -= 1
                }
                Clear-Host
                break
            }

            40 {
                If ($Selection -eq $MaxValue) {
                    $Selection = 0
                }
                Else {
                    $Selection += 1
                }
                Clear-Host
                break
            }
            Default {
                Clear-Host
            }
        }
    }



    # Invoke-Expression "$PSScriptRoot\cmdlets\$($MyInvocation.MyCommand)";
    # Write-Host "";




}