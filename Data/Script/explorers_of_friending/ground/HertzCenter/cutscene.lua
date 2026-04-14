Hertz = {}

function Hertz.DesertTown()
    COMMON.RespawnAllies()
    GAME:CutsceneMode(true)
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    local maru = CH("PLAYER")
    local turner = true

    GROUND:Unhide("one")
    GROUND:Unhide("two")
    GROUND:Unhide("three")
    GROUND:Unhide("four")
    local one = CH("one")
    local two = CH("two")
    local thr = CH("three")
    local fou = CH("four")
    one.CollisionDisabled = true
    two.CollisionDisabled = true
    thr.CollisionDisabled = true
    fou.CollisionDisabled = true
    local coro3 = TASK:BranchCoroutine(function() 
        GROUND:AnimateToPosition(azura, "Walk", Dir8.Up, azura.Position.X, azura.Position.Y - 45, 0.3, 0.6, 0)
        end)
    local coro4 = TASK:BranchCoroutine(function()
        GROUND:AnimateToPosition(rexio, "Walk", Dir8.Up, rexio.Position.X, rexio.Position.Y - 45, 0.3, 0.6, 0)
        end)
    local coro5 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(15)
        GROUND:AnimateToPosition(maru, "Walk", Dir8.Up, maru.Position.X, maru.Position.Y - 65, 0.3, 0.6, 0)
        end)
    local coro6 = TASK:BranchCoroutine(function()
        GAME:FadeIn(50)
        end)
    TASK:JoinCoroutines({coro3, coro4, coro5, coro6})
    SOUND:StopBGM()
   EXPLCOMMON.SetCharAndEmotion("none", "Worried")
    UI:WaitShowDialogue("BOSS![pause=50] BOSS!")

    local a = TASK:BranchCoroutine(function()
        local cor3 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(15)
            GROUND:MoveToMarker(one, MRKR("m0"), true, 6)
            end)
        local cor4 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(25)
            GROUND:MoveToMarker(two, MRKR("m1"), true, 6)
            end)
        TASK:JoinCoroutines({cor3, cor4})
        end)
    local b = TASK:BranchCoroutine(function()
        local cor5 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(20)
            GROUND:MoveToMarker(thr, MRKR("m2"), true, 6)
            end)
        local cor6 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(10)
            GROUND:MoveToMarker(fou, MRKR("m3"), false, 6)
            end)
        TASK:JoinCoroutines({cor5, cor6})
        end)
    TASK:JoinCoroutines({a, b})

    --maybe put a song here...?

    local look = TASK:BranchCoroutine(function()
        local ca3 = TASK:BranchCoroutine(function()
            while turner do
                    GROUND:CharAnimateTurnTo(one, GAME:RandomDirection(), 4)
                    GAME:WaitFrames(30)
                end
            end)
        local ca4 = TASK:BranchCoroutine(function()
            while turner do
                    GROUND:CharAnimateTurnTo(two, GAME:RandomDirection(), 4)
                    GAME:WaitFrames(20)
                end
            end)
        local ca5 = TASK:BranchCoroutine(function()
            while turner do
                    GROUND:CharAnimateTurnTo(thr, GAME:RandomDirection(), 4)
                    GAME:WaitFrames(25)
                end
            end)
        local ca6 = TASK:BranchCoroutine(function()
            while turner do
                    GROUND:CharAnimateTurnTo(fou, GAME:RandomDirection(), 4)
                    GAME:WaitFrames(20)
                end
            end)
        TASK:JoinCoroutines({ca3, ca4, ca5, ca6})
        end)
    local talk = TASK:BranchCoroutine(function()
       EXPLCOMMON.SetCharAndEmotion(one, "Worried")
        UI:WaitShowDialogue("Where is he!?")
        UI:WaitShowDialogue("He said he would meet us here!")

       EXPLCOMMON.CharHop("two")
       EXPLCOMMON.SetCharAndEmotion(two, "Shouting")
        UI:WaitShowDialogue("He's late! He's late!")

        turner = false
       EXPLCOMMON.SetCharAndEmotion(thr, "Worried")
        UI:WaitShowDialogue("It's whatever, we can find and steal the treasure ourselves!")
        end)
    TASK:JoinCoroutines({look, talk})

    local co3 = TASK:BranchCoroutine(function() 
        GROUND:MoveToMarker(one, MRKR("m0_1"), true, 3)
        end)
    local co4 = TASK:BranchCoroutine(function()
        GROUND:MoveToMarker(two, MRKR("m1_1"), true, 3)
        end)
    local co5 = TASK:BranchCoroutine(function()
        GROUND:MoveToMarker(thr, MRKR("m2_1"), true, 3)
        end)
    local co6 = TASK:BranchCoroutine(function()
        GROUND:MoveToMarker(fou, MRKR("m3_1"), true, 3)
        end)
    TASK:JoinCoroutines({co3, co4, co5, co6})

   EXPLCOMMON.SetCharAndEmotion(maru, "Stunned")
    UI:WaitShowDialogue("...are we gonna pretend we didn't see or hear that?")

   EXPLCOMMON.SetCharAndEmotion(rexio, "Stunned")
    UI:WaitShowDialogue("Out loud.[pause=30] No stopping.[pause=30] Their entire plan.")

   EXPLCOMMON.SetCharAndEmotion(azura, "Stunned")
    UI:WaitShowDialogue("Wow...")

   EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
    UI:WaitShowDialogue("Guess we have to find the treasure first.")
    GAME:CutsceneMode(false)
end