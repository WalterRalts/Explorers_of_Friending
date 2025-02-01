--[[
    init.lua
    Created: 09/05/2024 13:00:56
    Description: Autogenerated script file for the map TarroTownSquare_ch3.
]]--
-- Commonly included lua functions and data
require 'explorers_of_friending.common'


-- Package name
local TarroTownSquare_ch3 = {}

-------------------------------
-- Map Callbacks
-------------------------------
---TarroTownSquare_ch3.Init(map)
--Engine callback function
function TarroTownSquare_ch3.Init(map)
  
  MapStrings = STRINGS.MapStrings
  COMMON.RespawnAllies()
  local partner = CH('Teammate1')
  partner.CollisionDisabled = true
  
  if outside_enter == 3 then
    GROUND:TeleportTo(partner, 30, 254, Direction.Right, 0)
  end
  if outside_enter == 4 then
    GROUND:TeleportTo(partner, 405, 230, Direction.Down, 0)
  end
  
  AI:SetCharacterAI(partner, "origin.ai.ground_partner", CH('PLAYER'), partner.Position)
end

---TarroTownSquare_ch3.Enter(map)
--Engine callback function
function TarroTownSquare_ch3.Enter(map)

  GAME:FadeIn(20)

end

---TarroTownSquare_ch3.Exit(map)
--Engine callback function
function TarroTownSquare_ch3.Exit(map)


end

---TarroTownSquare_ch3.Update(map)
--Engine callback function
function TarroTownSquare_ch3.Update(map)
  local lax = CH("Lax")
  local sleepy_lax = false
  if sleepy_lax == false then
    GROUND:CharSetAnim(lax, "Sleep", true)
    sleepy_lax = true
  end
  
  local maru = CH("PLAYER")
  local azura = CH('Teammate1')

  if GAME:IsKeyDown(66) then
    if SV.tarro_town.DarknessChapter == 1 then
      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Now's probably a great time to go through the Big Tree.") 

      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Oh yeah, let's go in there!")
    else
      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Yeah, town!")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Whoo, town!")  
    end
  end
end

---TarroTownSquare_ch3.GameSave(map)
--Engine callback function
function TarroTownSquare_ch3.GameSave(map)


end

---TarroTownSquare_ch3.GameLoad(map)
--Engine callback function
function TarroTownSquare_ch3.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------

function TarroTownSquare_ch3.Lax_Action(obj, activator)
  local munch = CH("Munch")
  local lax = CH("Lax")
  GROUND:CharSetAnim(lax, "Sleep", true)
  
  UI:ResetSpeaker()
  UI:WaitShowDialogue("Zzzzzzzzz...")
  
  UI:SetSpeaker(munch)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Pops... getcha self up, would ya.")
end

function TarroTownSquare_ch3.Getic_Action(obj, activator)
  local getic = CH("Getic")

  COMMON.FaceEachother("Getic", "PLAYER")
  UI:SetSpeaker(getic)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Gonna let you know, Maru")
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("You get older, and everything becomes pins and needles.")
  GROUND:CharAnimateTurn(getic, Direction.DownRight, 4, false)
end

function TarroTownSquare_ch3.Buzzer_Action(obj, activator)
  local buzzer = CH("Buzzer")
  local maru = CH("PLAYER")
  GROUND:CharTurnToCharAnimated(buzzer, maru, 2)
  UI:SetSpeaker(buzzer)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("Oi! [pause=50]Behind the counter, buzz!")
  GROUND:CharAnimateTurn(buzzer, Direction.Left, 4, true)
end

function TarroTownSquare_ch3.Gekis_Action(obj, activator)
  local gekis = CH("Gekis")
  UI:SetSpeaker(gekis)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("My two little kids...")
end

function TarroTownSquare_ch3.Ribbon_Action(obj, activator)
  local ribbon = CH("Ribbon")
  local maru = CH("PLAYER")
  GROUND:CharTurnToCharAnimated(ribbon, maru, 2)
  UI:SetSpeaker(ribbon)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Welcome to our little setup, friend.")
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("We aren't ready yet, though. [pause=20]Do come back later.")
  GROUND:CharAnimateTurn(ribbon, Direction.DownLeft, 4, false)
