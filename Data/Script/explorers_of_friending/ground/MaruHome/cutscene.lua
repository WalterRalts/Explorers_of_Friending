require 'explorers_of_friending.common'

Bluetails = {}

function Bluetails.PieTime()
    GAME:CutsceneMode(true)
    local maru = CH("Maru")
    local azura = CH("Teammate1")
    local arama = CH("Arama")
    local amazuru = CH("Amazuru")
    local real_maru = CH("PLAYER")
    GROUND:TeleportTo(amazuru, 186, 211, Direction.Right, 0)
    GROUND:TeleportTo(arama, 221, 211, Direction.Left, 0)
    GROUND:TeleportTo(maru, 227, 350, Direction.UpRight, 0)
    GROUND:TeleportTo(real_maru, 1000, 1000, Direction.UpRight, 0)
    GROUND:TeleportTo(azura, 220, 350, Direction.UpRight, 0)
    GAME:MoveCamera(229, 248, 1, false)
    GAME:FadeIn(20)
    
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Oh... what should I do...?")
    
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I don't see the problem.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Everything you make is a good, can't you just[emote=Normal] use normal apples?")
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Are you kidding?![pause=60] The smaller apples won't make it taste as good! T[emote=Pain]hey would tell immediately...!")
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("It doesn't help the fact that I made a promise, too...")
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Azura will be devestated!")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Just tell them that you're out of Big Apples.[pause=30] No big deal.")
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowTimedDialogue("But then that woul-", 20)
    
    local function enterforpie()
      GROUND:MoveToPosition(azura, 186, 240, false, 6)
      GROUND:MoveToPosition(maru, 221, 240, true, 2)
    end
    GROUND:CharTurnToCharAnimated(maru, arama, 2)
    GROUND:CharTurnToCharAnimated(azura, arama, 2)
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("Mama,[script=0] pie time!", { enterforpie })
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("Oh! [pause=15]Pie![pause=15] Yes!")
    GROUND:MoveToPosition(arama, 290, 170, true, 3)
    GROUND:CharTurnToCharAnimated(maru, arama, 2)
    GROUND:CharTurnToCharAnimated(azura, arama, 2)
    GROUND:CharTurnToCharAnimated(amazuru, arama, 2)
    UI:SetSpeakerEmotion("Joyous")
    GROUND:CharAnimateTurn(arama, Direction.Up, 2, true)
    UI:WaitShowDialogue("I'll get right on that! [speed=2.0]Ahahahahahahahahahahahaha!")
  
    GAME:WaitFrames(30)
    GROUND:CharTurnToCharAnimated(maru, azura, 2)
    GROUND:CharTurnToCharAnimated(azura, maru, 2)
  
    GAME:WaitFrames(30)
    GROUND:CharTurnToCharAnimated(maru, arama, 2)
    GROUND:CharTurnToCharAnimated(azura, arama, 2)
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Uhh... mom?")
    UI:WaitShowDialogue("Don't you need a Big Apple?")
  
    local function AramaLeft()
      GROUND:CharAnimateTurn(arama, Direction.Left, 2, true)
    end
    local function AramaRight()
      GROUND:CharAnimateTurn(arama, Direction.Right, 2, true)
    end
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Uh...! [pause=15][script=0]Well...![pause=15][script=1] Umm...!", { AramaLeft, AramaRight })
    GROUND:CharAnimateTurn(arama, Direction.Down, 2, true)
    UI:WaitShowDialogue("Oh! [pause=30][emote=Happy]I found it, I found it!")
    GROUND:Unhide("NotApple")
    SOUND:PlaySE("Battle/DUN_Money")
  
    GAME:WaitFrames(115)
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("[speed=0.7]Mom...? That's not...")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Pfft, that[speed=0.3][emote=Normal]...[pause=40] t[speed=1.0]h-... [emote=Happy]hhhhhhh...")
  
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Teary-Eyed")
    UI:WaitShowDialogue("B-but... I wan pie...")
    
    GROUND:CharTurnToCharAnimated(arama, azura, 2)
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("No no no no, Azura[emote=Happy], sweetie!")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("I just... ran out of Big Apples! It'll be fine!")
  
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("You promised, mom.")
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("Yes, I know.")
  
    GROUND:CharAnimateTurn(arama, Direction.Down, 2, true)
    GROUND:Hide("NotApple")
    SOUND:PlaySE("Battle/DUN_Money")
  
    GROUND:MoveToPosition(arama, 221, 211, false, 2)
    GROUND:CharTurnToCharAnimated(maru, arama, 2)
    GROUND:CharTurnToCharAnimated(azura, arama, 2)
    GROUND:CharTurnToCharAnimated(amazuru, arama, 2)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("I guess I should've checked my supply first...")
  
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("[speed=0.6]...")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Just send the kids to get more.")
  
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Oh,[pause=10] us?")
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("What?! No way! I'm not sending them into a dungeon!")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("C'moooon, that dungeon is fine.[pause=0] I already taught them how to battle well; it'll be easy.")
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("I know,[pause=35] but why don't I just go?[pause=40] Keep the kids out of danger.")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("All they have to do is avoid the wild bugs, they're all weak. A Big Apple tree, too.")
  
    GROUND:CharTurnToCharAnimated(maru, azura, 2)
    
    
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Shouting")
    UI:WaitShowDialogue("Let's do it![pause=35] FOR THE PIE!")
    
    COMMON.FaceEachother("Maru", "Arama")
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("I don't think you have to worry, ma.")
    GROUND:CharTurnToCharAnimated(arama, azura, 2)
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...[pause=34]f[emote=Sigh]ine.")
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Azura,[pause=46] don't hurt yourself, dear...")
  
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Hehee.")
    GAME:FadeOut(false, 20)
    GROUND:RemoveCharacter("Maru")
    GROUND:TeleportTo(amazuru, 172, 149, Direction.Down, 0)
    GROUND:TeleportTo(real_maru, 221, 240, Direction.Up, 0)
    GROUND:TeleportTo(arama, 245, 184, Direction.DownLeft, 0)
    GAME:MoveCamera(0, 0, 0, true)
    print("Go back to ground.")
