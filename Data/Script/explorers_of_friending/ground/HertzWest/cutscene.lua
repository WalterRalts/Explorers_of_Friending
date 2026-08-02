Line = {}

function Line.Mission()
      GAME:FadeIn(45)
      COMMON.RespawnAllies()
      local azura = CH("Teammate1")
      local rexio = CH("Teammate2")
      local maru = CH("PLAYER")
      local crooke = CH("Crooke")

      EXPLCOMMON.SetCharAndEmotion(maru, "Stunned")
      UI:WaitShowDialogue("...")
      EXPLCOMMON.AllyFollow(false, false)
end