Darker = {}

function Darker.Spotlight()
      COMMON.RespawnAllies()
      SV.guilders.fielded_two = true
      local maru = CH("PLAYER")
      local azura = CH("Teammate1")
      local rexio = CH("Teammate2")
      maru.CollisionDisabled = true
      azura.CollisionDisabled = true
      rexio.CollisionDisabled = true
      GROUND:Hide("PLAYER")
      GROUND:Hide("Teammate1")
      GROUND:Hide("Teammate2")
      GROUND:Hide("spot_a")
      GROUND:Hide("spot_b")
      GROUND:Hide("spot_c")
      GAME:FadeIn(60)

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Well, this is helpful.")

      UI:SetSpeaker(rexio)
      UI:SetSpeakerEmotion("Shouting")
      UI:WaitShowDialogue("Helloooooooo?![pause=45] Treasuuuuuuuuure?!")

      GAME:WaitFrames(95)

      UI:SetSpeaker(rexio)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("Yep, nothing, let's go somewhere else for treasure!")

      SOUND:PlaySE("Battle/DUN_Octazooka")
      GROUND:Unhide("PLAYER")
      GROUND:Unhide("spot_a")

      GAME:WaitFrames(15)
      EXPLCOMMON.CharRealize("PLAYER")
      for i = 1, 4, 1 do
            GROUND:CharAnimateTurnTo(maru, GAME:RandomDirection(), 4)
            GAME:WaitFrames(15)
      end

      EXPLCOMMON.SetCharAndEmotion("none")
      UI:WaitShowDialogue("Name!")

      EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
      UI:WaitShowDialogue("Huh? Oh, uh...")

      GROUND:CharAnimateTurnTo(maru, Dir8.Down, 4)
      EXPLCOMMON.CharHop("PLAYER")
      UI:WaitShowDialogue("Maru.[pause=45] Maru Bluetail!")

      GAME:WaitFrames(85)
      for i = 1, 2, 1 do
            GROUND:CharAnimateTurnTo(maru, GAME:RandomDirection(), 4)
            GAME:WaitFrames(25)
      end

      local function a_spot()
            SOUND:PlaySE("Battle/DUN_Octazooka")
            GROUND:Unhide("Teammate1")
            GROUND:Unhide("spot_b")

            GROUND:CharTurnToChar(maru, azura)
            EXPLCOMMON.CharRealize("Teammate1")
      end

      EXPLCOMMON.SetCharAndEmotion(maru, "Worried")
      UI:WaitShowTimedDialogue("Wait... was that it or...?[script=0]", 40, {a_spot})

      SOUND:PlaySE("Battle/DUN_Octazooka")
      EXPLCOMMON.SetCharAndEmotion(maru, "Stunned")
      UI:WaitShowTimedDialogue("Oh, okay.", 50)

      EXPLCOMMON.SetCharAndEmotion("none")
      UI:WaitShowDialogue("Name!")

      local function r_spot()
            SOUND:PlaySE("Battle/DUN_Octazooka")
            GROUND:Unhide("Teammate2")
            GROUND:Unhide("spot_c")

            GROUND:CharTurnToChar(maru, rexio)
            EXPLCOMMON.StartAndStop(rexio, "Pose")
      end

      EXPLCOMMON.SetCharAndEmotion(azura, "Joyous")
      UI:WaitShowTimedDialogue("Azura Bluetail![pause=40] Yippe-[script=0]", 25, {r_spot})

      EXPLCOMMON.SetCharAndEmotion(azura, "Angry")
      UI:WaitShowDialogue("Rude!!")

      EXPLCOMMON.SetCharAndEmotion("none")
      UI:WaitShowDialogue("Name!")

      GROUND:CharTurnToChar(azura, rexio)
      GAME:WaitFrames(85)

      EXPLCOMMON.SetCharAndEmotion(rexio, "Normal")
      UI:WaitShowTimedDialogue("[speed=0.6]...my name...[pause=45] is Rexio.[pause=90] Last name, Aurm;[pause=45] son of Lucas and Lilly.[pause=45] My mission[pause=30] is t-", 20)

      EXPLCOMMON.SetCharAndEmotion("none")
      UI:WaitShowDialogue("Okay, shut up! You're intruders, keep the stupid little stories for the sheriff!")

      GROUND:CharSetAnim(rexio, "Idle", false)
      GROUND:CharAnimateTurnTo(rexio, Dir8.Up, 3)
      EXPLCOMMON.SetCharAndEmotion(rexio, "Surprised")
      UI:WaitShowDialogue("Huh?!")

      EXPLCOMMON.SetCharAndEmotion(maru, "Worried")
      UI:WaitShowDialogue("We were just looking around for treasure.[pause=40][emote=Normal] We can leave, it's fine.")

      EXPLCOMMON.SetCharAndEmotion("none")
      UI:WaitShowDialogue("The treasure?! Treasure of the Hertz?!")

      EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
      UI:WaitShowDialogue("Nah, something that belongs to our guildmaster's friend.")

      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      EXPLCOMMON.SetCharAndEmotion(azura, "Happy")
      UI:WaitShowDialogue("Ms. Kitty... I think!")
      GROUND:CharAnimateTurnTo(maru, Dir8.Up, 4)

      EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
      UI:WaitShowDialogue("Yeah, yeah her.")

      EXPLCOMMON.SetCharAndEmotion("none")
      UI:WaitShowTimedDialogue("...", 90)
      SOUND:PlaySE("Battle/DUN_Octazooka")
      GROUND:Hide("PLAYER")
      GROUND:Hide("Teammate1")
      GROUND:Hide("Teammate2")
      GROUND:Hide("spot_a")
      GROUND:Hide("spot_b")
      GROUND:Hide("spot_c")
      GAME:WaitFrames(90)

      SOUND:PlaySE("Battle/DUN_Octazooka")
      GAME:EnterGroundMap("Osias", "cutmark")
end