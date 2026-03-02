class Person
{
    [string]$name

    Person(){
    }

    Person([string]$name)
    {
        $this.name = $name
    }

}

$friend = New-Object Person
$friend.name = "Ian"
$friend.name


#Player class
class Player
{
    #defining variables
    [string]$name
    [int]$positionX
    [int]$positionY
    [int]$health
    [int]$speed

    #class constructor
    Player(){
    }

    #methods
    DisplayPlayerStats()
    {
        Write-Host "Name:" $this.name
        Write-Host "Position X:" $this.positionX
        Write-Host "Position Y:" $this.positionY
        Write-Host "Health:" $this.health
        Write-Host "Speed:" $this.speed

    }

    SetPosition([int]$x, [int]$y)
    {
        $this.positionX = $x
        $this.positionY = $y
    }

    [bool]IsDead()
    {
        if ($this.health -le 0) 
        {
            return $true
        }
        else {
            return $false
        }
    }
}


$gamePlayer = new-object Player

$gamePlayer.name = "Vincent"
$gamePlayer.positionX = 10
$gamePlayer.positionY = 10
$gamePlayer.health = 100
$gamePlayer.speed = 0.9

#Move player to position 20 20
$gamePlayer.SetPosition(20, 20)

$gamePlayer.DisplayPlayerStats()

#Check if the player is dead or alive
$isDead = $gamePlayer.IsDead()
Write-Host $isDead