#Game Variables
$global:playerCharacter = $null
$global:playerDragonTip = $false
$global:runGame = $true


function Setup-Display([string]$title, [int]$width, [int]$height) 
{
    $psHost = get-host
    $window = $psHost.ui.rawui
    $newsize = $window.WindowSize
    $newsize.Height = $height
    $newsize.Width = $width
    $window.WindowSize = $newsize
    $window.WindowTitle = $title
}


function Read-NextKey()
{
    return $Host.UI.RawUI.ReadKey("NoEcho, IncludeKeyDown").character
}


function Title-Screen()
{
    #clearing pre existing key press
    $Host.UI.RawUI.FlushInputBuffer()
                                        
    $else =
@"
  ;                                                                                                                                                
  ED.                                                   :                                                                                          
  E#Wi                                                 t#,     L.                      .                                              ,;           
  E###G.       j.                               .Gt   ;##W.    EW:        ,ft         ;W         i                                  f#i j.         
  E#fD#W;      EW,                   ..        j#W:  :#L:WE    E##;       t#E        f#E        LE              .. f.     ;WE.    .E#t  EW,        
  E#t t##L     E##j                 ;W,      ;K#f   .KG  ,#D   E###t      t#E      .E#f        L#E             ;W, E#,   i#G     i#W,   E##j       
  E#t  .E#K,   E###D.              j##,    .G#D.    EE    ;#f  E#fE#f     t#E     iWW;        G#W.            j##, E#t  f#f     L#D.    E###D.     
  E#t    j##f  E#jG#W;            G###,   j#K;     f#.     t#i E#t D#G    t#E    L##Lffi     D#K.            G###, E#t G#i    :K#Wfff;  E#jG#W;    
  E#t    :E#K: E#t t##f         :E####, ,K#f   ,GD;:#G     GK  E#t  f#E.  t#E   tLLG##L     E#K.           :E####, E#jEW,     i##WLLLLt E#t t##f   
  E#t   t##L   E#t  :K#E:      ;W#DG##,  j#Wi   E#t ;#L   LW.  E#t   t#K: t#E     ,W#i    .E#E.           ;W#DG##, E##E.       .E#L     E#t  :K#E: 
  E#t .D#W;    E#KDDDD###i    j###DW##,   .G#D: E#t  t#f f#:   E#t    ;#W,t#E    j#E.    .K#E            j###DW##, E#G           f#E:   E#KDDDD###i
  E#tiW#G.     E#f,t#Wi,,,   G##i,,G##,     ,K#fK#t   f#D#;    E#t     :K#D#E  .D#j     .K#D            G##i,,G##, E#t            ,WW;  E#f,t#Wi,,,
  E#K##i       E#t  ;#W:   :K#K:   L##,       j###t    G#t     E#t      .E##E ,WK,     .W#G           :K#K:   L##, E#t             .D#; E#t  ;#W:  
  E##D.        DWi   ,KK: ;##D.    L##,        .G#t     t      ..         G#E EG.     :W##########Wt ;##D.    L##, EE.               tt DWi   ,KK: 
  E#t                     ,,,      .,,           ;;                        fE ,       :,,,,,,,,,,,,,.,,,      .,,  t                               
  L:                                                                        ,                                                                      
"@

    $and=
@"
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#+-:.  -+#%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*=: .=#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#*=::::.......::::-*% %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@#-:+%@@@@@@@@@@@@@@@@@@@@%#*#+.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#*-  .:-+#@@@@@=+@@@@@@@@%+#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*-.-+%@@@@@@@@@@@@@@%.  .:-=+%@#@%+#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%*:+#@@@@@@@@@@@@@@@@@@%.  *#%%##*:  ..%%**@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+%@%@@@@@@@@@@@@@@@@@@@@* :@@@@@@@@@@@%@%.  =*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@@@- .-@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# .@@@@@@@@@@@@@@@@@@@%= -#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-  -*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#+:          .--*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%#= .** -@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@* *@%.+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+:@@#.%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*.%@@+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%=@@%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


"@
    
    Write-Host $and
    Start-Sleep 1
    Clear-Host
    Write-Host $and 
    Write-Host $else
    Start-Sleep 1
    Clear-Host
    Write-Host $else
    Write-Host "             Press Any Key to Play or Q to quit               "
    $continue = Read-NextKey

    if ($continue -eq 'q')
    {
        $Global:rungame = $false
    }
}


