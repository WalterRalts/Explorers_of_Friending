AppleBoss = {}

function AppleBoss.Roomy()
    COMMON.RespawnAllies()
    local maru = CH("PLAYER")
    local galia = CH("Galia")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    COMMON.TeleportToMarker(maru, "m2", Dir8.Up)
    GAME:MoveCamera(160, 200, 1, false)
    GAME:FadeIn(20)

    COMMON.CharQuestion("PLAYER")
    COMMON.SetCharAndEmotion(maru, "Worried")
    UI:WaitShowDialogue("...huh.")

    COMMON.FaceEachother(maru, galia)
    COMMON.SetCharAndEmotion(maru, "Normal")
    UI:WaitShowDialogue("Excuse me miss, am I allowed to go in this room?")

    COMMON.SetCharAndEmotion(galia, "Normal")
    UI:WaitShowDialogue("...that room is strange, actually...")
    UI:WaitShowDialogue("When we bring it up to the mayor, he speaks no words back.")
    UI:WaitShowDialogue("Possibly because it seems empty, all except the one cushion in there.")

    COMMON.SetCharAndEmotion(maru, "Worried")
    UI:WaitShowDialogue("Huh, weird,[pause=40] [emote=Normal]can I go in anyway...?")

    local c0 = TASK:BranchCoroutine(function()
        COMMON.SetCharAndEmotion(galia, "Stunned")
        UI:WaitShowTimedDialogue("I would much prefer it if you didn't.[pause=30] Maybe with someone else with you...?")
    
        COMMON.SetCharAndEmotion(rexio, "Happy")
        UI:WaitShowTimedDialogue("Oi! Clever blue nickname!", 60)

        COMMON.SetCharAndEmotion(azura, "Worried")
        UI:WaitShowTimedDialogue("Clever what?", 60)

        COMMON.SetCharAndEmotion(rexio, "Normal")
        UI:WaitShowDialogue("Maru just sounded lame, so I wanna think of something cooler.")

        COMMON.SetCharAndEmotion(azura, "Determined")
        UI:WaitShowDialogue("Maru's not lame!")

        COMMON.SetCharAndEmotion(rexio, "Stunned")
        UI:WaitShowDialogue("I didn't mean...[pause=40] ...okay,[emote=Normal] anyway,[pause=30] uhhh,[pause=30] Bluetail...![pause=40] B[emote=Happy]luetail sounds cool!")

        COMMON.SetCharAndEmotion(maru, "Normal")
        UI:WaitShowDialogue("Did you find any apples?")

        COMMON.SetCharAndEmotion(rexio, "Worried")
        UI:WaitShowDialogue("The guy I was talking to fell asleep on me.") 
        end)	
    local c1 = TASK:BranchCoroutine(function()
        GROUND:MoveToMarker(rexio, MRKR("r1"), false, 1)
        GAME:WaitFrames(120)
        GROUND:MoveToMarker(rexio, MRKR("r2"), false, 1)
        GROUND:MoveToMarker(rexio, MRKR("r3"), false, 1)
        GROUND:MoveToMarker(rexio, MRKR("r4"), false, 1)
        end)
    local c2 = TASK:BranchCoroutine(function()
        azura.CollisionDisabled = true
        GAME:WaitFrames(30)
        GROUND:MoveToMarker(azura, MRKR("a1"), false, 1)
        COMMON.FaceEachother(azura, rexio)
        GAME:WaitFrames(120)
        GROUND:MoveToMarker(azura, MRKR("r1"), false, 1)
        GROUND:MoveToMarker(azura, MRKR("r2"), false, 1)
        GROUND:MoveToMarker(azura, MRKR("r3"), false, 1)
        GROUND:MoveToMarker(azura, MRKR("a2"), false, 1)
        azura.CollisionDisabled = false
        end)
    TASK:JoinCoroutines({c0, c1, c2})

    COMMON.FaceEachother(rexio, azura)
    UI:WaitShowDialogue("And your sis wouldn't stop staring at that apple...")

    GROUND:CharAnimateTurn(azura, Direction.UpRight, 4, false)
    COMMON.SetCharAndEmotion(azura, "Worried")
    UI:WaitShowDialogue("Are you sure that we can't take it?")

    COMMON.SetCharAndEmotion(maru, "Worried")
    UI:WaitShowDialogue("Uh,[pause=40] [emote=Normal]this room first.[pause=30] Then we'll maybe ask for a piece.")

    COMMON.CharHop("Teammate1")
    COMMON.SetCharAndEmotion(azura, "Happy")
    UI:WaitShowDialogue("Then let's go!")

    GAME:FadeOut(false, 20)
    GAME:MoveCamera(0, 0, 1, true)
    GAME:EnterGroundMap("MayorRoom", "Enter")
end