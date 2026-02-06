Hertz = {}

function Hertz.DesertTown()
    COMMON.RespawnAllies()
    GAME:CutsceneMode(true)
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    local maru = CH("PLAYER")

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
        GAME:FadeIn(30)
        end)

    TASK:JoinCoroutines({coro3, coro4, coro5, coro6})

    local cor3 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(15)
        GROUND:MoveToMarker(one, MRKR("m0"), true, 6)
        end)
    local cor4 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(25)
        GROUND:MoveToMarker(two, MRKR("m1"), true, 6)
        end)
    local cor5 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(20)
        GROUND:MoveToMarker(thr, MRKR("m2"), true, 6)
        end)
    local cor6 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(10)
        GROUND:MoveToMarker(fou, MRKR("m3"), false, 3)
        end)
    TASK:JoinCoroutines({cor3, cor4, cor5, cor6})

    local look = TASK:BranchCoroutine(function()
        local c3 = TASK:BranchCoroutine(function() 
            while turner do
                    GROUND:CharAnimateTurnTo(one, GAME:RandomDirection(), 4)
                    GAME:WaitFrames(70)
                end
            end)
        local c4 = TASK:BranchCoroutine(function()
            while turner do
                    GROUND:CharAnimateTurnTo(two, GAME:RandomDirection(), 4)
                    GAME:WaitFrames(70)
                end
            end)
        local c5 = TASK:BranchCoroutine(function()
            while turner do
                    GROUND:CharAnimateTurnTo(thr, GAME:RandomDirection(), 4)
                    GAME:WaitFrames(70)
                end
            end)
        local c6 = TASK:BranchCoroutine(function()
            while turner do
                    GROUND:CharAnimateTurnTo(fou, GAME:RandomDirection(), 4)
                    GAME:WaitFrames(70)
                end
            end)
        TASK:JoinCoroutines({c3, c4, c5, c6})
    end
    )

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

end