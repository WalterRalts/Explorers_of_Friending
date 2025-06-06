--[[
    init.lua
    Created: 08/11/2024 14:35:15
    Description: Autogenerated script file for the map TarroTownEast_ch2.
]]--
-- Commonly included lua functions and data
require 'explorers_of_friending.common'
require 'explorers_of_friending.partner'
-- Package name
local TarroTownEast_ch2 = {}

-------------------------------
-- Map Callbacks
-------------------------------
---TarroTownEast_ch2.Init(map)
--Engine callback function
function TarroTownEast_ch2.Init(map)
  local puchi = CH('Puchi')
  GROUND:CharSetEmote(puchi, "Sleep", 0)
  GROUND:CharSetAnim(puchi, "Sleep", true)

  MapStrings = STRINGS.MapStrings
  COMMON.RespawnAllies()
  local partner = CH('Teammate1')
  GROUND:Hide("Furie")
  GROUND:Hide("Beel")
  
  if SV.tarro_town.PieChapter >= 6 then
    GROUND:Hide("Senna")
    GROUND:Hide("Ziggy")
    GROUND:Hide("Puchi")
    GROUND:Unhide("Furie")
    GROUND:Unhide("Beel")
  end
  if outside_enter == 1 then
    GROUND:TeleportTo(partner, 355, 401, Direction.Down, 0)
    GAME:FadeIn(20)
  elseif outside_enter == 2 then
    GROUND:TeleportTo(partner, 448, 19, Direction.Down, 0)
    GAME:FadeIn(20)
  end
  AI:SetCharacterAI(partner, "origin.ai.ground_partner", CH('PLAYER'), partner.Position)
  partner.CollisionDisabled = true
  SleepingPuchi = false
end

---TarroTownEast_ch2.Enter(map)
--Engine callback function
function TarroTownEast_ch2.Enter(map)
  
  GAME:FadeIn(20)
  
end

---TarroTownEast_ch2.Exit(map)
--Engine callback function
function TarroTownEast_ch2.Exit(map)


end

---TarroTownEast_ch2.Update(map)
--Engine callback function
function TarroTownEast_ch2.Update(map)
  
  Partner()

end

---TarroTownEast_ch2.GameSave(map)
--Engine callback function
function TarroTownEast_ch2.GameSave(map)


end

---TarroTownEast_ch2.GameLoad(map)
--Engine callback function
function TarroTownEast_ch2.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------

function TarroTownEast_ch2.TTEast_WExit_Touch(obj, activator)
  outside_enter = 1
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("TarroTownOutside", "TTOutside_WEnter")
end

function TarroTownEast_ch2.TarroForestEntrance_Touch(obj, activator)

  local maru = CH("PLAYER")

  if SV.tarro_town.PieChapter == 5 then
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("I don't think we have time for this...")
    dungeon_oof = 0
  elseif SV.tarro_town.PieChapter > 5 then
    local dungeon_entrances = {"tarro_forest"}
    local ground_entrances = {
      {Flag = true, Zone = "tarro_forest", ID = 1, Entry = 0}
    }
    COMMON.ShowDestinationMenu(dungeon_entrances, ground_entrances)
  else
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Hmm... maybe later...")
  end
end

function TarroTownEast_ch2.Ziggy_Action(obj, activator)
  TarroTownEast_ch2.Senna_Action()
end

