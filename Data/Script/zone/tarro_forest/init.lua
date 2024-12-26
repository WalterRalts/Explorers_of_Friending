--[[
    init.lua
    Created: 08/31/2024 17:32:02
    Description: Autogenerated script file for the map tarro_forest.
]]--
-- Commonly included lua functions and data
require 'origin.common'

-- Package name
local tarro_forest = {}

-------------------------------
-- Zone Callbacks
-------------------------------
---tarro_forest.Init(zone)
--Engine callback function
function tarro_forest.Init(zone)
  chapterpie = 2
  if DUNGEON:DungeonCurrentFloor() == 0 and chapterpie == 2 then
    print("W h o o !")
    local maru = _DUNGEON.ActiveTeam.Players[0]
    local azura = _DUNGEON.ActiveTeam.Players[1]

    UI:SetSpeaker(azura)
    DUNGEON:CharTurnToChar(maru, azura)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Whoa... [pause=33]t[emote=Normal]his place doesn't seem so bad.")

    UI:SetSpeaker(maru)
    DUNGEON:CharTurnToChar(azura, maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("See, we totally got this.")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Now, as I can remember...[pause=50] we[emote=Worried] have to find some...[pause=30] s[emote=Stunned]tairs?")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Right![pause=30] Let's[emote=Determined] get that apple!")
  end
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
      chapterpie = 2.1
    elseif segmentID == 1 then
      chapterpie = 2.2
    end
    COMMON.EndDungeonDay(result, "tarro_town_outside", -1, 1, 2)
  else
    if segmentID == 0 then
      GAME:EnterZone("tarro_forest", -1, 1, 0)
    else
      COMMON.EndDungeonDay(result, "tarro_town_outside", -1, 1, 0)
    end
  end
end

---tarro_forest.Rescued(zone, name, mail)
--Engine callback function
function tarro_forest.Rescued(zone, name, mail)


end

return tarro_forest

