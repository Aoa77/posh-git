############################################################################################################
# Console-Snapshop.ps1
########---------------------------------------------------------------------
# source: https://devblogs.microsoft.com/powershell/colorized-capture-of-console-screen-in-html-and-rtf/
###########################################
# The script captures console screen buffer up to the current cursor position and returns it in HTML format.
#-------------------
#


# The Windows PowerShell console host redefines DarkYellow and DarkMagenta colors and uses them as defaults.
# The redefined colors do not correspond to the color names used in HTML, so they need to be mapped to digital color codes.
#
function Normalize-HtmlColor ($color) {
    if ($color -eq "DarkYellow") { $color = "#eeedf0" }
    if ($color -eq "DarkMagenta") { $color = "#012456" }
    if ($color -eq "DarkBlue") { $color = "#0052CD" }
    return $color
}

function Console-Snapshop([string] $logFile) {
    ###################
    AssertConsoleHost;
    ###################

    # Initialize the HTML string builder.
    $htmlBuilder = New-Object system.text.stringbuilder;

    [void]$htmlBuilder.Append("<!DOCTYPE html><html lang=`"en`"><head><meta charset=`"UTF-8`">");
    [void]$htmlBuilder.Append("<meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0`">");
    [void]$htmlBuilder.Append("<meta http-equiv=`"X-UA-Compatible`" content=`"ie=edge`">");
    [void]$htmlBuilder.Append("<script src=`"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js`"></script>");
    [void]$htmlBuilder.Append("<style>");

    [void]$htmlBuilder.Append("* {margin:0;font-family: 'Cascadia Code', monospace;font-size:8pt;}");
    [void]$htmlBuilder.Append("body {background-color:#003366;text-align:left;}");
    [void]$htmlBuilder.Append(".container {display:inline-block;text-align:left;margin:0px;padding:21px;background-color:#000000;border:solid 2px #00ff00;}");
    [void]$htmlBuilder.Append(".container pre {display:inline-block;text-align:left;}");
    [void]$htmlBuilder.Append("</style></head><body><div class='container'><pre>");

    # Grab the console screen buffer contents using the Host console API.
    $bufferWidth = $host.ui.rawui.BufferSize.Width;
    $bufferHeight = $host.ui.rawui.CursorPosition.Y;
    $rec = New-Object System.Management.Automation.Host.Rectangle 0, 0, ($bufferWidth – 1), $bufferHeight;
    $buffer = $host.ui.rawui.GetBufferContents($rec);

    # Iterate through the lines in the console buffer.
    for ($i = 0; $i -lt $bufferHeight; $i++) {
        $spanBuilder = New-Object system.text.stringbuilder;

        # Track the colors to identify spans of text with the same formatting.
        $currentForegroundColor = $buffer[$i, 0].Foregroundcolor;
        $currentBackgroundColor = $buffer[$i, 0].Backgroundcolor;

        for ($j = 0; $j -lt $bufferWidth; $j++) {
            $cell = $buffer[$i, $j];

            # If the colors change, generate an HTML span and append it to the HTML string builder.
            if (($cell.ForegroundColor -ne $currentForegroundColor) -or ($cell.BackgroundColor -ne $currentBackgroundColor)) {
                Append-HtmlSpan;

                # Reset the span builder and colors.
                $spanBuilder = New-Object system.text.stringbuilder;
                $currentForegroundColor = $cell.Foregroundcolor;
                $currentBackgroundColor = $cell.Backgroundcolor;
            }

            # Substitute characters which have special meaning in HTML.
            switch ($cell.Character) {
                ">" { $htmlChar = "&gt;" }
                "<" { $htmlChar = "&lt;" }
                "&" { $htmlChar = "&amp;" }
                default {
                    $htmlChar = $cell.Character;
                }
            }

            $null = $spanBuilder.Append($htmlChar);
        }

        Append-HtmlSpan;
        Append-HtmlBreak;
    }

    # Append HTML ending tag.
    [void]$htmlBuilder.Append("</pre></div></body></html>");
    #throw $logFile;
    [void] (Set-Content -Path $logFile -Force -Value ($htmlBuilder.ToString()));
}




function AssertConsoleHost {
    # Check the host name and exit if the host is not the Windows PowerShell console host.
    if ($host.Name -ne "ConsoleHost") {
        Write-Host -ForegroundColor Red "This script runs only in the console host. You cannot run this script in $($host.Name)."
        exit -1
    }
}


# Create an HTML span from text using the named console colors.
#
function Make-HtmlSpan ($text, $forecolor = "DarkYellow", $backcolor = "DarkMagenta") {
    $forecolor = Normalize-HtmlColor $forecolor
    $backcolor = Normalize-HtmlColor $backcolor

    # You can also add font-weight:bold tag here if you want a bold font in output.
    return "<span style=`"color:$forecolor; background:$backcolor`">$text</span>"
}

# Generate an HTML span and append it to HTML string builder
#
function Append-HtmlSpan {
    $spanText = $spanBuilder.ToString()
    $spanHtml = Make-HtmlSpan $spanText $currentForegroundColor $currentBackgroundColor
    [void]$htmlBuilder.Append($spanHtml)
}

# Append line break to HTML builder
#
function Append-HtmlBreak {
    [void]$htmlBuilder.Append("<br>")
}

