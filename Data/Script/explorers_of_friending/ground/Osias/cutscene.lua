Dreset = {}

function Dreset.Guild()
      COMMON.RespawnAllies()
      local maru = CH("PLAYER")
      local azura = CH("Teammate1")
      local rexio = CH("Teammate2")
      local embu = CH("Emburst")
      GAME:WaitFrames(45)
      UI:SetSpeaker(embu)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("...I guess children technically can't be sheriffed away anyway.")
      UI:SetSpeakerEmotion("Normal")

      local function question()
            EXPLCOMMON.CharQuestion("Emburst")
      end
      UI:WaitShowDialogue("You're looking for,[pause=40] who was it,[pause=25][script=0] Kitkat?", {question})

      UI:SetSpeaker(rexio)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("You know her?")

      local function up()
            GROUND:CharAnimateTurnTo(embu, Dir8.Up, 5)
      end
      UI:SetSpeaker(embu)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Nah, guild master does, she's outside.[script=0] Just go straight ahead.", {up})
      local coro1 = TASK:BranchCoroutine(function()
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Not many of us here today,[pause=40] so I don't think you're allowed to go anywhere else.")
            UI:WaitShowDialogue("So, yeah, just go ask her about it and leave, will ya?")
      end)
      local coro2 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(40)
            GROUND:MoveToMarker(embu, MRKR("Flared"), false, 1)
            GROUND:CharAnimateTurnTo(embu, Dir8.DownLeft, 5)
      end)
      TASK:JoinCoroutines({coro1, coro2})
      SV.Story.sect = 3
      EXPLCOMMON.AllyFollow(false, false)
end