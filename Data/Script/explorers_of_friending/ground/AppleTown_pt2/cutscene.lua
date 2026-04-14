Apple2 = {}

function Apple2.EndingUp() --CutWIP
    UI:SetSpeaker(CH("PLAYER"))
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("We did tell you this would happen.")

    UI:SetSpeaker(CH("Teammate2"))
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...whatever.")

    local moverex = GAME:GetPlayerPartyTable()
    GAME:SetCanSwitch(false)
    function PrintTable(t, indent)
      indent = indent or 0
      for key, value in pairs(t) do
        local formatting = string.rep("  ", indent) .. tostring(key) .. ": "
        if type(value) == "table" then
          print(formatting)
          PrintTable(value, indent + 1)
        else
          print(formatting .. tostring(value))
        end
      end
    end
    PrintTable(SV.guilders.tarro_town.bluetail_stats)
    PrintTable(moverex)
    if GAME:GetPlayerPartyCount() <= 1 then
      for i, p in ipairs(SV.guilders.tarro_town.bluetail_stats) do
        GAME:AddPlayerTeam(_DATA.Save.ActiveTeam.Players:Add(p))
        --GROUND:GiveCharIdleChatter(chara)  
      end
      GAME:RemovePlayerTeam(0)
      for i, p in ipairs(moverex) do
        GAME:AddPlayerTeam(_DATA.Save.ActiveTeam.Players:Add(p))
      end
    end
   EXPLCOMMON.AllyFollow(true, true)
end