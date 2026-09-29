Vault = {}

function Vault.CannotOpen()
      COMMON.RespawnAllies()
      GAME:CutsceneMode(true)
      local azura = CH("Teammate1")
      local rexio = CH("Teammate2")
      local maru = CH("PLAYER")
      local coro3 = TASK:BranchCoroutine(function() 
            GROUND:AnimateToPosition(azura, "Walk", Dir8.Up, azura.Position.X, azura.Position.Y - 40, 0.3, 0.6, 0)
            end)
      local coro4 = TASK:BranchCoroutine(function()
            GROUND:AnimateToPosition(rexio, "Walk", Dir8.Up, rexio.Position.X, rexio.Position.Y - 40, 0.3, 0.6, 0)
            end)
      local coro5 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(15)
            GROUND:AnimateToPosition(maru, "Walk", Dir8.Up, maru.Position.X, maru.Position.Y - 40, 0.3, 0.6, 0)
            end)
      local coro6 = TASK:BranchCoroutine(function()
            GAME:FadeIn(50)
            end)
      TASK:JoinCoroutines({coro3, coro4, coro5, coro6})

      EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
      UI:WaitShowDialogue("...hm.[pause=30] Looks like a dead end.")

      EXPLCOMMON.SetCharAndEmotion(azura, "Worried")
      UI:WaitShowDialogue("What's that?")

      EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
      UI:WaitShowDialogue("Oh?[pause=20] That symbol?[pause=0] Good question,[emote=Worried] no idea.")

      EXPLCOMMON.SetCharAndEmotion(rexio, "Worried")
      UI:WaitShowDialogue("Whatever,[pause=30] the treasure is probably somewhere else anyway.[pause=30][emote=Happy] Let's go.")
      GAME:CutsceneMode(false)
      EXPLCOMMON.AllyFollow(false, false)
end