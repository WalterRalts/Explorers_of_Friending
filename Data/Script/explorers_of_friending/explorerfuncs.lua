--[[
    common.lua
    A collection of frequently used functions and values!
]]--
EXPLCOMMON = {}

function EXPLCOMMON.CharSweatdrop(char)
  local sweater = CH(char)
  GROUND:CharSetEmote(sweater, "sweatdrop", 1)
  SOUND:PlaySE("Battle/EVT_Emote_Sweatdrop")
end

function EXPLCOMMON.CharAngry(char)
  local angry = CH(char)
  GROUND:CharSetEmote(angry, "angry", 3)
  SOUND:PlaySE("Battle/EVT_Emote_Complain_2")
end

function EXPLCOMMON.CharExclaim(char)
  local exclaim = CH(char)
  GROUND:CharSetEmote(exclaim, "exclaim", 1)
  SOUND:PlaySE("Battle/EVT_Emote_Exclaim")
end

function EXPLCOMMON.CharQuestion(char)
  local question = CH(char)
  GROUND:CharSetEmote(question, "question", 1)
  SOUND:PlaySE("Battle/EVT_Emote_Confused")
end

function EXPLCOMMON.CharQuestion2(char)
  local question = CH(char)
  GROUND:CharSetEmote(question, "question", 2)
  SOUND:PlaySE("Battle/EVT_Emote_Confused_2")
end

function EXPLCOMMON.CharHop(char)
  GROUND:AnimateToPosition(CH(char), "Idle", CH(char).Direction, CH(char).Position.X, CH(char).Position.Y, 0.5, 2, 8)
  GROUND:AnimateToPosition(CH(char), "Idle", CH(char).Direction, CH(char).Position.X, CH(char).Position.Y, 0.5, 3, 0)
  GROUND:AnimateToPosition(CH(char), "Idle", CH(char).Direction, CH(char).Position.X, CH(char).Position.Y, 0.5, 2, 8)
  GROUND:AnimateToPosition(CH(char), "Idle", CH(char).Direction, CH(char).Position.X, CH(char).Position.Y, 0.5, 3, 0)
end

function EXPLCOMMON.CharSweating(char)
  local sweating = CH(char)
  GROUND:CharSetEmote(sweating, "sweating", 2)
  SOUND:PlaySE("Battle/EVT_Emote_Sweating")
end

function EXPLCOMMON.CharRealize(char)
  local real = CH(char)
  GROUND:CharSetEmote(real, "notice", 2)
  SOUND:PlaySE("Battle/EVT_Emote_Exclaim_Surprised")
end

function EXPLCOMMON.CharRealizeHeavy(char)
  local real = CH(char)
  GROUND:CharSetEmote(real, "notice", 2)
  SOUND:PlaySE("Battle/EVT_Emote_Shock_Bad")
end

function EXPLCOMMON.CharHappy(char)
  local real = CH(char)
  GROUND:CharSetEmote(real, "happy", 2)
  SOUND:PlaySE("Battle/EVT_Emote_Startled_2")
end

function EXPLCOMMON.CharAngryHop(char)
  EXPLCOMMON.CharAngry(char)
  EXPLCOMMON.CharHop(char)
end

function EXPLCOMMON.CharHappyHop(char)
  EXPLCOMMON.CharHappy(char)
  EXPLCOMMON.CharHop(char)
end

function EXPLCOMMON.SetCharAndEmotion(char, emote)
  if char == "none" then
    UI:ResetSpeaker()
  else
    UI:SetSpeaker(char)
    UI:SetSpeakerEmotion(emote)
  end
end

function EXPLCOMMON.TeleportToMarker(char, marker, dir)
  GROUND:TeleportTo(char, MRKR(marker).Position.X, MRKR(marker).Position.Y, dir, 0)
end

function EXPLCOMMON.SaveStorage()
  --remove bag and storage items and put them in a temporary table
  SV.guilders.tarro_town.bluetail_storage = {}
  local storage = _DATA.Save.ActiveTeam.Storage
  local count = storage.Keys.Count
  if count > 0 then
    for i = count - 1, 0, -1 do
      print(i)
      local slot = {id = storage.Keys[i], count = storage.Values[i], hidden = ""}
      table.insert(SV.guilders.tarro_town.bluetail_storage, slot)
      print(slot.id)
      print(slot.count)
      print(slot.hidden)
      storage:Remove(storage.Keys[i])
    end
  end
  
  local box_storage = _DATA.Save.ActiveTeam.BoxStorage
  local box_count = box_storage.Count
  if box_count > 0 then
    for i = box_count - 1, 0, -1 do
      print(i)
      local slot = {id = box_storage[i].ID, count = 1, hidden_value = box_storage[i].HiddenValue}
      table.insert(SV.guilders.tarro_town.bluetail_storage, slot)
      print(slot.id)
      print(slot.count)
      print(slot.hidden_value)
      box_storage:RemoveAt(i)
    end
  end
