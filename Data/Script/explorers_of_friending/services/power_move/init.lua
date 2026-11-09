require 'origin.services.baseservice'

local PowerMove = Class('PowerMove', BaseService)

function PowerMove:initialize()
  self.rfocus_cooldown = 0
end

function PowerMove:Power()
      TASK:BranchCoroutine(function()
            if RogueEssence.GameManager.Instance.CurrentScene ~= RogueEssence.Dungeon.DungeonScene.Instance then
                  return
            else
                  for i = 1, 4, 1 do
                        
                  end
                  local leader = GAME:GetPlayerPartyMember(GAME:GetTeamLeaderIndex())
                  if GAME:IsKeyDown(70) and GAME:IsKeyDown(65) then

                  else

                  end
            end
      end)
end


function PowerMove:Subscribe(med)
  med:Subscribe("PowerMove", EngineServiceEvents.Update, function() self:Power() end)
end

function PowerMove:UnSubscribe(med)
end

SCRIPT:AddService("PowerMove", PowerMove:new())
return PowerMove