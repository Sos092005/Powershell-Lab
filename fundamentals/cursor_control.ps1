function Move-cursor([int]$x , [int]$y)
{
    $host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates $x, $y
}

<#
Clear-Host
Move-cursor 5 1
Write-Host "X" -NoNewLine
Move-cursor 5 2
Write-Host "X" -NoNewLine
Move-cursor 5 3 
Write-Host "X" -NoNewLine
Move-cursor 5 4
Write-Host "X" -NoNewLine
Move-cursor 5 5
Write-Host "X" -NoNewLine
#>

function Setup-Display([string]$title, [int]$width, [int]$height)
{
    $psHost = Get-Host
    $window = $psHost.ui.RawUI
    $newsize = $window.WindowSize
    $newsize.Height = $height
    $newsize.width = $width
    $window.WindowSize = $newsize
    $window.WindowTitle = $title 
}

Clear-Host
Setup-Display "Move Cursor Demo" 50 25

#Loop 20 times and display an x in a random location
For ($i=0 , $i -lt 20; $i = $i + 1)
{
    #Generate random values for the X and Y positions
    $X = Get-Random -Minimum 0 -Maximum 119
    $Y = Get-Random -Minimum 0 -Maximum 24

    #Move to the random location
    Move-cursor $x $y

    #Display an X and disable a new line character
    Write-Host "X" -NoNewLine
}

#Move cursor to the bottom of the display
Move-cursor 0 31



#keep player inside the display
if ($xPosition -le 0)
{
    $xPosition = 0
}elseif ($xPosition -ge $displayWidth - $characterWidth)
{
    $xPosition = $displayWidth - $characterWidth
}

if ($yPosition -le 0)
{
    $yPosition = 0
}
elseif ($yPosition -ge $displayHeight - $characterHeight)
{
    $yPosition = $displayHeight -$characterHeight
}



#Only drawing display if there is an update
if ($update)
{
    Clear-Host
    Draw-Character
    $update = false
}