Apart = {}

function Apart.TidyIntro()
    local rexio = CH("PLAYER")
    local tidy = CH("Tidy")
    local mouse = CH("Mouse")

    GAME:CutsceneMode(true)
    local coro01 = TASK:BranchCoroutine(function()
        GAME:FadeIn(50)
        GROUND:MoveToPosition(rexio, rexio.Position.X - 25, rexio.Position.Y, false, 2)
        end)	
    local coro02 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("(Dumb chores...)")
        end)
    
    
    TASK:JoinCoroutines({coro01, coro02})
    GROUND:Unhide("Tidy")

    COMMON.FaceEachother(tidy, rexio)

    UI:SetSpeaker(tidy)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Rexio!")

    GROUND:MoveToPosition(tidy, rexio.Position.X, rexio.Position.Y - 28, true, 7)

    UI:SetSpeaker(tidy)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("Ah! You're [emote=Worried]all dusty again...![pause=45] Eugh...")

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
        GAME:WaitFrames(18)
    end
    GAME:WaitFrames(10)
    SOUND:PlaySE("Battle/EVT_Minigame_Correct")
    GROUND:MoveToPosition(tidy, rexio.Position.X, rexio.Position.Y - 28, true, 7)
    COMMON.FaceEachother(rexio, tidy)

    SOUND:PlayBGM("Base Town.ogg", true)
    UI:SetSpeaker(tidy)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Alrighty![pause=10] Hope I didn't miss a spot!")

    COMMON.FaceEachother(rexio, mouse)
    UI:SetSpeaker(mouse)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Hey, Tidy.")

    COMMON.FaceEachother(tidy, mouse)
    UI:SetSpeaker(mouse)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("My turn.")

    UI:SetSpeaker(tidy)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue("...I'll try.")

    GROUND:MoveToMarker(tidy, MRKR("exit_1"), true, 5)
    GROUND:MoveToPosition(tidy, mouse.Position.X + 18, mouse.Position.Y, false, 4)
    COMMON.FaceEachother(tidy, mouse)
    SOUND:StopBGM()

    SOUND:PlaySE("Battle/DUN_Tail_Whip")
    GROUND:CharSetAnim(tidy, "Rotate", false)
    GAME:WaitFrames(45)
    SOUND:PlaySE("Battle/EVT_Minigame_Wrong")

    GAME:WaitFrames(80)
    COMMON.CharSweating("Tidy")
    GAME:WaitFrames(40)
    for i = 1, 2, 1 do
        SOUND:PlaySE("Battle/DUN_Tail_Whip")
        GROUND:CharSetAnim(tidy, "Rotate", false)
        GAME:WaitFrames(18)
    end
    GAME:WaitFrames(30)
    SOUND:PlaySE("Battle/EVT_Minigame_Wrong")

    GAME:WaitFrames(120)
    COMMON.CharSweatdrop("Tidy")

    GROUND:MoveToPosition(tidy, mouse.Position.X + 25, mouse.Position.Y, true, 7)
    COMMON.FaceEachother(tidy, mouse)
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
    SV.entoh_town.HelperChapter = 0
end