end

function EXPLCOMMON.FadeEnterGround(area, zone)
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap(area, zone)
end

function EXPLCOMMON.FaceEachother(char1, char2)
  GROUND:CharTurnToCharAnimated(char1, char2, 2)
  GROUND:CharTurnToCharAnimated(char2, char1, 2)
end

function EXPLCOMMON.TwoTeam()
  COMMON.RespawnAllies()
  CH("Teammate1").CollisionDisabled = true
  GROUND:TeleportTo(CH("Teammate1"), CH("PLAYER").Position.X, CH("PLAYER").Position.Y, Dir8.DownRight, 0)
  AI:SetCharacterAI(CH("Teammate1"), "origin.ai.ground_partner", CH('PLAYER'), CH("Teammate1").Position)
end

function EXPLCOMMON.ThreeTeam()
  COMMON.RespawnAllies()
  CH("Teammate1").CollisionDisabled = true
  CH("Teammate2").CollisionDisabled = true
  GROUND:TeleportTo(CH("Teammate1"), CH("PLAYER").Position.X, CH("PLAYER").Position.Y, Dir8.DownRight, 0)
  GROUND:TeleportTo(CH("Teammate2"), CH("PLAYER").Position.X, CH("PLAYER").Position.Y, Dir8.UpRight, 0)
  AI:SetCharacterAI(CH("Teammate1"), "origin.ai.ground_partner", CH('PLAYER'), CH("Teammate1").Position)
  AI:SetCharacterAI(CH("Teammate2"), "origin.ai.ground_partner", CH("Teammate1"), CH("Teammate2").Position)
end

---Automatically sets your team to follow you.
---If spawn is true, then they will respawn at the given spawners.
---If teleport is true, they will teleport to the player after spawning.
function EXPLCOMMON.AllyFollow(spawn, teleport)
  if spawn then
    COMMON.RespawnAllies()
  end
  for i = 1, GAME:GetPlayerPartyCount() - 1, 1 do
    if i == 1 then
      if teleport then
        GROUND:TeleportTo(CH("Teammate1"), CH("PLAYER").Position.X, CH("PLAYER").Position.Y, Dir8.UpRight, 0)
      end
      AI:SetCharacterAI(CH("Teammate1"), "origin.ai.ground_partner", CH('PLAYER'), CH("Teammate1").Position)
      CH("Teammate1").CollisionDisabled = true
    else
      if teleport then
        GROUND:TeleportTo(CH("Teammate" .. tostring(i)), CH("PLAYER").Position.X, CH("PLAYER").Position.Y, Dir8.UpRight, 0)
      end
      AI:SetCharacterAI(CH("Teammate" .. tostring(i)), "origin.ai.ground_partner", CH("Teammate" .. tostring(i - 1)), CH("Teammate" .. tostring(i)).Position)
    end
    CH("Teammate" .. tostring(i)).CollisionDisabled = true
  end
end

function EXPLCOMMON.CharDistance(char1, char2)
  local char1x = CH(char1).Position.X
  local char1y = CH(char1).Position.Y
  local char2x = CH(char2).Position.X
  local char2y = CH(char2).Position.Y
  local distance = math.sqrt(((char2x - char1x) ^ 2) + ((char2y - char1y) ^ 2))
  return distance
end

function EXPLCOMMON.KazenService()
 EXPLCOMMON.SetCharAndEmotion(CH("Kazen"), "Normal")
  UI:WaitShowDialogue("Good day to you, my name is Kazen; welcome to my fast travel service.")
  if SV.hertz_town.fastvisited[1] == 1 then
    UI:ChoiceMenuYesNo("Would you like to go to " .. SV.hertz_town.fastvisited[2], false)
      UI:WaitForChoice()
      result = UI:ChoiceResult()
  elseif SV.hertz_town.fastvisited[1] > 1 then
    UI:WaitShowDialogue("Choose a location.")
    local count = 1
    for i = 2, SV.hertz_town.fastvisited[1], 1 do
      local choice = {}
      choice[i - 1] = SV.hertz_town.fastvisited[i]
      count = count + 1
    end
    UI:BeginChoiceMenu("Choose a location.", choices, 1, count)
    UI:WaitForChoice()
    local result = UI:ChoiceResult()
  elseif SV.hertz_town.fastvisited[1] < 1 then
    UI:WaitShowDialogue("Looks like you haven't even gone into town yet. There's no need for me to assist you.")
  end
