#=== Reading a Key Press ===#

function read-character()
{   
    if ($Host.UI.RawUI.KeyAvailable)
    {
        return $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").character
    }   

    return $null
}

$done = $false

Clear-Host

$Host.UI.RawUI.FlushInputBuffer()

Write-Host "press any key or q to quit"

#keep looping round checking for new key presses
while (!$done)
{
    $char = read-character
    if ($null -ne $char)
    {
        Write-Host "you pressed" $char
    }
    if ($char -eq 'q')
    {
        Write-Host 'returning ...'
        $done = $true
    }
}


#===Reading a line of text===#
#Clear console
Clear-Host

#Ask questions using -Prompt
$userResponse = Read-Host -Prompt 'What is your name? '
Write-Host "Hi $userResponse nice to meet you!"

#Read input from next line
Write-Host "Where are you from?"
$userResponse = Read-Host