function Character-Selection()
{
    #clearing console
    Clear-Host

    #Introduction
        Write-Host "###############################################################"
        Write-Host "#                                                             #"
        Write-Host "#                 Dragon Slayer 1.0 by 'Ok'                   #"
        Write-Host "#                Inspiration from Ian Waters                  #"
        Write-Host "#                                                             #"
        Write-Host "###############################################################"
        Write-Host "                                                               "
        Write-Host "###############################################################"
        Write-Host "                                                               "
        Write-Host "                     Character Selection                       "
        Write-Host "                                                               "
        Write-Host "                         A: Slorvak                            "
        Write-Host "                         B: Prince Valant                      "
        Write-Host "                         C: Zanthe                             "
        Write-Host "                         D: Amara                              "
        Write-Host "                                                               "
        Write-Host "                                                               "
        Write-Host "###############################################################"
        Write-Host "                                                               "

        $userResponse =read-host "Choose your character"
        Write-Host ""
        Switch ($userResponse)
        {
            A { $global:playerCharacter = "Slorvak" }
            B { $global:playerCharacter = "Prince Valant" }
            C { $global:playerCharacter = "Zanthe" }
            D { $global:playerCharacter = "Amara" }
            default { $global:playerCharacter = "Slorvak" }            
        }

        Write-Host "You selected $global:playerCharacter ,let's beGin!"
        Start-Sleep 1
    }


function Accept-TheQuest()
{
    #clearing console
    Clear-Host

    #dragon slayer
    Write-Host "################################################################"
    Write-Host "#                                                              #"
    Write-Host "# The King requests your help to slay the dragon FireWing.     #"
    Write-Host "# FireWing has been woken from a deep slumber and has started  #"
    Write-Host "# terrorising the local villages.                              #"
    Write-Host "#                                                              #"
    Write-Host "# The people are scared and have started to leave the kingdom. #"
    Write-Host "#                                                              #"
    Write-Host "# The King must protect his people.                            #"
    Write-Host "#                                                              #"
    Write-Host "################################################################"        

    do 
    {
        $userResponse = Read-Host "Are you willing to help?
        (yes/no) "
    }
    while ($userResponse -notlike 'yes' -and $userResponse -notlike 'no') 
    write-host ''

    switch ($userResponse)
    {
        'yes'
        {
            Write-Host "The King thanks you $global:playerCharacter"
            Write-Host ""
            Write-Host "Now start your quest!"
            Start-Sleep 1
            return $true
        }
        'no' 
        {
            Write-Host "Your King is dissapointed and sends you on your way"
            Start-Sleep 4
            return $false
        }
    }
}


function  Arrive-AtVillage()
{
    Clear-Host
    write-host ""
    Write-Host "After two day's ride you arrive at Florin, a small village on the"
    Write-Host "outskirts of the kingdom."
    Write-Host ""
    Write-Host "You choose Florin to make your stand due to its remote location"
    Write-Host "and nearby army detachment camping nearby."
    Write-Host ""
    Write-Host "On your arrival do you?"
    Write-Host ""
    Write-Host "A) Talk to the villagers"
    Write-Host "B) Talk to the commander in charge of the local detachment"
    Write-Host ""


    do
    {
        $userResponse = Read-Host "Answer (A or B)"
    }
    while ($userResponse -notlike 'A' -and $userResponse -notlike 'B')
    
    write-host ""
    switch ($userResponse)
    {
        "A" {Speak-ToVillagers}
        "B" {Speak-ToDetachment}
    }
}


function Speak-ToDetachment()
{
    Clear-Host
    if (!$global:playerDragonTip)
    {

    Write-Host ""
    Write-Host "You speak to Cedric who is commanding the local "
    Write-Host "detachmenSpeat of soldiers."
    Write-Host ""
    Write-Host "Cendric is making his way north to rejoin the rest of the"
    Write-Host "troops but is willing toassist in finding FireWing and "
    Write-Host "suggests waiting until the dragon returns and slay it in combat."
    Write-Host ""
    Write-Host "Press any key to continue."
    $continue = Read-NextKey
    Wait-ForDragon
    }
    else {
        Write-Host ""
        Write-Host "You speak to Cedric who is commanding the local detachment"
        Write-Host "of soldiers."
        Write-Host ""
        Write-Host "Cendric is making his way north to rejoin the rest of the"
        Write-Host "troops but is willing toassist in finding FireWing."
        Write-Host ""
        Write-Host "You tell Cendric that the local villiagers know where the"
        Write-Host "dragon may be resting at night .And Together, you formulate"
        Write-Host "a plan of attack."
        Write-Host ""
        Write-Host "Press any key to continue."

        $continue = Read-NextKey
        Attack-DragonWithDetachment
    }
}