end

function TarroTownSquare_ch3.BuzzStore_Action(obj, activator)
  local buzzer = CH("Buzzer")
  local maru = CH("PLAYER")
  GROUND:CharTurnToCharAnimated(buzzer, maru, 2)
  UI:SetSpeaker(buzzer)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Sorry, buzzas.")
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("Can't open the store up yet,[pause=35] setting it up perfectly iz harder then it lookz, buzz.")
  --[[UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Welcome, welcome, buzz!")
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Got some quick stuff here, so buy something, will ya!")
  BuzzerShopStart()]]
end

function TarroTownSquare_ch3.TTown_SouthExit_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  outside_enter = 2
  GAME:EnterGroundMap("tarro_town_outside", "TarroTownEast_ch3", "TTSquare_TownExit")
end

function TarroTownSquare_ch3.Plus_Action()
  local doc = CH("Dr_Chance")
  local plus = CH("Plus")
  local happy = CH("Happy")

  UI:SetSpeaker(plus)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("Come on, you gotta let me see her!")
  UI:SetSpeakerEmotion("Teary-Eyed")
  UI:WaitShowDialogue("Please...!")

  UI:SetSpeaker(happy)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("No, Plus, she needs her time to rest!")

  UI:SetSpeaker(plus)
  UI:SetSpeakerEmotion("Sad")
  UI:WaitShowDialogue("This just isn't like her...!")
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Is she okay?")

  UI:SetSpeaker(doc)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("I can assure you, Plus, she will be fine in a little while.")
end

function TarroTownSquare_ch3.Happy_Action(obj, activator)
  TarroTownSquare_ch3.Plus_Action()
end

function TarroTownSquare_ch3.Dr_Chance_Action(obj, activator)
  TarroTownSquare_ch3.Plus_Action()
end

function TarroTownSquare_ch3.Gepii_Action(obj, activator)
    local gepii = CH("Gepii")
    local getic = CH("Getic")
    local gekis = CH("Gekis")
    gepii_dialogue = math.random(1, 4)
    if gepii_dialogue == 1 then
        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Hey mum, can I go into the forest and explore?")

        UI:SetSpeaker(gekis)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("You'll have to have someone with you, Gepii.")

        UI:SetSpeaker(getic)
        UI:SetSpeakerEmotion("Sigh")
        UI:WaitShowDialogue("And it isn't going to be me.")
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Not right now, at least.")
    elseif gepii_dialogue == 2 then
        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Sigh")
        UI:WaitShowDialogue("We've been waiting for dad for forever.[pause=45] W[emote=Worried]hen is he going to get here?")

        UI:SetSpeaker(getic)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("We've only been waiting for five minutes...")

        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Five minutes too long...")
    elseif gepii_dialogue == 3 then
        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Ooh![pause=25] Let's get some of the honey!")
        
        UI:SetSpeaker(gekis)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Gepii, I bought you three whole jars last week.[pause=25] And you still haven't even opened one...")

        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("More!")
    elseif gepii_dialogue == 4 then
        COMMON.FaceEachother("PLAYER", "Gepii")
        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Oh hey, Mars![pause=25] Welcome to town!")
        GROUND:CharAnimateTurn(gepii, Direction.Left, 4, false)
    end
    
end

--enters

function TarroTownSquare_ch3.TTown_HiveEntrance_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  outside_enter = 2
  GAME:EnterGroundMap("TarroTownHive", "TTSquare_HiveEnter")
end

function TarroTownSquare_ch3.PlumiHouse_Entrance_Touch(obj, activator)
  local maru = CH("PLAYER")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("If I go in there and touch anything, the two of them would probably start fighting again...")
end

function TarroTownSquare_ch3.BigTree_Entrance_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("TarroTownBigTree_ch3", "Tree_Enter")
end

return TarroTownSquare_ch3