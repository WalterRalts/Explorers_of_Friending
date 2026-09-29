--[[
    explcommon.lua
    A collection of frequently used functions and values!
]]--
EXPLCOMMON = {}

---@param char string
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

---Sign Words
---@param string string
function EXPLCOMMON.SignDialogue(string)
  UI:SetAutoFinish(true)
  UI:ResetSpeaker(false)
  UI:SetCenter(true)
  UI:WaitShowDialogue(string)
  UI:SetAutoFinish(false)
  UI:SetCenter(false)
end


---Sets the emotion of the specified character.
---@param char GroundCH
---@param emote? PortEmote
function EXPLCOMMON.SetCharAndEmotion(char, emote)
  if char == "none" then
    UI:ResetSpeaker()
  else
    UI:SetSpeaker(char)
    UI:SetSpeakerEmotion(emote)
  end
end

---Teleports an entity to a marker
---@param char GroundCH
---@param marker string
---@param dir Dir8
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

---Makes two characters turn towards eachother.
---@param char1 GroundCH
---@param char2 GroundCH
function EXPLCOMMON.FaceEachother(char1, char2)
  local coro1 = TASK:BranchCoroutine(function()
    GROUND:CharTurnToCharAnimated(char1, char2, 4)
    end)
  local coro2 = TASK:BranchCoroutine(function()
    GROUND:CharTurnToCharAnimated(char2, char1, 4)
    end)
  TASK:JoinCoroutines({coro1, coro2})
end

---Turns a group of characters to face someone
---@param group table
---@param char GroundCH
---@param time? number
function EXPLCOMMON.GroupFacer(group, char, time)
  for i = 1, #group, 1 do
    if time ~= nil then
      GROUND:CharTurnToCharAnimated(group[i], char, time)
      GAME:WaitFrames(math.random(2, 15))
    else
      GROUND:CharTurnToChar(group[i], char)
    end
  end
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
---@param spawn boolean If spawn is true, then they will respawn at the given spawners.
---@param teleport boolean If teleport is true, they will teleport to the player after spawning.
function EXPLCOMMON.AllyFollow(spawn, teleport)
  player = CH("PLAYER")
  if spawn then
    COMMON.RespawnAllies()
  end
  for i = 1, GAME:GetPlayerPartyCount() - 1, 1 do
    if i == 1 then
      if teleport then
        GROUND:TeleportTo(CH("Teammate1"), player.Position.X, player.Position.Y, player.Direction, 0)
      end
      AI:SetCharacterAI(CH("Teammate1"), "origin.ai.ground_partner", CH('PLAYER'), CH("Teammate1").Position)
      CH("Teammate1").CollisionDisabled = true
    else
      if teleport then
        GROUND:TeleportTo(CH("Teammate" .. tostring(i)), CH("PLAYER").Position.X, player.Position.Y, player.Direction, 0)
      end
      AI:SetCharacterAI(CH("Teammate" .. tostring(i)), "origin.ai.ground_partner", CH("Teammate" .. tostring(i - 1)), CH("Teammate" .. tostring(i)).Position)
    end
    CH("Teammate" .. tostring(i)).CollisionDisabled = true
  end
end

---Check the distance between two characters
---@param char1 GroundCH
---@param char2 GroundCH
---@return number
function EXPLCOMMON.CharDistance(char1, char2)
  local char1x = char1.Position.X
  local char1y = char1.Position.Y
  local char2x = char2.Position.X
  local char2y = char2.Position.Y
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

---Sets a scene as a new chapter, resetting all other story values.
---@param number integer
function EXPLCOMMON.SetNewChapter(number)
  SV.Story = {
    chap = number,
    sect = 0,
    flag = 0,
    dunsect = 0
  }
end

