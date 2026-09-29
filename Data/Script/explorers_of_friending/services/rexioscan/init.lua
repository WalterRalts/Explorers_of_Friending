require 'origin.services.baseservice'

local RexioScan = Class('RexioScan', BaseService)

function RexioScan:initialize()
  self.rfocus_cooldown = 0
  self.in_dungeon = false
end

function RexioScan:Scan()
  TASK:BranchCoroutine(function()
    if GAME:GetCurrentDungeon() == nil then
      return
    else
      local leader = GAME:GetPlayerPartyMember(GAME:GetTeamLeaderIndex())
      if leader.Name == "Rexio" and self.rfocus_cooldown <= 0 then
        if GAME:IsKeyDown(66) then
          self.rfocus_cooldown = 100
          --services are coroutines, apparently
          if self.in_dungeon == true then
            PrintInfo("Scan ready at level " .. SV.tablestats.scan_level .. "!") --Print scan level for debugging.
            --Rexio should focus
            if self.rfocus_cooldown > 80 then
              local rexx = GAME:GetPlayerPartyMember(GAME:GetTeamLeaderIndex()).CharLoc.X
              local rexy = GAME:GetPlayerPartyMember(GAME:GetTeamLeaderIndex()).CharLoc.Y
              local iircount = 0 --"item in range" count
              --check within 15 rows and columns with Rexio in the center. 
              --This will be changed, but since Rexio's Aura Scan can only be level 1, leave it on ten too save resources

              GAME:CutsceneMode(true)
              GAME:WaitFrames(15)
              SOUND:PlaySE("Battle/_UNK_DUN_Charge")
              DUNGEON:CharWaitAnim(leader, "DeepBreath")
              GAME:WaitFrames(45)
              for x = 1, 19, 1 do
                for y = 1, 19, 1 do
                  local scanx = rexx + 10 - x
                  local scany = rexy + 10 - y
                  item_ref = _ZONE.CurrentMap:GetItem(RogueElements.Loc(scanx, scany))
                  if item_ref > -1 then
                    PrintInfo("Rexio, at (" .. rexx .. ", " .. rexy .. ") scanned a tile: (" .. scanx .. ", " .. scany .. ").")
                    PrintInfo("There is an item here! It's the " .. _ZONE.CurrentMap.Items[item_ref]:GetDungeonName() .. ".")
                    iircount = iircount + 1
                  end
                end
              end
              if iircount > 1 then
                UI:SetSpeaker(leader)
                UI:SetSpeakerEmotion("Inspired")
                UI:WaitShowDialogue("Whoa, there's a bunch of stuff here!")
                _DUNGEON:LogMsg("Rexio scanned " .. iircount .. " items.")
              elseif iircount > 0 then
                UI:SetSpeaker(leader)
                UI:SetSpeakerEmotion("Happy")
                UI:WaitShowDialogue("Knew it, there's something here!")
                _DUNGEON:LogMsg("Rexio scanned something.")
              else
                UI:SetSpeaker(leader)
                UI:SetSpeakerEmotion("Worried")
                UI:WaitShowDialogue("Darn,[pause=30] can't sense anything here.")
              end
              GAME:CutsceneMode(false)
            end
          elseif GAME:GetPlayerPartyCount() == 1 then
            if SV.Story.sect == 3 and KeyGet == false then
              GAME:CutsceneMode(true)
              GAME:WaitFrames(15)
              SOUND:PlaySE("Battle/_UNK_DUN_Charge")
              local area_name = GAME:GetCurrentGround().AssetName
              if area_name == "EntohTownDelivery" then
                UI:SetSpeaker(leader)
                UI:SetSpeakerEmotion("Worried")
                UI:WaitShowDialogue("I feel something here.")
                UI:SetSpeakerEmotion("Normal")
                UI:WaitShowDialogue("Maybe Mr. Dragon knows something.")
              else
                UI:SetSpeaker(leader)
                UI:SetSpeakerEmotion("Worried")
                UI:WaitShowDialogue("No key here.")
              end
              GAME:CutsceneMode(false)
            else
              return
              --[[GAME:CutsceneMode(true)
              UI:SetSpeaker(leader)
              UI:SetSpeakerEmotion("Worried")
              UI:WaitShowDialogue("I can see everything here, no need to use aura now.")
              GAME:CutsceneMode(false)]]
            end
          end
        else
          return
        end
      elseif self.rfocus_cooldown > 0 then
        self.rfocus_cooldown = self.rfocus_cooldown - 1
      end
      return
    end
  end)
end

function RexioScan:EnterDungeon()
  self.in_dungeon = true
end

function RexioScan:ExitDungeon()
  self.in_dungeon = false
end

function RexioScan:Subscribe(med)
  med:Subscribe("RexioScan", EngineServiceEvents.Update, function() self:Scan() end)
  med:Subscribe("RexioScan", EngineServiceEvents.DungeonModeBegin, function() self:EnterDungeon() end)
  med:Subscribe("RexioScan", EngineServiceEvents.DungeonModeEnd, function() self:ExitDungeon() end)
end

function RexioScan:UnSubscribe(med)
end

SCRIPT:AddService("RexioScan", RexioScan:new())
return RexioScan