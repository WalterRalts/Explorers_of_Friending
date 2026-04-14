Hertz = {}

function Hertz.GuildUp()
    COMMON.RespawnAllies()
    GAME:CutsceneMode(true)
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    local maru = CH("PLAYER")

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

    GAME:CutsceneMode(false)
end