--[[
    init.lua
    Created: 08/31/2024 17:32:02
    Description: Autogenerated script file for the map tarro_forest.
]]--
-- Commonly included lua functions and data
require 'explorers_of_friending.common'

-- Package name
local tarro_forest = {}

-------------------------------
-- Zone Callbacks
-------------------------------
---tarro_forest.Init(zone)
--Engine callback function
function tarro_forest.Init(zone)
  
end

---tarro_forest.EnterSegment(zone, rescuing, segmentID, mapID)
--Engine callback function
function tarro_forest.EnterSegment(zone, rescuing, segmentID, mapID)
  
end

---tarro_forest.ExitSegment(zone, result, rescue, segmentID, mapID)
--Engine callback function
function tarro_forest.ExitSegment(zone, result, rescue, segmentID, mapID)
  if result ~= RogueEssence.Data.GameProgress.ResultType.Cleared then
    if segmentID == 0 then
      SV.tarro_town.PieChapter = 2.1
    elseif segmentID == 1 then
      SV.tarro_town.PieChapter = 2.2
    end
    COMMON.EndDungeonDay(result, "tarro_town_outside", -1, 1, 2)
  else
    if SV.tarro_forest.ZoomerDefeated == false then
      if segmentID == 0 then
        GAME:EnterZone("tarro_forest", -1, 0, 0)
      else
        SV.tarro_forest.ZoomerDefeated = true
        GAME:EnterZone("tarro_forest", -1, 0, 0)
      end
    else
      if segmentID == 0 then
        COMMON.EndDungeonDay(result, "tarro_forest", -1, 1, 0)
        SV.tarro_forest.dungpoints = SV.tarro_forest.dungpoints + 50
      end
    end
  end
end

---tarro_forest.Rescued(zone, name, mail)
--Engine callback function
function tarro_forest.Rescued(zone, name, mail)


end

return tarro_forest

