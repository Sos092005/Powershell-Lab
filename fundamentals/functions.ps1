 #Beginners Guide to Functions

 function show-menu 
 {
    Write-Host "------------"
    Write-Host "Menu Options"
    Write-Host "------------"
    Write-Host "Press P to play"
    Write-Host "Press Q to Quit"
 }

Clear-Host
show-menu

#Function which adds two int values and returns the results
function add-numbers([int]$numbera, [int]$numberb)
{
    $sum = $numbera + $numberb
    
    return $sum
}
$result = add-numbers 2 10
Write-Host "Adding 5 and 10 equals:" $result