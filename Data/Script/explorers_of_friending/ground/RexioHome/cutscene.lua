require 'explorers_of_friending.common'

Aurm = {}

function Aurm.Feeling()
    local rexio = CH("PLAYER")
    local luke = CH("Luke")
    GAME:CutsceneMode(true)
    GAME:MoveCamera(229, 248, 1, false)
    local coro01 = TASK:BranchCoroutine(function()
        UI:WaitShowTitle("Chapter 3", 120)
        GAME:WaitFrames(30)
        UI:WaitHideTitle(120)
        GAME:FadeIn(50)
        end)	
    local coro02 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(200)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("...ugh, this is so boring...")
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("I don't get it, can't I just [emote=Happy]punch stuff?")
        end)
    
    TASK:JoinCoroutines({coro01, coro02})
    rexio_stance = false

    local coro001 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Look, kid. I understand it's taking a while.")
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("I just don't want you to fall behind, yeah?")
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Hm, whatever.")
        while rexio_stance == false do
            GAME:WaitFrames(5)
        end
        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Okay, now focus.")
        end)	
    local coro002 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(100)
        GROUND:MoveToPosition(rexio, 256, 184, false, 2)
        GROUND:CharAnimateTurn(rexio, Direction.Down, 4, false)
        rexio_stance = true
        end)
    TASK:JoinCoroutines({coro001, coro002})
    GROUND:CharSetAnim(rexio, "DeepBreath", false)
    GAME:WaitFrames(30)

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Now tell me, what do you feel?")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("[speed=0.4]...[pause=45] .[emote=Worried].. [pause=50]...")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Nothin'?")
    
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("It's so stupid, dad!")
    COMMON.FaceEachother("PLAYER", "Luke")
    COMMON.CharHop("PLAYER")
    UI:WaitShowDialogue("I get it, aura, purpose![pause=20] I just don't see the point in focusing all day just to know who's right next to me!")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Stupid 6th sense. I'll just...[pause=40] fight my way through things.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Getting stronger and all, like I'm not strong enough already.")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("We'll talk about that later.")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I need you to do me a favor.")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Wassup?")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I was supposed to go get a package from Dragon a few days ago.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Could you go check on him for me?")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Choooooores?")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue("Yes, Rexio. Chooooores.")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("Uugghhhhhhh!")
    
    local talk_evt = RogueEssence.Dungeon.BattleScriptEvent("RexioInteract")
        _DATA.Save.ActiveTeam.Players[0].ActionEvents:Add(talk_evt)
        
    SV.guilders.entoh_town.scan_level = 1
    SV.entoh_town.HelperChapter = 0
    GAME:CutsceneMode(false)
    GAME:MoveCamera(0, 0, 0, true)
end

function Aurm.Home()
    local rexio = CH("PLAYER")
    local luke = CH("Luke")
    GAME:CutsceneMode(true)
    GAME:FadeIn(50)
    COMMON.FaceEachother("PLAYER", "Luke")
    local coro01 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Welcome back, buddy.")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Yeah, yeah, I got the package.")

        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Good, because it's actually for you.")
        end)	
    local coro02 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(50)
        GAME:MoveCamera(229, 248, 1, false)
        GROUND:MoveToMarker(rexio, MRKR("RexioStart"), false, 4)
        GAME:WaitFrames(10)
        COMMON.FaceEachother("PLAYER", "Luke")
        GROUND:Unhide("Package")
        SOUND:PlaySE("Battle/EVT_CH02_Item_Place")
        end)
    
    TASK:JoinCoroutines({coro01, coro02})
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Inspired")
    UI:WaitShowDialogue("Really?!")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("But...")

    COMMON.CharSweatdrop("PLAYER")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("But...?")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("You gotta be able to get the key first.")

    if KeyGet then
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Oh, the random key on the ground? I already got it.[pause=30] I'm just that good.")

        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Ah shucks. Oh well.")

        GROUND:Hide("Package")
        SOUND:PlayFanfare("Fanfare/Item")
        UI:ResetSpeaker()
        UI:WaitShowDialogue("It's a Power Band!")
        
        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("...well?")

        COMMON.CharSweatdrop("PLAYER")
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("...what is it?")

        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("It's... uh...")
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("(That's not my order...)")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Did you grab someone else's package again?")
        
        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowTimedDialogue("No, I could've sworn I...", 10)

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Dad...")

        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Well, it has to be ours, kid! You wouldn't have needed a key!")

        SV.entoh_town.HelperChapter = 4

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Okay, so... do I just...?")
        
        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Probably like a headband.")
        UI:WaitShowDialogue("Put it on.")

        GAME:GivePlayerItem("held_power_band")
        GAME:CutsceneMode(false)
    else
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("Key?![pause=25] Oh,[emote=Worried] don't tell me this is for practice...")

        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("You need to somehow.")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("...you know what,[pause=30] I[emote=Determined]'ll find it!")

        COMMON.CharHop("Luke")
        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Yeah, you will!")

        GROUND:CharSetAnim(CH("PLAYER"), "Pose", false)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("This'll be easy!")

        COMMON.CharHop("Luke")
        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Joyous")
        UI:WaitShowDialogue("That's my boy!")

        SV.entoh_town.HelperChapter = 3
        GAME:CutsceneMode(false)
        GAME:MoveCamera(0, 0, 0, true)
    end
