Line = {}

function Line.Short()
      COMMON.RespawnAllies()
      GAME:FadeIn(45)
      local azura = CH("Teammate1")
      local rexio = CH("Teammate2")
      local maru = CH("PLAYER")

      EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
      UI:WaitShowDialogue("Huh. This line is shorter than I thought.")
      EXPLCOMMON.AllyFollow(false, false)
end

function Line.Interrupt()
      GAME:CutsceneMode(true)
      COMMON.RespawnAllies()
      GAME:FadeIn(45)
      local azura = CH("Teammate1")
      local rexio = CH("Teammate2")
      local maru = CH("PLAYER")
      local excal = CH("Excaliber")
      local one = CH("one")
      local two = CH("two")
      local thr = CH("three")
      local fou = CH("four")
      local ar = CH("Ar")
      one.CollisionDisabled = true
      two.CollisionDisabled = true
      thr.CollisionDisabled = true
      fou.CollisionDisabled = true
      GROUND:Unhide("one")
      GROUND:Unhide("two")
      GROUND:Unhide("three")
      GROUND:Unhide("four")

      local function switch(a, b)
            local c1 = TASK:BranchCoroutine(function()
                  GROUND:MoveToPosition(a, b.Position.X, b.Position.Y, true, 2)
                  GROUND:CharAnimateTurnTo(a, Direction.Right, 4)
                  end)
            local c2 = TASK:BranchCoroutine(function()
                  GROUND:MoveToPosition(b, a.Position.X, a.Position.Y, true, 2)
                  GROUND:CharAnimateTurnTo(b, Direction.Right, 4)
                  end)
            TASK:JoinCoroutines({c1, c2})
      end
      if not West_visit then
            EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
            UI:WaitShowTimedDialogue("Huh. This line is shorter than I th", 1)
      end

      SOUND:StopBGM()
      EXPLCOMMON.SetCharAndEmotion(one, "Angry")
      UI:WaitShowDialogue("Hold it, chumps!")

      local coro3 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(15)
            GROUND:MoveToMarker(azura, MRKR("a1"), false, 1)
            end)
      local coro4 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(25)
            GROUND:MoveToMarker(rexio, MRKR("r1"), false, 1)
            end)
      local coro5 = TASK:BranchCoroutine(function()
            GROUND:MoveToMarker(maru, MRKR("m1"), false, 1)

            GAME:WaitFrames(15)
            EXPLCOMMON.SetCharAndEmotion(maru, "Normal")
            UI:WaitShowDialogue("Hello.")

            GAME:WaitFrames(15)
            EXPLCOMMON.SetCharAndEmotion(one, "Angry")
            UI:WaitShowDialogue("Don't 'hello' us! You have something that belongs to us and we need it now!")

            EXPLCOMMON.SetCharAndEmotion(rexio, "Stunned")
            UI:WaitShowDialogue("...need what?")

            GAME:WaitFrames(15)
            EXPLCOMMON.SetCharAndEmotion(one, "Angry")
            GROUND:CharSetAnim(one, "Run", true)
            UI:WaitShowDialogue("Playing dumb?![pause=60] The key![pause=30] It's ours!")

            local function bruh()
                  GROUND:CharSetAnim(one, "None", false)
            end
            EXPLCOMMON.SetCharAndEmotion(rexio, "Normal")
            UI:WaitShowDialogue("...[pause=75][emote=Happy]no[script=0].", {bruh})
            end)
      local coro6 = TASK:BranchCoroutine(function()
            GAME:MoveCamera((one.Position.X + MRKR("m1").Position.X) / 2, maru.Position.Y, 50, false)
            end)
      TASK:JoinCoroutines({coro3, coro4, coro5, coro6})

      EXPLCOMMON.FaceEachother(one, two)
      EXPLCOMMON.SetCharAndEmotion(one, "Stunned")
      UI:WaitShowDialogue("It didn't work...")

      EXPLCOMMON.SetCharAndEmotion(two, "Angry")
      UI:WaitShowDialogue("Dummy! Let me do it!")

      switch(one, two)

      EXPLCOMMON.SetCharAndEmotion(two, "Determined")
      UI:WaitShowDialogue("Oi, kid! Give us that key or else!")

      EXPLCOMMON.SetCharAndEmotion(rexio, "Happy")
      UI:WaitShowDialogue("...or what?")

      GAME:WaitFrames(120)
      EXPLCOMMON.SetCharAndEmotion(two, "Stunned")
      UI:WaitShowTimedDialogue("Uhh...", 90)

      EXPLCOMMON.FaceEachother(thr, two)
      EXPLCOMMON.SetCharAndEmotion(thr, "Normal")
      UI:WaitShowDialogue("Out of the way.")

      switch(thr, two)

      EXPLCOMMON.SetCharAndEmotion(thr, "Normal")
      UI:WaitShowTimedDialogue("We have a certain set of skills", 30)

      EXPLCOMMON.SetCharAndEmotion(rexio, "Normal")
      UI:WaitShowDialogue("Issues.")

      EXPLCOMMON.SetCharAndEmotion(thr, "Stunned")
      UI:WaitShowDialogue("Huh?")

      EXPLCOMMON.SetCharAndEmotion(rexio, "Worried")
      UI:WaitShowDialogue("Skill...[pause=30] issue.[pause=60] [emote=Happy]...yeah, I like that.[pause=30] Skill issue.")

      GAME:WaitFrames(60)
      EXPLCOMMON.FaceEachother(thr, fou)
      EXPLCOMMON.SetCharAndEmotion(thr, "Sigh")
      UI:WaitShowDialogue("We're so doomed.")

      EXPLCOMMON.FaceEachother(two, fou)
      EXPLCOMMON.SetCharAndEmotion(two, "Normal")
      UI:WaitShowDialogue("You come up with something, you're our last chance!")

      EXPLCOMMON.SetCharAndEmotion(fou, "Stunned")
      UI:WaitShowDialogue("U-uh... y-... yeah...")

      switch(fou, thr)
      GROUND:CharAnimateTurnTo(two, Direction.Right, 4)
      GAME:WaitFrames(180)

      EXPLCOMMON.SetCharAndEmotion(fou, "Stunned")
      UI:WaitShowDialogue("I have nothing.")

      EXPLCOMMON.SetCharAndEmotion(rexio, "Normal")
      UI:WaitShowDialogue("And you have no key.")

      EXPLCOMMON.SetCharAndEmotion(azura, "Stunned")
      UI:WaitShowDialogue("These guys suck...")

      print("")
      GROUND:MoveToPosition(excal, two.Position.X - 44, two.Position.Y, true, 4)
      EXPLCOMMON.SetCharAndEmotion(excal, "Stunned")
      EXPLCOMMON.CharAngryHop("Excaliber")
      GROUND:CharAnimateTurnTo(excal, Direction.Right, 4)
      local function twist()
            local c1 = TASK:BranchCoroutine(function()
                  GROUND:CharTurnToChar(one, excal)
                  end)
            local c2 = TASK:BranchCoroutine(function()
                  GROUND:CharTurnToChar(two, excal)
                  end)
            local c3 = TASK:BranchCoroutine(function()
                  GROUND:CharTurnToChar(thr, excal)
                  end)
            local c4 = TASK:BranchCoroutine(function()
                  GROUND:CharTurnToChar(fou, excal)
                  end)
            TASK:JoinCoroutines({c1, c2, c3, c4})
      end
      UI:WaitShowDialogue("Excuse me![script=0][pause=0] May you hooligans take your bickering SOMEWHERE ELSE!", {twist})
      UI:WaitShowDialogue("My battle arena is for tourney participants only!")

      local function againtwist()
            local c1 = TASK:BranchCoroutine(function()
                  GROUND:CharTurnToCharAnimated(one, maru, 4)
                  GROUND:CharSetAnim(one, "Charge", true)
                  end)
            local c2 = TASK:BranchCoroutine(function()
                  GROUND:CharTurnToCharAnimated(two, maru, 4)
                  GROUND:CharSetAnim(two, "Charge", true)
                  end)
            local c3 = TASK:BranchCoroutine(function()
                  GROUND:CharTurnToCharAnimated(thr, maru, 4)
                  GROUND:CharSetAnim(thr, "Charge", true)
                  end)
            local c4 = TASK:BranchCoroutine(function()
                  GROUND:CharTurnToCharAnimated(fou, maru, 4)
                  GROUND:CharSetAnim(fou, "Charge", true)
                  end)
            TASK:JoinCoroutines({c1, c2, c3, c4})
      end

      EXPLCOMMON.SetCharAndEmotion(one, "Happy")
      UI:WaitShowDialogue("Oh yeah![pause=30] WE COULD JUST[script=0][emote=Angry] BEAT YOU UP FOR IT!!", {againtwist})
      local arx = ar.Position.X
      local ary = ar.Position.Y

      EXPLCOMMON.SetCharAndEmotion(one, "Determined")
      UI:WaitShowTimedDialogue("Yeah! Give us the key and maybe we'll let you get away spikeless!", 75)

      local c1 = TASK:BranchCoroutine(function()
            GROUND:MoveToMarker(ar, MRKR("arc1"), true, 4)
            GROUND:MoveToMarker(ar, MRKR("arc2"), true, 4)
            GROUND:MoveToMarker(ar, MRKR("arc3"), true, 4)
            end)
      local c2 = TASK:BranchCoroutine(function()
            local center = GAME:GetCameraCenter()
            local emitter = RogueEssence.Content.FlashEmitter()
            emitter.FadeInTime = 2
            emitter.HoldTime = 2
            emitter.FadeOutTime = 2
            emitter.StartColor = Color(0, 0, 0, 0)
            emitter.Layer = DrawLayer.Top
            emitter.Anim = RogueEssence.Content.BGAnimData("White", 0)
            GROUND:PlayVFX(emitter, center.X, center.Y)
            SOUND:PlayBattleSE("EVT_Battle_Flash")
            GAME:WaitFrames(16)
            GROUND:PlayVFX(emitter, center.X, center.Y)
            SOUND:PlayBattleSE("EVT_Battle_Flash")
            GAME:WaitFrames(46)
            end)
      TASK:JoinCoroutines({c1, c2})

      local c3 = TASK:BranchCoroutine(function()
            EXPLCOMMON.StartAndStop(ar, "Shoot")
            GROUND:CharSetEmote(ar, "angry", 2)
            ar.CollisionDisabled = true
            GAME:WaitFrames(8)

            local anim_data = RogueEssence.Content.AnimData("Flamethrower", 3, -1, -1, 255, Dir8.DownLeft)
            local emitter = RogueEssence.Content.SingleEmitter(anim_data)
            GROUND:PlayVFX(emitter, one.Position.X, one.Position.Y)
            GROUND:PlayVFX(emitter, two.Position.X, two.Position.Y)
            GROUND:PlayVFX(emitter, thr.Position.X, thr.Position.Y)
            GROUND:PlayVFX(emitter, fou.Position.X, fou.Position.Y)
            end)
      local c4 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(10)
            local a1 = TASK:BranchCoroutine(function()
                  SOUND:PlayBattleSE("DUN_Flamethrower_2")
                  GROUND:AnimateToPosition(one, "Rotate", Dir8.UpRight, one.Position.X - 200, one.Position.Y + 200, 2.0, 2, 300)
                  GROUND:Hide("one")
                  end)
            local a2 = TASK:BranchCoroutine(function()
                  GAME:WaitFrames(4)
                  SOUND:PlayBattleSE("DUN_Flamethrower")
                  GROUND:AnimateToPosition(two, "Rotate", Dir8.UpRight, two.Position.X - 200, two.Position.Y + 200, 2.0, 2, 300)
                  end)
            local a3 = TASK:BranchCoroutine(function()
                  GAME:WaitFrames(10)
                  SOUND:PlayBattleSE("DUN_Flamethrower_2")
                  GROUND:AnimateToPosition(thr, "Rotate", Dir8.UpRight, thr.Position.X - 200, thr.Position.Y + 200, 2.0, 2, 300)
                  GROUND:Hide("two")
                  GROUND:Hide("three")
                  GROUND:Hide("four")
                  end)
            local a4 = TASK:BranchCoroutine(function()
                  GAME:WaitFrames(2)
                  SOUND:PlayBattleSE("DUN_Flamethrower_3")
                  GROUND:AnimateToPosition(fou, "Rotate", Dir8.UpRight, fou.Position.X - 200, fou.Position.Y + 200, 2.0, 2, 300)
                  end)
            local a5 = TASK:BranchCoroutine(function()
                  GAME:WaitFrames(15)
                  EXPLCOMMON.SetCharAndEmotion(one, "Shouting")
                  UI:WaitShowTimedDialogue("[speed=0.5]Waaaaaaaaaaaaaaaaaaaaaaaaaaaaaa!!!", 120)
                  end)
            TASK:JoinCoroutines({a1, a2, a3, a4, a5})
            end)
      TASK:JoinCoroutines({c3, c4})

      GAME:WaitFrames(45)
      GROUND:CharSetAnim(ar, "None", false)
      EXPLCOMMON.SetCharAndEmotion(ar, "Determined")
      UI:WaitShowDialogue("Hmph.[pause=80] Idiots.")

      GROUND:MoveToMarker(ar, MRKR("arc2"), false, 4)
      GROUND:MoveToMarker(ar, MRKR("arc1"), false, 4)
      GROUND:MoveToPosition(ar, arx, ary, false, 4)
      GROUND:CharTurnToChar(ar, CH("Cook"))

      EXPLCOMMON.CharSweatdrop("Teammate2")
      GAME:WaitFrames(20)
      EXPLCOMMON.SetCharAndEmotion(rexio, "Stunned")
      UI:WaitShowDialogue("...uh...[pause=30] we win...?")

      TASK:WaitTask(GROUND:_HandoutEXP(_DATA.Save.ActiveTeam.Players[0], 100))
      TASK:WaitTask(GROUND:_HandoutEXP(_DATA.Save.ActiveTeam.Players[1], 100))
      TASK:WaitTask(GROUND:_HandoutEXP(_DATA.Save.ActiveTeam.Players[2], 100))

      EXPLCOMMON.SetCharAndEmotion(azura, "Joyous")
      UI:WaitShowDialogue("Yay!")

      ar.CollisionDisabled = false
      GAME:CutsceneMode(false)

      GAME:MoveCamera(0, 0, 60, true)
      EXPLCOMMON.AllyFollow(false, false)
end