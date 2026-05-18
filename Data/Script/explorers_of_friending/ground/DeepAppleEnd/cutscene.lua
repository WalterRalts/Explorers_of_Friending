Seed = {}

function Seed.AppleOut()
    COMMON.RespawnAllies()
    GAME:CutsceneMode(true)
    GAME:MoveCamera(168, 120, 0, false)
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    local gold = OBJ("GoldApple")
    maru.CollisionDisabled = true
    azura.CollisionDisabled = true
    rexio.CollisionDisabled = true

    local the1 = TASK:BranchCoroutine(function()
        local wh2 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(rexio, gold.Position.X, gold.Position.Y + 50, false, 5)
            end)
        local wh3 = TASK:BranchCoroutine(function()
            GAME:FadeIn(60)
            end)
        TASK:JoinCoroutines({wh2, wh3})
        end)
    local the2 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(30)
        GROUND:MoveToPosition(azura, rexio.Position.X + 12, rexio.Position.Y + 50, false, 2)
        end)
    local the3 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(35)
        GROUND:MoveToPosition(maru, rexio.Position.X - 12, rexio.Position.Y + 40, true, 2)
        end)
    TASK:JoinCoroutines({the1, the2, the3})
    EXPLCOMMON.SetCharAndEmotion(rexio, "Inspired")
    UI:WaitShowDialogue("Whoa! Goooold!")

    GROUND:CharSetAnim(azura, "Sleep", true)
    EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
    UI:WaitShowDialogue("Well, that's neat.")

    GROUND:CharAnimateTurnTo(rexio, Dir8.Down, 3)
    EXPLCOMMON.SetCharAndEmotion(rexio, "Happy")
    UI:WaitShowDialogue("Knew we could do it. You worry too much, Bluetail")

    local function maru_concern()
        GROUND:CharTurnToCharAnimated(maru, azura, 3)
        EXPLCOMMON.CharSweatdrop("PLAYER")
    end
    EXPLCOMMON.SetCharAndEmotion(maru, "Happy")
    UI:WaitShowDialogue("I'm sure the guildmaster would love to see a gold apple[pause=30],[emote=Worried][script=0] but uh...", {maru_concern})

    GAME:WaitFrames(60)
    GROUND:MoveToPosition(rexio, azura.Position.X, rexio.Position.Y + 16, true, 2)

    local ah2 = TASK:BranchCoroutine(function()
        GROUND:CharSetAnim(rexio, "Attack", false)
        GAME:WaitFrames(40)
        end)
    local ah3 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(20)
        GROUND:AnimateToPosition(azura, "Sleep", azura.Direction, rexio.Position.X, rexio.Position.Y, 0.5, 2, 6)
        end)
    TASK:JoinCoroutines({ah2, ah3})

    EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
    UI:WaitShowDialogue("...I guess that works.")

    
    local ch2 = TASK:BranchCoroutine(function()
        local bh2 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(rexio, azura.Position.X, rexio.Position.Y + 80, true, 2)
            end)
        local bh3 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(rexio, azura.Position.X, rexio.Position.Y + 80, true, 2)
            end)
        TASK:JoinCoroutines({bh2, bh3})
        end)
    local ch3 = TASK:BranchCoroutine(function()
        GROUND:MoveToPosition(rexio, azura.Position.X, rexio.Position.Y + 16, true, 2)
        end)
    TASK:JoinCoroutines({ch2, ch3})

    GAME:GivePlayerItem("food_apple_golden")
    GAME:FadeOut(false, 30)
    GAME:CutsceneMode(false)
    GAME:EnterGroundMap("guild_field", "GuildFieldMain", "Start2")
end