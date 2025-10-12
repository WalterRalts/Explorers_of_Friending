Square = {}

function Square.FightFightFight()
  SV.tarro_town.PieChapter = 6
  GAME:MoveCamera(((1662 + 1708) / 2), 274, 1, false)

  local partner = CH('Teammate1')
  local gepii = CH("Gepii")
  local getic = CH("Getic")
  local gekis = CH("Gekis")
  local happy = CH('Happy')
  local plus = CH("Plus")
  local minus = CH('Minus')
  local maru = CH("PLAYER")
  local azura = CH('Teammate1')
  local buzzer = CH("Buzzer")
  local puchi = CH("Puchi")
  local senna = CH("Senna")
  local ziggy = CH("Ziggy")
  local kek = CH("Kecleon")
  
  
  GROUND:TeleportTo(happy, 1616, 230, Direction.Right)
  GROUND:TeleportTo(gepii, 1616, 250, Direction.Right)

  GROUND:TeleportTo(gekis, 1683, 190, Direction.Down)
  GROUND:TeleportTo(buzzer, 1755, 160, Direction.DownLeft)
  GROUND:TeleportTo(kek, 1736, 296, Direction.UpLeft)

  GROUND:TeleportTo(puchi, 1640, 450, Direction.DownLeft)
  GROUND:TeleportTo(ziggy, 1726, 450, Direction.DownLeft)
  GROUND:TeleportTo(senna, 1754, 450, Direction.UpLeft)

  GROUND:CharSetAnim(minus, "Charge", true)
  GROUND:CharSetAnim(plus, "Charge", true)
  GAME:CutsceneMode(true)
	AI:DisableCharacterAI(partner)
  GAME:FadeIn(25)

  
  local coro1 = TASK:BranchCoroutine(function() 
    GAME:WaitFrames(24)
    GROUND:MoveToPosition(puchi, 1636, 292, false, 2)
    GROUND:CharTurnToCharAnimated(puchi, plus, 7)
    end)	
  local coro2 = TASK:BranchCoroutine(function()
    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Like, literally, no way!")

    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Nah, you know I'm right!")

    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("I know you are but what am I?!")

    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Wrong!")

    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("I know you are but what am I?!")

    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("You can't just do that[pause=30], that's CHEATING!")
    end)

  TASK:JoinCoroutines({coro1, coro2})
  
  UI:SetSpeaker(puchi)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("What... what is this about?")

  GROUND:CharTurnToCharAnimated(gepii, puchi, 3)
  UI:SetSpeaker(gepii)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Pouch? What are you doing here?")

  GROUND:CharTurnToCharAnimated(puchi, gepii, 5)
  UI:SetSpeaker(puchi)
  UI:SetSpeakerEmotion("Sigh")
  UI:WaitShowDialogue("I wish I knew...")
  
  GROUND:CharTurnToCharAnimated(minus, happy, 3)
  UI:SetSpeaker(happy)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("Are you two gonna start paralyzing people again?")
  
  GROUND:CharTurnToCharAnimated(minus, plus, 3)
  UI:SetSpeaker(minus)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("I might start paralyzing HIM if he doesn't admit he's wrong!")

  UI:SetSpeaker(plus)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("Oh, so you wanna fight?!")

  local coro300 = TASK:BranchCoroutine(function() GAME:WaitFrames(24)
    GROUND:MoveToPosition(ziggy, 1685, 247, false, 8)
    GROUND:CharTurnToCharAnimated(ziggy, minus, 7)
    end)	
  local coro400 = TASK:BranchCoroutine(function() 
    UI:SetSpeaker(ziggy)
    UI:SetSpeakerEmotion("Shouting")
    UI:WaitShowDialogue("NOT THIS TIME!")
    end)

  TASK:JoinCoroutines({coro300, coro400})
  

  local coro3 = TASK:BranchCoroutine(function() GAME:WaitFrames(24)
    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Zigzag, I'm sorry, but I'm not letting this one go![pause=40] O[emote=Angry]ut of my way!")
    end)	
  local coro4 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(senna, 1685, 281, false, 3)
    end)
  local coro5 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(azura, 1665, 295, false, 6)
    end)

  TASK:JoinCoroutines({coro3, coro4, coro5})
  GROUND:CharTurnToCharAnimated(senna, ziggy, 1)
  GROUND:CharTurnToCharAnimated(azura, ziggy, 1)
  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue("Nuh-[pause=10]uh!")

  GROUND:CharTurnToCharAnimated(senna, plus, 3)
  UI:SetSpeaker(plus)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("Fine! Minus can't hurt you anyway,[pause=20] since she can't aim!")
  
  GROUND:CharTurnToCharAnimated(senna, minus, 3)
  UI:SetSpeaker(minus)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("You wanna, like, test that?!")

  local coro6 = TASK:BranchCoroutine(function() GAME:WaitFrames(24)
    UI:SetSpeaker(ziggy)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Nuh-[pause=30]uh!")

    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Worried")
    GROUND:CharTurnToCharAnimated(azura, senna, 3)
    UI:WaitShowDialogue("...[pause=40] .[emote=Determined]..")
    
    UI:SetSpeakerEmotion("Determined")
    GROUND:CharTurnToCharAnimated(ziggy, senna, 3)
    UI:WaitShowDialogue("You two are gonna hurt someone!")

    UI:SetSpeaker(azura)
    GROUND:CharTurnToCharAnimated(azura, minus, 3)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowTimedDialogue("Yeah!", 50)
    end)	
  local coro7 = TASK:BranchCoroutine(function() 
    GROUND:MoveToPosition(maru, 1706, 280, false, 3)
    GROUND:CharTurnToCharAnimated(puchi, minus, 4)
    GROUND:CharTurnToCharAnimated(gepii, plus, 4)
    end)
    
  TASK:JoinCoroutines({coro6, coro7})
  
  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Determined")
  GROUND:CharTurnToCharAnimated(azura, senna, 3)
  UI:WaitShowDialogue("Over one little fight!")

  UI:SetSpeaker(azura)
  GROUND:CharTurnToCharAnimated(azura, minus, 3)
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowTimedDialogue("Yeah!", 50)
  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Angry")
  GROUND:CharTurnToCharAnimated(azura, senna, 3)
  UI:WaitShowDialogue("What is this fight for?!")

  UI:SetSpeaker(azura)
  GROUND:CharTurnToCharAnimated(azura, minus, 3)
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowTimedDialogue("Yeah!", 50)

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("What is this fight about?")

  UI:SetSpeaker(minus)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("He thinks that red is better than blue!")

  UI:SetSpeaker(plus)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("Because it is better than blue!")

  GAME:WaitFrames(90)
  SOUND:StopBGM()
  
  local coro8 = TASK:BranchCoroutine(function() GAME:WaitFrames(24)
    UI:SetSpeaker(getic)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue("You two are such kids...")

    GROUND:CharTurnToCharAnimated(minus, gekis, 3)
    COMMON.CharSweatdrop("Minus")
    GROUND:CharSetAnim(minus, "None", true)
    GROUND:CharSetAnim(plus, "None", true)

    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Huh?")

    local coro08 = TASK:BranchCoroutine(function() 
      UI:SetSpeaker(happy)
      UI:SetSpeakerEmotion("Sigh")
      UI:WaitShowDialogue("I'm done...[pause=45] glad I didn't prepare for this.")

      local co8 = TASK:BranchCoroutine(function()
        COMMON.CharExclaim("Gepii")
        GROUND:CharAnimateTurn(gepii, Direction.Left, 6, true)
        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Shouting")
        UI:WaitShowDialogue("Wait, Haps! [pause=40] Wait up!")
        end)	
      local co9 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(60)
        COMMON.CharHop("Gepii")
        GAME:WaitFrames(20)
        GROUND:MoveToMarker(gepii, MRKR("moving5"), false, 5)
        end)
      TASK:JoinCoroutines({co8, co9})

      end)	
    local coro09 = TASK:BranchCoroutine(function()
      GAME:WaitFrames(90)
      GROUND:MoveToMarker(happy, MRKR("moving5"), false, 2)   
      end)

    TASK:JoinCoroutines({coro08, coro09})
    end)	
  local coro9 = TASK:BranchCoroutine(function()
    GROUND:MoveToMarker(kek, MRKR("moving1"), false, 3)
    GROUND:MoveToMarker(kek, MRKR("moving4"), false, 3)
    end)

  TASK:JoinCoroutines({coro8, coro9})
  
  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue('...this was honestly a total waste of my time.')
  UI:WaitShowDialogue('My disappointment is immeasurable,[pause=0] and my day is ruined.')
  

  local coro008 = TASK:BranchCoroutine(function() 
      GROUND:MoveToMarker(ziggy, MRKR("moving3"), false, 5)
      GROUND:MoveToMarker(ziggy, MRKR("moving5"), false, 5)
      end)	
  local coro009 = TASK:BranchCoroutine(function()
      UI:SetSpeaker(puchi)
      UI:SetSpeakerEmotion("Pain")
      UI:WaitShowDialogue('I wanna go home...');
      UI:WaitShowDialogue('Sleep...[pause=30] [emote=Dizzy][speed=0.6]need sleep...');
      end)

  TASK:JoinCoroutines({coro008, coro009})

  local coro0008 = TASK:BranchCoroutine(function()
    GROUND:MoveToPosition(puchi, puchi.Position.X, 249, false, 2)
    GROUND:MoveToPosition(puchi, 1000, 249, false, 2)
    AI:DisableCharacterAI(gepii)
    end)	
  local coro0009 = TASK:BranchCoroutine(function()
    GAME:WaitFrames(70)
    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue('No one got hurt.')
    UI:SetSpeakerEmotion("Normal")
    GROUND:CharTurnToCharAnimated(senna, ziggy, 3)
    UI:WaitShowDialogue("Looks like they're going towards the [color=#01FE10]Big Tree[color].")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("I'll go with them,[pause=40] meet you guys there.");
    GROUND:MoveToPosition(senna, 1600, 250, false, 2)
    GROUND:MoveToPosition(senna, 1000, 250, false, 4)
    end)

  TASK:JoinCoroutines({coro0008, coro0009})
  
  GROUND:TeleportTo(kek, 157, 186, Direction.DownLeft)

  GROUND:TeleportTo(puchi, 475, 353, Direction.Down)
  GROUND:TeleportTo(ziggy, 449, 409, Direction.UpRight)
  GROUND:TeleportTo(senna, 500, 409, Direction.UpLeft)

  GROUND:TeleportTo(happy, 1344, 196, Direction.Left)
  GROUND:TeleportTo(gepii, 1304, 196, Direction.Right)
  
  COMMON.FaceEachother(gekis, getic)

  UI:SetSpeaker(gekis)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Getic,[pause=10] you're in charge.")

  UI:SetSpeaker(getic)
  UI:SetSpeakerEmotion("Surprised")
  UI:WaitShowTimedDialogue("What?![pause=40] But I-")

  UI:SetSpeaker(gekis)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowTimedDialogue("Shopping tiiiiiiime!~", 30)

  local coro16 = TASK:BranchCoroutine(function() 
    GAME:WaitFrames(24)
    UI:SetSpeaker(getic)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Wha-[pause=20], but I-[pause=25] thi-[pause=35] u[emote=Sigh]gh!")
    end)	
  local coro17 = TASK:BranchCoroutine(function()
    COMMON.FaceEachother(plus, minus)
    GROUND:MoveToPosition(gekis, 1655, 230, false, 7)
    GROUND:MoveToPosition(gekis, 1200, 230, false, 7)
    GROUND:TeleportTo(gekis, 126, 231, Direction.UpRight) 
    GAME:WaitFrames(70)
    GROUND:CharAnimateTurn(getic, Direction.DownRight, 2, false)
    end)
  
  TASK:JoinCoroutines({coro16, coro17})

  SOUND:PlayBGM("Tropical Path.ogg", true)

  GAME:MoveCamera(0, 0, 1, true)
  GAME:CutsceneMode(false)
  AI:EnableCharacterAI(partner)
