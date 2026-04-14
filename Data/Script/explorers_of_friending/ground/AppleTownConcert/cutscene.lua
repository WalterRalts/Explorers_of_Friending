AppleCon = {}

function AppleCon.Concert()
      local maru = CH("PLAYER")
      GAME:WaitFrames(25)
      GROUND:CharAnimateTurnTo(maru, Dir8.Up, 4)
      GAME:WaitFrames(15)
      GROUND:CharAnimateTurnTo(maru, Dir8.Down, 4)
      GAME:WaitFrames(15)
      GROUND:CharAnimateTurnTo(maru, Dir8.Left, 4)

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("I don't think I'll find anything here.")
end