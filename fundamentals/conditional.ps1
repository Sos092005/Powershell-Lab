#if
if (4 -eq 4)
{
    write-host "equal values"
}
if ('hello' -eq "hello")
{
    write-host "equal values too"
}


#if .. else
[int]$x = 2
[int]$y =78

if (($false -eq $true))
{
    write-host 'good'
}
else
{
    write-host 'expected'
}


$yourName = "Ia"

if ($yourName -eq "Ian")
{
    Write-Host "Hay my name is Ian too!"
}
else 
{
    Write-Host "Hi $yourName, nice to meet you!"
}


#user input
[string]$playerInput = ""

$playerInput =read-host "You walk into a room with two doorways. 
One to the left and one to the right. Type 'left' or 'Right' to walk 
through one of the doors."

if ($playerInput -eq "left")
{
    Write-Host "Player Typed left"
}
elseif ($playerInput -eq "right")
{
    Write-Host "Player avoided left"
}
else
{
    Write-Host "Can't believe he played with us !Haha"
}


#comparison operators
#-ne
if (3 -ne 4)
{
    write-host 'not equals'
}

#-gt -lt
write-host "0 vs 4"
if (0 -gt 4)
{
    write-host 'greater'
}
elseif(0 -lt 4)
{
    write-host 'lesser'
}


#-ge -le
write-host "4 vs 4"
if (4 -ge 4)
{
    write-host 'greater or equal'
}
if (4 -le 4)
{
    write-host 'lesser or equal'
}


#-like 
if ("hello*" -like "*")
{
    write-host 'matched'
}
elseif ("*" -notlike 'hello*')
{
    write-host "not matched"
}

# -contains -notcontains -in -notin
$list = @(1, 2, 3, 4, 5)
if ($list -contains 3) 
{
    write-host "the list does contain a 3"
}
if ($list -notcontains 8) 
{
    write-host "the list does not contain a 8"
}
if (3 -in $list) 
{
    write-host "the list does contain a 3"
}
if (8 -notin $list) 
{
    write-host "the list does not contain a 8"
}


#-is
$var = 1
if ($var -is [string])
{
    write-host 'Nooo-Va'
}
else
{
    write-host 'craignos'
}


#Switch Statements
[int]$number = 2
switch ($number) 
{
    1 { 'and One' }
    2 { 'and TWO'}
    Default {'not well known'}
}
