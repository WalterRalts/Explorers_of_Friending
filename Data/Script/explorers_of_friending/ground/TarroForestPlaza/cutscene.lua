Plaza = {}

function Plaza.Fail()
      local maru = CH("PLAYER")
      local azura = CH("Teammate1")
      local cater = CH('Catering')

      GROUND:TeleportTo(cater, maru.Position.X + 30, (maru.Position.Y + azura.Position.Y) / 2, Dir8.Left, 0)

      GAME:CutsceneMode(true)
      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Pain")
      UI:WaitShowDialogue("Yeesh...")

      UI:SetSpeaker(azura)
      UI:SetSpeakerEmotion("Dizzy")
      UI:WaitShowDialogue("...too dark...")

      GAME:FadeIn(30)
      EXPLCOMMON.CharHappyHop("Catering")
      UI:SetSpeaker(cater)
      UI:SetSpeakerEmotion("Inspired")
      UI:WaitShowDialogue("Oh, wow![pause=40] Explorers!")

      UI:SetSpeaker(azura)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("Huh...?")

      UI:SetSpeaker(cater)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("You guys are explorers, that's so cool!")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("No, we're just trying to figure something out.")

      UI:SetSpeaker(cater)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("Oh...")
      GROUND:CharAnimateTurnTo(cater, Dir8.Down, 6)
      UI:WaitShowDialogue("Okay.")
end