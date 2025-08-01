--[[
    init.lua
    Created: 06/09/2025 22:54:33
    Description: Autogenerated script file for the map EntohTownSouth_ch2.
]]--
-- Commonly included lua functions and data
require 'origin.common'
require 'explorers_of_friending.ground.EntohTownSouth_ch2.cutscene'

-- Package name
local EntohTownSouth_ch2 = {}

-------------------------------
-- Map Callbacks
-------------------------------
---EntohTownSouth_ch2.Init(map)
--Engine callback function
function EntohTownSouth_ch2.Init(map)
  if SV.entoh_town.HelperChapter == 6 then
    South_ch2.GoingIn()
  elseif SV.entoh_town.HelperChapter == 7 then
    South_ch2.GoingInFull()
  end
end

---EntohTownSouth_ch2.Enter(map)
--Engine callback function
function EntohTownSouth_ch2.Enter(map)

  GAME:FadeIn(20)

end

---EntohTownSouth_ch2.Exit(map)
--Engine callback function
function EntohTownSouth_ch2.Exit(map)


end

---EntohTownSouth_ch2.Update(map)
--Engine callback function
function EntohTownSouth_ch2.Update(map)


end

---EntohTownSouth_ch2.GameSave(map)
--Engine callback function
function EntohTownSouth_ch2.GameSave(map)


end

---EntohTownSouth_ch2.GameLoad(map)
--Engine callback function
function EntohTownSouth_ch2.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------

--Characters

local pietalk = 0
function EntohTownSouth_ch2.Pie_Action(obj, activator)
  local pie = CH('Pie')
  if pietalk == 0 then
    COMMON.SetCharAndEmotion(pie, "Worried")
    UI:WaitShowDialogue("[speed=0.6]Weird,[pause=20] I feel like I've been summoned here but there's no other apple around...")
    pietalk = 1
  else
    COMMON.SetCharAndEmotion(pie, "Normal")
    UI:WaitShowDialogue("[speed=0.6]Maybe it's just my imagination...")
  end
end

function EntohTownSouth_ch2.Moonoo_Action(obj, activator)
  local mono = CH("Moonoo")
  
  COMMON.SetCharAndEmotion(mono, "Stunned")
  UI:WaitShowDialogue("What going on?~[pause=30] Why is everyone seemingly appearing out of nowhere...?~")
  UI:WaitShowDialogue("Am I still dreaming?~")
end

function EntohTownSouth_ch2.Snow_Action(obj, activator)
  local snow = CH("Snow")
  
  COMMON.SetCharAndEmotion(snow, "Happy")
  UI:WaitShowDialogue("M-mama says that she's making some frost snacks l-later to help me g-get my mind off of this...")
  UI:ChoiceMenuYesNo("Sh-should I give some to you later, m-maybe?", false)
  UI:WaitForChoice()

  if result then
    SV.entoh_town.snowtreat = true
    UI:WaitShowDialogue("O-okay... got it...")
  else
    SV.entoh_town.snowtreat = true
    UI:WaitShowDialogue("Okay... m-more for me.")
  end
end

function EntohTownSouth_ch2.Frost_Action(obj, activator)
  local frost = CH("Frost")
  local rexio = CH("PLAYER")
  local snow = CH("Snow")
  
  COMMON.SetCharAndEmotion(frost, "Normal")
  UI:WaitShowDialogue("...")

  COMMON.SetCharAndEmotion(rexio, "Normal")
  UI:WaitShowDialogue("...")

  COMMON.SetCharAndEmotion(frost, "Happy")
  UI:WaitShowDialogue("H-... hello...")

  COMMON.SetCharAndEmotion(rexio, "Normal")
  UI:WaitShowDialogue("Heyo.")

  COMMON.FaceEachother("Frost", "Snow")
  GAME:WaitFrames(20)
  COMMON.CharHop("Frost")
  GAME:WaitFrames(30)
  COMMON.SetCharAndEmotion(snow, "Normal")
  UI:WaitShowDialogue("M-mom... I know, he's a g-good friend. You d-don't... need to remind me...")
end
--Entities

function EntohTownSouth_ch2.Storage_Action(obj, activator)
  COMMON:ShowTeamStorageMenu()
end

function EntohTownSouth_ch2.MissionBoard_Action(obj, activator)
  local rexio = CH('PLAYER')
  COMMON.SetCharAndEmotion(rexio, "Worried")
  UI:WaitShowDialogue("(...geez, the rescue teams are slacking.)")
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("(Maybe they need me on their team, haha.)")
end

--Exits

function EntohTownSouth_ch2.EntohSouth_NExit_Touch(obj, activator)
  SV.entoh_town.HelperChapter = 8
  GAME:EnterGroundMap("EntohTownCenter_ch2", "EnterMark_South")
end

return EntohTownSouth_ch2

