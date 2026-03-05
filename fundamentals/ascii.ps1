for ($i=0; $i -le 255 ; $i++)
    {[char]$i}


 # Outputs and ASCII table as HTML for easy viewing

$filename = "ASCII_Table.html"
$tableWidth = 17
$showASCIITo = 260

"Remove Existing File if it exists"
if (Test-Path $filename)
{
    Remove-Item $filename
}

Add-Content $filename  "<!DOCTYPE html><html><body>
<style>
table {border-collapse: collapse;}
th, td {border: 1px solid black;padding: 3px;text-align: center;} 
</style>
<table>
    <tr>"

#Add Colomn Headers
for ($i = 0; $i -le $tableWidth; $i++)
{
    if ($i % 2) 
    {
        Add-Content $filename "<th>Char</th>"
    }else 
    {
        Add-Content $filename "<th>Dec</th>"
    }
}

Add-Content $fileName "</tr>"

#Add Row Data
$counter = 0
for ($i=0; $i -le (($showASCIITo / $tableWidth) * 2); $i++)
{
    Add-Content $fileName "<tr>"

    for ($j = 0; $j -le $tablewidth; $j++)
    {
        if ($j % 2)
        {
            Add-Content $fileName "<td>$([char]$counter)</td>"
        }else
        {
            Add-Content $fileName "<td>$($counter)</td>"
            $counter++ 
        }
    }
    Add-Content $filename "</tr>"
}

