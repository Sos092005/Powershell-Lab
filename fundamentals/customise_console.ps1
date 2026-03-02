#getting the console window
$pshost = Get-Host
$window = $psHost.UI.RawUI

#setting window properties
$window.WindowTitle = "PowerCraft"
$window.ForegroundColor ='gray'
$window.BackgroundColor ='magenta'


$newsize = $window.WindowSize
$newsize.Height = 20
$newsize.Width = 20

$window.WindowSize = $newsize
$window.WindowTitle = $title
