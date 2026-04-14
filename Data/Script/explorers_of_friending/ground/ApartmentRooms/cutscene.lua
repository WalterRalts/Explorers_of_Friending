Apart = {}

function Apart.TidyIntro()
    SV.Story.sect = 1
    local rexio = CH("PLAYER")
    local tidy = CH("Tidy")
    local mouse = CH("Mouse")

    GAME:CutsceneMode(true)
    local coro01 = TASK:BranchCoroutine(function()
        GAME:FadeIn(50)
        GROUND:MoveToPosition(rexio, rexio.Position.X - 25, rexio.Position.Y, false, 1)
        end)	
    local coro02 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("(Dumb chores...)")

        GROUND:Unhide("Tidy")
        end)
    TASK:JoinCoroutines({coro01, coro02})

   EXPLCOMMON.FaceEachother(tidy, rexio)

    local coro1 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Rexio!")

        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("Ah! You're [emote=Worried]all dusty again...![pause=45] Eugh...")
        end)
    local coro2 = TASK:BranchCoroutine(function()
       EXPLCOMMON.CharHop("Tidy")
        GROUND:MoveToPosition(tidy, rexio.Position.X, rexio.Position.Y - 28, true, 7)
        end)
    TASK:JoinCoroutines({coro1, coro2})

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Makes sense. I'm still sleeping on the ground.")

    UI:SetSpeaker(tidy)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Can't you just...?[pause=70] W[emote=Sigh]ell,[pause=10] let's just get you clean[emote=Normal].")
    GROUND:MoveToPosition(tidy, rexio.Position.X, rexio.Position.Y - 15, false, 2)
    SOUND:StopBGM()
    for i = 1, 5, 1 do
        SOUND:PlaySE("Battle/DUN_Tail_Whip")
        GROUND:CharSetAnim(tidy, "Rotate", false)
        GAME:WaitFrames(20)
    end
    GAME:WaitFrames(10)
    SOUND:PlaySE("Battle/EVT_Minigame_Correct")
    GROUND:MoveToPosition(tidy, rexio.Position.X, rexio.Position.Y - 28, true, 7)
   EXPLCOMMON.FaceEachother(rexio, tidy)

    SOUND:PlayBGM("Base Town.ogg", true)
    UI:SetSpeaker(tidy)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Alrighty![pause=10] Hope I didn't miss a spot!")

    local coro13 = TASK:BranchCoroutine(function()
       EXPLCOMMON.FaceEachother(rexio, mouse)
        UI:SetSpeaker(mouse)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Hey, Tidy.")

        UI:SetSpeaker(mouse)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("My turn.")
        end)
    local coro24 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(20)
       EXPLCOMMON.CharRealize("Tidy")
       EXPLCOMMON.FaceEachother(tidy, mouse)
        end)
    TASK:JoinCoroutines({coro13, coro24})

    local c1 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Sigh")
        UI:WaitShowDialogue("Uh...[pause=45] ...I'll try.")
        end)
    local c2 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(20)
        GROUND:MoveToMarker(tidy, MRKR("exit_1"), true, 3)
        GROUND:MoveToPosition(tidy, mouse.Position.X + 18, mouse.Position.Y, false, 3)
       EXPLCOMMON.FaceEachother(tidy, mouse)
        end)
    TASK:JoinCoroutines({c1, c2})

    SOUND:StopBGM()
    SOUND:PlaySE("Battle/DUN_Tail_Whip")
    GROUND:CharSetAnim(tidy, "Rotate", false)
    GAME:WaitFrames(45)
    SOUND:PlaySE("Battle/EVT_Minigame_Wrong")

    GAME:WaitFrames(80)
   EXPLCOMMON.CharSweating("Tidy")
    GAME:WaitFrames(40)
    for i = 1, 2, 1 do
        SOUND:PlaySE("Battle/DUN_Tail_Whip")
        GROUND:CharSetAnim(tidy, "Rotate", false)
        GAME:WaitFrames(22)
    end
    GAME:WaitFrames(30)
    SOUND:PlaySE("Battle/EVT_Minigame_Wrong")

    GAME:WaitFrames(120)
    EXPLCOMMON.CharSweatdrop("Tidy")

    GROUND:MoveToPosition(tidy, mouse.Position.X + 25, mouse.Position.Y, true, 7)
   EXPLCOMMON.FaceEachother(tidy, mouse)
    UI:SetSpeaker(tidy)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...I don't think...")

    UI:SetSpeaker(mouse)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Oh yeah.[pause=30] I'm just dirt.[pause=30] Whoops.")

    SOUND:PlayBGM("Base Town.ogg", true)
    UI:SetSpeaker(tidy)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...right, I'm gonna get fresh air.")

    UI:SetSpeaker(mouse)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Cya.")

    GROUND:MoveToMarker(tidy, MRKR("exit_3"), false, 6)
    GROUND:Hide("Tidy")
    GAME:CutsceneMode(false)
end