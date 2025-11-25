Guild = {}
Tent = {} --guild lvl1

function Guild.Day0()
    SV.guilders.fielded_two = true
    GROUND:Hide("PLAYER")
    GAME:MoveCamera(1000, 640, 30, false)
    GAME:FadeIn(30)
    local maru = CH("Maru")
    local azura = CH("Azura")
    local rexio = CH("Rexio")
    local zoomer = CH("Zoomer")
    local kitty = CH("Kitkit")
    local smear = CH("Smear")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("What's going on?")

    COMMON.FaceEachother(rexio, azura)
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

    GROUND:CharTurnToCharAnimated(zoomer, smear, 3)
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
                GAME:WaitFrames(70)
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
        UI:WaitShowTimedDialogue("Now, where was I when I was seemingly interrupted...", 130)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowTimedDialogue("Ah yes,[pause=10] my introduction.[pause=20] I am Smear,[pause=15] that is what many friends have called me.", 130)
        UI:SetSpeakerEmotion("Happy")
        smear.Data.Nickname = "Smear"
        UI:ResetSpeaker()
        UI:SetSpeaker(smear)
        UI:WaitShowTimedDialogue("With my elementary deduction skills,[pause=10] and previously working with your parents...", 130) 
        UI:WaitShowTimedDialogue("I have sent Zoomer to your locations to test your skills.", 130)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowTimedDialogue("Of course,[pause=10] I am fully aware that you have been pulled away from your homes a little earlier than wanted...", 130)

        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowTimedDialogue("It's a little weird.[pause=20] Mom and dad barely gave us a goodbye.", 130)
        turner = false

        UI:SetSpeaker(smear)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowTimedDialogue("Worry not, Maru Bluetail, for you can return safely to your family in the next coming days.", 130)
    end)
    TASK:JoinCoroutines({coro01, coro02})

    COMMON.FaceEachother(rexio, smear)
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
        GROUND:CharTurnToCharAnimated(azura, rexio, 4)
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

    COMMON.FaceEachother(rexio, smear)
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
            COMMON.FaceEachother(zoomer, smear)
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

function Guild.Day1()
    SV.guilders.fielded_two = true
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
        COMMON.FaceEachother(maru, smear)
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
        GAME:WaitFrames(30)
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

    GROUND:CharSetAnim(rexio, "None", true)
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

    GROUND:CharSetAnim(rexio, "Idle", false)
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
    GAME:UnlockDungeon("apple_forest")
    GAME:MoveCamera(0, 0, 0, true)
end

