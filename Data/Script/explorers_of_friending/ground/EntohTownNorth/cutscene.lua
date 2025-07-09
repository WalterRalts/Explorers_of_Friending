require 'explorers_of_friending.common'

Entoh = {}

function Entoh.PanchChallenge()
    Todungeonscene = true
    local panch = CH("Panch")
    local rexio = CH("PLAYER")
    local asd = TASK:BranchCoroutine(function() 
        GAME:FadeIn(60)
        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Hey, Rexio!")
        end)	
    local qwe = TASK:BranchCoroutine(function() 
        GROUND:AnimateToPosition(rexio, "Walk", Dir8.Up, rexio.Position.X, rexio.Position.Y - 45, 1, 1, 0)
        end)
    TASK:JoinCoroutines({asd, qwe})

    local coro01 = TASK:BranchCoroutine(function() 
        GROUND:MoveToPosition(rexio, panch.Position.X - 40, panch.Position.Y, true, 4)
        COMMON.FaceEachother("Panch", "PLAYER")
        end)	
    local coro02 = TASK:BranchCoroutine(function() 
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Panch!")
        end)
    TASK:JoinCoroutines({coro01, coro02})

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("How'sit been?")

    UI:SetSpeaker(panch)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("How's it been?!")
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("I've been doing great. Hadn't had to do anything all day!")
    
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Awwww, what?")
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("Not fair...")

    UI:SetSpeaker(panch)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Heh, lemme guess, chooooooores?")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowTimedDialogue("How did you-", 10)

    UI:SetSpeaker(panch)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("You complain too much, dude.")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Let's do something fun,[pause=15] like, uh...")
    GROUND:CharAnimateTurn(panch, Direction.Right, 4, false)
    GAME:WaitFrames(20)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Right, [pause=25][emote=Normal]I got a plan.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Follow me, bud.")

    local movep = TASK:BranchCoroutine(function() 
        GROUND:MoveToMarker(panch, MRKR("m1"), false, 2)
        GROUND:MoveToMarker(panch, MRKR("m3"), false, 3)
        GROUND:CharAnimateTurn(panch, Direction.Left, 4, false)
        end)
    local mover = TASK:BranchCoroutine(function() 
        GAME:WaitFrames(30) 
        GROUND:MoveToMarker(rexio, MRKR("m1"), false, 2)
        GROUND:MoveToMarker(rexio, MRKR("m2"), false, 2)
        GROUND:CharAnimateTurn(rexio, Direction.Right, 4, false)

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Okay,[pause=60] sooooooo...?")
        end)
    TASK:JoinCoroutines({movep, mover})

    UI:SetSpeaker(panch)
    UI:SetSpeakerEmotion("Normal")
    GROUND:CharAnimateTurn(panch, Direction.Up, 4, false)
    UI:WaitShowDialogue("Cave.")
    GROUND:CharAnimateTurn(panch, Direction.Left, 4, true)
    UI:WaitShowDialogue("Go in.")

    GROUND:CharAnimateTurn(rexio, Direction.Up, 4, true)
    GAME:WaitFrames(35)
    GROUND:CharAnimateTurn(rexio, Direction.Right, 4, false)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...that's it?")
    
    UI:SetSpeaker(panch)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("You scaaaaaaared?")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Pssh, yeah, so scary, oh nooo. [br]I can do it.")
    GROUND:AnimateToPosition(rexio, "Walk", Dir8.Up, rexio.Position.X, rexio.Position.Y - 5, 2, 2, 0)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("[speed=10]Wait...")
    UI:SetSpeakerEmotion("Worried")
    GROUND:CharAnimateTurn(rexio, Direction.Right, 4, false)
    UI:WaitShowDialogue("I can't...[pause=30] I have to do chooooooores.")
    
    UI:SetSpeaker(panch)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Don't be booooring, Rexio, c'mon.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("I'm challenging you... to go in... do it.")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Should I...?")

    UI:SetSpeakerEmotion("Worried")
    local choices = {("Nah."),
        ("Yah")}
    UI:BeginChoiceMenu("Hmmmmmmmmmmmm...", choices, 1, 2)
    UI:WaitForChoice()
    result = UI:ChoiceResult()
    ::continue::
    if result == 1 then
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Nah.")

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("WHAT?!")
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("You... you never refused a Panch challenge before!")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Yeah, but I usualy don't go into a random, dark cave without letting my dad know.")
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("...he'd kill me.")

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Sad")
        UI:WaitShowDialogue("Come ooooooon!")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        local choices = {("Nuh-uh."),
        ("Fine...")}
        UI:BeginChoiceMenu("Um...", choices, 1, 2)
        UI:WaitForChoice()
        result = UI:ChoiceResult()
        if result == 1 then
            UI:SetSpeaker(panch)
            UI:SetSpeakerEmotion("Determined")
            UI:WaitShowDialogue("C'moooooon!")
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Worried")
            local choices = {("Nope."),
            ("Fine...")}
            UI:BeginChoiceMenu("Um...", choices, 1, 2)
            UI:WaitForChoice()
            result = UI:ChoiceResult()
            if result == 1 then
                UI:SetSpeaker(panch)
                UI:SetSpeakerEmotion("Determined")
                UI:WaitShowDialogue("Do it!")
                UI:SetSpeaker(rexio)
                UI:SetSpeakerEmotion("Determined")
                local choices = {("No!"),
                ("...fine!")}
                UI:BeginChoiceMenu("Dude!", choices, 1, 2)
                UI:WaitForChoice()
                result = UI:ChoiceResult()
                if result == 1 then
                    UI:SetSpeaker(panch)
                    UI:SetSpeakerEmotion("Angry")
                    UI:WaitShowDialogue("Tch... whatever, go do your chooooores...")
                    SV.entoh_town.HelperChapter = 1
                    SV.entoh_town.thicket.result = -1
                else
                    goto continue
                end
            else
                goto continue
            end
        else
            goto continue
        end
    else
        SV.entoh_town.HelperChapter = 1
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Sigh")
        UI:WaitShowDialogue("Fine,[pause=20] but if I get in trouble,[pause=10] you[emote=Worried] probably won't see me outside again.")

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("I'll take that risk, come on!")
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("In ya go!")

        local coro1 = TASK:BranchCoroutine(function()
            GAME:FadeOut(false, 20)
            SV.entoh_town.HelperChapter = 1

        end)	
        local coro2 = TASK:BranchCoroutine(function()
            GROUND:AnimateToPosition(rexio, "Walk", Dir8.Up, rexio.Position.X, rexio.Position.Y - 30, 0.5, 1, 0)
        end)
        COMMON.UnlockWithFanfare("entoh_thicket", false)
        GAME:EnterZone("entoh_thicket", 0, 0, 0)
        TASK:JoinCoroutines({coro1, coro2})
    end
