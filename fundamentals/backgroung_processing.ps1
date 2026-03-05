 $scriptBlock =
 {
    param($countTo)
    for ($i = 0; $i -le $countTo; $i++) 
    {
        Write-Host "Counter:$i"
        Start-Sleep -Seconds 1
    }
 }
 Start-Job $scriptBlock -ArgumentList 100