function Guild.Day2()
    SV.guilders.fielded_two = true
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    local kitty = CH("Kitkit")
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
        GROUND:CharTurnToCharAnimated(maru, smear, 2)
    end)
    local coro012 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(55)
        GROUND:Unhide("Teammate1")
        GAME:WaitFrames(20)
        GROUND:MoveToPosition(azura, 1029, 654, false, 1)
        GROUND:CharTurnToCharAnimated(azura, smear, 2)
    end)
    local coro013 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(90)
        GROUND:Unhide("Teammate2")
        GAME:WaitFrames(20)
        GROUND:MoveToPosition(rexio, 971, 654, false, 1)
        GROUND:CharTurnToCharAnimated(rexio, smear, 2)
    end)
    TASK:JoinCoroutines({coro011, coro012, coro013})

    GAME:WaitFrames(40)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("...")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Mr. Smear?")
    COMMON.CharRealize("Smear")
    GROUND:CharTurnToCharAnimated(smear, maru, 6)

    GAME:WaitFrames(60)
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...are you okay?")

    GAME:WaitFrames(60)
    COMMON.CharSweating("Smear")
    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Well, it is, uh...")
    GAME:WaitFrames(10)
    COMMON.CharSweating("Smear")
    GAME:WaitFrames(30)
    UI:WaitShowDialogue("...I do not have a mission, [pause=50]a[emote=Stunned]gain,[pause=40] but I have more of a request.")

    GROUND:CharTurnToCharAnimated(smear, rexio, 6)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Greeeeaaaat!")

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("Rexio, please.[pause=0] [emote=Worried]I am hoping that you three will do better than before, very important people are coming in today or tomorrow.")
    UI:WaitShowDialogue("Those people are going to build up my dreams and I do not want to have this go bad.")
    GROUND:CharTurnToCharAnimated(smear, maru, 6)
    
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Huh?")

    UI:SetSpeaker(zoomer)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("He's all nervous that he went to set a guild approval appointment later than he should've[pause=0], and now he's gotta figure out how to explain why kids are in his forefront.")

    local function jumpup()
        COMMON.CharAngry("Smear")
        COMMON.CharHop("Smear")
    end
    COMMON.FaceEachother(smear, zoomer)
    jumpup()
    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Zoomer![pause=0][script=0] Zoomer,[pause=15][script=1] they're capable, Zoomer!", {jumpup, jumpup})

    COMMON.CharAngry("Zoomer")
    UI:SetSpeaker(zoomer)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Their[pause=25] PARENTS[pause=30] are barely capable! These are random kids you pulled out of their homes and they SUCK!")
    kitty.CollisionDisabled = true
    local angy = true
    
    local c1 = TASK:BranchCoroutine(function()
        while angy do
            local a1 = TASK:BranchCoroutine(function()
                GAME:WaitFrames(85)
                GROUND:CharSetEmote(smear, "angry", 3)
                COMMON.CharHop("Smear")
            end)
            local a2 = TASK:BranchCoroutine(function()
                COMMON.CharHop("Zoomer")
                GAME:WaitFrames(110)
                GROUND:CharSetEmote(zoomer, "angry", 3)
            end)
            local a3 = TASK:BranchCoroutine(function()
                COMMON.CharHop("Teammate2")
                GROUND:CharSetEmote(rexio, "angry", 3)
                GAME:WaitFrames(75)
                GROUND:CharTurnToCharAnimated(rexio, smear, 2)
                COMMON.CharHop("Teammate2")
                GROUND:CharSetEmote(rexio, "angry", 3)
                GAME:WaitFrames(75)
                GROUND:CharTurnToCharAnimated(rexio, zoomer, 2)
            end)
            TASK:JoinCoroutines({a1, a2, a3})
        end
    end)
    local c2 = TASK:BranchCoroutine(function()
        COMMON.FaceEachother(zoomer, rexio)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Excuse me?![pause=30] I can do all these side quests by myself! I'm too strong to do any of this!")

        UI:SetSpeaker(zoomer)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Yeah right!")

        COMMON.FaceEachother(maru, azura)
        UI:SetSpeaker(azura)
        UI:SetSpeakerEmotion("Sad")
        UI:WaitShowDialogue("Maru...")

        GROUND:Unhide("Kitkit")
        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("I'm sure they'll stop being mad...[speed=0.5][pause=35] at some point...")

        local cc1 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(zoomer)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowTimedDialogue("Your stupid little aura sense isn't even working!", 80)
            UI:SetSpeakerEmotion("Inspired")
            GROUND:CharSetAnim(zoomer, "Walk", false)
            UI:WaitShowTimedDialogue("OoH, lOoK at ME! I can see TWO[emote=Angry] THINGS ON THE GROUND AT A TIME!", 80)
            GROUND:CharSetAnim(zoomer, "Normal", false)

            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowTimedDialogue("I don't even need that stupid power, I can punch you out of this stupid guild field!", 80)

            UI:SetSpeaker(smear)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowTimedDialogue("My dreams are being absolutely destroyed right now![pause=35] Zoomer,[pause=15] please!", 80)

            UI:SetSpeaker(zoomer)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowTimedDialogue("Blame the kid!!", 80)
        end)
        local cc2 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(55)
            GROUND:MoveToMarker(kitty, MRKR("mKit"), false, 2)
            GROUND:MoveToMarker(kitty, MRKR("mKit_1"), false, 2)
            GROUND:CharTurnToCharAnimated(kitty, maru, 6)
            angy = false
            COMMON.CharRealize("PLAYER")
            GROUND:CharTurnToCharAnimated(maru, kitty, 6)
            GROUND:CharTurnToCharAnimated(azura, kitty, 6)
            GAME:WaitFrames(35)
            COMMON.CharQuestion("Zoomer")
            COMMON.CharRealize("Teammate1")
            GAME:WaitFrames(60)
            GROUND:CharTurnToCharAnimated(kitty, smear, 6)
        end)
        TASK:JoinCoroutines({cc1, cc2})
    end)
    TASK:JoinCoroutines({c1, c2})

    COMMON.SetCharAndEmotion(kitty, "Normal")
    UI:WaitShowDialogue("Having fun, nya?")

    COMMON.SetCharAndEmotion(smear, "Surprised")
    UI:WaitShowDialogue("That voice! Could it be?!")
    COMMON.FaceEachother(kitty, smear)

    COMMON.SetCharAndEmotion(smear, "Surprised")
    UI:WaitShowDialogue("Kitkat! There is no need for you to be here right now!")
    COMMON.SetCharAndEmotion(smear, "Worried")
    UI:WaitShowDialogue("And, uh... of course, it is also not the best time since I am trying to figure out what to do with the current team.")

    GROUND:CharTurnToCharAnimated(kitty, maru, 6)
    COMMON.SetCharAndEmotion(kitty, "Worried")
    UI:WaitShowDialogue("...")

    kitty.Data.Nickname = "Kitkit"
    COMMON.FaceEachother(kitty, smear)
    COMMON.SetCharAndEmotion(kitty, "Normal")
    UI:WaitShowDialogue("This is the first grand team that you're putting together, nya?")
    COMMON.FaceEachother(kitty, rexio)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("They look like they could only do[emote=Happy] fetch quests.")

    COMMON.CharAngry("Teammate2")
    COMMON.SetCharAndEmotion(rexio, "Angry")
    UI:WaitShowDialogue("Bruuuuhhh!!")

    COMMON.SetCharAndEmotion(kitty, "Happy")
    UI:WaitShowDialogue("Calm down, nya! I've got a mission!")

    local function cat1turn()
        GROUND:CharAnimateTurnTo(kitty, Dir8.UpRight, 3)
    end

    local function cat2turn()
        GROUND:CharAnimateTurnTo(kitty, Dir8.DownLeft, 3)
    end

    COMMON.SetCharAndEmotion(kitty, "Normal")
    UI:WaitShowDialogue("Cool desert,[script=0][pause=40] over there nya,[script=1][pause=40] my important treasure is guarded by really bad people and we nyeeeeeed it.", {cat1turn, cat2turn})

    COMMON.SetCharAndEmotion(rexio, "Joyous")
    UI:WaitShowDialogue("Now that's a quest!")

    COMMON.FaceEachother(kitty, smear)
    COMMON.SetCharAndEmotion(smear, "Stunned")
    UI:WaitShowDialogue("Ah, well, um yes, but they... uh...")

    local a1 = TASK:BranchCoroutine(function()
        GROUND:MoveToPosition(smear, kitty.Position.X - 20, kitty.Position.Y, false, 1)
    end)
    local a2 = TASK:BranchCoroutine(function()
        UI:WaitShowBG("SmearKitSTalk1", 0, 20)
    end)
    TASK:JoinCoroutines({a1, a2})

    local b1 = TASK:BranchCoroutine(function()
        for i = 1, 5, 1 do
            UI:WaitShowBG("SmearKitSTalk2", 0, 0)
            GAME:WaitFrames(5 + i)
            UI:WaitShowBG("SmearKitSTalk1", 0, 0)
            GAME:WaitFrames(5 + i)
        end
    end)
    local b2 = TASK:BranchCoroutine(function()
        UI:ResetSpeaker()
        UI:SetBounds(10, 16, 300, 50)
        UI:WaitShowDialogue("We cannot send these children out on any mission, yes?")
    end)
    TASK:JoinCoroutines({b1, b2})

    local d1 = TASK:BranchCoroutine(function()
        for i = 1, 5, 1 do
            UI:WaitShowBG("SmearKitSTalk2", 0, 0)
            GAME:WaitFrames(5 + i)
            UI:WaitShowBG("SmearKitSTalk1", 0, 0)
            GAME:WaitFrames(5 + i)
        end
    end)
    local d2 = TASK:BranchCoroutine(function()
        UI:WaitShowDialogue("Not to mention that Mr. Aurm is giving me a strange feeling of recklessness.[pause=45] I must not be the one responsible for the kid of Luke getting into trouble.")
    end)
    TASK:JoinCoroutines({d1, d2})

    UI:WaitShowBG("SmearKitKTalk2", 0, 0)
    UI:WaitShowTimedDialogue("Nyah??!", 70)
    UI:WaitShowBG("SmearKitKTalk1", 0, 0)
    UI:WaitShowDialogue("That's Lukey's kid, nya?!")

    local e1 = TASK:BranchCoroutine(function()
        for i = 1, 5, 1 do
            UI:WaitShowBG("SmearKitKTalk2", 0, 0)
            GAME:WaitFrames(5 + i)
            UI:WaitShowBG("SmearKitKTalk1", 0, 0)
            GAME:WaitFrames(5 + i)
        end
    end)
    local e2 = TASK:BranchCoroutine(function()
        UI:WaitShowDialogue("Nyaaa, Smear! Don't let the guild approval team make you so nyervous.")
    end)
    TASK:JoinCoroutines({e1, e2})

    local f1 = TASK:BranchCoroutine(function()
        for i = 1, 5, 1 do
            UI:WaitShowBG("SmearKitKTalk2", 0, 0)
            GAME:WaitFrames(5 + i)
            UI:WaitShowBG("SmearKitKTalk1", 0, 0)
            GAME:WaitFrames(5 + i)
        end
    end)
    local f2 = TASK:BranchCoroutine(function()
        UI:WaitShowDialogue("I'm sure the three of them will do fine, meow!")
    end)
    TASK:JoinCoroutines({f1, f2})
    UI:WaitHideBG(30)
    UI:ResetBounds()
    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowTimedDialogue("...", 50)
    COMMON.FaceEachother(smear, maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("As you all have heard, it is a good time to further your team.[pause=50] For this guild,[pause=30] er, for Kitkat,[pause=30] get the treasure and bring it back!")

    GROUND:CharAnimateTurnTo(rexio, Dir8.Down, 3)
    GROUND:CharAnimateTurnTo(maru, Dir8.Down, 3)
    GROUND:CharAnimateTurnTo(azura, Dir8.Down, 3)

    GROUND:CharWaitAnim(maru, "Pose")
    GROUND:CharSetAction(maru, RogueEssence.Ground.PoseGroundAction(maru.Position, maru.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Pose")))
    GROUND:CharWaitAnim(rexio, "Pose")
    GROUND:CharSetAction(rexio, RogueEssence.Ground.PoseGroundAction(rexio.Position, rexio.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Pose")))
    GROUND:CharWaitAnim(azura, "Pose")
    GROUND:CharSetAction(azura, RogueEssence.Ground.PoseGroundAction(azura.Position, azura.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Pose")))
    GAME:MoveCamera(0, 0, 30, true)
    SV.guild.areas.east[1] = {
        Flag = true,
        Zone = "dane_desert",
        ID = 0,
        Entry = 0
    }

    GROUND:CharSetAnim(maru, "None", false)
    GROUND:CharSetAnim(rexio, "None", false)
    GROUND:CharSetAnim(azura, "None", false)
    IntroCutscene = false
end

function Guild.Day1Done()
    GAME:FadeOut(false, 40)
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    local zoomer = CH("Zoomer")
    local smear = CH("Smear")
    
    AI:DisableCharacterAI(azura)
    AI:DisableCharacterAI(rexio)

    GROUND:TeleportTo(azura, 1029, 654, Dir8.UpLeft, 0)
    GROUND:TeleportTo(rexio, 971, 654, Dir8.UpRight, 0)
    COMMON.TeleportToMarker(maru, "Start", Dir8.Up)
    COMMON.FaceEachother(maru, smear)

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I see.[pause=45] That is unfortunate...")
    GAME:FadeIn(40)
    GROUND:CharAnimateTurnTo(smear, Dir8.Up, 3)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("This was not a part of the original plan,[pause=30] but alas, there is nothing we can do.")
    UI:WaitShowDialogue("Since we are not anything official, we are not authorized to help them without permission...")

    GROUND:CharAnimateTurnTo(smear, Dir8.Down, 3)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Let's see how many apples you've gotten regardless.")

    local apple_storcount = GAME:GetPlayerStorageItemCount("food_apple") + GAME:GetPlayerStorageItemCount("food_apple_big")
    local apple_bagcount = 0
    
    for i = 0, GAME:GetPlayerBagCount() - 1, 1 do
        if GAME:GetPlayerBagItem(i).ID == "food_apple" or GAME:GetPlayerBagItem(i).ID == "food_apple_big" then
            apple_bagcount = apple_bagcount + 1
        end
    end
    local apple_count = apple_bagcount + apple_storcount
    if apple_bagcount == 0 then
        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Um,[pause=40] about that...")

        GROUND:CharAnimateTurnTo(zoomer, Dir8.Left, 3)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("The mission was so boring that we fell asleep and forgot.")

        COMMON.FaceEachother(maru, rexio)

        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Rexio...!")

        UI:SetSpeaker(azura)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Dungeon hard.[pause=45] Apple gone.")

        UI:SetSpeaker(zoomer)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Let's just check the storage...")
    else
        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Here ya go.")
        if apple_bagcount < 10 then
            UI:SetSpeaker(smear)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue(apple_bagcount .. ", it seems. Now we'll check storage.")
        else
            COMMON.CharExclaim("Smear")
            UI:SetSpeaker(smear)
            UI:SetSpeakerEmotion("Surprised")
            UI:WaitShowDialogue("Huh?! Have you three carried nothing but apples with you this entire time?!")

            UI:SetSpeaker(maru)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("The bag was heavy.")

            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("The mission was too easy... and also boring.")
        end
    end

    local c11 = TASK:BranchCoroutine(function()
        if apple_bagcount < 10 then
        else
            GROUND:CharTurnToCharAnimated(maru, rexio, 4)
            COMMON.CharSweatdrop("PLAYER")
            GAME:WaitFrames(70)
            GROUND:CharTurnToCharAnimated(maru, smear, 4)
        end
    end)
    local c12 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(smear)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Now we'll check storage.")
        GROUND:CharAnimateTurnTo(zoomer, Dir8.Right, 4)
        GAME:WaitFrames(40)
    end)
    TASK:JoinCoroutines({c11, c12})

    if apple_storcount == 0 then
        if apple_bagcount == 0 then
            UI:SetSpeaker(zoomer)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("There aren't any apples in here!")

            COMMON.FaceEachother(zoomer, rexio)

            UI:SetSpeaker(zoomer)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("Did you skip the entire dungeon?!")

            UI:SetSpeaker(azura)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("[speed=0.5] Uhhhhhhhhhhhhhh... [speed=1.0]dungeon[emote=Happy] hard.[pause=45] Apple gone.")

            COMMON.CharSweatdrop("Teammate2")
            GROUND:CharAnimateTurnTo(rexio, Dir8.Right, 3)
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("...")
        else
            UI:SetSpeaker(zoomer)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("Of course, can't expect any more than nothing...")
            GROUND:CharAnimateTurnTo(zoomer, Dir8.Down, 5)
            UI:WaitShowDialogue("Should've asked me for help at that point.")

            COMMON.FaceEachother(smear, zoomer)
            UI:SetSpeaker(smear)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("As pretentious as that is...")

            COMMON.CharAngry("Zoomer")
            COMMON.CharHop("Zoomer")
            GROUND:CharAnimateTurnTo(smear, Dir8.Down, 3)
            UI:SetSpeaker(zoomer)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("OI!")
        end
    elseif apple_storcount < 5 then
        UI:SetSpeaker(zoomer)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue(apple_storcount .. " of them. Right, because you're inexperienced.")

        COMMON.CharAngry("Teammate2")
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Like, what is your deal...?")
    end

    if apple_count == 0 then
        UI:SetSpeaker(smear)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("As worrying as it is that you have somehow managed to return with no red fruit in hand...")
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("This is normal for the guilding process.[pause=55] There is no learning in a guild if you do not fail a mission.")
        
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Waste of time...")
    elseif apple_count < 10 then
        UI:SetSpeaker(smear)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Good job.[pause=30] For a first time guild dungeon experience, you did at least decently.")
    else
        UI:SetSpeaker(smear)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Very good work, you three. My dreams of building a guild may actually come true.")

        UI:SetSpeaker(zoomer)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Guild full of kids...")
    end

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Tomorrow is a new day, do better or do worse; just keep going with your dreams!")
    
    GAME:WaitFrames(50)

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Is that the motto?")

    UI:SetSpeaker(smear)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("It is a work in progress.")
    UI:WaitShowDialogue("I will work on it while you rest for the day.")

    local coro011 = TASK:BranchCoroutine(function()
        local c11 = TASK:BranchCoroutine(function()
            GROUND:MoveToMarker(azura, MRKR("m1"), false, 1)
            GROUND:Hide("Teammate1")
        end)
        local c12 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(30)
            GROUND:MoveToMarker(maru, MRKR("m1"), false, 1)
            GROUND:Hide("PLAYER")
        end)
        TASK:JoinCoroutines({c11, c12})
    end)
    local coro012 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(20)
        GROUND:MoveToMarker(rexio, MRKR("m1"), false, 1)
        GROUND:Hide("Teammate2")
        GAME:FadeOut(false, 60)
    end)
    TASK:JoinCoroutines({coro011, coro012})
end

--- The tent

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

    SOUND:PlayFanfare("Fanfare/Note")
    UI:ResetSpeaker()
    UI:WaitShowDialogue("Maru has been moved to the front of the team.")

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

        COMMON.FaceEachother(maru, azura)
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
    IntroCutscene = true
    GAME:SetCanSwitch(true)
end

function Tent.Day1End()
    COMMON.RespawnAllies()
    GAME:FadeIn(40)
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    UI:SetBounds(10, 16, 300, 50)

    COMMON.SetCharAndEmotion(maru, "Normal")
    UI:WaitShowDialogue("Day 1 done.")

    COMMON.SetCharAndEmotion(azura, "Happy")
    UI:WaitShowDialogue("Fun!")

    COMMON.SetCharAndEmotion(rexio, "Normal")
    UI:WaitShowDialogue("It was okay, I think.")

    local c1 = TASK:BranchCoroutine(function()
        GROUND:MoveToMarker(rexio, MRKR("RexBed"), false, 2)
        GROUND:CharAnimateTurnTo(rexio, Dir8.Left, 4)
        GAME:WaitFrames(35)
        GROUND:CharAnimateTurnTo(rexio, Dir8.Right, 4)
        GAME:WaitFrames(35)
        GROUND:CharAnimateTurnTo(rexio, Dir8.Down, 4)
        COMMON.SetCharAndEmotion(rexio, "Worried")
        UI:WaitShowDialogue("...of course we still don't have the pillows.")

        COMMON.SetCharAndEmotion(maru, "Stunned")
        UI:WaitShowDialogue("Do you really want a pillow that bad?")
    end)
    local c2 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(20)
        GROUND:MoveToMarker(azura, MRKR("AzuBed"), false, 2)
        GROUND:CharAnimateTurnTo(azura, Dir8.Left, 4)
    end)
    TASK:JoinCoroutines({c1, c2})

    COMMON.SetCharAndEmotion(rexio, "Angry")
    UI:WaitShowDialogue("Look, okay, Blue Boy! You don't understand!")
    COMMON.SetCharAndEmotion(rexio, "Sad")
    UI:WaitShowDialogue("I've never had a pillow before...")

    GAME:WaitFrames(60)
    SOUND:StopBGM()
    COMMON.SetCharAndEmotion(azura, "Normal")
    UI:WaitShowDialogue("...we haven't either.")

    COMMON.SetCharAndEmotion(rexio, "Stunned")
    UI:WaitShowTimedDialogue("...", 90)

    GROUND:CharSetAnim(CH("Teammate2"), "Trip", true)
    GROUND:CharSetAction(rexio, RogueEssence.Ground.PoseGroundAction(rexio.Position, rexio.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Trip")))

    GAME:WaitFrames(120)
    COMMON.SetCharAndEmotion(maru, "Normal")
    UI:WaitShowDialogue("What a day.")
    SOUND:PlayBGM("Aftermath 2.ogg", true)
end

function Tent.FreeDay()
    GAME:SetCanSwitch(false)

    COMMON.RespawnAllies()
    GAME:FadeIn(40)
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    UI:SetBounds(10, 16, 300, 50)

    local choice = math.random(3)

    local c1 = TASK:BranchCoroutine(function()
        if choice == 1 then
            GROUND:MoveToMarker(rexio, MRKR("RexBed"), false, 2)
            GROUND:CharAnimateTurnTo(rexio, Dir8.Left, 4)
            GAME:WaitFrames(35)
            GROUND:CharAnimateTurnTo(rexio, Dir8.Right, 4)
            GAME:WaitFrames(35)
            GROUND:CharAnimateTurnTo(rexio, Dir8.Down, 4)

            COMMON.SetCharAndEmotion(rexio, "Worried")
            UI:WaitShowDialogue("Still no pillows...")

            COMMON.SetCharAndEmotion(maru, "Stunned")
            UI:WaitShowDialogue("Geez...")

            COMMON.SetCharAndEmotion(azura, "Worried")
            UI:WaitShowDialogue("...tired...[speed=0.6] eepy...[speed=0.2] is eepy time.")
            GROUND:CharSetAnim(CH("Teammate1"), "Sleep", true)

            COMMON.SetCharAndEmotion(rexio, "Normal")
            UI:WaitShowDialogue("Right.")

            GROUND:CharSetAnim(CH("Teammate2"), "Trip", true)
            GROUND:CharSetAction(rexio, RogueEssence.Ground.PoseGroundAction(rexio.Position, rexio.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Trip")))
            
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Tomorrow'd better be better.")
        elseif choice == 2 then
            COMMON.SetCharAndEmotion(maru, "Happy")
            UI:WaitShowDialogue("Not a bad day, I think.")

            COMMON.SetCharAndEmotion(azura, "Happy")
            UI:WaitShowDialogue("Yippee")

            GROUND:MoveToMarker(rexio, MRKR("RexBed"), false, 2)
            COMMON.SetCharAndEmotion(rexio, "Worried")
            UI:WaitShowDialogue("Right, dungeons done, so awake is also done.")
            GROUND:CharSetAnim(CH("Teammate2"), "Trip", true)
            GROUND:CharSetAction(rexio, RogueEssence.Ground.PoseGroundAction(rexio.Position, rexio.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Trip")))
        elseif choice == 3 then
            COMMON.SetCharAndEmotion(azura, "Happy")
            UI:WaitShowDialogue("We did it!")
            UI:WaitShowDialogue("Yippee")

            COMMON.SetCharAndEmotion(rexio, "Worried")
            UI:WaitShowDialogue("Meh. I did most of the work.")

            COMMON.SetCharAndEmotion(maru, "Stunned")
            UI:WaitShowDialogue("You literally did not but okay.")
            
            local cor2 = TASK:BranchCoroutine(function()
                GROUND:MoveToMarker(rexio, MRKR("RexBed"), false, 2)
                COMMON.SetCharAndEmotion(rexio, "Worried")
                GROUND:CharSetAnim(CH("Teammate2"), "Trip", true)
                GROUND:CharSetAction(rexio, RogueEssence.Ground.PoseGroundAction(rexio.Position, rexio.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Trip")))
            end)
            local cor3 = TASK:BranchCoroutine(function()
                COMMON.SetCharAndEmotion(maru, "Stunned")
                UI:WaitShowDialogue("You literally did not but okay.")
            end)

            COMMON.SetCharAndEmotion(rexio, "Happy")
            UI:WaitShowDialogue("Whateverrrrrrrrrr!")
            TASK:JoinCoroutines({cor2, cor3})
        end
    end)
    local c2 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(20)
        GROUND:MoveToMarker(azura, MRKR("AzuBed"), false, 2)
        GROUND:CharAnimateTurnTo(azura, Dir8.Left, 4)
    end)
    TASK:JoinCoroutines({c1, c2})
end

function Tent.DayStart()
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
    end)
    local cor3 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(10)
        GROUND:CharWaitAnim(azura, "Wake")
        GROUND:CharSetAnim(azura, "Idle", false)
    end)
    TASK:JoinCoroutines({cor1, cor2, cor3})

    COMMON.SetCharAndEmotion(maru, "Happy")
    UI:WaitShowDialogue("Day time already?")

    COMMON.SetCharAndEmotion(azura, "Happy")
    UI:WaitShowDialogue("Good morning!")

    COMMON.SetCharAndEmotion(rexio, "Worried")
    UI:WaitShowDialogue("Whatever...")

    GROUND:MoveToPosition(maru, 215, 230, false, 1)
    GAME:CutsceneMode(false)
    maru.CollisionDisabled = false
    IntroCutscene = true
    GAME:SetCanSwitch(true)
end