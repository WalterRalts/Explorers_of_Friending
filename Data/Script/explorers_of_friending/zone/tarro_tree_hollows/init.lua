--[[
    init.lua
    Created: 09/11/2024 13:50:11
    Description: Autogenerated script file for the map tarro_tree_hollows.
]]--
-- Commonly included lua functions and data
--require 'origin.common'
require 'explorers_of_friending.common'
require 'explorers_of_friending.event_battle'

-- Package name
local tarro_tree_hollows = {}

-------------------------------
-- Zone Callbacks
-------------------------------
---tarro_tree_hollows.Init(zone)
--Engine callback function
function tarro_tree_hollows.Init(zone)
  SV.tarro_town.bag_size = 10
  tarro_tree_fail = false
end

---tarro_tree_hollows.EnterSegment(zone, rescuing, segmentID, mapID)
--Engine callback function
function tarro_tree_hollows.EnterSegment(zone, rescuing, segmentID, mapID)
  if segmentID == 1 then
    SV.tarro_tree_hollows.sprout_money_give = false
  end
end

---tarro_tree_hollows.ExitSegment(zone, result, rescue, segmentID, mapID)
--Engine callback function
function tarro_tree_hollows.ExitSegment(zone, result, rescue, segmentID, mapID)
  if result ~= RogueEssence.Data.GameProgress.ResultType.Cleared then -- failing or otherwise
    tarro_tree_fail = true
    GAME:SetTeamLeaderIndex(0)
    if segmentID == 0 then
      COMMON.EndDungeonDay(result, "tarro_town", -1, 1, 0)
    elseif segmentID == 1 then
      SV.tarro_tree_hollows.entering_party = GAME:GetPlayerPartyTable()
      GAME:RemovePlayerTeam(2)
      GAME:RemovePlayerTeam(2)
      GAME:RemovePlayerTeam(2)
      COMMON.EndDungeonDay(result, "tarro_tree_hollows", -1, 0, 0)
    else
      SV.tarro_tree_hollows.entering_party = GAME:GetPlayerPartyTable()
      GAME:RemovePlayerTeam(2)
      GAME:RemovePlayerTeam(2)
      GAME:RemovePlayerTeam(2)
      COMMON.EndDungeonDay(result, "tarro_tree_hollows", -1, 0, 0)
    end
  else -- succeed
    GAME:SetTeamLeaderIndex(0)
    if SV.tarro_tree_hollows.AmasDefeat == false then -- boss undefeated
      if segmentID == 0 then
        SV.tarro_tree_hollows.entering_party = GAME:GetPlayerPartyTable()
        GAME:RemovePlayerTeam(2)
        GAME:RemovePlayerTeam(2)
        GAME:RemovePlayerTeam(2)
        if SV.tarro_town.PieChapter == 7 then
          SV.tarro_town.PieChapter = 8
        end
        GAME:EnterZone("tarro_tree_hollows", -1, 0, 0)
      elseif segmentID == 1 then
        SV.tarro_town.PieChapter = 9
        GAME:EnterZone("tarro_tree_hollows", -1, 1, 0)
      else
        SV.tarro_town.PieChapter = 10
        SV.tarro_tree_hollows.dungpoints = SV.tarro_tree_hollows.dungpoints + 200
        SV.tarro_tree_hollows.AmasDefeat = true
        COMMON.EndDungeonDay(result, "tarro_tree_hollows", -1, 1, 0)
      end
    else
      if segmentID == 0 then
        SV.tarro_tree_hollows.entering_party = GAME:GetPlayerPartyTable()
        GAME:EnterZone("tarro_tree_hollows", -1, 0, 0)
      else
        SV.tarro_tree_hollows.dungpoints = SV.tarro_tree_hollows.dungpoints + 100
        COMMON.EndDungeonDay(result, "tarro_town", -1, 1, 0)
      end
    end
  end
end

---tarro_tree_hollows.Rescued(zone, name, mail)
--Engine callback function
function tarro_tree_hollows.Rescued(zone, name, mail)


end

return tarro_tree_hollows

