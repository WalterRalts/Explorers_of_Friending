Mayor = {}

function Mayor.Intro()
    GAME:SetCanSwitch(false)
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    local coro3 = TASK:BranchCoroutine(function() 
        GROUND:AnimateToPosition(azura, "Walk", Dir8.Up, azura.Position.X, azura.Position.Y - 15, 0.5, 0.2, 0)
        end)
    local coro4 = TASK:BranchCoroutine(function() 
        GROUND:AnimateToPosition(rexio, "Walk", Dir8.Up, rexio.Position.X, rexio.Position.Y - 20, 0.4, 0.2, 0)
        GAME:WaitFrames(40)
        GROUND:CharAnimateTurnTo(rexio, Dir8.Left, 5)
        end)
    local coro5 = TASK:BranchCoroutine(function() 
        GAME:WaitFrames(25)
        GROUND:AnimateToPosition(maru, "Walk", Dir8.Up, maru.Position.X, maru.Position.Y - 15, 0.4, 0.2, 0)
        end)
    local coro6 = TASK:BranchCoroutine(function()
        GAME:FadeIn(90)
        GAME:WaitFrames(40)
        COMMON.SetCharAndEmotion(maru, "Normal")
        UI:WaitShowDialogue("Nope, not seeing any big apples...[pause=30] or small apples.")

        COMMON.SetCharAndEmotion(azura, "Normal")
        UI:WaitShowDialogue("I see what you did there...")

        COMMON.SetCharAndEmotion(rexio, "Worried")
        UI:WaitShowDialogue("...this was a waste...")
        end)
    TASK:JoinCoroutines({coro3, coro4, coro5, coro6})

    COMMON.SetCharAndEmotion(maru, "Normal")
    UI:WaitShowDialogue("We'll just get apples in the forest again.")

    local c1 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(15)
        GROUND:AnimateToPosition(azura, "Walk", Dir8.Down, azura.Position.X, azura.Position.Y + 15, 0.5, 1, 0)
        COMMON.CharRealizeHeavy("Teammate1")
        end)
    local c2 = TASK:BranchCoroutine(function() 
        GROUND:AnimateToPosition(rexio, "Walk", Dir8.Down, rexio.Position.X, rexio.Position.Y + 15, 0.4, 0.5, 0)
        COMMON.CharRealizeHeavy("Teammate2")
        end)
    local c3 = TASK:BranchCoroutine(function() 
        GAME:WaitFrames(25)
        GROUND:AnimateToPosition(maru, "Walk", Dir8.Down, maru.Position.X, maru.Position.Y + 15, 0.4, 0.5, 0)
        COMMON.CharRealizeHeavy("PLAYER")
        end)
    local c4 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(20)
        for i = 1, 6, 1 do
            GROUND:Unhide("wall_" .. i)
            SOUND:PlayBattleSE("DUN_Explosion")
            GAME:WaitFrames(40 - 6 * i)
        end
        end)
    TASK:JoinCoroutines({c1, c2, c3, c4})

    COMMON.SetCharAndEmotion(rexio, "Surprised")
    UI:WaitShowDialogue("Oh what?! This again...!")

    GAME:MoveCamera(200, 120, 30, false)
    for i = 1, 3, 1 do
        GROUND:Unhide("ama_" .. i)
        SOUND:PlayBattleSE("DUN_Explosion")
        GAME:WaitFrames(50 - 10 * i)
    end

    COMMON.SetCharAndEmotion(maru, "Stunned")
    UI:WaitShowDialogue("Oh geez, not again...")

    COMMON.SetCharAndEmotion(azura, "Determined")
    UI:WaitShowDialogue("Every time when we need apples...!")

    COMMON.SetCharAndEmotion(rexio, "Stunned")
    UI:WaitShowDialogue("...let's... do it I guess?")
    
    COMMON.BossTransition(false)
    GAME:ContinueDungeon("apple_forest", 1, 0, 0)
end

function Mayor.Ender()
    GAME:SetCanSwitch(false)
    GAME:FadeIn(30)
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    COMMON.SetCharAndEmotion(maru, "Stunned")
    UI:WaitShowDialogue("Well, that was something.")

    COMMON.SetCharAndEmotion(azura, "Happy")
    UI:WaitShowDialogue("Now we can leave!")

    COMMON.FaceEachother(maru, rexio)
    COMMON.SetCharAndEmotion(rexio, "Worried")
    UI:WaitShowDialogue("...something doesn't feel right again.")

    COMMON.SetCharAndEmotion(maru, "Stunned")
    UI:WaitShowDialogue("Did you sense something?")

    COMMON.SetCharAndEmotion(rexio, "Worried")
    UI:WaitShowDialogue("...[pause=45]maybe.")
end