Guild = {}
Tent = {} --guild lvl1

function Guild.Day0()
    GROUND:Hide("PLAYER")
    GAME:MoveCamera(1000, 640, 30, false)
    GAME:FadeIn(30)
    local maru = CH("Maru")
    local azura = CH("Azura")
    local rexio = CH("Rexio")
    local zoomer = CH("Zoomer")
    local smear = CH("Smear")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("What going on?")

    COMMON.FaceEachother("Rexio", "Azura")
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("I don't know,[pause=15] he's just been standing there for the last three minutes.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...maybe he's broken...?")

    COMMON.CharSweatdrop("Zoomer")
    GAME:WaitFrames(20)
    GROUND:CharTurnToCharAnimated(zoomer, rexio, 3)
    UI:SetSpeaker(zoomer)
    UI:SetSpeakerEmotion("Inspired")
    UI:WaitShowDialogue("He's fiiiine![pause=20] He's just[pause=20] warming up!")

    UI:SetSpeaker(zoomer)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Boss![pause=10] Boss,[pause=10] they're right there! Do something!")

    UI:SetSpeaker(STRINGS:Format("\\uE040"))
    UI:WaitShowDialogue("[speed=0.6]...ah. They have arrived.")

    UI:SetSpeaker(zoomer)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...yes, for a while now.")

    GROUND:CharTurnToCharAnimated(smear, maru, 20)

    GAME:WaitFrames(60)

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("It is very nice to meet you!")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Ah, the stranger statue moved.")
    GROUND:CharTurnToCharAnimated(azura, smear, 1)
    GROUND:CharTurnToCharAnimated(rexio, smear, 1)

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Yes yes,[pause=10] apologies,[pause=10] I was doing some script preparation within my head.")
    UI:WaitShowTimedDialogue("You may call me Sme")
    
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Where's the guild?")

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("I was going to mention that after, Rexio.")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("(I left home for this...?)")
    local turner = true

    local coro01 = TASK:BranchCoroutine(function()
        local c1 = TASK:BranchCoroutine(function()
            while turner do
                local dir_random = math.random(8)
                if dir_random == 1 then
                    GROUND:CharAnimateTurnTo(rexio, Dir8.Down, 4)
                elseif dir_random == 2 then
                    GROUND:CharAnimateTurnTo(rexio, Dir8.DownLeft, 4)
                elseif dir_random == 3 then
                    GROUND:CharAnimateTurnTo(rexio, Dir8.Left, 4)
                elseif dir_random == 4 then
                    GROUND:CharAnimateTurnTo(rexio, Dir8.UpLeft, 4)
                elseif dir_random == 5 then
                    GROUND:CharAnimateTurnTo(rexio, Dir8.Up, 4)
                elseif dir_random == 6 then
                    GROUND:CharAnimateTurnTo(rexio, Dir8.UpRight, 4)
                elseif dir_random == 7 then
                    GROUND:CharAnimateTurnTo(rexio, Dir8.Right, 4)
                else
                    GROUND:CharAnimateTurnTo(rexio, Dir8.DownRight, 4)
                end
                GAME:WaitFrames(100)
            end
        end)
    
        local c2 = TASK:BranchCoroutine(function()
            while turner do
                local distract = math.random(5)
                GAME:WaitFrames(30)
                if distract == 5 then
                    GROUND:CharTurnToChar(smear, rexio)
                    GAME:WaitFrames(20)
                    GROUND:CharTurnToChar(smear, maru)
                else
                    GAME:WaitFrames(20)
                end
            end
        end)
        TASK:JoinCoroutines({c1, c2})
    end)
    local coro02 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(smear)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowTimedDialogue("Now, where was I when I was seemingly interrupted...", 100)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowTimedDialogue("Ah yes,[pause=10] my introduction.[pause=20] I am Smear,[pause=15] that is what many friends have called me.", 100)
        UI:SetSpeakerEmotion("Happy")
        smear.Data.Nickname = "Smear"
        UI:WaitShowTimedDialogue("With my elementary deduction skills,[pause=10] and previously working with your parents...", 100) 
        UI:WaitShowTimedDialogue("I have sent Zoomer to your locations to test your skills.", 100)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowTimedDialogue("Of course,[pause=10] I am fully aware that you have been pulled away from your homes a little earlier than wanted...", 100)

        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowTimedDialogue("It's a little weird.[pause=20] Mom and dad barely gave us a goodbye.", 100)
        turner = false

        UI:SetSpeaker(smear)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowTimedDialogue("Worry not, Maru Bluetail, for you can return safely to your family in the next coming days.", 100)
    end)
    TASK:JoinCoroutines({coro01, coro02})

    COMMON.FaceEachother("Rexio", "Smear")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...okay, so what's the issue? Is the guild somewhere else or what?")
    
    UI:SetSpeaker(smear)
    UI:WaitShowDialogue("Affirmatively,[pause=10] that is the first issue.")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("As of right now,[pause=15] there is currently no guild in this location.")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Wha-![pause=20] Waste[emote=Angry] of my time!")

    GROUND:CharAnimateTurnTo(smear, maru, 4)
    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("It may seem that way.[pause=15] However,[pause=15] it is because of this that I hastily requested you here.")
    UI:SetSpeakerEmotion("Inspired")
    UI:WaitShowDialogue("All I would happen to need is a guild license for this very piece of land,[pause=20] where that would require a rescue team to align with the guild in question.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...wha...?")
    
    GROUND:CharTurnToCharAnimated(maru, azura, 4)
    GROUND:CharTurnToCharAnimated(rexio, azura, 4)
    local function mario()
        COMMON.CharSweatdrop("Maru")
        GROUND:CharTurnToCharAnimated(maru, rexio, 4)
    end
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("It means we have to team up with...[script=0] uh...", {mario})

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Rexio.")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Maru.")

    COMMON.CharHop("Azura")
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Azura.")

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("The rest of the details is what I shall give to you tomorrow.")
    GROUND:CharTurnToCharAnimated(maru, smear, 4)
    GROUND:CharTurnToCharAnimated(rexio, smear, 4)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Now that you are all hastily familiar with eachother, let me show you around the psuedoguild.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Yippee!")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...there's more than this?")
    
    GROUND:CharAnimateTurnTo(azura, Dir8.UpRight, 4)
    GROUND:CharAnimateTurnTo(maru, Dir8.Right, 4)
    GROUND:CharAnimateTurnTo(rexio, Dir8.Right, 4)
    GROUND:CharAnimateTurnTo(smear, Dir8.Right, 4)
    GROUND:CharAnimateTurnTo(zoomer, Dir8.Right, 4)

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Within the tent to your right are your fairly small sleeping chambers.")
    UI:WaitShowDialogue("Each of you will have your own bed,[pause=10] and a pillow provided to us from the makers over in Oirili Town.")

    GAME:WaitFrames(110)
    COMMON.CharSweatdrop("Rexio")
    GAME:WaitFrames(5)
    COMMON.CharSweatdrop("Maru")
    GAME:WaitFrames(15)
    COMMON.CharSweatdrop("Azura")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("And...?")

    COMMON.CharSweating("Smear")
    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Well... of course uh...")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...there was not more than this.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...i-it's a cool tent, at least.")

    COMMON.FaceEachother("Rexio", "Smear")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Booooooooooooooooooooooooo! When's the missiiiiiiiiion?!")

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I cannot give you a mission[pause=0], we are not a guild.")
    COMMON.CharAngry("Rexio")
    GAME:WaitFrames(35)
    UI:WaitShowDialogue("While I appreciate your enthuiasm, I cannot in good conscious let three children outside during sunset.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("To bed you shall go. And when you awaken, we will talk about your dungeoning skills.")

    local coro011 = TASK:BranchCoroutine(function()
        local c11 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(20)
            COMMON.FaceEachother("Zoomer", "Smear")
        end)
        local c12 = TASK:BranchCoroutine(function()
            GROUND:MoveToMarker(azura, MRKR("m1"), false, 1)
            GROUND:Hide("Azura")
            GAME:WaitFrames(10)
            GROUND:MoveToMarker(maru, MRKR("m1"), false, 1)
            GROUND:Hide("Maru")
            GAME:WaitFrames(15)
            
        end)
        TASK:JoinCoroutines({c11, c12})
    end)
    local coro012 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("...")
        GROUND:MoveToMarker(rexio, MRKR("m1"), false, 1)
        GROUND:Hide("Rexio")
        GAME:FadeOut(false, 60)
    end)
    TASK:JoinCoroutines({coro011, coro012})
    GAME:EnterGroundMap("GuildLvl1", "GuildEnter1")