function TarroTownEast_ch2.Sunny_Action(obj, activator)
  local sunny = CH("Sunny")
  local tango = CH('Tango')
  local mrseed = CH("MrSeed")
  local cherry = CH("Cherry")
  if SV.tarro_town.PieChapter == 5 then
    UI:SetSpeaker(sunny)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Alright, class!")
    GROUND:CharTurnToCharAnimated(sunny, cherry, 4)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("In order to properly synthesize,[pause=25] you must learn to naturally absorb the sun!")
    GROUND:CharTurnToCharAnimated(sunny, mrseed, 4)
    UI:WaitShowDialogue("Ready?")
    GROUND:CharTurnToCharAnimated(sunny, tango, 4)

    GROUND:CharSetAnim(sunny, "Charge", true)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("[speed=0.4]Inhale, [pause=25][speed=1.0]and [emote=Inspired]feel the sun through your pores...")
    
    UI:SetSpeaker(cherry)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Hey, Ms. Teacher?")
    GROUND:CharTurnToCharAnimated(tango, cherry, 4)
    GROUND:CharTurnToCharAnimated(sunny, cherry, 4)
    UI:SetSpeaker(cherry)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("When's the part where we shoot big[emote=Happy] fire lasers?")

    GROUND:CharSetAnim(sunny, "None", true)
    UI:SetSpeaker(sunny)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("That's[pause=23] irrelevant right now, Cherry.")
    
    UI:SetSpeaker(tango)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Heh.")

    GROUND:CharSetAnim(sunny, "Idle", true)
    COMMON.CharAngry("Sunny")
    COMMON.FaceEachother("Sunny", "Tango")
    UI:SetSpeaker(sunny)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Tango, shush!")
    
    UI:SetSpeaker(tango)
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("Hehehehahaha!")
  else
    UI:SetSpeaker(sunny)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Are you aware of the flowers that grow around us, class?")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("You can really learn a lot from them.")

    UI:SetSpeaker(tango)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Really...?")

    UI:SetSpeaker(sunny)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Just listen closely, you can hear them speak through the breeze!")

    GROUND:CharAnimateTurn(cherry, Direction.Right, 4, false)
    GAME:WaitFrames(12)
    local coro01 = TASK:BranchCoroutine(function() 
      GROUND:CharAnimateTurn(mrseed, Direction.DownRight, 4, false)
      end)	
    local coro02 = TASK:BranchCoroutine(function() 
      GROUND:CharAnimateTurn(tango, Direction.Down, 4, false)
      end)
  
    TASK:JoinCoroutines({coro01, coro02})
    GAME:WaitFrames(95)
    

    UI:SetSpeaker(mrseed)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Nope.")

    local function sunnycrying()
      GROUND:CharTurnToCharAnimated(cherry, sunny, 4)
      GROUND:CharSetAnim(sunny, "None", true)
      print("Start")
    end
    
    local coro1 = TASK:BranchCoroutine(function()
      GAME:WaitFrames(10)
      GROUND:CharTurnToCharAnimated(tango, sunny, 3)
      GROUND:CharTurnToCharAnimated(mrseed, sunny, 4)
      GAME:WaitFrames(30)
      COMMON.CharSweatdrop("Tango")
      end)	
    local coro2 = TASK:BranchCoroutine(function() 
      UI:SetSpeaker(cherry)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Yeah, I'm just hearing the wind[script=0] fl-...[pause=50][emote=Worried]", { sunnycrying })
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("Hey, teach,[pause=45] y[emote=Stunned]ou okay?")
      end)
  
    TASK:JoinCoroutines({coro1, coro2})

    UI:SetSpeaker(tango)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue("Oh no...")

    UI:SetSpeaker(sunny)
    UI:SetSpeakerEmotion("Teary-Eyed")
    UI:WaitShowDialogue("[speed=0.6]Their story... just... [pause=35]*sniffle*...[pause=40] so beautiful...!")

    GROUND:CharSetEmote(sunny, "sweating", 1)
    UI:SetSpeakerEmotion("Crying")
    UI:WaitShowDialogue("Waaaaaa!")
    GROUND:CharSetAnim(sunny, "Idle", true)
  end
end

function TarroTownEast_ch2.Tango_Action(obj, activator)
  TarroTownEast_ch2.Sunny_Action()
end

function TarroTownEast_ch2.Cherry_Action(obj, activator)
  TarroTownEast_ch2.Sunny_Action()
end

function TarroTownEast_ch2.MrSeed_Action(obj, activator)
  TarroTownEast_ch2.Sunny_Action()
end

