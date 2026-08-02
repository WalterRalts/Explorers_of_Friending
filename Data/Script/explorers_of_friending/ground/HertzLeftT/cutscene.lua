Line = {}

function Line.Mission()
      COMMON.RespawnAllies()
      GAME:FadeIn(45)
      local azura = CH("Teammate1")
      local rexio = CH("Teammate2")
      local maru = CH("PLAYER")

      EXPLCOMMON.CharRealize("Teammate2")
      EXPLCOMMON.SetCharAndEmotion(rexio, "Stunned")
      UI:WaitShowDialogue("Woah.")

      EXPLCOMMON.SetCharAndEmotion(azura, "Stunned")
      UI:WaitShowDialogue("What's the big line for?")

      EXPLCOMMON.SetCharAndEmotion(maru, "Stunned")
      UI:WaitShowDialogue("I dunno, something for a line, maybe.")
      EXPLCOMMON.AllyFollow(false, false)
end