end
  
function Bluetails.RealPieTime()
    GAME:CutsceneMode(true)
    GAME:MoveCamera(229, 248, 1, false)
    local arama = CH("Arama")
    local amazuru = CH("Amazuru")
    local maru = CH("Maru")
    local azura = CH("Teammate1")
    local real_maru = CH("PLAYER")
    GROUND:TeleportTo(amazuru, 245, 184, Direction.UpRight, 0)
    GROUND:TeleportTo(arama, 290, 170, Direction.Up, 0)
    GROUND:TeleportTo(maru, 227, 350, Direction.UpRight, 0)
    GROUND:TeleportTo(azura, 220, 350, Direction.UpRight, 0)
    GROUND:TeleportTo(real_maru, 1000, 1000, Direction.UpRight, 0)
    GAME:FadeIn(20)
    
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("I'll never understand how you do it, Ara.")
    
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Just a bit of magic.")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Ooh[pause=35], so if I find out your secret...")
    UI:SetSpeakerEmotion("Inspired")
    UI:WaitShowDialogue("...I could impress the kids with cooking, too!")
    
    GROUND:CharTurnToCharAnimated(arama, amazuru, 4)
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("I'll never tell, Aru.~")
    GROUND:CharAnimateTurn(arama, Direction.Up, 4, true)
    UI:WaitShowDialogue("Besides, you already impress them your battle skills.")
    UI:WaitShowDialogue("I'll impress their stomachs.")
  
    local function slowturn()
      GROUND:CharAnimateTurn(amazuru, Direction.DownLeft, 15, false)
    end
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("[speed=0.7]Awww[script=0][speed=0.3]...", {slowturn})
    
    GROUND:CharTurnToCharAnimated(arama, azura, 2)
    GROUND:CharTurnToCharAnimated(amazuru, azura, 2)
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("Mama! Apple!")
    GROUND:MoveToPosition(arama, 221, 211, false, 2)
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Well, lookie here.[pause=0] They're back and they're completely fine.")
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Joyous")
    GROUND:MoveToPosition(arama, 290, 170, false, 2)
    UI:WaitShowDialogue("Now let me make my famous pie!")
  
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("Whooooooo!")
    GAME:FadeOut(false, 30)
end
  
