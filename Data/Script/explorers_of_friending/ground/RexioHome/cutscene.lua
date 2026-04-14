require 'explorers_of_friending.common'

Aurm = {}

function Aurm.Feeling()
    GAME:GroundSave()
    local rexio = CH("PLAYER")
    local luke = CH("Luke")
    GAME:CutsceneMode(true)
    GAME:MoveCamera(229, 248, 1, false)
    local coro01 = TASK:BranchCoroutine(function()
        UI:WaitShowTitle("Prologue B-0", 120)
        GAME:WaitFrames(30)
        UI:WaitHideTitle(120)
        GAME:FadeIn(50)
        end)
    local coro02 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(180)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("...ugh, this is so boring...")
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("I don't get it, can't I just[pause=40] [emote=Happy]punch stuff?")
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
   EXPLCOMMON.FaceEachother(rexio, luke)
   EXPLCOMMON.CharHop("PLAYER")
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

    SV.guilders.entoh_town.scan_level = 1

    GAME:CutsceneMode(false)
    GAME:MoveCamera(0, 0, 0, true)
end

function Aurm.Home()
    local rexio = CH("PLAYER")
    local luke = CH("Luke")
    GAME:CutsceneMode(true)
    GAME:FadeIn(50)
   EXPLCOMMON.FaceEachother(rexio, luke)
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
       EXPLCOMMON.FaceEachother(rexio, luke)
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

    EXPLCOMMON.CharSweatdrop("PLAYER")
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
        EXPLCOMMON.CharSweatdrop("PLAYER")
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("...what is it?")

       EXPLCOMMON.CharExclaim("Luke")
        UI:SetSpeaker(luke)
        UI:WaitShowDialogue("It's... uh...")
        EXPLCOMMON.CharSweatdrop("Luke")
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("(That's not my order...)")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Did you grab someone else's package again?")

        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowTimedDialogue("No, I could've sworn I...", 10)

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Dad...")

        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Well, it has to be ours, kid! You wouldn't have needed a key!")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Okay, so... do I just...?")

        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Probably like a headband.")
        UI:WaitShowDialogue("Put it on.")

        SV.Story.sect = 4
        GAME:GivePlayerItem("held_power_band")
        GAME:CutsceneMode(false)
        GAME:MoveCamera(0, 0, 0, true)
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

       EXPLCOMMON.CharHop("Luke")
        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Yeah, you will!")

        GROUND:CharSetAnim(CH("PLAYER"), "Pose", false)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("This'll be easy!")

       EXPLCOMMON.CharHop("Luke")
        UI:SetSpeaker(luke)
        UI:SetSpeakerEmotion("Joyous")
        UI:WaitShowDialogue("That's my boy!")

        SV.Story.flag = 1
        GAME:CutsceneMode(false)
        GAME:MoveCamera(0, 0, 0, true)
    end
end

function Aurm.OpenIt()
    local rexio = CH("PLAYER")
    local luke = CH("Luke")
    GAME:CutsceneMode(true)
    GAME:FadeIn(20)
   EXPLCOMMON.FaceEachother(rexio, luke)

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
       EXPLCOMMON.FaceEachother(rexio, luke)
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
    EXPLCOMMON.CharSweatdrop("PLAYER")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...what is it?")

   EXPLCOMMON.CharExclaim("Luke")
    UI:SetSpeaker(luke)
    UI:WaitShowDialogue("It's... uh...")
    EXPLCOMMON.CharSweatdrop("Luke")
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("(That's not my order...)")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Did you grab someone else's package again?")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowTimedDialogue("No, I could've sworn I...", 10)

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Dad...")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Well, it has to be ours, kid! You wouldn't have needed a key!")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Okay, so... do I just...?")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Probably like a headband.")
    UI:WaitShowDialogue("Put it on.")

    SV.Story.sect = 4
    GAME:GivePlayerItem("held_power_band")
    GAME:CutsceneMode(false)
    GAME:MoveCamera(0, 0, 0, true)
end

