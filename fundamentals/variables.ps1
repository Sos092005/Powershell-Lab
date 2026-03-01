[string]$name ="Peter"
[char]$letter = 'A'
[bool]$isbool = $false

[int]$age = 38
[decimal]$height = 12345.0112324134231344231349999999999999999999999999999999
[double]$var = 12345.01123241342313442313011232413423134423101123241342313442313

[datetime]$birth = "march 12,1989"
[array]$table = "itemone", "itemtwo"," e", "z", "'"
[hashtable]$global:hashed = @{Name= "Ian"; Age = 37; Height = 5.9}
$birth = i

write-host $birth
write-host $table
write-host $global:hashed