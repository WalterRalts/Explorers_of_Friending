North = {}

function North.Upward()
      --Introduce the "sire" team
      SV.tablestats.bluetail_stats = GAME:GetPlayerPartyTable()

      GAME:RemovePlayerTeam(0)
      GAME:RemovePlayerTeam(0)
      GAME:RemovePlayerTeam(0)

      local mon_id = RogueEssence.Dungeon.MonsterID("quagsire", 0, "normal", Gender.Male)

      local p = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id, 50, "", 0)
      p.IsFounder = false
      p.IsPartner = true
      p.Nickname = "Sire Quag"

      _DATA.Save.ActiveTeam.Players:Add(p)

      mon_id = RogueEssence.Dungeon.MonsterID("clodsire", 0, "normal", Gender.Male)

      p = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id, 50, "", 0)
      p.IsFounder = false
      p.IsPartner = true
      p.Nickname = "Sire Clod"

      _DATA.Save.ActiveTeam.Players:Add(p)

      mon_id = RogueEssence.Dungeon.MonsterID("bellsprout", 0, "normal", Gender.Male)

      p = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id, 50, "", 0)
      p.IsFounder = false
      p.IsPartner = true
      p.Nickname = "Sire Sproutious"

      _DATA.Save.ActiveTeam.Players:Add(p)

      mon_id = RogueEssence.Dungeon.MonsterID("bellsprout", 0, "normal", Gender.Male)

      p = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id, 50, "", 0)
      p.IsFounder = false
      p.IsPartner = true
      p.Nickname = "Sire Skits"

      _DATA.Save.ActiveTeam.Players:Add(p)

      mon_id = RogueEssence.Dungeon.MonsterID("pinsir", 0, "normal", Gender.Male)

      p = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id, 50, "", 0)
      p.IsFounder = false
      p.IsPartner = true
      p.Nickname = "Sire Pin"

      _DATA.Save.ActiveTeam.Players:Add(p)

      --Story start
      COMMON.RespawnAllies()
      GAME:CutsceneMode(true)
      local kassy = CH("Kassy")
      local quag = CH("PLAYER")
      local clod = CH("Teammate1")
      local sprout = CH("Teammate2")
      local skits = CH("Teammate3")
      local pins = CH("Teammate4")

      local coro3 = TASK:BranchCoroutine(function()
            GAME:MoveCamera(MRKR("k1").Position.X, MRKR("k1").Position.Y, 1, false)
            EXPLCOMMON.TeleportToMarker(kassy, "NorthEnter", Dir8.Down)
            end)
      local coro4 = TASK:BranchCoroutine(function()
            GAME:FadeIn(60)
            UI:SetSpeaker(kassy)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Everything is falling into place...")
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("The beast will get whatever this is, and I...[pause=40] I'll be free...!")
            end)
      TASK:JoinCoroutines({coro3, coro4})

      EXPLCOMMON.SetCharAndEmotion("none")
      UI:WaitShowDialogue("Hold it right here, criminal scum!")

      local function what()
            EXPLCOMMON.CharRealizeHeavy("Kassy")
      end
      local function huh()
            GROUND:CharAnimateTurnTo(kassy, Dir8.Up, 3)
            GAME:WaitFrames(10)
      end
      local function ohno()
            GROUND:CharAnimateTurnTo(kassy, Dir8.Up, 3)
      end
      
      UI:SetSpeaker(kassy)
      UI:SetSpeakerEmotion("Surprised")
      UI:WaitShowDialogue("([script=0]...what?![script=1] How did-...? ...no way...)", {what, huh, ohno})
      --Epic music for epic Team Sire!

      --Hmm, GTI reference, mhm?
      GAME:MoveCamera(quag.Position.X, GAME:GetCameraCenter().Y, 1, false)
      UI:SetSpeaker(quag)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Mhm, you're not allowed to take things that aren't yours, hmm?")

      UI:SetSpeaker(clod)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Hmm, that's considered stealing, you know, mhm?")

      UI:SetSpeaker(quag)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Mhm, we're gonna half to take it back and arrest you, hmm?")

      UI:SetSpeaker(kassy)
      UI:SetSpeakerEmotion("Stunned")
      UI:WaitShowDialogue("But I have nothing on my person[pause=10], you must have the wrong guy.")

      UI:SetSpeaker(pins)
      UI:SetSpeakerEmotion("Sigh")
      UI:WaitShowDialogue("...thinks we're stupid.")

      UI:SetSpeaker(sprout)
      UI:SetSpeakerEmotion("Stunned")
      UI:WaitShowDialogue("The tide has changed. It is now highly likely our best interest to stop you right here.")

      COMMON.BossTransition(false)
end