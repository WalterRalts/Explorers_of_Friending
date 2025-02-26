--[[
    init.lua
    Created: 09/18/2024 13:37:43
    Description: Autogenerated script file for the map TarroTownBigTree_ch3.
]]--
-- Commonly included lua functions and data
require 'explorers_of_friending.common'

-- Package name
local TarroTownBigTree_ch3 = {}

-------------------------------
-- Map Callbacks
-------------------------------
---TarroTownBigTree_ch3.Init(map)
--Engine callback function
function TarroTownBigTree_ch3.Init(map)
  --SV.tarro_town.PieChapter == 7 is the first cutscene
  MapStrings = STRINGS.MapStrings
  COMMON.RespawnAllies()
  local partner = CH('Teammate1')
  AI:SetCharacterAI(partner, "origin.ai.ground_partner", CH('PLAYER'), partner.Position)
  partner.CollisionDisabled = true

end

---TarroTownBigTree_ch3.Enter(map)
--Engine callback function
function TarroTownBigTree_ch3.Enter(map)

  GAME:FadeIn(20)

end

---TarroTownBigTree_ch3.Exit(map)
--Engine callback function
function TarroTownBigTree_ch3.Exit(map)


end

---TarroTownBigTree_ch3.Update(map)
--Engine callback function
function TarroTownBigTree_ch3.Update(map)


end

---TarroTownBigTree_ch3.GameSave(map)
--Engine callback function
function TarroTownBigTree_ch3.GameSave(map)


end

---TarroTownBigTree_ch3.GameLoad(map)
--Engine callback function
function TarroTownBigTree_ch3.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------
function TarroTownBigTree_ch3.TreeHallow_Entrance_Touch(obj, activator)
  COMMON.UnlockWithFanfare("tarro_tree_hollows", false)
  local dungeon_entrances = {"tarro_tree_hollows"}
  local ground_entrances = {}
  COMMON.ShowDestinationMenu(dungeon_entrances, ground_entrances)
end

function TarroTownBigTree_ch3.InfoSign_Action(obj, activator)
  local maru = CH("PLAYER")
  local azura = CH('Teammate1')
  local ziggy = CH("Teammate4")
  local senna = CH('Teammate2')
  local puchi = CH("Teammate3")

  UI:ResetSpeaker()
  UI:WaitShowDialogue("Today's news!:")
  UI:WaitShowDialogue("The mayor is looking for more recruits to carry her honey around.")
  UI:WaitShowDialogue("Payment will be done bihourly by Queen herself.")
  UI:WaitShowDialogue("All help is welcome!")

  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Weird, the sign is usually updated.")

  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue("That thing probably has something to do with this!")

  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue("Let's get after it!")
end

function TarroTownBigTree_ch3.Tree_2ndFloorEntrance_Touch(obj, activator)
  
end

function TarroTownBigTree_ch3.PurpKek_Counter_Action(obj, activator)
  local ziggy = CH("Teammate4")
  local senna = CH('Teammate2')
  local puchi = CH("Teammate3")

  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Here is where the other Kecleon brother would set up shop.")

  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Where did he go?")

  UI:SetSpeaker(puchi)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Outside, maybe? He's usually always here...")
end

function TarroTownBigTree_ch3.Tree_Exit_Touch(obj, activator)
  UI:ChoiceMenuYesNo("Exit?", false)
  UI:WaitForChoice()
  local choice = UI:ChoiceResult()
  if choice then
    local ziggy = CH("Teammate4")
    local senna = CH('Teammate2')
    local puchi = CH("Teammate3")
  
    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Leaving?")

    UI:SetSpeaker(ziggy)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("We'll wait here for you two to get stuff.")

    UI:SetSpeaker(puchi)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("And I'll get more sleep...")
    SV.tarro_tree_hollows.entering_party = GAME:GetPlayerPartyTable()
    GAME:RemovePlayerTeam(2)
    GAME:RemovePlayerTeam(2)
    GAME:RemovePlayerTeam(2)
    GAME:FadeOut(false, 20)
    SV.tarro_town.PieChapter = 7.1
    outside_enter = 4
    GAME:EnterGroundMap("tarro_town", "TarroTownSquare", "TarroTree_Exit")
  else
    
  end
end

return TarroTownBigTree_ch3