end

function Square.AfterQuiz()
  quiz_available = false
  local partner = CH('Teammate1')
  local maru = CH("PLAYER")
  local azura = CH('Teammate1')
  local puchi = CH("Puchi")
  local senna = CH("Senna")
  local ziggy = CH("Ziggy")
  AI:DisableCharacterAI(partner)
  GROUND:TeleportTo(partner, 504, 378, Direction.Left, 0)
  SOUND:PlayBGM("None", false, 0)
  GROUND:CharAnimateTurn(puchi, Direction.Up, 2, true)
  GROUND:CharAnimateTurn(ziggy, Direction.Up, 2, true)
  GROUND:CharAnimateTurn(senna, Direction.Up, 5, true)
  GROUND:CharAnimateTurn(azura, Direction.Up, 2, true)
  GROUND:CharAnimateTurn(maru, Direction.Up, 2, true)
  GAME:WaitFrames(70)
  
  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("W-[pause=5]what was that?")

  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("An explosion from the Big Tree?")

  COMMON.FaceEachother(ziggy, senna)
  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("No! No no no no!")

  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowTimedDialogue("But...[pause=35] but[pause=15] it...")
  
  GROUND:CharAnimateTurnTo(ziggy, Direction.Up, 2)
  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue("We're going!")

  UI:SetSpeaker(puchi)
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("Ziggy,[pause=15] this feels like something our parents should take care of...")

  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("That would take too long! [emote=Determined] Someone else would've heard it by now, c'mon! We can help!")

  local coro1 = TASK:BranchCoroutine(function() 
    GROUND:MoveToMarker(ziggy, MRKR("jump"), false, 6)
    end)
  local coro2 = TASK:BranchCoroutine(function()
    GAME:WaitFrames(15)
    GROUND:AnimateInDirection(ziggy, "Hop", Dir8.Up, Dir8.Up, 25, 3, 0.5)
    end)

  TASK:JoinCoroutines({coro1, coro2})
  GAME:WaitFrames(25)
  GROUND:CharAnimateTurnTo(ziggy, Direction.Down, 2)

  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("Come on!")

  GROUND:MoveToPosition(ziggy, 420, 200, false, 2)
  GROUND:Hide("Ziggy")
  SV.tarro_town.PieChapter = 7

  GAME:MoveCamera(0, 0, 30, true)
  GAME:CutsceneMode(false)
  AI:EnableCharacterAI(partner)
end