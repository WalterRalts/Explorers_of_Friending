--[[require 'origin.services.baseservice'

local PartnerRespawn = Class('PartnerRespawn', BaseService)

function PartnerRespawn:initialize()
  Player = CH("PLAYER")
  OneTime = false
end

function PartnerRespawn:Placement()
  if GAME:GetPlayerPartyCount() > 1 and OneTime == false then
    for i = 1, GAME:GetPlayerPartyCount() - 1, 1 do
      AI:DisableCharacterAI(CH("Teammate" .. tostring(i)))
      GROUND:TeleportTo(CH("Teammate" .. tostring(i)), Player.Position.X, Player.Position.Y, Dir8.Down, 0)
    end
    OneTime = true
  end
end

function PartnerRespawn:Subscribe(med)
  med:Subscribe("PartnerRespawn", EngineServiceEvents.GroundMapInit, function() self:Placement() end)
end

SCRIPT:AddService("PartnerRespawn", PartnerRespawn:new())
return PartnerRespawn]]