function Wait-ForDragon()
{
    Clear-Host
    Write-Host "You setup camp with the detachment and prepare the weapons."
    Write-Host ""
    Write-Host "During the night FireWing attacks the camp and villagers."
    Write-Host "Everyone runs for their life but you are engolfed in flames"
    Write-Host "and dont make it out alive!"
    Write-Host ""
    Write-Host "You have failed to protect the villagers."
    Write-Host ""
    Write-Host "Game Over"
    Write-Host ""
    Write-Host "Press any key to continue"

    $continue = Read-NextKey
}


function Attack-DragonWithDetachment() 
{
    Clear-Host
    Write-Host "You ready your weapons and with the villiagers help you"
    Write-Host "formulate a plan. The plan is to setup a large chainmail"
    Write-Host "net over the cave entrance."
    Write-Host ""
    Write-Host "When FireWing enters the cave to rest you will drop the"
    Write-Host "net to block his escape."
    Write-Host ""
    Write-Host "The troops will then fire their bows into the cave and"
    Write-Host "slay the dragon!"
    Write-Host ""
    Write-Host "You work with Cedric and the troops to prepare the trap"
    Write-Host "and wait in hiding."
    Write-Host ""
    Write-Host "During the night FireWing enters the cave and the trap"
    Write-Host "is sprung. Huge arrows are fired into the cave and fire"
    Write-Host "bellows out from the cave entrance. More arrows fly and"
    Write-Host "then silence.."
    Write-Host ""
    Write-Host "You enter the cave and and find nothing but a pile of"
    Write-Host "ash on the floor."
    Write-Host ""
    Write-Host "Congratulations! you have defeated FireWing and"
    Write-Host "protected the Kingdom."
    Write-Host ""
    Write-Host "You are indeed a cunning and mighty warrior!"
    Write-Host ""
    Write-Host "Press any key to continue."

    $continue = Read-NextKey
}


function Attack-DragonOneOwn
{
    Clear-Host
    
    Write-Host "After dark Hadrain takes you to the cave and leaves you to"
    Write-Host "investigate."
    Write-Host ""
    Write-Host "You get close to the cave but cant see any sign of FireWing"
    Write-Host "so you move close still."
    Write-Host ""
    Write-Host "Suddenly you hear a noise from behind! you turn quickly"
    Write-Host "and are engolved by flames!"
    Write-Host ""
    Write-Host "FireWing as struck you down with his fire breath and you"
    Write-Host "are turned to ashes."
    Write-Host ""
    Write-Host "Press any key to continue"

    $Continue = Read-NextKey
}


function Speak-ToVillagers()
{
    Clear-Host
    Write-Host ""
    Write-Host "You speak to Hadrain an elder of the village who explains that "
    Write-Host "FireWing has been seen resting in a cave nearby after 
    nightfall."
    Write-Host "He suggests speaking to the local detachment and launching 
    a surprise"
    Write-Host "attack after dark with their help.  "
    Write-Host ""
    Write-Host "What do you do next?"
    Write-Host ""
    Write-Host "A) Speak to the detachments commander"
    Write-Host "B) Ask Hadarin to take you to the cave after dark"
    Write-Host ""

    #Player has picked up a tip from the local villagers!
    #This will change the outcome of future decisions
    $global:playerDragonTip = $true
    do 
    {
        $UserResponse = Read-Host -Prompt "Answer (A or B)"
    }
    while ($UserResponse -notlike "A" -and $UserResponse -notlike "B")
    
    Write-Host ""
    Switch ($UserResponse) 
    {
        "A" { Speak-ToDetachment }
        "B" { Attack-DragonOnOwn }
    }
}


#Setup-Display "Dragon Slayer" 64 38
Clear-Host
Title-Screen
while ($global:runGame)
{
    Character-Selection
    $accept = Accept-TheQuest

    if ($accept -eq $true)
    {
        Arrive-AtVillage
    }else
    {
        #player quit
        write-host " "
        write-host "Thnaks for playing"
        $global:runGame = $false
        Start-Sleep 3
    }
}



