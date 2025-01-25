--[[
    init.lua
    Created: 01/11/2025 14:19:34
    Description: Autogenerated script file for the map TarroTownWest.
]]--
-- Commonly included lua functions and data
require 'origin.common'

-- Package name
local TarroTownWest = {}

-------------------------------
-- Map Callbacks
-------------------------------
---TarroTownWest.Init(map)
--Engine callback function
function TarroTownWest.Init(map)
  MapStrings = STRINGS.MapStrings
  COMMON.RespawnAllies()
  local partner = CH('Teammate1')
  AI:SetCharacterAI(partner, "origin.ai.ground_partner", CH('PLAYER'), partner.Position)
  partner.CollisionDisabled = true

end

---TarroTownWest.Enter(map)
--Engine callback function
function TarroTownWest.Enter(map)

  GAME:FadeIn(20)

end

---TarroTownWest.Exit(map)
--Engine callback function
function TarroTownWest.Exit(map)


end

---TarroTownWest.Update(map)
--Engine callback function
function TarroTownWest.Update(map)


end

---TarroTownWest.GameSave(map)
--Engine callback function
function TarroTownWest.GameSave(map)


end

---TarroTownWest.GameLoad(map)
--Engine callback function
function TarroTownWest.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------

-- Characters

function TarroTownWest.Sproutious_Action(obj, activator)
  local sprout = CH("Sproutious")

  UI:SetSpeaker(sprout)
  UI:SetSpeakerEmotion("Inspired")
  UI:WaitShowDialogue("The glorious sun that shines over us.")
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("The foliage-types lay themselves on these soft beddings and rest their chlorophyllic apendages.")
  COMMON.FaceEachother("Sproutious", "PLAYER")
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Given you ever need a break, 'tis always space off of the beds laid upon thee.")
  UI:WaitShowDialogue("Our sun we absorb is also yours to collect the same.")

  GROUND:CharAnimateTurn(sprout, Direction.UpRight, 2, false)
end

function TarroTownWest.Malia_Action(obj, activator)
  local malia = CH("Malia")
  local puchi = CH("Puchi")

  UI:SetSpeaker(malia)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("So you went into the tree?!")

  UI:SetSpeaker(puchi)
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("Yeah...")

  UI:SetSpeaker(malia)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("Without my permission?!")

  UI:SetSpeaker(puchi)
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("Yeah...")

  UI:SetSpeaker(malia)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("And you made it through?!")

  UI:SetSpeaker(puchi)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Yeah...?")

  UI:SetSpeaker(malia)
  UI:SetSpeakerEmotion("Joyous")
  UI:WaitShowDialogue("That's my Puchi boy!")

  UI:SetSpeaker(puchi)
  UI:SetSpeakerEmotion("Sigh")
  UI:WaitShowDialogue("Thanks, mom...")
end

function TarroTownWest.Puchi_Action(obj, activator)
  TarroTownWest.Malia_Action()
end

-- Entrances

function TarroTownWest.TarroTown_Entrance_Touch()
  GAME:FadeOut(false, 35)
  GAME:EnterGroundMap("tarro_town", "TarroTownSquare", "TTSquare_EastEnter")
end

function TarroTownWest.TarroTownOutside_Entrance_Touch()
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("TarroTownOutside", "TTOutside_EEnter")
end

function TarroTownWest.PlantationStorage_Entrance_Touch()
  local maru = CH("PLAYER")
  
  if sign_check == 1 then
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I think it would be best if I didn't go in.")
  else
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Maybe I should check the sign first...?")
  end
end

function TarroTownWest.PlantationStorage_Sign_Action()
  sign_check = 1
  UI:ResetSpeaker()
  UI:SetAutoFinish(true)
  UI:WaitShowDialogue("These stairs lead to the plant-storage room. Do not touch any of the plants within the facility. Thank you.\n - Greenly Facility")

  UI:SetAutoFinish(false)
end

return TarroTownWest

