Apple = {}

function Apple.Tour()
    GAME:SetCanSwitch(false)
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")

    UI:WaitShowTitle("Chapter 1: Appling Away", 180)

    GROUND:TeleportTo(azura, maru.Position.X - 34, maru.Position.Y, Dir8.Up, 0)
    GROUND:TeleportTo(rexio, maru.Position.X + 34, maru.Position.Y, Dir8.Up, 0)
    local coro3 = TASK:BranchCoroutine(function()
        GROUND:AnimateToPosition(azura, "Walk", Dir8.Up, azura.Position.X, azura.Position.Y - 75, 0.7, 1, 0)
        EXPLCOMMON.CharExclaim("Teammate1")
        GAME:WaitFrames(15)
        EXPLCOMMON.CharHop("Teammate1")
        EXPLCOMMON.SetCharAndEmotion(azura, "Surprised")
        end)
    local coro4 = TASK:BranchCoroutine(function()
        GROUND:AnimateToPosition(rexio, "Walk", Dir8.Up, rexio.Position.X, rexio.Position.Y - 75, 0.4, 1, 0)
        end)
    local coro5 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(25)
        GROUND:AnimateToPosition(maru, "Walk", Dir8.Up, maru.Position.X, maru.Position.Y - 75, 0.5, 1, 0)
        end)
    local coro6 = TASK:BranchCoroutine(function()
        GAME:FadeIn(90)
        end)
    TASK:JoinCoroutines({coro3, coro4, coro5, coro6})

    local the1 = TASK:BranchCoroutine(function()
        EXPLCOMMON.CharRealize("Teammate2")
        GROUND:CharTurnToCharAnimated(rexio, azura)
        end)
    local the2 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(6)
        EXPLCOMMON.CharRealize("PLAYER")
        GROUND:CharTurnToCharAnimated(maru, azura)
        end)
    local the3 = TASK:BranchCoroutine(function()
        UI:WaitHideTitle(60)
        UI:WaitShowDialogue("AAAAAAAAAAAAAAAAAAAAAAAAAA!!!!")
        end)
    TASK:JoinCoroutines({the1, the2, the3})
    EXPLCOMMON.SetCharAndEmotion(maru, "Stunned")
    UI:WaitShowDialogue("Azu???")

    EXPLCOMMON.SetCharAndEmotion(azura, "Inspired")
    UI:WaitShowDialogue("Apple[speed=0.2]eeee[emote=Joyous]eeeeeeeeeee!!!! [pause=50][speed=1.0]It's huuuuuu[emote=Shouting]uuuuuuuuuuuge!!!!")

    local function Whoa()
        GROUND:CharAnimateTurnTo(maru, Dir8.Up, 2)
        GAME:MoveCamera(0, -160, 30, true)
    end
    EXPLCOMMON.SetCharAndEmotion(maru, "Stunned")
    UI:WaitShowDialogue("What...? [script=0]W[emote=Surprised]hoa!", {Whoa})

    local the01 = TASK:BranchCoroutine(function()
        GAME:MoveCamera(0, 0, 60, true)
        EXPLCOMMON.FaceEachother(maru, rexio)
        GROUND:AnimateToPosition(azura, "Walk", Dir8.Up, 247, 348, 2, 1, 0)
        end)
    local the02 = TASK:BranchCoroutine(function()
        GROUND:CharAnimateTurnTo(rexio, Dir8.Up, 2)
       EXPLCOMMON.SetCharAndEmotion(rexio, "Normal")
        UI:WaitShowDialogue("Huh, not bad.[pause=30] Guess this wasn't a pointless trip, but...")
       EXPLCOMMON.SetCharAndEmotion(rexio, "Sigh")
        UI:WaitShowDialogue("...we still have to do the boring part.[pause=35] Getting more apples...")
        end)
    TASK:JoinCoroutines({the01, the02})

   EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
    UI:WaitShowDialogue("I'm sure the locals will know.[pause=40] For obvious reasons.")

   EXPLCOMMON.SetCharAndEmotion(rexio, "Worried")
    UI:WaitShowDialogue("Boooooooooooring.[pause=50] I'll ask someone, I gueeeeeeeess.")

   EXPLCOMMON.SetCharAndEmotion(maru, "Stunned")
    UI:WaitShowDialogue("You could at least try to enjoy this, you know.")

    local athe01 = TASK:BranchCoroutine(function()
        EXPLCOMMON.CharSweatdrop("Teammate2")
        GAME:WaitFrames(25)
        GROUND:CharAnimateTurnTo(rexio, Dir8.UpRight, 2)
        GAME:WaitFrames(35)
        GROUND:AnimateToPosition(rexio, "Walk", Dir8.UpRight, 514, 312, 1, 1, 0)
        GROUND:CharAnimateTurnTo(rexio, Dir8.UpLeft, 2)
        end)
    local athe02 = TASK:BranchCoroutine(function()
       EXPLCOMMON.SetCharAndEmotion(rexio, "Sigh")
        UI:WaitShowTimedDialogue("I enjoy what's fun, Maru.[pause=45] This is not.", 90)
        end)
    TASK:JoinCoroutines({athe01, athe02})

   EXPLCOMMON.CharSweating("PLAYER")
    GAME:WaitFrames(25)
   EXPLCOMMON.SetCharAndEmotion(maru, "Stunned")
    UI:WaitShowDialogue("[speed=0.5]...")

    SV.guild.areas.west[1] = {
        Flag = true,
        Zone = "apple_forest",
        ID = 0,
        Entry = 0
    }
    SV.apple_town.visited = true
end