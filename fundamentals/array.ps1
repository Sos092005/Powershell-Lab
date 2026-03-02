#creation
[array]$myarray = @(1,2,3,4,5,6,7,8,9,10)
$myarray

[system.collections.arraylist]$names=@("Ian", "Steve", "Rebecca", "Claire")
$names

[Array]$mixedArray = @("Ian", 4, 45.6, "Rebecca", 'A')
$mixedArray

Write-Host "Count:" $myArray.Count
Write-Host "IsFixedSize:" $myArray.IsFixedSize
Write-Host "Object from index 2:" $names[2]

$names.remove($names[2])
$names.add('azerty')
$names.insert(4,'qwerty')
Write-Host "Object from index 2:" $names[2]