end

function EXPLCOMMON.DebugWithBudeg()
  local budeg = CH("Budeg")
  local area_name = GAME:GetCurrentGround().AssetName
  if area_name == "TarroTownEast" then
    UI:SetSpeaker(budeg)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Zzrk, this town is a little boring,[pause=50] but it's not... [pause=30]zzzt,[pause=30] [emote=Stunned]bad???")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("...almost as if it's the first town ever.")
    UI:WaitShowDialogue("...")
  elseif area_name == "TarroTownEast_ch2" then
    UI:SetSpeaker(budeg)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...this tree corner...")
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...it does not compute...")
  elseif area_name == "EntohTownCenter" then
    UI:SetSpeaker(budeg)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Zzt, this town is weird.[pause=30] A little too natural for me.")
    UI:WaitShowDialogue("Flowers everywhere,[pause=60] stone buildings,[pause=60] and a Drampa telling stories like he's 300 years old.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Very informative stories.")
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("By the waaaay, zzt, I'm a little broken here at the moment, krzzt...")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("If you're testing the game out and have the password, I recommend not trying to use the Bluetail's teleports for now.")
  elseif area_name == "EntohTownCenter_ch2" then
    UI:SetSpeaker(budeg)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...something happened.")

    UI:SetSpeaker(CH("PLAYER"))
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("...you know what,[pause=40] you're cool.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Glad you're around.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Awww, thank Rexio.")
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("By the waaaay, zzt, I'm a little broken here at the moment, krzzt...")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("If you're testing the game out and have the password, I recommend not trying to use the Bluetail's teleports for now.")
  end
  EXPLCOMMON.FaceEachother(budeg, CH("PLAYER"))
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Zzt, welcome to dev mode. Bzzt, I am made to skip scenes and jump bewteen characters.")
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Krzzt, I really hope this get to the right person...")

  local password = "Aa1Bb2devdebug;345"
  UI:NameMenu("Please enter the password.", "Password", 200, "Catbug")
  UI:WaitForChoice()
  if UI:ChoiceResult() ~= password then
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("Wrong!")
    UI:SetSpeaker(budeg)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Have a nice day!")
  else
    ::question::
    UI:SetSpeakerEmotion("Happy")
    local choices = {("Maru and Azura"),
      ("Rexio"),
      ("Guild"),
      ("Cancel")}
      UI:BeginChoiceMenu("Please choose a character for dev work.", choices, 1, 2)
      UI:WaitForChoice()
      result = UI:ChoiceResult()
    if result == 1 then
      UI:SetSpeakerEmotion("Happy")
      local choices = {
        ("Clouds..."),
        ("Fight!"),
        ("Darkness.")}
      UI:BeginChoiceMenu("Please choose a chapter for dev work.", choices, 1, 2)
      UI:WaitForChoice()
      result = UI:ChoiceResult()
      if result == 1 then --Prologue 1
        SV.Story = {
          chap = -1,
          sect = 0,
          flag = 0
        }
        GAME:EnterGroundMap("tarro_town_outside", "TarroTownOutside", "OutsideStart")
      elseif result == 2 then --Prologue 2
        SV.Story = {
          chap = -2,
          sect = 0,
          flag = 0
        }
        GAME:EnterGroundMap("tarro_town_outside", "MaruHome", "MaruHome_MainEnter")
      else --Prologue 3
        SV.Story = {
          chap = -3,
          sect = 0,
          flag = 0
        }
        GAME:EnterGroundMap("tarro_town_outside", "MaruHome", "MaruHome_MainEnter")
      end

    elseif result == 2 then
      UI:SetSpeaker(budeg)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Changing to Rexio!")

      GAME:FadeOut(false, 60)
      --Begin replacement
      --Save Maru and Azura's stats
      SV.guilders.tarro_town.bluetail_stats = GAME:GetPlayerPartyTable()
      --Replace them with Rexio
      GAME:RemovePlayerTeam(0)
      GAME:RemovePlayerTeam(0)
      local mon_id = RogueEssence.Dungeon.MonsterID("riolu", 0, "normal", Gender.Male)

      local p = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id, 7, "", 0)
      p.IsFounder = true
      p.IsPartner = true
      p.Nickname = "Rexio"

      _DATA.Save.ActiveTeam.Players:Add(p)
      local talk_evt = RogueEssence.Dungeon.BattleScriptEvent("RexioInteract")
        _DATA.Save.ActiveTeam.Players[0].ActionEvents:Add(talk_evt)
      GAME:DepositAll()
      --COMMON.SaveStorage()

      UI:SetSpeakerEmotion("Happy")
      local choices = {
        ("Clouds..."),
        ("Fight!"),
        ("Darkness.")}
      UI:BeginChoiceMenu("Please choose a chapter for dev work.", choices, 1, 2)
      UI:WaitForChoice()
      result = UI:ChoiceResult()
      if result == 1 then --Prologue 4
        SV.Story = {
          chap = -4,
          sect = 0,
          flag = 0
        }
        GAME:EnterGroundMap("entoh_town", "RexioHome", "RexioStart")
      elseif result == 2 then --Prologue 5
        SV.Story = {
          chap = -5,
          sect = 0,
          flag = 0
        }
        GAME:EnterGroundMap("entoh_town", "RexioHome_ch2", "RexioStart")
      else --Prologue 6
        SV.Story = {
          chap = -6,
          sect = 0,
          flag = 0
        }
        GAME:EnterGroundMap("entoh_town", "RexioHome", "RexioStart")
      end
    elseif result == 3 then

      UI:SetSpeaker(budeg)
      UI:SetSpeakerEmotion("Stunned")
      UI:WaitShowDialogue("You may be a little underleveled for this part of the story...!")
      UI:ChoiceMenuYesNo("Are you sure?", false)
      UI:WaitForChoice()
      local result = UI:ChoiceResult()

      if result then
        GAME:FadeOut(false, 60)
        --Begin replacement
        --Save Maru and Azura's stats
        SV.guilders.tarro_town.bluetail_stats = GAME:GetPlayerPartyTable()
        --Replace them with Rexio
        GAME:RemovePlayerTeam(0)
        GAME:RemovePlayerTeam(0)
        local mon_id = RogueEssence.Dungeon.MonsterID("riolu", 0, "normal", Gender.Male)

        local p = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id, 7, "", 0)
        p.IsFounder = true
        p.IsPartner = true
        p.Nickname = "Rexio"

        _DATA.Save.ActiveTeam.Players:Add(p)
        local talk_evt = RogueEssence.Dungeon.BattleScriptEvent("RexioInteract")
        _DATA.Save.ActiveTeam.Players[0].ActionEvents:Add(talk_evt)
        GAME:DepositAll()
        SV.Story = {
          chap = -6,
          sect = 0,
          flag = 0
        }

        GAME:EnterGroundMap("the_field", "TheField", "MainEntrance_1")
      else
        goto question
      end
    else
      UI:SetSpeaker(budeg)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Zzt, have a good day.")
    end
  end