function EXPLCOMMON.DebugWithBudeg()
  local budeg = CH("Budeg")
  local area_name = GAME:GetCurrentGround().AssetName
  EXPLCOMMON.FaceEachother(budeg, CH("PLAYER"))
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
    UI:WaitShowDialogue("Flowers everywhere,[pause=30] stone buildings.[pause=30] That Drampa over there, too, telling stories like he's 300 years old.")
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

    UI:SetSpeaker(budeg)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Awww, thank Rexio.")
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("By the waaaay, zzt, I'm a little broken here at the moment, krzzt...")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("If you're testing the game out and have the password, I recommend not trying to use the Bluetail's teleports for now.")
  elseif area_name == "GuildFieldMain" then
    UI:SetSpeaker(budeg)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("I'm zzt sorry, this is supposed to be a guild?")

    UI:SetSpeaker(budeg)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Good luck with that.")
  end
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Zzt, welcome to dev mode. Bzzt, I am made to skip scenes and jump bewteen characters.")
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Krzzt, I really hope this get to the right person...")
  EXPLCOMMON.PrintTable(GAME:GetPlayerPartyTable())
  for i = 1, #GAME:GetPlayerPartyTable() do
    print(GAME:GetPlayerPartyTable()[i].Name, GAME:GetPlayerPartyTable()[i].species)
  end

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
      UI:BeginChoiceMenu("Please choose a character for dev work.", choices, 1, 3)
      UI:WaitForChoice()
      result = UI:ChoiceResult()
    if result == 1 then
      UI:SetSpeakerEmotion("Happy")
      local choices2 = {
        ("Clouds..."),
        ("Fight!"),
        ("Darkness.")}
      UI:BeginChoiceMenu("Please choose a chapter for dev work.", choices2, 1, 2)
      UI:WaitForChoice()

      result = UI:ChoiceResult()
      UI:SetSpeaker(budeg)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Changing to Maru and Azura!")
      GAME:FadeOut(false, 20)
      if CH("PLAYER").Nickname == "Rexio" then
        SV.tablestats.aurm_stats = GAME:GetPlayerPartyTable()
        
        GAME:RemovePlayerTeam(0)
        for i, p in ipairs(SV.tablestats.bluetail_stats) do
          GAME:AddPlayerTeam(_DATA.Save.ActiveTeam.Players:Add(p))
        end
      end
      if result == 1 then --Prologue 1
        EXPLCOMMON.SetNewChapter(-1)
        GAME:EnterGroundMap("tarro_town_outside", "TarroTownOutside", "OutsideStart")
      elseif result == 2 then --Prologue 2
        EXPLCOMMON.SetNewChapter(-2)
        GAME:EnterGroundMap("tarro_town_outside", "MaruHome", "MaruHome_MainEnter")
      else --Prologue 3
        EXPLCOMMON.SetNewChapter(-3)
        GAME:EnterGroundMap("tarro_town_outside", "MaruHome", "MaruHome_MainEnter")
      end
    elseif result == 2 then
      UI:SetSpeaker(budeg)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Changing to Rexio!")

      GAME:FadeOut(false, 20)
      if CH("PLAYER").Nickname ~= "Rexio" then
        SV.tablestats.bluetail_stats = GAME:GetPlayerPartyTable()
        GAME:RemovePlayerTeam(0)
      end
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
        ("Aura!"),
        ("Gone..."),
        ("Adventure.")}
      UI:BeginChoiceMenu("Please choose a chapter for dev work.", choices, 1, 3)
      UI:WaitForChoice()
      result = UI:ChoiceResult()
      if result == 1 then --Prologue 4
        EXPLCOMMON.SetNewChapter(-4)
        GAME:EnterGroundMap("entoh_town", "RexioHome", "RexioStart")
      elseif result == 2 then --Prologue 5
        EXPLCOMMON.SetNewChapter(-5)
        GAME:EnterGroundMap("entoh_town", "RexioHome_ch2", "RexioStart")
      else --Prologue 6
        EXPLCOMMON.SetNewChapter(-6)
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
        UI:SetSpeakerEmotion("Happy")
        local choices = {
          ("Begin..."),
          ("Apple Up!"),
          ("Desert")}
        UI:BeginChoiceMenu("Please choose a chapter for dev work.", choices, 1, 2)
        UI:WaitForChoice()
        result = UI:ChoiceResult()
        if result == 1 then --Right before Chapter 1
          EXPLCOMMON.SetNewChapter(-6)
          SV.bag_size = 999
          GAME:EnterGroundMap("guild_field", "GuildField", "Start")
        elseif result == 2 then --Chapter 1 in Apple Town
          EXPLCOMMON.SetNewChapter(1)
          SV.bag_size = 999
          GAME:EnterGroundMap("guild_field", "GuildField", "Start")
        else --Chapter 2 in Hertz Desert
          EXPLCOMMON.SetNewChapter(2)
          SV.bag_size = 999
          GAME:EnterGroundMap("guild_field", "GuildField", "Start")
        end
        GAME:FadeOut(false, 60)
        --Begin replacement
        --Save Maru and Azura's stats
        SV.tablestats.bluetail_stats = GAME:GetPlayerPartyTable()
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
        EXPLCOMMON.SetNewChapter(-6)

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

---Makes a character tremble
---@param chara GroundCH
function EXPLCOMMON.StartTremble(chara)
  GROUND:CharSetAction(chara, RogueEssence.Ground.FrameGroundAction(chara.Position, chara.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Walk"), 0))
  GROUND:CharSetDrawEffect(chara, DrawEffect.Trembling)
end

function EXPLCOMMON.StopTremble(chara)
  GROUND:CharEndAnim(chara)
  GROUND:CharEndDrawEffect(chara, DrawEffect.Trembling)
end

---Begins an animation and ends it on the last frame
---@param char GroundCH
---@param anim Anim
function EXPLCOMMON.StartAndStop(char, anim)
  GROUND:CharSetAnim(char, anim, true)
  GROUND:CharSetAction(char, RogueEssence.Ground.PoseGroundAction(char.Position, char.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex(anim)))
end

function EXPLCOMMON.SetLeaderFront()
  GAME:SetTeamLeaderIndex(0)
  COMMON.RespawnAllies()
end

---Used for the sparklies hidden around the map.
---@param pack integer
---@param player GroundCH
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
  elseif pack == 1 then
    if choice == 3 then
      item = "food_apple"
    elseif choice then
      item = "food_apple_big"
    else
      item = "food_apple_golden"
    end
  end
  COMMON.GiftItem(player, item)

  if player.Nickname == "Maru" then
    UI:SetSpeaker(player)
    UI:SetSpeakerEmotion("Inspired")
    UI:WaitShowDialogue("(Woah, this is rare!)")
  elseif player.Nickname == "Rexio" then
    UI:SetSpeaker(player)
    UI:SetSpeakerEmotion("Inspired")
    UI:WaitShowDialogue("(Woah, this is rare!)")
  end
  GROUND:Hide("Item")
end

function EXPLCOMMON.PrintTable(t, indent)
  indent = indent or 0
  for key, value in pairs(t) do
    local formatting = string.rep("  ", indent) .. tostring(key) .. ": "
    if type(value) == "table" then
      print(formatting)
      EXPLCOMMON.PrintTable(value, indent + 1)
    else
      print(formatting .. tostring(value))
    end
  end
end

function EXPLCOMMON.CheckHeld(item)
  local baggy = {}
  for i = 0, GAME:GetPlayerBagCount() - 1, 1 do
    baggy[i] = GAME:GetPlayerBagItem(i).ID
  end
  for _, v in pairs(baggy) do
    if v == item or GAME:GetPlayerEquippedItem(0).ID == item then
      held = true
    end
  end
  return held
end