function TarroTownEast_ch2.TTEastSign_Action(obj, activator)
  local maru = CH("PLAYER")
  UI:ResetSpeaker()
  UI:SetAutoFinish(true)
  UI:WaitShowDialogue("<- Tarro Town Outskirts \n Tarro Town Square ^")

  UI:SetAutoFinish(false)
  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Normal")
  GROUND:CharAnimateTurn(maru, Direction.Left, 4, true)
  UI:WaitShowDialogue("(I see.[pause=40] So that's the way to the other side of town.)")
  UI:WaitShowDialogue("(Praise be the deity of well-placed signs.)")
end

function TarroTownEast_ch2.Tsudo_Action(obj, activator)
  local tsudo = CH("Tsudo")
  UI:SetSpeaker(tsudo)
  tsudo_dialogue = math.random(1, 3)
  if tsudo_dialogue == 1 then
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("[color=#FFC663]I heard that there are two siblings that fight all the time in town![color] [pause=60][color=#AAAAA4]Are they really all that bad?[color]")
    GAME:WaitFrames(25)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("[color=#FFC663]That's seems like a pretty solvable issue.[color][pause=60] [color=#AAAAA4]Whatever the fight's about should be, at least...[color]")
  elseif tsudo_dialogue == 2 then
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("[color=#FFC663]Having two heads is great![color] [pause=60][color=#AAAAA4]...and also convenient![color]")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("[color=#FFC663]It's like a sibling![color] [pause=60][color=#AAAAA4]...but that sibling is you![color]")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("[color=#FFC663]Double the thinking![color] [pause=60][color=#AAAAA4]Less of the fights![color]")
  elseif tsudo_dialogue == 3 then
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("[color=#FFC663]Waking up in the morning is a good way to start your day![color] [pause=60][color=#AAAAA4]Unless you're nocturnal,[pause=15] the night time is better![color]")
  end
end

function TarroTownEast_ch2.Senna_Action(obj, activator)
  local maru = CH("PLAYER")
  local azura = CH("Teammate1")
  local senna = CH('Senna')
  local ziggy = CH('Ziggy')

  GROUND:MoveToPosition(maru, ziggy.Position.X, ziggy.Position.Y + 24, false, 2)
  GROUND:MoveToPosition(azura, senna.Position.X, senna.Position.Y + 24, false, 2)
  GROUND:CharTurnToCharAnimated(maru, ziggy, 4)
  GROUND:CharTurnToCharAnimated(azura, senna, 4)
  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("Mn... I can't... I couldn't.")

  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue("Come on, Senna, you're their friend too!");
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("They listen to you more, anyway!")
  
  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Sad")
  UI:WaitShowDialogue("I... wasn't much help before...")

  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue("Why does that matter now?!")

  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("[speed=0.6]Uhh...?")

  local function ziggyturn()
    GROUND:CharTurnToCharAnimated(ziggy, maru, 4)
  end

  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue("Ugh![pause=35][script=0] Mar, help! She's being insecure again!", { ziggyturn })
  local function sennacharge()
    GROUND:CharSetAnim(senna, "Charge", true)
  end
  local function sennafreeze()
    GROUND:CharSetAnim(senna, "None", true)
  end
  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("W[script=1]ha-...[pause=25] h-[pause=15]h[script=0][emote=Angry]ey!", { sennacharge, sennafreeze })

  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Angry")
  GROUND:CharTurnToCharAnimated(ziggy, senna, 2)
  GROUND:CharSetAnim(ziggy, "Charge", true)
  UI:WaitShowDialogue("You know it's true!")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("We'll just go...")

  GROUND:CharSetAnim(senna, "Idle", true)
  GROUND:CharSetAnim(ziggy, "Idle", true)
end