function Aurm.Fashion()
    local rexio = CH("PLAYER")
    local luke = CH("Luke")
   EXPLCOMMON.CharExclaim("PLAYER")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("Whoa, I feel...!")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("You feel...?")

    GAME:WaitFrames(70)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("...stronger.")

   EXPLCOMMON.FaceEachother(rexio, luke)

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...I guess there's nothing wrong with that.")

    GROUND:CharSetAnim(rexio, "RearUp", true)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Heh, I'll keep it.[pause=30] Not like I need it, but thanks, pops.")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...")

    GROUND:CharWaitAnim(rexio, "RearUp", false)
   EXPLCOMMON.CharQuestion("PLAYER")
    GAME:WaitFrames(30)
   EXPLCOMMON.SetCharAndEmotion(rexio, "Worried")
    UI:WaitShowDialogue("...something up?")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("That color.[pause=0][emote=Happy] It sucks on you.")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Bruuuuuuuh.")
    SV.Story = {
        chap = -5,
        sect = 0,
        flag = 0,
        dunsect = 0
    }
    GAME:FadeOut(false, 50)
    GAME:EnterGroundMap("RexioHome_ch2", "RexioStart2")
end

function Aurm.Slipped()
    GAME:WaitFrames(30)
    local rexio = CH("PLAYER")
    local luke = CH("Luke")
   EXPLCOMMON.CharExclaim("PLAYER")
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("There is no way...")

    GAME:WaitFrames(70)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...uhhhhhh.")

   EXPLCOMMON.FaceEachother(rexio, luke)

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Rexio,[pause=45] come on, kid,[pause=15] what was that for...?")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Special3")
    UI:WaitShowDialogue("Hehe...[pause=30] I did it...[pause=30] hehehe...[pause=30] it turned invisible when I put it on, though...")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...")

   EXPLCOMMON.SetCharAndEmotion(rexio, "Special3")
    UI:WaitShowDialogue("...?")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Somehow I expected that excuse out of you.")

   EXPLCOMMON.CharAngry("PLAYER")
   EXPLCOMMON.CharHop("PLAYER")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Bruuuuuuuh.")
    SV.Story = {
        chap = -5,
        sect = 0,
        flag = 0,
        dunsect = 0
    }
    GAME:FadeOut(false, 50)
    GAME:EnterGroundMap("RexioHome_ch2", "RexioStart2")
end

Aurm2 = {}