function Bluetails.AfterPieTime()
    local maru = CH("Maru")
    local real_maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local arama = CH("Arama")
    local amazuru = CH("Amazuru")
    local ziggy = CH("Ziggy")
    GROUND:Hide("Arama")
    GROUND:CharSetAnim(azura, "Sleep", true)
    GROUND:TeleportTo(maru, 157, 258, Direction.UpRight, 0)
    GROUND:TeleportTo(azura, 120, 230, Direction.UpRight, 0)
    GROUND:TeleportTo(amazuru, 180, 225, Direction.DownLeft, 0)
    GROUND:TeleportTo(real_maru, 1000, 1000, Direction.UpRight, 0)
    GAME:FadeIn(35)
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Alright, you adventurer.")
    UI:WaitShowDialogue("Hope you enjoyed your pie. [pause=40](It was delicious...!)")
    
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Yeah, that taste is unforgettable.")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowTimedDialogue("Good, now then", 1)
  
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Hey... actually... dad?")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("What's up, kiddo?")
  
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Did you ever... [pause=35]go in the dungeon?")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Yeah, back when it wasn't only stingers and poison.")
    
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Did you also ever fight a Zubat in here?")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Yeah, well...[emote=Worried][pause=50] ...no[emote=Stunned], actually.")
  
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Oh, weird. I guess that was someone who also wanted a big apple.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Not like it matters,[pause=25] we beat 'em, too.")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Those are my little champs right there.[pause=0] And champs get good sleep, so...")
  
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Yeah. Sleep time. G'night, dad.")
  
    GROUND:MoveToPosition(amazuru, 135, 172, false, 2)
    GROUND:CharTurnToCharAnimated(amazuru, maru, 2)
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Nighto, Maru.")
    GROUND:CharSetAnim(maru, "Sleep", true)
    GROUND:CharAnimateTurn(amazuru, Direction.UpLeft, 4, false)
    GROUND:Hide("Amazuru")
    GAME:FadeOut(false, 75)
    GAME:WaitFrames(60)
    GROUND:Unhide("Arama")
    GROUND:TeleportTo(arama, 180, 225, Direction.DownLeft, 0)
  
    UI:WaitShowTitle("Chapter 1:\nExplosive", 180)
    GAME:WaitFrames(30)
  
    local coro01 = TASK:BranchCoroutine(function() 
      UI:WaitHideTitle(180)
      end)	
    local coro02 = TASK:BranchCoroutine(function() 
      UI:SetSpeaker(arama)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Alright, you two, r[emote=Joyous]ise and shine!")
      end)
  
    TASK:JoinCoroutines({coro01, coro02})
    
    GAME:FadeIn(30)
    GAME:WaitFrames(15)
    GROUND:Unhide("Amazuru")
    COMMON.FaceEachother("Amazuru", "Arama")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Need help?")
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Appreciated.")
    GROUND:MoveToPosition(amazuru, 129, 206, false, 5)
  
    local coro1 = TASK:BranchCoroutine(function() 
      UI:SetSpeaker(amazuru)
      UI:SetSpeakerEmotion("Shouting")
      UI:WaitShowDialogue("ARISE MY CHILDREN!")
      end)	
    local coro2 = TASK:BranchCoroutine(function() 
      GROUND:CharSetAnim(maru, "Hurt", true)
      GROUND:CharSetAnim(azura, "Hurt", true)
      GROUND:CharTurnToCharAnimated(azura, amazuru, 2)
      GROUND:CharTurnToCharAnimated(maru, amazuru, 2)
      end)
  
    TASK:JoinCoroutines({coro1, coro2})
  
    GROUND:CharSetAnim(maru, "None", true)
    GROUND:CharSetAnim(azura, "None", true)
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Whyyyyy???")
  
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("Oof... five more minutes...")
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Isn't it a little early?")
  
    UI:SetSpeaker(arama)
    GROUND:CharTurnToCharAnimated(arama, maru, 2)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowTimedDialogue("Well,[pause=40] yes, but there's something impo-")
  
    UI:SetSpeaker(ziggy)
    UI:SetSpeakerEmotion("Shouting")
    UI:WaitShowDialogue("GUYS GUYS GUYS GUYS!")
  
    GROUND:MoveToPosition(ziggy, 200, 266, false, 7)
  
    GROUND:CharTurnToCharAnimated(azura, ziggy, 2)
    GROUND:CharTurnToCharAnimated(maru, ziggy, 2)
    GROUND:CharTurnToCharAnimated(amazuru, ziggy, 1)
    GROUND:CharTurnToCharAnimated(arama, ziggy, 2)
  
    UI:SetSpeaker(ziggy)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue("Guh...[pause=30] phew![pause=30][emote=Dizzy] Ran...[pause=30] too fast...!")
  
    COMMON.FaceEachother("Maru", "Ziggy")
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Ziggy?[pause=30] What's going on?")
  
    UI:SetSpeaker(ziggy)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("They're fighting again!")
  
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Again?")
  
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Special1")
    UI:WaitShowDialogue("Ugh... [pause=0]we have to go?")
  
    UI:SetSpeaker(ziggy)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Yep![pause=0] They're more serious this time! Hurry up, they might start shooting lightning and stuff!")
  
    GROUND:MoveToPosition(ziggy, 200, 346, false, 10)
    GAME:WaitFrames(65)
  
    COMMON.CharSweatdrop("Arama")
    GAME:WaitFrames(10)
    COMMON.CharSweatdrop("Amazuru")
    COMMON.FaceEachother("Arama", "Amazuru")
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Dear, maybe we should invest in a door...")
  
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Mhm.")
    GAME:FadeOut(false, 30)
    GROUND:TeleportTo(real_maru, 221, 240, Direction.Left, 0)
    GROUND:TeleportTo(azura, 186, 240, Direction.Right, 0)
    GROUND:Hide("Maru")
    SV.tarro_town.PieChapter = 5