end

function Entoh.Resulting()
    local panch = CH("Panch")
    local rexio = CH("PLAYER")
    if SV.entoh_town.thicket.result == 0 then
        GROUND:TeleportTo(rexio, MRKR("m2").Position.X, MRKR("m2").Position.Y, Dir8.Right, 0)
        GROUND:CharSetAnim(rexio, "Laying", true)
        GROUND:TeleportTo(panch, MRKR("m3").Position.X, MRKR("m3").Position.Y, Dir8.Left, 0)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Dizzy")
        UI:WaitShowDialogue("Auuuughhh!")

        GAME:FadeIn(60)

        COMMON.CharSweating("Panch")
        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("...dude... maybe you should listen to your dad more...")
        
        local cor1 = TASK:BranchCoroutine(function()
            GROUND:CharWaitAnim(rexio, "Wake")
            GROUND:CharSetAnim(rexio, "Idle", true)
        end)	
        local cor2 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("Sh-shut it![pause=60] I'm absolutely fine,[pause=20] [emote=Angry]I'm going back!")
        end)
        TASK:JoinCoroutines({cor1, cor2})

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("I think you'd be better off getting your dad's package...")
        
        local coro01 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("Bruh.")
        end)	
        local coro02 = TASK:BranchCoroutine(function()
            GROUND:CharSetAnim(rexio, "Pain", false)
            GAME:WaitFrames(30)
            GROUND:CharSetAnim(rexio, "Idle", false)
        end)
        TASK:JoinCoroutines({coro01, coro02})

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("You can take this reward, though.")

        GAME:GivePlayerItem("food_apple")
        SOUND:PlayFanfare("Fanfare/Item")
        UI:ResetSpeaker()
        UI:WaitShowDialogue("Panch gives Rexio an Apple.")

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Use it to get back on your feet, buuuuuud.")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Sad")
        UI:WaitShowDialogue("...")
    elseif SV.entoh_town.thicket.result == 1 then
        GROUND:TeleportTo(rexio, MRKR("m2").Position.X, MRKR("m2").Position.Y, Dir8.Right, 0)
        GROUND:CharSetAnim(rexio, "Idle", true)
        GROUND:TeleportTo(panch, MRKR("m3").Position.X, MRKR("m3").Position.Y, Dir8.Left, 0)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Heck...!")

        GAME:FadeIn(60)

        COMMON.CharSweating("Panch")
        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("...dude.")
        
        local cor1 = TASK:BranchCoroutine(function()
            GROUND:CharSetAnim(rexio, "Idle", true)
        end)	
        local cor2 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("Nope,[pause=20] [emote=Angry]I'm going back!")
        end)
        TASK:JoinCoroutines({cor1, cor2})

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Hah, I think you'd be better off getting your dad's package...")
        
        local coro01 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("Bruh.")
        end)	
        local coro02 = TASK:BranchCoroutine(function()
            GROUND:CharSetAnim(rexio, "Pain", false)
            GAME:WaitFrames(30)
            GROUND:CharSetAnim(rexio, "Idle", false)
        end)
        TASK:JoinCoroutines({coro01, coro02})

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("You can take this reward, though.")

        GAME:GivePlayerItem("berry_oran")
        SOUND:PlayFanfare("Fanfare/Item")
        UI:ResetSpeaker()
        UI:WaitShowDialogue("Panch gives Rexio an Oran Berry.")

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Use it to get back on your feet, buddyyyyyyyyy.")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Sad")
        UI:WaitShowDialogue("Whatever...")
    elseif SV.entoh_town.thicket.result == 2 then
        GROUND:TeleportTo(rexio, MRKR("m2").Position.X, MRKR("m2").Position.Y, Dir8.Right, 0)
        GROUND:CharSetAnim(rexio, "Idle", true)
        GROUND:TeleportTo(panch, MRKR("m3").Position.X, MRKR("m3").Position.Y, Dir8.Left, 0)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Mmm...")

        GAME:FadeIn(60)

        COMMON.CharSweating("Panch")
        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("I thought you said this would be easy.")
        
        local cor1 = TASK:BranchCoroutine(function()
            GROUND:CharSetAnim(rexio, "Idle", true)
        end)	
        local cor2 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("Nope,[pause=20] [emote=Angry]I'm going back!")
        end)
        TASK:JoinCoroutines({cor1, cor2})

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Hah, I think you'd be better off getting your dad's package...")
        
        local coro01 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("Bruh.")
        end)	
        local coro02 = TASK:BranchCoroutine(function()
            GROUND:CharSetAnim(rexio, "Pain", false)
            GAME:WaitFrames(30)
            GROUND:CharSetAnim(rexio, "Idle", false)
        end)
        TASK:JoinCoroutines({coro01, coro02})

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("You can take this reward, though.")

        GAME:GivePlayerItem("berry_sitrus")
        SOUND:PlayFanfare("Fanfare/Item")
        UI:ResetSpeaker()
        UI:WaitShowDialogue("Panch gives Rexio a Sitrus Berry.")

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("I'm impressed.")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Mhm.")
    elseif SV.entoh_town.thicket.result == 3 then
        GROUND:TeleportTo(rexio, MRKR("m2").Position.X, MRKR("m2").Position.Y, Dir8.Right, 0)
        GROUND:CharSetAnim(rexio, "Idle", true)
        GROUND:TeleportTo(panch, MRKR("m3").Position.X, MRKR("m3").Position.Y, Dir8.Left, 0)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Not bad.")

        GAME:FadeIn(60)

        COMMON.CharSweating("Panch")
        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Not as far as I was hoping, but ya did make it.")
        
        local cor1 = TASK:BranchCoroutine(function()
            GROUND:CharSetAnim(rexio, "Idle", true)
        end)	
        local cor2 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("I'm kinda wanna go back.")
        end)
        TASK:JoinCoroutines({cor1, cor2})

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Hah, I think you'd be better off getting your dad's package...")
        
        local coro01 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("Bruh.")
        end)	
        local coro02 = TASK:BranchCoroutine(function()
            GROUND:CharSetAnim(rexio, "Pain", false)
            GAME:WaitFrames(30)
            GROUND:CharSetAnim(rexio, "Idle", false)
        end)
        TASK:JoinCoroutines({coro01, coro02})

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("You can take this reward, though.")

        GAME:GivePlayerItem("berry_oran")
        SOUND:PlayFanfare("Fanfare/Item")
        UI:ResetSpeaker()
        UI:WaitShowDialogue("Panch gives Rexio an Oran Berry.")

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Use it to get back on your feet, buddyyyyyyyyy.")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Sad")
        UI:WaitShowDialogue("Whatever...")
    elseif SV.entoh_town.thicket.result == 8 then
        GROUND:TeleportTo(rexio, MRKR("m2").Position.X, MRKR("m2").Position.Y, Dir8.Right, 0)
        GROUND:CharSetAnim(rexio, "Idle", true)
        GROUND:TeleportTo(panch, MRKR("m3").Position.X, MRKR("m3").Position.Y, Dir8.Left, 0)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Joyous")
        UI:WaitShowDialogue("Yeah!")

        GAME:FadeIn(60)

        COMMON.CharSweating("Panch")
        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Inspired")
        UI:WaitShowDialogue("Woah...")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Way too easy of a challenge.")
        
        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Dude, you're on fire!")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Of course I am, I'm just that good.")

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Dude, you know what?")

        GAME:GivePlayerItem("berry_sitrus")
        GAME:GivePlayerItem("berry_sitrus")
        SOUND:PlayFanfare("Fanfare/Item")
        UI:ResetSpeaker()
        UI:WaitShowDialogue("Panch gives Rexio two Sitrus Berries.")

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Keep it up!")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Joyous")
        UI:WaitShowDialogue("YIPPEE!")
    else
        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("So, uh, I wasn't paying attention, and this totally isn't a failsafe \nfor situations I didn't account for, but...")
        
        local coro01 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("Bruh.")
        end)	
        local coro02 = TASK:BranchCoroutine(function()
            GROUND:CharSetAnim(rexio, "Pain", false)
            GAME:WaitFrames(30)
            GROUND:CharSetAnim(rexio, "Idle", false)
        end)
        TASK:JoinCoroutines({coro01, coro02})

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("You can take this reward, though.")

        GAME:GivePlayerItem("food_apple")
        SOUND:PlayFanfare("Fanfare/Item")
        UI:ResetSpeaker()
        UI:WaitShowDialogue("Panch gives Rexio an Apple.")

        UI:SetSpeaker(panch)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("You did... a thing!")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("oh ok")
    end
    SV.entoh_town.thicket.result = 9
end