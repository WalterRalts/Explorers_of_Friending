Bottom = {}

function Bottom.Key()
      GAME:CutsceneMode(true)
      COMMON.RespawnAllies()
      local azura = CH("Teammate1")
      local rexio = CH("Teammate2")
      local maru = CH("PLAYER")
      local hertz = CH("HertzMaster")

      --Maru and gang make it here
      EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
      UI:WaitShowDialogue("Looks like we made it.")

      EXPLCOMMON.SetCharAndEmotion(azura, "Happy")
      UI:WaitShowDialogue("Yay, yippee, yay!")

      EXPLCOMMON.SetCharAndEmotion(hertz, "Happy")
      local function charger()
            SOUND:PlaySE("Battle/DUN_Charge_Start")
            GAME:WaitFrames(15)
            SOUND:PlaySE("Battle/DUN_Charge")
            GROUND:CharWaitAnim(hertz, "Charge")
            SOUND:PlaySE("Battle/DUN_Discharge_2")
            GROUND:CharWaitAnim(hertz, "Shock")
            GROUND:CharSetAnim(hertz, "Idle", false)
      end
      UI:WaitShowDialogue("Simple enough with the [script=0]Guildmaster!", {charger})

      EXPLCOMMON.SetCharAndEmotion(rexio, "Worried")
      UI:WaitShowDialogue("Yeah, yeah, whatever,[emote=Happy] key time, where is it?")

      GROUND:CharAnimateTurnTo(rexio, GAME:RandomDirection(), 3)
      GAME:WaitFrames(15)
      GROUND:CharAnimateTurnTo(rexio, GAME:RandomDirection(), 3)
      GAME:WaitFrames(15)

      --Rexio gets key
      GAME:MoveCamera(OBJ("Key").X, OBJ("Key").Y, 60, false)

      EXPLCOMMON.SetCharAndEmotion(rexio, "Inspired")
      UI:WaitShowDialogue("There!")
      --They leave
      --Hooray! But WAIT...!
      --Sneaky sneaky Cacturne...
      GAME:CutsceneMode(false)
end