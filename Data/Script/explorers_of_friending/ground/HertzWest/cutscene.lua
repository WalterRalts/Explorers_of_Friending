Line = {}

function Line.Short()
      COMMON.RespawnAllies()
      GAME:FadeIn(45)
      local azura = CH("Teammate1")
      local rexio = CH("Teammate2")
      local maru = CH("PLAYER")
      local crooke = CH("Crooke")

      EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
      UI:WaitShowDialogue("Huh. This line is shorter than I thought.")
      EXPLCOMMON.AllyFollow(false, false)
end