end

function EXPLCOMMON.StartTremble(chara)
  GROUND:CharSetAction(chara, RogueEssence.Ground.FrameGroundAction(chara.Position, chara.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Walk"), 0))
  GROUND:CharSetDrawEffect(chara, DrawEffect.Trembling)
end

function EXPLCOMMON.StopTremble(chara)
  GROUND:CharEndAnim(chara)
  GROUND:CharEndDrawEffect(chara, DrawEffect.Trembling)
end

function EXPLCOMMON.StartAndStop(char, anim)
  GROUND:CharSetAnim(char, anim, true)
  GROUND:CharSetAction(char, RogueEssence.Ground.PoseGroundAction(char.Position, char.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex(anim)))
end

function EXPLCOMMON.SetLeaderFront()
  GAME:SetTeamLeaderIndex(0)
  COMMON.RespawnAllies()
end

function EXPLCOMMON.ItemGetSpecial(pack, player)
  local item
  local choice = math.random(3)
  if pack == 0 then
    if choice == 3 then
      item = "berry_kebab"
    elseif choice then
      item = "berry_sitrus"
    else
      item = "packed_honey"
    end
  end
  COMMON.GiftItem(player, item)

  if player.Name == "Maru" then
    UI:SetSpeaker(player)
    UI:SetSpeakerEmotion("Inspired")
    UI:WaitShowDialogue("(Woah, this is rare!)")
    GROUND:Hide("Item")
  elseif player.Name == Rexio then
    UI:SetSpeaker(player)
    UI:SetSpeakerEmotion("Inspired")
    UI:WaitShowDialogue("(Woah, this is rare!)")
    GROUND:Hide("Item")
  end
  
  
end