function Aurm2.LukeWarm()
    local rexio = CH("PLAYER")
    local luke = CH("Luke")
    GAME:CutsceneMode(true)
    GAME:FadeIn(20)
   EXPLCOMMON.FaceEachother(rexio, luke)
   EXPLCOMMON.CharRealize("PLAYER")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowTimedDialogue("Oh hey, welcome back again, buddy!", 30)

    local coro01 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(190)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Buddy...?[pause=30] ...hello???")
        end)
    local coro02 = TASK:BranchCoroutine(function()
        GAME:MoveCamera(229, 248, 1, false)
        GROUND:MoveToMarker(rexio, MRKR("RexioStart"), false, 1)
        GAME:WaitFrames(10)
       EXPLCOMMON.FaceEachother(rexio, luke)
        end)
    TASK:JoinCoroutines({coro01, coro02})

    GAME:WaitFrames(70)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...are you real?")

    EXPLCOMMON.CharSweatdrop("Luke")
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Did you eat too many berries again?")
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Where were you anyway?")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("You were gone! I should be asking you! Were you not concerned?!")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Kid, I was here the whole time,[pause=20] and I'm definitely sure this time.")
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("I thought you were out with your friends without telling me again. You're usually out for longer, too.")

    local coro2 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Tch... whatever, man...")
        end)
    local coro1 = TASK:BranchCoroutine(function()
        GROUND:MoveToPosition(rexio, rexio.Position.X, rexio.Position.Y - 35, false, 2)
        end)
    TASK:JoinCoroutines({coro1, coro2})

    GROUND:CharTurnToCharAnimated(luke, rexio)
    GAME:WaitFrames(95)
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("...you still miss her,[pause=10] don't you...")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("N-no... I...")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("...she'll be back.[pause=60] I promise.")

    GAME:WaitFrames(55)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("I didn't know where I went.[pause=40] Or even where everyone else went...")

    local coro2 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("I didn't like it![pause=25] Why did it feel so awful?!")
        end)
    local coro1 = TASK:BranchCoroutine(function()
        GROUND:MoveToMarker(rexio, MRKR("RexioStart"), false, 4)
       EXPLCOMMON.FaceEachother(luke, rexio)
        end)
    TASK:JoinCoroutines({coro1, coro2})

    GAME:WaitFrames(50)
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("What?[pause=30] Emotions?")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I'd say that your aura is growing and making them a little stronger.")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Bruuuuuuuuuuuuh, I don't want it anymore![pause=20] Aura is dumb!")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("Wha-[pause=30] Rexio! No!!")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowTimedDialogue("It's just so")

    GROUND:CharSetAnim(rexio, "Sleep", true)
    GAME:WaitFrames(120)

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowTimedDialogue("([speed=0.1]...[emote=Sigh][speed=1.0]Rexio...)", 70)
    GROUND:CharAnimateTurnTo(luke, Dir8.Down, 3)
    UI:WaitShowTimedDialogue("(I guess it's pretty late.[pause=55] Guess I'll check in with Dragon...)", 70)

    GROUND:MoveToPosition(luke, 142, 226, false, 2)
    GROUND:MoveToPosition(luke, 208, 289, false, 2)
    GROUND:CharAnimateTurnTo(luke, Dir8.Down, 3)
    GAME:WaitFrames(15)
    GROUND:Hide("Luke")

    --Next Chapter

    SV.Story = {
        chap = -6,
        sect = 0,
        flag = 0,
        dunsect = 0
    }
    GAME:FadeOut(false, 90)

    GAME:CutsceneMode(true)
    GROUND:CharSetAnim(rexio, "EventSleep", true)
    GAME:FadeIn(180)
    UI:WaitShowTitle("Prologue B-2:\nAnew", 120)
    GAME:WaitFrames(30)
    UI:WaitHideTitle(120)
    GROUND:CharWaitAnim(rexio, "EventSleep", true)
    GROUND:CharSetAnim(rexio, "Laying", true)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("Hic!")

    GROUND:CharWaitAnim(rexio, "Wake", true)
    GROUND:CharSetAnim(rexio, "Idle", true)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowTimedDialogue("Good morning, old g")
   EXPLCOMMON.CharRealize("PLAYER")
    GAME:WaitFrames(50)

   EXPLCOMMON.CharAngry("PLAYER")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowTimedDialogue("[speed=0.7]Oh you have got to be kidding me")

    local coro2 = TASK:BranchCoroutine(function()
        SOUND:PlayBattleSE("DUN_Aura_Sphere_2")
        GAME:WaitFrames(10)
        local center = GAME:GetCameraCenter()

        local result_emitter = RogueEssence.Content.SingleEmitter(RogueEssence.Content.AnimData("Blast_Seed", 3))
        result_emitter.LocHeight = 6

        local sphere = RogueEssence.Content.MoveToEmitter()
        sphere.MoveTime = 30
        sphere.Anim = RogueEssence.Content.AnimData("Aura_Sphere", 3)
        sphere.ResultAnim = result_emitter
        sphere.OffsetStart = RogueElements.Loc(rexio.Position.X + 24, 400)
        sphere.OffsetEnd = RogueElements.Loc(rexio.Position.X + 24, 150)
        sphere.LingerStart = 0
        sphere.LingerEnd = 5
        GROUND:PlayVFX(sphere, 0, 0)
        GAME:WaitFrames(40)
        SOUND:PlayBattleSE("DUN_Explosion")
        GAME:WaitFrames(10)
        SOUND:PlayBattleSE("DUN_Self-Destruct")

        GAME:WaitFrames(10)
        GROUND:Unhide("Luke")
        end)
    local coro1 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(5)

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowTimedDialogue("Wah!", 10)
        GROUND:MoveToMarker(rexio, MRKR("RexioStart"), false, 4)
       EXPLCOMMON.FaceEachother(luke, rexio)
        GROUND:AnimateToPosition(rexio, "HitGround", Dir8.Right, rexio.Position.X + 30, rexio.Position.Y, 5, 6, 0)
        GAME:WaitFrames(30)
        GROUND:CharWaitAnim(rexio, "Wake", true)
        GROUND:CharSetAnim(rexio, "Idle", false)
        end)
    TASK:JoinCoroutines({coro1, coro2})

   EXPLCOMMON.FaceEachother(rexio, luke)
    GAME:WaitFrames(60)

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("D-dad, when did you...?[pause=30] W[emote=Stunned]hy did you?????")
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("We don't even HAVE A DOOR, DAD!!")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Rexio, we're going! I'll get your friends!")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("Wh-... where?!")

    GAME:WaitFrames(30)
    EXPLCOMMON.CharSweatdrop("Luke")
    GROUND:CharAnimateTurnTo(luke, Dir8.Down, 10)
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("No idea, but it's important! Come ooooooon!")
    GROUND:Hide("Luke")
    GAME:CutsceneMode(false)
end