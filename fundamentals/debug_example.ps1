<#
    .SYNOPSIS
    says hello to ederunners

    .DESCRIPTION
    The hello script tell you good soming

    .PARAMETER Name
    
    .INPUTS
    None. You cannot pipe objects to Hello.ps1.

    .OUTPUTS
    Writes two string objects "Hello" and "How are you?" to the console.

    .EXAMPLE
    C:\PS> .\Hello.ps1

    .EXAMPLE
    C:\PS> .\Hello.ps1 -Name Ian
#>

#a single-line comment

$number = 1
 Write-Host "The number is: " $number
 $number = 2
 Write-Host "The number is: " $number
 $number = 3
 Write-Host “The number is: “ $number
 $number = 4
 Write-Host "The number is: " $number