end

function Bluetails.MailTime()
  local amazuru = CH("Amazuru")
  local maru = CH("PLAYER")
  GAME:MoveCamera(229, 248, 1, false)
  GAME:FadeIn(20)
  GROUND:CharTurnToCharAnimated(amazuru, maru, 4)

  UI:SetSpeaker(amazuru)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Hey, before you two leave, could you two go check the mail real quickly?")
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("I set your mom out to get it, but I think she got caught up with Mrs. Longline.")
  SV.tarro_town.PieChapter = 11
end

function Bluetails.AfterMailTime()
  GAME:CutsceneMode(true)
  local maru = CH("Maru")
  local azura = CH("Teammate1")
  local arama = CH("Arama")
  local amazuru = CH("Amazuru")
  local real_maru = CH("PLAYER")
  GAME:MoveCamera(229, 248, 1, false)
  GROUND:TeleportTo(amazuru, 202, 211, Direction.Down, 0)
  GROUND:TeleportTon(azura, 186, 240, Direction.UpRight, 6)
  GROUND:TeleportTo(maru, 221, 240, Direction.UpLeft, 2)
  GROUND:TeleportTo(arama, 202, 600, Direction.UpRight, 0)
  GROUND:TeleportTo(real_maru, 1000, 1000, Direction.UpRight, 0)

  UI:SetSpeaker(amazuru)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("You two have the mail, I'm guessing.")

  local coro1 = TASK:BranchCoroutine(function() 
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Yeah.[pause=30] But,[emote=Worried] this letter has a little weird print on it.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Maybe you know about it?")

    UI:ResetSpeaker()
    UI:WaitShowDialogue("Maru gives his dad the letter.")
    end)	
  local coro2 = TASK:BranchCoroutine(function() 
    GAME:FadeIn(40)
    end)
  
  TASK:JoinCoroutines({coro1, coro2})

  UI:SetSpeaker(amazuru)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Well, let's see here...")

  local coro01 = TASK:BranchCoroutine(function()
    COMMON.FaceEachother("Arama", "Teammate1")
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Hey kids! So sorry, I was talking a while with our neighbor.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("Mama!")
    end)	
  local coro02 = TASK:BranchCoroutine(function()
    GROUND:MoveToPosition(arama, 202, 300, false, 2)
    GAME:WaitFrames(35)
    COMMON.CharExclaim("Amazuru")
    GAME:WaitFrames(25)
    COMMON.CharSweatdrop("Amazuru")
    end)
  
  TASK:JoinCoroutines({coro01, coro02})

  UI:SetSpeaker(arama)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("Ama, is everything okay?")

  local coro11 = TASK:BranchCoroutine(function() 
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Ara,[pause=25] you're gonna want to see this later...")
    UI:WaitShowDialogue("It's important.")

    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Um, go to the basement, we'll talk about it later.")
    end)	
  local coro12 = TASK:BranchCoroutine(function()
    GROUND:MoveToPosition(amazuru, 135, 172, false, 2)
    COMMON.FaceEachother("Arama", "Amazuru")
    end)
  
  TASK:JoinCoroutines({coro11, coro12}) 
  GROUND:CharAnimateTurn(amazuru, Direction.UpLeft, 4, false)
  GROUND:Hide("Amazuru")

  local coro21 = TASK:BranchCoroutine(function()
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("While he's down there...")

    GROUND:CharTurnToCharAnimated(maru, arama, 5)
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("I guess since you two know your way around dungeons,[pause=50] how about I teach you about ovens?")
    end)	
  local coro22 = TASK:BranchCoroutine(function()
    COMMON.CharSweatdrop("Teammate1")
    GAME:WaitFrames(35)
    GROUND:CharTurnToCharAnimated(azura, arama, 5)
    end)
  
  TASK:JoinCoroutines({coro21, coro22})

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Inspired")
  UI:WaitShowDialogue("Really?")

  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("I'll show ya.")
end