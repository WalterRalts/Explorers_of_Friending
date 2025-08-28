require 'origin.services.baseservice'

local ResetSettings = Class('PartnerRespawn', BaseService)

function ResetSettings:initialize()
  Player = CH("PLAYER")
  OneTime = false
  RogueEssence.Dungeon.ExplorerTeam.MAX_TEAM_SLOTS = 5
end

function ResetSettings:Reset()
  RogueEssence.Dungeon.ExplorerTeam.MAX_TEAM_SLOTS = 4
end

function ResetSettings:Subscribe(med)
  med:Subscribe("ResetSetting", EngineServiceEvents.GraphicsUnload, function() self:Reset() end)
end

SCRIPT:AddService("ResetSetting", ResetSettings:new())
return ResetSettings