#for
[int]$times = 5
for ($counter=0; $counter -lt $times; $counter++)
{
    write-host $counter ' times hello'
}

[int]$counter = 0
while ($counter -lt 5)
{
    write-host $counter ' times hello'
    $counter++
}


#do ..while
$counter = 0
do 
{
    write-host 'nothing'
    $counter++
}while ($counter -lt 3)


#foreach
[string]$string ='string'
[char]$char
foreach ($char in $string.ToCharArray()) {
    write-host $char
}


#foreach-object
$string = "Powershell for beginners"
$string.tochararray()|foreach-object {write-host "$_"}