end

function Tent.Day0()
    local moverex = GAME:GetPlayerPartyTable()
    GAME:SetCanSwitch(false)
    function PrintTable(t, indent)
      indent = indent or 0
      for key, value in pairs(t) do
        local formatting = string.rep("  ", indent) .. tostring(key) .. ": "
        if type(value) == "table" then
          print(formatting)
          PrintTable(value, indent + 1)
        else
          print(formatting .. tostring(value))
        end
      end
    end
    PrintTable(SV.guilders.tarro_town.bluetail_stats)
    PrintTable(moverex)
    
    SOUND:PlayFanfare("Fanfare/Note")
    UI:ResetSpeaker()
    UI:WaitShowDialogue("Maru has been moved to the front of the team.")
    if GAME:GetPlayerPartyCount() <= 1 then
      for i, p in ipairs(SV.guilders.tarro_town.bluetail_stats) do
        GAME:AddPlayerTeam(_DATA.Save.ActiveTeam.Players:Add(p))
        --GROUND:GiveCharIdleChatter(chara)  
      end
      GAME:RemovePlayerTeam(0)
      for i, p in ipairs(moverex) do
        GAME:AddPlayerTeam(_DATA.Save.ActiveTeam.Players:Add(p))
      end
    end
    COMMON.RespawnAllies()
    GAME:FadeIn(40)
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    UI:SetBounds(10, 16, 300, 50)

    COMMON.SetCharAndEmotion(maru, "Normal")
    UI:WaitShowDialogue("I guess this isn't so bad.")

    COMMON.SetCharAndEmotion(azura, "Worried")
    UI:WaitShowDialogue("...if you say so.")

    COMMON.SetCharAndEmotion(rexio, "Normal")
    UI:WaitShowDialogue("Beats sleeping on the floor...")

    local c1 = TASK:BranchCoroutine(function()
        GROUND:MoveToMarker(rexio, MRKR("RexBed"), false, 2)
        GROUND:CharAnimateTurnTo(rexio, Dir8.Left, 4)
        GAME:WaitFrames(35)
        GROUND:CharAnimateTurnTo(rexio, Dir8.Right, 4)
        GAME:WaitFrames(35)
        GROUND:CharAnimateTurnTo(rexio, Dir8.Down, 4)
        COMMON.SetCharAndEmotion(rexio, "Worried")
        UI:WaitShowDialogue("Where are the pillows?")

        COMMON.SetCharAndEmotion(maru, "Stunned")
        UI:WaitShowDialogue("...not here, apparently.")
    end)
    local c2 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(20)
        GROUND:MoveToMarker(azura, MRKR("AzuBed"), false, 2)
        GROUND:CharAnimateTurnTo(azura, Dir8.Left, 4)
    end)
    TASK:JoinCoroutines({c1, c2})

    COMMON.SetCharAndEmotion(rexio, "Angry")
    UI:WaitShowDialogue("Dude! Are we getting dueced?! Scammed?!")
    UI:WaitShowDialogue("First there's no guild,[pause=20] and then there's no pillows?!")
    
    COMMON.SetCharAndEmotion(azura, "Worried")
    UI:WaitShowDialogue("...maybe he just forgot...")

    GROUND:CharSetAnim(CH("Teammate2"), "Trip", true)
    GROUND:CharSetAction(rexio, RogueEssence.Ground.PoseGroundAction(rexio.Position, rexio.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Trip")))
    COMMON.SetCharAndEmotion(rexio, "Worried")
    UI:WaitShowDialogue("Uuuuuuugghhhhh!")
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("Lemme know when we can go home...")

    COMMON.CharSweatdrop("Teammate1")
    COMMON.SetCharAndEmotion(maru, "Normal")
    UI:WaitShowDialogue("Alrighty.")
end

function Tent.Day1()
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    azura.CollisionDisabled = true
    GAME:CutsceneMode(true)
    local cor11 = TASK:BranchCoroutine(function()
        GROUND:TeleportTo(maru, 258, 183, Dir8.DownRight, 0)
        SOUND:PlayBGM("Awakening.ogg", false)
        GROUND:CharSetAnim(maru, "Sleep", true)
        GROUND:CharSetAnim(azura, "Sleep", true)
        GROUND:CharSetAnim(rexio, "Sleep", true)
    end)	
    local cor22 = TASK:BranchCoroutine(function()
        UI:WaitShowVoiceOver("[speed=0.6]The next day...", 150)
        GAME:FadeIn(125)
    end)
    TASK:JoinCoroutines({cor11, cor22})

    SOUND:PlayBGM("Aftermath 2.ogg", false)
    UI:SetBounds(10, 16, 300, 50)

    local cor1 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(120)
        GROUND:CharWaitAnim(rexio, "Wake")
        GROUND:CharSetAnim(rexio, "Idle", false)
    end)	
    local cor2 = TASK:BranchCoroutine(function()
        GROUND:CharWaitAnim(maru, "Wake")
        GROUND:CharSetAnim(maru, "Idle", false)

        COMMON.SetCharAndEmotion(maru, "Normal")
        UI:WaitShowDialogue("...almost forgot we were still here.")

        COMMON.FaceEachother("PLAYER", "Teammate1")
        COMMON.SetCharAndEmotion(azura, "Happy")
        UI:WaitShowDialogue("Time for adventure!")
    end)
    local cor3 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(10)
        GROUND:CharWaitAnim(azura, "Wake")
        GROUND:CharSetAnim(azura, "Idle", false)
    end)
    TASK:JoinCoroutines({cor1, cor2, cor3})

    COMMON.SetCharAndEmotion(rexio, "Worried")
    UI:WaitShowDialogue("...hmm,[pause=40] I have a weird feeling about this...")

    GROUND:MoveToPosition(maru, 215, 230, false, 1)
    GAME:CutsceneMode(false)
    maru.CollisionDisabled = false
    Intro1 = true
    GAME:SetCanSwitch(true)
