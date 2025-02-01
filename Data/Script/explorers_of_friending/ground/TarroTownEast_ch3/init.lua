--[[
    init.lua
    Created: 08/11/2024 14:35:15
    Description: Autogenerated script file for the map TarroTownEast_ch3.
]]--
-- Commonly included lua functions and data
require 'explorers_of_friending.common'
require 'origin.common'

-- Package name
local TarroTownEast_ch3 = {}

-------------------------------
-- Map Callbacks
-------------------------------
---TarroTownEast_ch3.Init(map)
--Engine callback function
function TarroTownEast_ch3.Init(map)
  print("Here!")
  if SV.tarro_town.DarknessChapter > 0 then
    GROUND:Hide("Furie")
    GROUND:Hide("Arama")
  end
  if mail_read == nil then
    mail_read = 0
  end
  MapStrings = STRINGS.MapStrings
  COMMON.RespawnAllies()
  local partner = CH('Teammate1')
  if outside_enter == 1 then
    GROUND:TeleportTo(partner, 355, 401, Direction.Down, 0)
  elseif outside_enter == 2 then
    GROUND:TeleportTo(partner, 448, 19, Direction.Down, 0)
  elseif outside_enter == 3 then
    GROUND:TeleportTo(partner, 468, 411, Direction.Down, 0)
  elseif outside_enter == 4 then
    GROUND:TeleportTo(partner, 244, 96, Direction.Down, 0)
  end

  AI:SetCharacterAI(partner, "origin.ai.ground_partner", CH('PLAYER'), partner.Position)
  partner.CollisionDisabled = true
 
end

---TarroTownEast_ch3.Enter(map)
--Engine callback function
function TarroTownEast_ch3.Enter(map)
  
  GAME:FadeIn(20)
  
end

---TarroTownEast_ch3.Exit(map)
--Engine callback function
function TarroTownEast_ch3.Exit(map)


end

---TarroTownEast_ch3.Update(map)
--Engine callback function
function TarroTownEast_ch3.Update(map)

  local maru = CH("PLAYER")
  local azura = CH('Teammate1')

  if GAME:IsKeyDown(66) then
    print("Partner")
  end
  if GAME:IsKeyDown(66) then
    if SV.tarro_town.DarknessChapter == 1 then
      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Okay, I got it...![pause=30] Let's uhhhh...")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Maybe we should go to the tree and check it out?")
    else
      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Home sweet home.")

      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("Did we we even do anything?")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Probably not.")
    end
  end
end

---TarroTownEast_ch3.GameSave(map)
--Engine callback function
function TarroTownEast_ch3.GameSave(map)


end

---TarroTownEast_ch3.GameLoad(map)
--Engine callback function
function TarroTownEast_ch3.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------

function TarroTownEast_ch3.SennaHomeEntrance_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("SennaHome", "Marker")
end

function TarroTownEast_ch3.MaruHomeEntrance_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("MaruHome", "MaruHome_MainEnter")
end

function TarroTownEast_ch3.Sunny_Action(obj, activator)
  local sunny = CH("Sunny")
  local tango = CH('Tango')
  local mrseed = CH("MrSeed")
  local loast = CH("Loast")
  local cherry = CH("Cherry")
  
  UI:SetSpeaker(sunny)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Okay, class!")
  GROUND:CharTurnToCharAnimated(sunny, cherry, 4)
  UI:WaitShowDialogue("Our next lesson will be about finding water!")
  GROUND:CharTurnToCharAnimated(sunny, tango, 4)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowTimedDialogue("Every Pokemon needs some water in their system to live a healthy life!")

  GROUND:CharTurnToCharAnimated(cherry, loast, 4)
  UI:SetSpeaker(cherry)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Found it.")

  
  UI:SetSpeaker(sunny)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("What?[pause=20] Where??")

  local coro01 = TASK:BranchCoroutine(function() 
    GROUND:CharTurnToCharAnimated(tango, loast, 4)
    end)	
  local coro02 = TASK:BranchCoroutine(function() 
    GROUND:CharTurnToCharAnimated(mrseed, loast, 4)
    GROUND:CharTurnToCharAnimated(sunny, loast, 4)
    end)

  TASK:JoinCoroutines({coro01, coro02})

  GAME:WaitFrames(35)
  
  COMMON.CharExclaim("Loast")
  GROUND:CharTurnToCharAnimated(loast, cherry, 4)
  UI:SetSpeaker(loast)
  UI:SetSpeakerEmotion("Surprised")
  UI:WaitShowDialogue("Wha- huh?! Me?!")
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowTimedDialogue("[speed=0.5]How would I-")

  UI:SetSpeaker(mrseed)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Water Gun.")
  
  UI:SetSpeaker(tango)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Yeah, I'm sure that counts, doesn't it?")
  
  UI:SetSpeaker(loast)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowTimedDialogue("[speed=0.4]Well, uhhhhhhhhhhhhhhhhhh")

  local coro001 = TASK:BranchCoroutine(function() 
    GROUND:CharTurnToCharAnimated(mrseed, sunny, 4)
    GROUND:CharTurnToCharAnimated(loast, sunny, 4)
    end)	
  local coro002 = TASK:BranchCoroutine(function() 
    GROUND:CharTurnToCharAnimated(tango, sunny, 4)
    GROUND:CharTurnToCharAnimated(cherry, sunny, 4)
    GROUND:CharAnimateTurn(sunny, Direction.Right, 4, false)

    UI:SetSpeaker(sunny)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Class, let's not bother our fellow students.[pause=30] Plants must learn to depend on more nuatural sources.")
    end)

  TASK:JoinCoroutines({coro001, coro002})

  GROUND:CharTurnToCharAnimated(sunny, cherry, 4)
  UI:SetSpeaker(cherry)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("But he can[pause=10] n[emote=Happy]aturally[pause=10] give us some water.")

  GROUND:CharTurnToCharAnimated(loast, cherry, 4)
  GROUND:CharAnimateTurn(sunny, Direction.Right, 4, true)
  UI:SetSpeaker(loast)
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("(I'm sure that wouldn't work...)")
  GROUND:CharTurnToCharAnimated(loast, sunny, 4)