function TarroTownEast_ch2.SennaHomeEntrance_Touch(obj, activator)
  if SV.tarro_town.PieChapter < 6 then
    local maru = CH("PLAYER")
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("I think I have better things to do...")
  elseif SV.tarro_town.PieChapter >= 6 then
    local beel = CH("Beel")
    local furie = CH("Furie")
    UI:SetSpeaker(beel)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Oi, Maru.")
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("It is to my understanding that Ziggy and Senna went out.")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I can't just let you in for no reason, you know.")

    UI:SetSpeaker(furie)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Yes, Mr. Maru. If you're looking for Ziggy and Senna, they should be in town.")
  end
end

function TarroTownEast_ch2.MaruHomeEntrance_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("MaruHome", "MaruHome_MainEnter")
end

function TarroTownEast_ch2.TTEast_NExit_Touch(obj, activator)
  GAME:FadeOut(false, 35)
  GAME:EnterGroundMap("tarro_town", "TarroTownSquare", "TTSquare_EastEnter")
end

function TarroTownEast_ch2.Puchi_Action(obj, activator)
  local maru = CH("PLAYER")
  local azura = CH('Teammate1')
  local puchi = CH('Puchi')
  local ziggy = CH('Ziggy')
  GROUND:CharTurnToCharAnimated(maru, puchi, 4)
  GROUND:CharTurnToCharAnimated(azura, puchi, 4)
  GROUND:CharTurnToCharAnimated(puchi, maru, 4)
  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("...Puchi?")

  GROUND:CharSetEmote(puchi, "exclaim", 1)
  GROUND:CharSetAnim(puchi, "Hop", false)

  UI:SetSpeaker(puchi)
  UI:SetSpeakerEmotion("Surprised")
  UI:WaitShowDialogue("[speed=1.5]What,[pause=45] huh?!")
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("[speed=0.6]...o-oh... I'm awake.")

  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("You seem... tired...")

  UI:SetSpeaker(puchi)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("[speed=0.5]Ugh,[pause=25] someone decided to wake me up earlier than usual...")
  UI:SetSpeakerEmotion("Angry")
  GROUND:CharTurnToCharAnimated(puchi, ziggy, 4)
  UI:WaitShowDialogue("...grrrrr.")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Oh. He's a cool morning call, I'd say.")

  UI:SetSpeaker(puchi)
  UI:SetSpeakerEmotion("Pain")
  GROUND:CharTurnToCharAnimated(puchi, maru, 2)
  UI:WaitShowDialogue("[speed=0.15]...absol[emote=Determined]utely cool...")
  UI:SetSpeakerEmotion("Dizzy")
  UI:WaitShowDialogue("[speed=0.3]Guh... [speed=0.1]...so tired.")

  GROUND:CharSetEmote(puchi, "Sleep", 0)
  GROUND:CharSetAnim(puchi, "Sleep", true)
end

function TarroTownEast_ch2.Furie_Action(obj, activator)
  TarroTownEast_ch2.Beel_Action()
end

function TarroTownEast_ch2.Beel_Action(obj, activator)
  local maru = CH("PLAYER")
  local furie = CH('Furie')
  local beel = CH('Beel')
  UI:SetSpeaker(beel)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("I'm concerned for them,[pause=35] but as long as they're fine, then I am fine.")

  UI:SetSpeaker(furie)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Of course, dear, that was never a problem.")
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("I'm more attentive to those friends of theirs.")
  UI:WaitShowDialogue("What if...[pause=55] they're bad...?")
  
  UI:SetSpeaker(beel)
  GROUND:CharSetAnim(beel, "None", true)
  GROUND:CharSetAnim(furie, "None", true)
  GROUND:CharTurnToCharAnimated(furie, maru, 7)
  GROUND:CharTurnToCharAnimated(beel, maru, 7)
  GAME:WaitFrames(35)
  UI:WaitShowTimedDialogue("[speed=0.02]...", 90)
  GROUND:CharTurnToCharAnimated(furie, beel, 4)
  GROUND:CharTurnToCharAnimated(beel, furie, 4)
  GROUND:CharSetAnim(beel, "Idle", true)
  GROUND:CharSetAnim(furie, "Idle", true)
  UI:WaitShowDialogue("They'll be fine.")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Hehe...!")
end

return TarroTownEast_ch2



