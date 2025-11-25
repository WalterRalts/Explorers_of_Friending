require 'explorers_of_friending.common'

Center = {}

function Center.Feeling()
    local rexio = CH("PLAYER")
    GAME:CutsceneMode(true)
    GAME:FadeIn(30)
    COMMON.CharExclaim("PLAYER")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("(Not just dad![pause=45] Everyone!)")

    GAME:WaitFrames(90)
    GROUND:CharAnimateTurn(rexio, Direction.Left, 1, false)
    COMMON.CharSweatdrop("PLAYER")
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("(Guess I have the place to myself for a while.)")

    GROUND:CharAnimateTurn(rexio, Direction.Left, 8, false)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("(The heck did everyone go?![pause=40] And without telling me!)")

    GAME:CutsceneMode(false)
end

function Center.AnotherFeeling()
    SV.entoh_town.HelperChapter = 9
    local rexio = CH("PLAYER")
    local coro01 = TASK:BranchCoroutine(function()
        GROUND:AnimateToPosition(rexio, "Walk", Dir8.Up, rexio.Position.X, rexio.Position.Y - 245, 0.4, 1, 0)
        end)	
    local coro02 = TASK:BranchCoroutine(function()
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Sad")
        UI:WaitShowTimedDialogue("...", 120)
        end)
    local coro03 = TASK:BranchCoroutine(function() 
        GAME:FadeIn(180)
        end)
    TASK:JoinCoroutines({coro01, coro02, coro03})

    GAME:WaitFrames(90)
    GROUND:CharAnimateTurn(rexio, Direction.Left, 6, false)
    GAME:WaitFrames(90)
    GROUND:CharAnimateTurn(rexio, Direction.Right, 6, false)
    GAME:WaitFrames(120)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("(I should just...[pause=40] go home.)")
end