Dark = {}

function Dark.Darkness()
  local maru = CH("PLAYER")
  local azura = CH('Teammate1')
  local arama = CH("Arama")
  local amazuru = CH("Amazuru")
  AI:DisableCharacterAI(azura)
  GAME:CutsceneMode(true)

  GROUND:TeleportTo(maru, 80, 500, Direction.Up, 0)
  GROUND:TeleportTo(azura, 120, 510, Direction.Up, 0)

  local coro01 = TASK:BranchCoroutine(function()
    GROUND:MoveToPosition(maru, maru.Position.X, maru.Position.Y - 14, false, 0.4)
    GROUND:CharTurnToCharAnimated(maru, azura, 4)
    end)
  local coro02 = TASK:BranchCoroutine(function()
    GROUND:MoveToPosition(azura, azura.Position.X, azura.Position.Y - 14, false, 0.5)
    GROUND:CharTurnToCharAnimated(azura, maru, 8)
    end)
  local coro03 = TASK:BranchCoroutine(function()
    GAME:FadeIn(120)
    end)
  
  TASK:JoinCoroutines({coro01, coro02, coro03})

  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowTimedDialogue("That was fun, now we can go home and", 0)

  UI:SetSpeaker(arama)
  UI:SetSpeakerEmotion("Shouting")
  UI:WaitShowDialogue("Waaaaaaaaaaaaaait!")

  local coro1 = TASK:BranchCoroutine(function()
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Huh,[pause=70] mama...?")

    GROUND:CharTurnToCharAnimated(maru, arama, 5)
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("What are you doing here...?")
    end)	
  local coro2 = TASK:BranchCoroutine(function()
    GROUND:MoveToPosition(arama, (maru.Position.X + azura.Position.X) / 2, azura.Position.Y - 50, true, 8)
    end)
  
  TASK:JoinCoroutines({coro1, coro2})

  GROUND:CharTurnToCharAnimated(azura, arama, 8)
  GROUND:CharTurnToCharAnimated(maru, arama, 4)

  UI:SetSpeaker(arama)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("You two can't be here!")

  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowTimedDialogue("But mama, we can-...")

  UI:SetSpeaker(arama)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("Talking back to me, huh?!")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("But...[pause=30] mom...")

  UI:SetSpeaker(arama)
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue("I know you two are ready, but I can't let you go...!")
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Even if you two have the experience...")

  COMMON.CharSweatdrop("PLAYER")
  GAME:WaitFrames(5)
  COMMON.CharSweatdrop("Teammate1")
  GAME:WaitFrames(5)

  local coro1 = TASK:BranchCoroutine(function()
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("But what kind of mother would I be if I just kept you two stuck here...?")
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Difficult decision...")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("You know what,[pause=10] sure! You two can do it!")
    end)	
  local coro2 = TASK:BranchCoroutine(function()
    GAME:WaitFrames(60)
    COMMON.FaceEachother("PLAYER", "Teammate1")
    GAME:WaitFrames(30)
    GROUND:CharTurnToCharAnimated(azura, arama, 8)
    GROUND:CharTurnToCharAnimated(maru, arama, 8)
    end)
  
  TASK:JoinCoroutines({coro1, coro2})

  GROUND:MoveToPosition(arama, arama.Position.X, azura.Position.Y + 20, true, 9)
  GROUND:MoveToPosition(arama, azura.Position.X, azura.Position.Y + 20, true, 9)
  GROUND:CharTurnToCharAnimated(arama, azura, 8)

  local coro001 = TASK:BranchCoroutine(function()
    GROUND:AnimateToPosition(azura, "None", Dir8.Up, 120, 80, 0.5, 2, 0)
    end)	
  local coro002 = TASK:BranchCoroutine(function()
    GROUND:AnimateToPosition(arama, "Walk", Dir8.Up, 120, 100, 5, 2, 0)
    end)
  local coro003 = TASK:BranchCoroutine(function()
    GAME:WaitFrames(40)
    COMMON.CharSweatdrop("PLAYER")
    GAME:WaitFrames(5)
    GROUND:MoveToPosition(maru, maru.Position.X, maru.Position.Y - 400, false, 2)
    GROUND:CharTurnToCharAnimated(maru, arama, 8)
    end)
  local coro004 = TASK:BranchCoroutine(function()
    GAME:WaitFrames(10)
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowTimedDialogue("Huh?![pause=15] Hey![pause=15] Y[emote=Angry]ou're pushing,[pause=45] m[emote=Shouting]ama!", 40)

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Mom, what's going on?[pause=30] You're scaring me...")

    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Oh? What do you mean, there's not a single thing wrong! [pause=40][emote=Joyous]Hahaha!")
    end)
  
  TASK:JoinCoroutines({coro001, coro002, coro003, coro004})

  GROUND:CharTurnToCharAnimated(arama, maru, 8)
  GROUND:CharTurnToCharAnimated(azura, maru, 8)
  UI:SetSpeaker(arama)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("Almost forgot...!")
  SOUND:PlayFanfare("Fanfare/Item")
  UI:ResetSpeaker()
  UI:WaitShowDialogue("Arama gives Maru a treasure bag!")
  
  SV.bag_size = 30
  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Inspired")
  UI:WaitShowDialogue("Woah![pause=50] Cool bag...!")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowTimedDialogue("I'm so confused... why can't you just go with us?")

  UI:SetSpeaker(arama)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("This is something you two have to do alone!")
  UI:SetSpeakerEmotion("Joyous")
  UI:WaitShowDialogue("Off you two go! Have a wonderful trip!")

  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Wait... we're going?")

  UI:SetSpeaker(arama)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowTimedDialogue("Don't worry, I'll...")
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowTimedDialogue("...", 20)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("We'll[pause=20] be completely fine, go figure out what that letter was...!")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("...uh-huh...?")

  SOUND:PlayBGM("None", true, 120)
  GAME:MoveCameraToChara(0, 0, 0, arama)
  GROUND:TeleportTo(amazuru, 80, 500, Direction.Up, 0)
  
  local coro00001 = TASK:BranchCoroutine(function()
    GAME:MoveCamera(0, 500, 240, false)
    end)	
  local coro00002 = TASK:BranchCoroutine(function()
    GROUND:MoveToPosition(arama, arama.Position.X, azura.Position.Y + 100, true, 5)
    GROUND:MoveToPosition(arama, arama.Position.X, azura.Position.Y + 200, false, 3)
    GROUND:MoveToPosition(arama, arama.Position.X, azura.Position.Y + 300, false, 2)
    GROUND:MoveToPosition(arama, arama.Position.X, azura.Position.Y + 400, false, 0.5)
    end)
  
  TASK:JoinCoroutines({coro00001, coro00002})

  UI:SetSpeaker(amazuru)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Did you let them go?")
  GROUND:CharTurnToCharAnimated(amazuru, arama, 8)

  UI:SetSpeaker(arama)
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("...")

  UI:SetSpeaker(amazuru)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("They can do it, you know...")

  UI:SetSpeaker(arama)
  UI:SetSpeakerEmotion("Sad")
  UI:WaitShowDialogue("...")

  UI:SetSpeaker(amazuru)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("...and they're in good hands.")
  SV.tarro_town.DarknessChapter = 2

  GAME:SetCanSwitch(true)
  GAME:CutsceneMode(false)
  GAME:FadeOut(false, 240)
  COMMON.UnlockWithFanfare("deep_tarro_forest", false)  
  GAME:EnterZone("deep_tarro_forest", 0, 0, 0)
end