end

function TarroTownEast_ch3.Tango_Action(obj, activator)
  TarroTownEast_ch3.Sunny_Action()
end

function TarroTownEast_ch3.Cherry_Action(obj, activator)
  TarroTownEast_ch3.Sunny_Action()
end

function TarroTownEast_ch3.MrSeed_Action(obj, activator)
  TarroTownEast_ch3.Sunny_Action()
end

function TarroTownEast_ch3.Loast_Action(obj, activator)
  TarroTownEast_ch3.Sunny_Action()
end

function TarroTownEast_ch3.TTEast_WExit_Touch(obj, activator)
  outside_enter = 1
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("TarroTownOutside", "TTOutside_WEnter")
end

function TarroTownEast_ch3.TarroForestEntrance_Touch(obj, activator)

  local maru = CH("PLAYER")
  
  if SV.tarro_town.PieChapter >= 10 then
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

function TarroTownEast_ch3.Arama_Action(obj, activator)
  local furie = CH("Furie")
  local arama = CH("Arama")
  local maru = CH("PLAYER")
  local azura = CH("Teammate1")

  if mail_read == 1 then
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowTimedDialogue("Hey, mom.")
  
    UI:SetSpeaker(furie)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I think it's a pretty decent idea, Mrs. Arama.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowTimedDialogue("Mama...")
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("I can make enough for everyone, I'm sure!")

    COMMON.FaceEachother("PLAYER", "Teammate1")
    GAME:WaitFrames(22)
    COMMON.CharSweatdrop("PLAYER")
    GAME:WaitFrames(12)
    COMMON.CharSweatdrop("Teammate1")
    GAME:WaitFrames(12)

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Guess we're telling dad...")
  else
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Maybe I just need a break.")
  
    UI:SetSpeaker(furie)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("A break?[pause=0] Mrs. Arama, you worry too much.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Your kids are smart,[pause=30] they know why you watch over them so much.")
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("I just... don't want to...")  
  
    UI:SetSpeaker(furie)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("You'll never lose them,[pause=15] and you'll never lose us.")
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("Friends until it ends,[pause=15] r[emote=Happy]emember?")
  
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Pfft,[pause=20] you're such a noodle.")  
  end
end

function TarroTownEast_ch3.MaruMail_Action(obj, activator)
  local maru = CH("PLAYER")
  local azura = CH("Teammate1")
  if mail_read == 0 then
    
    UI:ResetSpeaker()
    UI:SetAutoFinish(true)
    UI:WaitShowDialogue("Maru opens the mailbox. A letter is inside.")
    UI:WaitShowBG("MarAzuMail", 3, 60)
    UI:WaitShowDialogue("\'To the two small ones.\nMeet me at the end of Deep Tarro.\n Do not worry about timing.\n I will know when you arrive...\'")

    UI:SetAutoFinish(false)
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("There's a weird looking mark on here...")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Should we tell dad?")
    UI:WaitHideBG(30)

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Maybe this letter isn't for us. We should tell him.")
    mail_read = 1
  else
    UI:ResetSpeaker()
    UI:SetAutoFinish(true)
    UI:WaitShowDialogue("The mailbox is empty.")

    UI:SetAutoFinish(false)
  end
end

function TarroTownEast_ch3.TTEast_NExit_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("tarro_town", "TarroTownSquare_ch3", "TTSquare_EastEnter")
end

return TarroTownEast_ch3