end

function Aurm.OpenIt()
    local rexio = CH("PLAYER")
    local luke = CH("Luke")
    GAME:CutsceneMode(true)
    GAME:FadeIn(20)
    COMMON.FaceEachother("PLAYER", "Luke")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowTimedDialogue("Welcome back, buddy.")
    local coro01 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Key.")

        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Alright, then open it.")
        end)	
    local coro02 = TASK:BranchCoroutine(function()
        GAME:MoveCamera(229, 248, 1, false)
        GROUND:MoveToMarker(rexio, MRKR("RexioStart"), false, 4)
        GAME:WaitFrames(10)
        COMMON.FaceEachother("PLAYER", "Luke")
        end)
    TASK:JoinCoroutines({coro01, coro02})

    SOUND:PlayBattleSE("_UNK_EVT_043")
    GROUND:Hide("Package")
    GAME:WaitFrames(40)
    SOUND:PlayFanfare("Fanfare/Item")
    UI:ResetSpeaker()
    UI:WaitShowDialogue("It's a Power Band!")
    
    GAME:WaitFrames(70)
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("...well?")

    GAME:WaitFrames(10)
    COMMON.CharSweatdrop("PLAYER")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...what is it?")
    
    COMMON.CharExclaim("Luke")
    UI:SetSpeaker(luke)
    UI:WaitShowDialogue("It's... uh...")
    COMMON.CharSweatdrop("Luke")
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("(That's not my order...)")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Did you grab someone else's package again?")
    
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowTimedDialogue("No, I could've sworn I...", 10)

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Dad...")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Well, it has to be ours, kid! You wouldn't have needed a key!")

    SV.entoh_town.HelperChapter = 4

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Okay, so... do I just...?")
    
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Probably like a headband.")
    UI:WaitShowDialogue("Put it on.")

    GAME:GivePlayerItem("held_power_band")
    GAME:CutsceneMode(false)
    GAME:MoveCamera(0, 0, 0, true)
end

function Aurm.Fashion()
    COMMON.CharExclaim("PLAYER")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("Whoa, I feel...!")
    
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("What, what?!")

    GAME:WaitFrames(70)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("...stronger.")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...I guess there's nothing wrong with that.")

    GROUND:CharSetAnim(rexio, "RearUp", true)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Heh, I'll keep it. Not like I need it, but thanks, pops.")
    
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...")

    GROUND:CharWaitAnim(rexio, "RearUp", false)
    COMMON.CharQuestion("PLAYER")
    COMMON.SetCharAndEmotion(rexio, "Worried")
    UI:WaitShowDialogue("...something up?")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("That color.[pause=0] It sucks on you.")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Bruuuuuuuh.")
    GAME:FadeOut(false, 50)
end