end

function Guild.Day1()
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    local zoomer = CH("Zoomer")
    local smear = CH("Smear")

    rexio.CollisionDisabled = true
    azura.CollisionDisabled = true

    COMMON.TeleportToMarker(maru, "m1", Dir8.DownLeft)
    COMMON.TeleportToMarker(azura, "m1", Dir8.DownLeft)
    COMMON.TeleportToMarker(rexio, "m1", Dir8.DownLeft)

    GROUND:Hide("PLAYER")
    GROUND:Hide("Teammate1")
    GROUND:Hide("Teammate2")
    GAME:MoveCamera(1000, 640, 1, false)
    GAME:FadeIn(70)

    local coro011 = TASK:BranchCoroutine(function()
        GROUND:Unhide("PLAYER")
        GAME:WaitFrames(20)
        GROUND:MoveToMarker(maru, MRKR("Start"), false, 1)
        COMMON.FaceEachother("PLAYER", "Smear")
        GROUND:CharTurnToCharAnimated(azura, smear, 2)

        GAME:WaitFrames(20)
        UI:SetSpeaker(smear)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Ah, yes, the Bluetails are awakened from their slumber, I see.")

        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Yep.")
    end)
    local coro012 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(95)
        GROUND:Unhide("Teammate1")
        GAME:WaitFrames(20)
        GROUND:MoveToPosition(azura, 1029, 654, false, 1)
    end)
    TASK:JoinCoroutines({coro011, coro012})

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("There is an announcement for the three of you to hear before I allow you to go on your mission.")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Mkay.")

    local coro0011 = TASK:BranchCoroutine(function()
        GROUND:CharTurnToCharAnimated(azura, smear, 2)
        GROUND:Unhide("Teammate2")
        GAME:WaitFrames(20)
        GROUND:MoveToPosition(rexio, 971, 654, false, 1)
    end)
    local coro0012 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(smear)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Ah, and the third of you all appears a little later, but is still on time.")
        UI:WaitShowDialogue("That is an amazing first start from the three of you.")

        GROUND:CharTurnToCharAnimated(rexio, smear, 2)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("You forgot the pillows.")

        UI:SetSpeaker(smear)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Ah, yes, that, um, uh...[pause=0] that is something I will talk about later.")
    end)
    TASK:JoinCoroutines({coro0011, coro0012})

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue("...")

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Essentially, against the clear disappointment I was given yesterday, I'll have to give you three a mission.")

    local rexihap = true
    local coro1 = TASK:BranchCoroutine(function()
        local function turnto()
            GROUND:CharTurnToCharAnimated(maru, rexio, 2)
            GROUND:CharTurnToCharAnimated(azura, rexio, 2)
            GROUND:CharTurnToCharAnimated(smear, rexio, 2)
            GROUND:CharTurnToCharAnimated(zoomer, rexio, 2)
        end
        
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Inspired")
        UI:WaitShowDialogue("Gasp! [script=0][pause=20]Y[emote=Joyous]eeeeeeeeeeeeeeeeeeeeeeeeeees!!!", {turnto})
        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Normal")
        GROUND:CharTurnToCharAnimated(maru, smear, 2)
        UI:WaitShowDialogue("What's the mission, boss?")
        GROUND:CharTurnToCharAnimated(azura, smear, 2)
        GROUND:CharTurnToCharAnimated(smear, maru, 2)

        UI:SetSpeaker(smear)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("We are running low on apples.")
        UI:WaitShowDialogue("We would usually get them from Applin Town, but they seem to be late on their delivery.")
        rexihap = false
    end)
    local coro2 = TASK:BranchCoroutine(function()
        while rexihap == true do
            local celebrate = math.random(3)
            if celebrate == 3 then
                COMMON.CharHop("Teammate2")
            elseif celebrate == 2 then
                GROUND:CharWaitAnim(rexio, "Walk")
            else
                GROUND:CharWaitAnim(rexio, "Pose")
            end
        end
    end)
    TASK:JoinCoroutines({coro1, coro2})

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Teary-Eyed")
    UI:WaitShowDialogue("[speed=0.6]I...[pause=50] I knew it.[pause=40] It's a quest... to fetch stuff...")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Ooo, we have experience with finding apples in dungeons specifically for some reason.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("Pie, yeah!!")
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("...oh, we're missing the pie...")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("To be fair, we're missing a lot of things...")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue("...okay...[pause=30] okay.")
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Where is it?")

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("It is to the left of the hill behind me.[pause=20] Simple?[pause=40]")
    UI:WaitShowDialogue("Yes,[pause=30] there are a few stale apples littered along the correct path, so you cannot get lost.")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Yes, boss!")
    GAME:MoveCamera(0, 0, 0, true)
end

function Tent.FreeDay()
    
end