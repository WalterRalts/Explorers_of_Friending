require 'explorers_of_friending.common'

function SINGLE_CHAR_SCRIPT.Test(owner, ownerChar, context, args)
  PrintInfo("Test")
end

function SINGLE_CHAR_SCRIPT.AzuNotLeader(owner, ownerChar, context, args)
	wholeads = GAME:GetTeamLeaderIndex()
	local maru = GAME:GetPlayerPartyMember(wholeads - 1) --Maru should be in the first slot
	if GAME:GetPlayerPartyMember(wholeads).BaseForm.Species == "azurill" then
		UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Sorry, Azura. As an older brother, I can't let you lead.[pause=35] Let[emote=Happy] someone else lead instead.")

		if GAME:GetPlayerPartyCount() > 2 then
			GAME:SetTeamLeaderIndex(2)
		else
			GAME:SetTeamLeaderIndex(0)
		end
	end
end

function SINGLE_CHAR_SCRIPT.SlumberPollen(owner, ownerChar, context, args)
	--only check if puchi is in the team
	if GAME:GetPlayerPartyCount() > 4 and GAME:GetPlayerPartyMember(3).BaseForm.Species == "poochyena" then
		local puchi = GAME:GetPlayerPartyMember(3)
		UI:SetSpeaker(puchi)
		local sleep = RogueEssence.Dungeon.StatusEffect("sleep")
		local turns = _DATA.Save.TotalTurns
		if turns % 60 == 0 and turns > 5 then
			local sleep_chance = math.random(20)
			if sleep_chance == 20 then
				local sleep_roll = false
				if SV.tarro_town.puchi_tired and puchi:GetStatusEffect("sleep") == nil and sleep_roll == false then
					PrintInfo("Sleepy time!")
					local say_choice = math.random(3)
					if say_choice == 1 then
						UI:SetSpeakerEmotion("Pain")
						UI:WaitShowDialogue("Nope... rest time...!")
					elseif say_choice == 2 then
						UI:SetSpeakerEmotion("Dizzy")
						UI:WaitShowDialogue("Fluffy clouds...!")
					elseif say_choice == 3 then
						UI:SetSpeakerEmotion("Stunned")
						UI:WaitShowDialogue("Need...[pause=65][emote=Pain] energy...")
					end
					sleep:LoadFromData()
					TASK:WaitTask(puchi:AddStatusEffect(nil, sleep, false))
					sleep_roll = true
				end
			else
				PrintInfo("Sleep roll failed!")
			end
		end
	end
end

bag_warn = false
function SINGLE_CHAR_SCRIPT.BagCount(owner, ownerChar, context, args)
	local item_count = GAME:GetPlayerBagCount()
	local bag_limit = SV.bag_size
	
	if item_count == bag_limit then
		if bag_warn == false then
			GAME:WaitFrames(25)
			_DUNGEON:LogMsg("Your inventory is full. Any picked up items will be removed!")
			bag_warn = true
		end
	elseif item_count < bag_limit then
		bag_warn = false
	end

	if item_count > bag_limit then
		print("too many items!")
		local extra_item = GAME:GetPlayerBagItem(SV.bag_size)
		GAME:GivePlayerStorageItem(extra_item)
		GAME:TakePlayerBagItem(SV.bag_size, true)
		GAME:WaitFrames(25)
		_DUNGEON:LogMsg("But no one can carry anymore, so it was thrown away somewhere!")
	end
end

function SINGLE_CHAR_SCRIPT.CastawayCaveAltMusic(owner, ownerChar, context, args)
  if context.User ~= nil then
    return
  end
  if not SV.castaway_cave.TookTreasure then
    --keep the map music as is
  else
	_ZONE.CurrentMap.Music = "B24. Castaway Cave 2.ogg"
  end
  
  SOUND:PlayBGM(_ZONE.CurrentMap.Music, true)
end

function SINGLE_CHAR_SCRIPT.CastawayCaveAltEnemies(owner, ownerChar, context, args)
  if context.User ~= nil then
    return
  end
  if not SV.castaway_cave.TookTreasure then
    return
  end
  
  _ZONE.CurrentMap.MapEffect.OnMapTurnEnds:Add(RogueElements.Priority(15), PMDC.Dungeon.RespawnFromEligibleEvent(14, 160))
  for ii = 1, 3, 1 do
	PMDC.Dungeon.RespawnFromEligibleEvent.Respawn()
  end
end

function SINGLE_CHAR_SCRIPT.SleepingCalderaAltData(owner, ownerChar, context, args)
  if context.User ~= nil then
    return
  end
  if not SV.sleeping_caldera.TookTreasure then
    --keep the map music as is
  else
	_ZONE.CurrentMap.Name = RogueEssence.LocalText(STRINGS:Format(RogueEssence.StringKey("TITLE_ENRAGED_CALDERA"):ToLocal(), _ZONE.CurrentMap.ID + 1))
	_ZONE.CurrentMap.Music = "B11. Enraged Caldera.ogg"
  end
  
  SOUND:PlayBGM(_ZONE.CurrentMap.Music, true)
end

function SINGLE_CHAR_SCRIPT.SleepingCalderaAltTiles(owner, ownerChar, context, args)
  if context.User ~= nil then
    return
  end
  if not SV.sleeping_caldera.TookTreasure then
    return
  end
  
  --set all water tiles to lava
  for xx = 0, _ZONE.CurrentMap.Width - 1, 1 do
	for yy = 0, _ZONE.CurrentMap.Height - 1, 1 do
	  local loc = RogueElements.Loc(xx, yy)
	  local tl = _ZONE.CurrentMap:GetTile(loc)
	  if tl.ID == "water" then
		tl.ID = "lava"
		--remove any mons traversing them
		local chara = _ZONE.CurrentMap:GetCharAtLoc(loc)
		if chara ~= nil then
		  if chara.MemberTeam ~= _DUNGEON.ActiveTeam then
			_DUNGEON:RemoveChar(chara)
		  end
		end
	  end
	  --also remove any stairs down
	  if tl.Effect.ID == "stairs_go_down" or tl.Effect.ID == "tile_boss" then
		tl.Effect = RogueEssence.Dungeon.EffectTile(loc)
	  end
	end
  end
  --set the tileset dictionary to lava
  if _ZONE.CurrentMap.ID < 6 then
    _ZONE.CurrentMap.BlankBG = RogueEssence.Dungeon.AutoTile("dark_crater_wall")
    _ZONE.CurrentMap.TextureMap["unbreakable"] = RogueEssence.Dungeon.AutoTile("dark_crater_wall")
    _ZONE.CurrentMap.TextureMap["wall"] = RogueEssence.Dungeon.AutoTile("dark_crater_wall")
    _ZONE.CurrentMap.TextureMap["floor"] = RogueEssence.Dungeon.AutoTile("dark_crater_floor")
  elseif _ZONE.CurrentMap.ID < 14 then
    _ZONE.CurrentMap.BlankBG = RogueEssence.Dungeon.AutoTile("deep_dark_crater_wall")
    _ZONE.CurrentMap.TextureMap["unbreakable"] = RogueEssence.Dungeon.AutoTile("deep_dark_crater_wall")
    _ZONE.CurrentMap.TextureMap["wall"] = RogueEssence.Dungeon.AutoTile("deep_dark_crater_wall")
    _ZONE.CurrentMap.TextureMap["floor"] = RogueEssence.Dungeon.AutoTile("deep_dark_crater_floor")
  else
    _ZONE.CurrentMap.BlankBG = RogueEssence.Dungeon.AutoTile("magma_cavern_3_wall")
    _ZONE.CurrentMap.TextureMap["unbreakable"] = RogueEssence.Dungeon.AutoTile("magma_cavern_3_wall")
    _ZONE.CurrentMap.TextureMap["wall"] = RogueEssence.Dungeon.AutoTile("magma_cavern_3_wall")
    _ZONE.CurrentMap.TextureMap["floor"] = RogueEssence.Dungeon.AutoTile("magma_cavern_3_floor")
  end
  --call recalculate all autotiles for the entire map
  _ZONE.CurrentMap:CalculateAutotiles(RogueElements.Loc(0, 0), RogueElements.Loc(_ZONE.CurrentMap.Width, _ZONE.CurrentMap.Height))
  _ZONE.CurrentMap:CalculateTerrainAutotiles(RogueElements.Loc(0, 0), RogueElements.Loc(_ZONE.CurrentMap.Width, _ZONE.CurrentMap.Height))
end

function SINGLE_CHAR_SCRIPT.SleepingCalderaAltEnemies(owner, ownerChar, context, args)
  if context.User ~= nil then
    return
  end
  if not SV.sleeping_caldera.TookTreasure then
    return
  end
  
  _ZONE.CurrentMap.MapEffect.OnMapTurnEnds:Add(RogueElements.Priority(15), PMDC.Dungeon.RespawnFromEligibleEvent(15, 50))
  for ii = 1, 3, 1 do
	PMDC.Dungeon.RespawnFromEligibleEvent.Respawn()
  end
end

function SINGLE_CHAR_SCRIPT.SleepingCalderaSummonHeatran(owner, ownerChar, context, args)
  if context.User ~= nil then
    return
  end
  if not SV.sleeping_caldera.TookTreasure then
    return
  end
  
  if SV.sleeping_caldera.GotHeatran then
    return
  end
  
  -- spawn heatran- try 10 times; not guaranteed but not crucial
  local origin = _DUNGEON.ActiveTeam.Leader.CharLoc
  for ii = 1, 10, 1 do
    local testLoc = RogueElements.Loc(_DATA.Save.Rand:Next(origin.X - 7, origin.X + 7 + 1), _DATA.Save.Rand:Next(origin.Y - 4, origin.Y + 4 + 1))
	local tile_block = _ZONE.CurrentMap:TileBlocked(testLoc)
	local char_at = _ZONE.CurrentMap:GetCharAtLoc(testLoc)
	if tile_block == false and char_at == nil then
	  --spawn it here
	  DUNGEON:MoveScreen(RogueEssence.Content.ScreenMover(3, 6, 30))
	  GAME:WaitFrames(10)
	  
	  local new_team = RogueEssence.Dungeon.MonsterTeam()
	  local mob_data = RogueEssence.Dungeon.CharData()
	  mob_data.BaseForm = RogueEssence.Dungeon.MonsterID("heatran", 0, "normal", Gender.Male)
	  mob_data.Level = 50;
	  mob_data.BaseSkills[0] = RogueEssence.Dungeon.SlotSkill("magma_storm")
	  mob_data.BaseSkills[1] = RogueEssence.Dungeon.SlotSkill("iron_head")
	  mob_data.BaseSkills[2] = RogueEssence.Dungeon.SlotSkill("scary_face")
	  mob_data.BaseSkills[3] = RogueEssence.Dungeon.SlotSkill("crunch")
	  mob_data.BaseIntrinsics[0] = "flash_fire"
	  local new_mob = RogueEssence.Dungeon.Character(mob_data)
	  local tactic = _DATA:GetAITactic("wander_smart")
	  new_mob.Tactic = RogueEssence.Data.AITactic(tactic)
	  new_mob.CharLoc = testLoc
	  new_mob.CharDir = _ZONE.CurrentMap:ApproximateClosestDir8(new_mob.CharLoc, _DUNGEON.ActiveTeam.Leader.CharLoc)
	  new_team.Players:Add(new_mob)
	  player_tbl = LTBL(new_mob)
	  player_tbl.IsLegend = true
	  
	  --with fanfare
	  SOUND:PlayBattleSE("_UNK_EVT_003")
	  local arriveAnim = RogueEssence.Content.StaticAnim(RogueEssence.Content.AnimData("Sacred_Fire_Ranger", 3), 1)
	  arriveAnim:SetupEmitted(RogueElements.Loc(new_mob.CharLoc.X * 24 + 12, new_mob.CharLoc.Y * 24 + 12), 32, RogueElements.Dir8.Down)
	  DUNGEON:PlayVFXAnim(arriveAnim, RogueEssence.Content.DrawLayer.Front)
	  
	  GAME:WaitFrames(3)
	  
	  _ZONE.CurrentMap.MapTeams:Add(new_team)
	  new_mob:RefreshTraits()
	  
      TASK:WaitTask(_DUNGEON:SpecialIntro(new_mob))
      TASK:WaitTask(new_mob:OnMapStart())
	  
	  _ZONE.CurrentMap:UpdateExploration(new_mob)
	  
	  break
	end
  end
  
end

function SINGLE_CHAR_SCRIPT.GuildBlock(owner, ownerChar, context, args)
  
  if not SV.guildmaster_summit.GameComplete then
    UI:ResetSpeaker()
    UI:SetAutoFinish(true)
    UI:WaitShowDialogue(RogueEssence.StringKey("DLG_LOCK_GUILD"):ToLocal())
  else
    
    UI:ResetSpeaker()
    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("DLG_LOCK_GUILD_OPEN"):ToLocal(), context.User:GetDisplayName(true)))
	
	_DUNGEON.PendingLeaderAction = _DUNGEON:ProcessPlayerInput(RogueEssence.Dungeon.GameAction(RogueEssence.Dungeon.GameAction.ActionType.Tile, Dir8.None, 1))
  end
end

ShopSecurityType = luanet.import_type('PMDC.Dungeon.ShopSecurityState')
MapIndexType = luanet.import_type('RogueEssence.Dungeon.MapIndexState')


function SINGLE_CHAR_SCRIPT.ThiefCheck(owner, ownerChar, context, args)
  local baseLoc = _DUNGEON.ActiveTeam.Leader.CharLoc
  local tile = _ZONE.CurrentMap.Tiles[baseLoc.X][baseLoc.Y]
  
  local thief_idx = "thief"
  
  local price = COMMON.GetDungeonCartPrice()
  local security_price = COMMON.GetShopPriceState()
  if price < 0 then
    --lost merchandise was placed back in shop, readjust the security price and clear the current price
    security_price.Amount = security_price.Amount - price
  elseif price < security_price.Cart then
    --merchandise was returned.  doesn't matter who did it.
    security_price.Cart = price
  elseif price > security_price.Cart then
    local char_index = _ZONE.CurrentMap:GetCharIndex(context.User)
    if char_index.Faction ~= RogueEssence.Dungeon.Faction.Player then
      --non-player was responsible for taking/destroying merchandise, just readjust the security price and clear the current price
      security_price.Amount = security_price.Amount - price + security_price.Cart
	else
	  --player was responsible for taking/destroying merchandise, add to the cart
      security_price.Cart = price
    end
  end

  
  if tile.Effect.ID ~= "area_shop" then
	if security_price.Cart > 0 then
	  _GAME:BGM("", false)
      COMMON.ClearAllPrices()
	  
	  SV.adventure.Thief = true
	  local index_from = owner.StatusStates:Get(luanet.ctype(MapIndexType))
	  _DUNGEON:LogMsg(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_THIEF_%04d", index_from.Index)):ToLocal()))
		
	  -- create thief status
	  local thief_status = RogueEssence.Dungeon.MapStatus(thief_idx)
      thief_status:LoadFromData()
	  -- put spawner from security status in thief status
	  local security_to = thief_status.StatusStates:Get(luanet.ctype(ShopSecurityType))
	  local security_from = owner.StatusStates:Get(luanet.ctype(ShopSecurityType))
	  security_to.Security = security_from.Security
      TASK:WaitTask(_DUNGEON:RemoveMapStatus(owner.ID))
      TASK:WaitTask(_DUNGEON:AddMapStatus(thief_status))
	  GAME:WaitFrames(60)
	end
  else
    local shop_idx = "shopping"
	if not _ZONE.CurrentMap.Status:ContainsKey(thief_idx) and not _ZONE.CurrentMap.Status:ContainsKey(shop_idx) then
	  
	  local shop_status = RogueEssence.Dungeon.MapStatus(shop_idx)
      shop_status:LoadFromData()
      TASK:WaitTask(_DUNGEON:AddMapStatus(shop_status))
	end
  end
end

function SINGLE_CHAR_SCRIPT.ShopCheckout(owner, ownerChar, context, args)
  local baseLoc = _DUNGEON.ActiveTeam.Leader.CharLoc
  local tile = _ZONE.CurrentMap.Tiles[baseLoc.X][baseLoc.Y]

  if tile.Effect.ID ~= "area_shop" then
	local found_shopkeep = COMMON.FindNpcWithTable(false, "Role", "Shopkeeper")
    if found_shopkeep and COMMON.CanTalk(found_shopkeep) then
	  local security_state = COMMON.GetShopPriceState()
      local price = security_state.Cart
	  local sell_price = COMMON.GetDungeonSellPrice()
  
      if price > 0 or sell_price > 0 then
	    local is_near = false
		local loc_diff = _DUNGEON.ActiveTeam.Leader.CharLoc - found_shopkeep.CharLoc
		if loc_diff:Dist8() > 1 then
		  -- check to see if the shopkeeper can see the player and warp there
		  local near_mat = false
		  local dirs = { Direction.Down, Direction.DownLeft, Direction.Left, Direction.UpLeft, Direction.Up, Direction.UpRight, Direction.Right, Direction.DownRight }
		  for idx, dir in ipairs(dirs) do
            if COMMON.ShopTileCheck(baseLoc, dir) then
		      near_mat = true
		    end
		  end
		  
		  if (near_mat or found_shopkeep:CanSeeCharacter(_DUNGEON.ActiveTeam.Leader)) then
	        -- attempt to warp the shopkeeper next to the player
		    local cand_locs = _ZONE.CurrentMap:FindNearLocs(found_shopkeep, baseLoc, 1)
		    if cand_locs.Count > 0 then
		      TASK:WaitTask(_DUNGEON:PointWarp(found_shopkeep, cand_locs[0], false))
			  is_near = true
		    end
		  end
		else
		  is_near = true
		end

		-- if it can't, fall through
		if is_near then
		  DUNGEON:CharTurnToChar(found_shopkeep, _DUNGEON.ActiveTeam.Leader)
		  DUNGEON:CharTurnToChar(_DUNGEON.ActiveTeam.Leader, found_shopkeep)
          UI:SetSpeaker(found_shopkeep)
		  
		  if sell_price > 0 then
		    UI:ChoiceMenuYesNo(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_SELL_%04d", found_shopkeep.Discriminator)):ToLocal(), STRINGS:FormatKey("MONEY_AMOUNT", sell_price)), false)
		    UI:WaitForChoice()
		    result = UI:ChoiceResult()
		  
		    if SV.adventure.Thief then
			  COMMON.ThiefReturn()
			  price = 0
		    elseif result then
			  -- iterate player inventory prices and remove total price
			  COMMON.PayDungeonSellPrice(sell_price)
			  SOUND:PlayBattleSE("DUN_Money")
			  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_SELL_DONE_%04d", found_shopkeep.Discriminator)):ToLocal()))
		    else
			  -- nothing
		    end
		  end
		  
		  if price > 0 then
	        UI:ChoiceMenuYesNo(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_PAY_%04d", found_shopkeep.Discriminator)):ToLocal(), STRINGS:FormatKey("MONEY_AMOUNT", price)), false)
	        UI:WaitForChoice()
	        result = UI:ChoiceResult()
	        if SV.adventure.Thief then
			  COMMON.ThiefReturn()
		    elseif result then
	          if price > GAME:GetPlayerMoney() then
                UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_PAY_SHORT_%04d", found_shopkeep.Discriminator)):ToLocal()))
	          else
	            -- iterate player inventory prices and remove total price
                COMMON.PayDungeonCartPrice(price)
		        SOUND:PlayBattleSE("DUN_Money")
	            UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_PAY_DONE_%04d", found_shopkeep.Discriminator)):ToLocal()))
	          end
	        end
		  end
		end
      else
        UI:SetSpeaker(found_shopkeep)
        UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_END_%04d", found_shopkeep.Discriminator)):ToLocal()))
      end
	end
  end
end

function SINGLE_CHAR_SCRIPT.UpdateEscort(owner, ownerChar, context, args)
  if context.User ~= nil then
    return
  end
  local party = GAME:GetPlayerGuestTable()
  for i, p in ipairs(party) do
    if p.Dead == false then
      local e_tbl = LTBL(p)
	  if e_tbl ~= nil then
	    local mission = SV.missions.Missions[e_tbl.Escort]
	    if mission ~= nil then
	      if mission.Type == COMMON.MISSION_TYPE_ESCORT_OUT then
		    if _ZONE.CurrentMapID.Segment == 0 then
		      mission.DestFloor = _ZONE.CurrentMapID.ID
		    end
	      end
	    end
	  end
	end
  end
end

function SINGLE_CHAR_SCRIPT.DestinationFloor(owner, ownerChar, context, args)
  if context.User ~= nil then
    return
  end
  SOUND:PlayFanfare("Fanfare/Note")
  UI:ResetSpeaker()
  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("DLG_MISSION_DESTINATION"):ToLocal()))
end

function SINGLE_CHAR_SCRIPT.SidequestOutlawFloor(owner, ownerChar, context, args)
  if context.User ~= nil then
    return
  end
  
  if not args.Silent then
    SOUND:PlayBGM("C07. Outlaw.ogg", false)
    UI:ResetSpeaker()
    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("DLG_MISSION_OUTLAW"):ToLocal()))
  end
  
  -- add a map status for outlaw clear check
  local checkClearStatus = "outlaw_clear_check" -- outlaw clear check
  local status = RogueEssence.Dungeon.MapStatus(checkClearStatus)
  status:LoadFromData()
  TASK:WaitTask(_DUNGEON:AddMapStatus(status))
end

function SINGLE_CHAR_SCRIPT.OutlawHouse(owner, ownerChar, context, args)
  if context.User ~= nil then
    return
  end
  
  local found_outlaw = COMMON.FindNpcWithTable(true, "Mission", args.Mission)
  found_outlaw.CharDir = _ZONE.CurrentMap:ApproximateClosestDir8(found_outlaw.CharLoc, _DUNGEON.ActiveTeam.Leader.CharLoc)
  UI:SetSpeaker(found_outlaw)
  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("DLG_MISSION_OUTLAW_TRAP"):ToLocal()))
	
  COMMON.TriggerAdHocMonsterHouse(owner, ownerChar, found_outlaw)
end

function SINGLE_CHAR_SCRIPT.OutlawClearCheck(owner, ownerChar, context, args)
  -- check for no outlaw in the mission list
  remaining_outlaw = false

  for _, name in ipairs(COMMON.GetSortedKeys(SV.missions.Missions)) do
    mission = SV.missions.Missions[name]
    if mission.Complete == COMMON.MISSION_INCOMPLETE and _ZONE.CurrentZoneID == mission.DestZone
	  and _ZONE.CurrentMapID.Segment == mission.DestSegment and _ZONE.CurrentMapID.ID == mission.DestFloor then
	  local found_outlaw = COMMON.FindNpcWithTable(true, "Mission", name)
	  -- check for disguised outlaws
	  if not found_outlaw then
	    found_outlaw = COMMON.FindNpcWithTable(false, "Mission", name)
	  end
      if found_outlaw then
        remaining_outlaw = true
      else
        -- if no outlaws of the mission list, mark quest as complete
        mission.Complete = COMMON.MISSION_COMPLETE
        UI:ResetSpeaker()
        
        -- retrieve the species of the target
        local target_name = _DATA:GetMonster(mission.TargetSpecies.Species).Name
        -- retrieve the species of the quest giver
        local client_name = _DATA:GetMonster(mission.ClientSpecies.Species).Name
        
        UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("DLG_MISSION_OUTLAW_DONE"):ToLocal(), target_name:ToLocal()))
        UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("DLG_MISSION_REMINDER"):ToLocal(), client_name:ToLocal()))
      end
    end
  end
  if not remaining_outlaw then
    -- if no outlaws are found in the map, return music to normal and remove this status from the map
    SOUND:PlayBGM(_ZONE.CurrentMap.Music, true)
    local checkClearStatus = "outlaw_clear_check" -- outlaw clear check
	TASK:WaitTask(_DUNGEON:RemoveMapStatus(checkClearStatus))
  end
end

function SINGLE_CHAR_SCRIPT.ShowTileName(owner, ownerChar, context, args)

    
	if SV.test_grounds.Tileset == 0 then
	  UI:TextPopUp("Tiny Woods", 150)
	elseif SV.test_grounds.Tileset == 1 then
	  UI:TextPopUp("Thunderwave Cave", 150)

	elseif SV.test_grounds.Tileset == 2 then
	  UI:TextPopUp("Mt. Steel", 150)

	elseif SV.test_grounds.Tileset == 3 then
	  UI:TextPopUp("Mt. Steel 2", 150)

	elseif SV.test_grounds.Tileset == 4 then
	  UI:TextPopUp("Grass Maze", 150)

	elseif SV.test_grounds.Tileset == 5 then
	  UI:TextPopUp("Uproar Forest", 150)

	elseif SV.test_grounds.Tileset == 6 then
	  UI:TextPopUp("Electric Maze", 150)

	elseif SV.test_grounds.Tileset == 7 then
	  UI:TextPopUp("Water Maze", 150)

	elseif SV.test_grounds.Tileset == 8 then
	  UI:TextPopUp("Poison Maze", 150)

	elseif SV.test_grounds.Tileset == 9 then
	  UI:TextPopUp("Rock Maze", 150)

	elseif SV.test_grounds.Tileset == 10 then
	  UI:TextPopUp("Silent Chasm", 150)

	elseif SV.test_grounds.Tileset == 11 then
	  UI:TextPopUp("Mt. Thunder", 150)

	elseif SV.test_grounds.Tileset == 12 then
	  UI:TextPopUp("Mt. Thunder Peak", 150)

	elseif SV.test_grounds.Tileset == 13 then
	  UI:TextPopUp("Great Canyon", 150)

	elseif SV.test_grounds.Tileset == 14 then
	  UI:TextPopUp("Lapis Cave", 150)

	elseif SV.test_grounds.Tileset == 15 then
	  UI:TextPopUp("Southern Cavern 2", 150)

	elseif SV.test_grounds.Tileset == 16 then
	  UI:TextPopUp("Wish Cave 2", 150)

	elseif SV.test_grounds.Tileset == 17 then
	  UI:TextPopUp("Rock Path", 150)

	elseif SV.test_grounds.Tileset == 18 then
	  UI:TextPopUp("Northern Range", 150)

	elseif SV.test_grounds.Tileset == 19 then
	  UI:TextPopUp("Mt. Blaze", 150)

	elseif SV.test_grounds.Tileset == 20 then
	  UI:TextPopUp("Snow Path", 150)

	elseif SV.test_grounds.Tileset == 21 then
	  UI:TextPopUp("Frosty Forest", 150)

	elseif SV.test_grounds.Tileset == 22 then
	  UI:TextPopUp("Mt. Freeze", 150)

	elseif SV.test_grounds.Tileset == 23 then
	  UI:TextPopUp("Ice Maze", 150)

	elseif SV.test_grounds.Tileset == 24 then
	  UI:TextPopUp("Magma Cavern 2", 150)

	elseif SV.test_grounds.Tileset == 25 then
	  UI:TextPopUp("Magma Cavern 3", 150)

	elseif SV.test_grounds.Tileset == 26 then
	  UI:TextPopUp("Howling Forest 2", 150)

	elseif SV.test_grounds.Tileset == 27 then
	  UI:TextPopUp("Sky Tower", 150)

	elseif SV.test_grounds.Tileset == 28 then
	  UI:TextPopUp("Darknight Relic", 150)

	elseif SV.test_grounds.Tileset == 29 then
	  UI:TextPopUp("Desert Region", 150)

	elseif SV.test_grounds.Tileset == 30 then
	  UI:TextPopUp("Howling Forest", 150)

	elseif SV.test_grounds.Tileset == 31 then
	  UI:TextPopUp("Southern Cavern", 150)

	elseif SV.test_grounds.Tileset == 32 then
	  UI:TextPopUp("Wyvern Hill", 150)

	elseif SV.test_grounds.Tileset == 33 then
	  UI:TextPopUp("Solar Cave", 150)

	elseif SV.test_grounds.Tileset == 34 then
	  UI:TextPopUp("Waterfall Pond", 150)

	elseif SV.test_grounds.Tileset == 35 then
	  UI:TextPopUp("Stormy Sea", 150)

	elseif SV.test_grounds.Tileset == 36 then
	  UI:TextPopUp("Stormy Sea 2", 150)

	elseif SV.test_grounds.Tileset == 37 then
	  UI:TextPopUp("Silver Trench 3", 150)

	elseif SV.test_grounds.Tileset == 38 then
	  UI:TextPopUp("Buried Relic", 150)

	elseif SV.test_grounds.Tileset == 39 then
	  UI:TextPopUp("Buried Relic 2", 150)

	elseif SV.test_grounds.Tileset == 40 then
	  UI:TextPopUp("Buried Relic 3", 150)

	elseif SV.test_grounds.Tileset == 41 then
	  UI:TextPopUp("Lightning Field", 150)

	elseif SV.test_grounds.Tileset == 42 then
	  UI:TextPopUp("Northwind Field", 150)

	elseif SV.test_grounds.Tileset == 43 then
	  UI:TextPopUp("Mt. Faraway 2", 150)

	elseif SV.test_grounds.Tileset == 44 then
	  UI:TextPopUp("Mt. Faraway 4", 150)

	elseif SV.test_grounds.Tileset == 45 then
	  UI:TextPopUp("Northern Range 2", 150)

	elseif SV.test_grounds.Tileset == 46 then
	  UI:TextPopUp("Pitfall Valley", 150)

	elseif SV.test_grounds.Tileset == 47 then
	  UI:TextPopUp("Wish Cave", 150)

	elseif SV.test_grounds.Tileset == 48 then
	  UI:TextPopUp("Joyous Tower", 150)

	elseif SV.test_grounds.Tileset == 49 then
	  UI:TextPopUp("Purity Forest 2", 150)

	elseif SV.test_grounds.Tileset == 50 then
	  UI:TextPopUp("Purity Forest 4", 150)

	elseif SV.test_grounds.Tileset == 51 then
	  UI:TextPopUp("Purity Forest 6", 150)

	elseif SV.test_grounds.Tileset == 52 then
	  UI:TextPopUp("Purity Forest 7", 150)

	elseif SV.test_grounds.Tileset == 53 then
	  UI:TextPopUp("Purity Forest 8", 150)

	elseif SV.test_grounds.Tileset == 54 then
	  UI:TextPopUp("Purity Forest 9", 150)

	elseif SV.test_grounds.Tileset == 55 then
	  UI:TextPopUp("Murky Cave", 150)

	elseif SV.test_grounds.Tileset == 56 then
	  UI:TextPopUp("Western Cave", 150)

	elseif SV.test_grounds.Tileset == 57 then
	  UI:TextPopUp("Western Cave 2", 150)

	elseif SV.test_grounds.Tileset == 58 then
	  UI:TextPopUp("Meteor Cave", 150)

	elseif SV.test_grounds.Tileset == 59 then
	  UI:TextPopUp("Rescue Team Maze", 150)

	elseif SV.test_grounds.Tileset == 60 then
	  UI:TextPopUp("Beach Cave", 150)

	elseif SV.test_grounds.Tileset == 61 then
	  UI:TextPopUp("Drenched Bluffs", 150)

	elseif SV.test_grounds.Tileset == 62 then
	  UI:TextPopUp("Mt. Bristle", 150)

	elseif SV.test_grounds.Tileset == 63 then
	  UI:TextPopUp("Waterfall Cave", 150)

	elseif SV.test_grounds.Tileset == 64 then
	  UI:TextPopUp("Apple Woods", 150)

	elseif SV.test_grounds.Tileset == 65 then
	  UI:TextPopUp("Craggy Coast", 150)

	elseif SV.test_grounds.Tileset == 66 then
	  UI:TextPopUp("Side Path", 150)

	elseif SV.test_grounds.Tileset == 67 then
	  UI:TextPopUp("Mt. Horn", 150)

	elseif SV.test_grounds.Tileset == 68 then
	  UI:TextPopUp("Rock Path (PMD2)", 150)

	elseif SV.test_grounds.Tileset == 69 then
	  UI:TextPopUp("Foggy Forest", 150)

	elseif SV.test_grounds.Tileset == 70 then
	  UI:TextPopUp("Forest Path", 150)

	elseif SV.test_grounds.Tileset == 71 then
	  UI:TextPopUp("Steam Cave", 150)

	elseif SV.test_grounds.Tileset == 72 then
	  UI:TextPopUp("Steam Cave Unused", 150)

	elseif SV.test_grounds.Tileset == 73 then
	  UI:TextPopUp("Amp Plains", 150)

	elseif SV.test_grounds.Tileset == 74 then
	  UI:TextPopUp("Far Amp Plains", 150)

	elseif SV.test_grounds.Tileset == 75 then
	  UI:TextPopUp("Northern Desert", 150)

	elseif SV.test_grounds.Tileset == 76 then
	  UI:TextPopUp("Northern Desert 2", 150)

	elseif SV.test_grounds.Tileset == 77 then
	  UI:TextPopUp("Quicksand Cave", 150)

	elseif SV.test_grounds.Tileset == 78 then
	  UI:TextPopUp("Quicksand Pit", 150)

	elseif SV.test_grounds.Tileset == 79 then
	  UI:TextPopUp("Quicksand Pit Unused", 150)

	elseif SV.test_grounds.Tileset == 80 then
	  UI:TextPopUp("Crystal Cave", 150)

	elseif SV.test_grounds.Tileset == 81 then
	  UI:TextPopUp("Crystal Cave 2", 150)

	elseif SV.test_grounds.Tileset == 82 then
	  UI:TextPopUp("Crystal Crossing", 150)

	elseif SV.test_grounds.Tileset == 83 then
	  UI:TextPopUp("Chasm Cave", 150)

	elseif SV.test_grounds.Tileset == 84 then
	  UI:TextPopUp("Chasm Cave 2", 150)

	elseif SV.test_grounds.Tileset == 85 then
	  UI:TextPopUp("Dark Hill", 150)

	elseif SV.test_grounds.Tileset == 86 then
	  UI:TextPopUp("Dark Hill 2", 150)

	elseif SV.test_grounds.Tileset == 87 then
	  UI:TextPopUp("Sealed Ruin", 150)

	elseif SV.test_grounds.Tileset == 88 then
	  UI:TextPopUp("Deep Sealed Ruin", 150)

	elseif SV.test_grounds.Tileset == 89 then
	  UI:TextPopUp("Dusk Forest", 150)

	elseif SV.test_grounds.Tileset == 90 then
	  UI:TextPopUp("Dusk Forest 2", 150)

	elseif SV.test_grounds.Tileset == 91 then
	  UI:TextPopUp("Deep Dusk Forest", 150)

	elseif SV.test_grounds.Tileset == 92 then
	  UI:TextPopUp("Deep Dusk Forest 2", 150)

	elseif SV.test_grounds.Tileset == 93 then
	  UI:TextPopUp("Treeshroud Forest", 150)

	elseif SV.test_grounds.Tileset == 94 then
	  UI:TextPopUp("Treeshroud Forest 2", 150)

	elseif SV.test_grounds.Tileset == 95 then
	  UI:TextPopUp("Brine Cave", 150)

	elseif SV.test_grounds.Tileset == 96 then
	  UI:TextPopUp("Lower Brine Cave", 150)

	elseif SV.test_grounds.Tileset == 97 then
	  UI:TextPopUp("Brine Cave Unused", 150)

	elseif SV.test_grounds.Tileset == 98 then
	  UI:TextPopUp("Hidden Land", 150)

	elseif SV.test_grounds.Tileset == 99 then
	  UI:TextPopUp("Hidden Highland", 150)

	elseif SV.test_grounds.Tileset == 100 then
	  UI:TextPopUp("Temporal Tower", 150)

	elseif SV.test_grounds.Tileset == 101 then
	  UI:TextPopUp("Temporal Spire", 150)

	elseif SV.test_grounds.Tileset == 102 then
	  UI:TextPopUp("Temporal Tower Unused", 150)

	elseif SV.test_grounds.Tileset == 103 then
	  UI:TextPopUp("Mystifying Forest", 150)

	elseif SV.test_grounds.Tileset == 104 then
	  UI:TextPopUp("Southern Jungle", 150)

	elseif SV.test_grounds.Tileset == 105 then
	  UI:TextPopUp("Concealed Ruins", 150)

	elseif SV.test_grounds.Tileset == 106 then
	  UI:TextPopUp("Surrounded Sea", 150)

	elseif SV.test_grounds.Tileset == 107 then
	  UI:TextPopUp("Miracle Sea", 150)

	elseif SV.test_grounds.Tileset == 108 then
	  UI:TextPopUp("Mt. Travail", 150)

	elseif SV.test_grounds.Tileset == 109 then
	  UI:TextPopUp("The Nightmare", 150)

	elseif SV.test_grounds.Tileset == 110 then
	  UI:TextPopUp("Spacial Rift", 150)

	elseif SV.test_grounds.Tileset == 111 then
	  UI:TextPopUp("Spacial Rift 2", 150)

	elseif SV.test_grounds.Tileset == 112 then
	  UI:TextPopUp("Dark Crater", 150)

	elseif SV.test_grounds.Tileset == 113 then
	  UI:TextPopUp("Deep Dark Crater", 150)

	elseif SV.test_grounds.Tileset == 114 then
	  UI:TextPopUp("World Abyss 2", 150)

	elseif SV.test_grounds.Tileset == 115 then
	  UI:TextPopUp("Golden Chamber", 150)

	elseif SV.test_grounds.Tileset == 116 then
	  UI:TextPopUp("Mystery Jungle", 150)

	elseif SV.test_grounds.Tileset == 117 then
	  UI:TextPopUp("Mystery Jungle 2", 150)

	elseif SV.test_grounds.Tileset == 118 then
	  UI:TextPopUp("Zero Isle East 3", 150)

	elseif SV.test_grounds.Tileset == 119 then
	  UI:TextPopUp("Zero Isle East 4", 150)

	elseif SV.test_grounds.Tileset == 120 then
	  UI:TextPopUp("Zero Isle South", 150)

	elseif SV.test_grounds.Tileset == 121 then
	  UI:TextPopUp("Zero Isle South 2", 150)

	elseif SV.test_grounds.Tileset == 122 then
	  UI:TextPopUp("Tiny Meadow", 150)

	elseif SV.test_grounds.Tileset == 123 then
	  UI:TextPopUp("Final Maze 2", 150)

	elseif SV.test_grounds.Tileset == 124 then
	  UI:TextPopUp("Waterfall Pond Unused", 150)

	elseif SV.test_grounds.Tileset == 125 then
	  UI:TextPopUp("Lush Prairie", 150)

	elseif SV.test_grounds.Tileset == 126 then
	  UI:TextPopUp("Rock Aegis Cave", 150)

	elseif SV.test_grounds.Tileset == 127 then
	  UI:TextPopUp("Ice Aegis Cave", 150)

	elseif SV.test_grounds.Tileset == 128 then
	  UI:TextPopUp("Steel Aegis Cave", 150)

	elseif SV.test_grounds.Tileset == 129 then
	  UI:TextPopUp("Murky Forest", 150)

	elseif SV.test_grounds.Tileset == 130 then
	  UI:TextPopUp("Deep Boulder Quarry", 150)

	elseif SV.test_grounds.Tileset == 131 then
	  UI:TextPopUp("Limestone Cavern", 150)

	elseif SV.test_grounds.Tileset == 132 then
	  UI:TextPopUp("Deep Limestone Cavern", 150)

	elseif SV.test_grounds.Tileset == 133 then
	  UI:TextPopUp("Barren Valley", 150)

	elseif SV.test_grounds.Tileset == 134 then
	  UI:TextPopUp("Dark Wasteland", 150)

	elseif SV.test_grounds.Tileset == 135 then
	  UI:TextPopUp("Temporal Tower (Future of Darkness)", 150)

	elseif SV.test_grounds.Tileset == 136 then
	  UI:TextPopUp("Temporal Spire (Future of Darkness)", 150)

	elseif SV.test_grounds.Tileset == 137 then
	  UI:TextPopUp("Spacial Cliffs", 150)

	elseif SV.test_grounds.Tileset == 138 then
	  UI:TextPopUp("Dark Ice Mountain", 150)

	elseif SV.test_grounds.Tileset == 139 then
	  UI:TextPopUp("Dark Ice Mountain Peak", 150)

	elseif SV.test_grounds.Tileset == 140 then
	  UI:TextPopUp("Icicle Forest", 150)

	elseif SV.test_grounds.Tileset == 141 then
	  UI:TextPopUp("Vast Ice Mountain", 150)

	elseif SV.test_grounds.Tileset == 142 then
	  UI:TextPopUp("Vast Ice Mountain Peak", 150)

	elseif SV.test_grounds.Tileset == 143 then
	  UI:TextPopUp("Sky Peak 4th Pass", 150)

	elseif SV.test_grounds.Tileset == 144 then
	  UI:TextPopUp("Sky Peak 7th Pass", 150)

	elseif SV.test_grounds.Tileset == 145 then
	  UI:TextPopUp("Sky Peak Summit Pass", 150)

	elseif SV.test_grounds.Tileset == 146 then
	  UI:TextPopUp("Test Dungeon", 150)

	end
end

function SINGLE_CHAR_SCRIPT.SetTileData(wall, ground, water)
  
    _ZONE.CurrentMap.TextureMap["wall"] = RogueEssence.Dungeon.AutoTile(wall)
    _ZONE.CurrentMap.TextureMap["floor"] = RogueEssence.Dungeon.AutoTile(ground)
    _ZONE.CurrentMap.TextureMap["water"] = RogueEssence.Dungeon.AutoTile(water)
  
  --call recalculate all autotiles for the entire map
  _ZONE.CurrentMap:CalculateTerrainAutotiles(RogueElements.Loc(0, 0), RogueElements.Loc(_ZONE.CurrentMap.Width, _ZONE.CurrentMap.Height))
end

function SINGLE_CHAR_SCRIPT.TileTestChange(owner, ownerChar, context, args)

  SV.test_grounds.Tileset = SV.test_grounds.Tileset + 1
  
	if SV.test_grounds.Tileset == 1 then

	  SINGLE_CHAR_SCRIPT.SetTileData("thunderwave_cave_wall", "thunderwave_cave_floor", "thunderwave_cave_secondary")
	elseif SV.test_grounds.Tileset == 2 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mt_steel_1_wall", "mt_steel_1_floor", "mt_steel_1_secondary")
	elseif SV.test_grounds.Tileset == 3 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mt_steel_2_wall", "mt_steel_2_floor", "mt_steel_2_secondary")
	elseif SV.test_grounds.Tileset == 4 then

	  SINGLE_CHAR_SCRIPT.SetTileData("grass_maze_wall", "grass_maze_floor", "grass_maze_secondary")
	elseif SV.test_grounds.Tileset == 5 then

	  SINGLE_CHAR_SCRIPT.SetTileData("uproar_forest_wall", "uproar_forest_floor", "uproar_forest_secondary")
	elseif SV.test_grounds.Tileset == 6 then

	  SINGLE_CHAR_SCRIPT.SetTileData("electric_maze_wall", "electric_maze_floor", "electric_maze_secondary")
	elseif SV.test_grounds.Tileset == 7 then

	  SINGLE_CHAR_SCRIPT.SetTileData("water_maze_wall", "water_maze_floor", "water_maze_secondary")
	elseif SV.test_grounds.Tileset == 8 then

	  SINGLE_CHAR_SCRIPT.SetTileData("poison_maze_wall", "poison_maze_floor", "poison_maze_secondary")
	elseif SV.test_grounds.Tileset == 9 then

	  SINGLE_CHAR_SCRIPT.SetTileData("rock_maze_wall", "rock_maze_floor", "rock_maze_secondary")
	elseif SV.test_grounds.Tileset == 10 then

	  SINGLE_CHAR_SCRIPT.SetTileData("silent_chasm_wall", "silent_chasm_floor", "silent_chasm_secondary")
	elseif SV.test_grounds.Tileset == 11 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mt_thunder_wall", "mt_thunder_floor", "mt_thunder_secondary")
	elseif SV.test_grounds.Tileset == 12 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mt_thunder_peak_wall", "mt_thunder_peak_floor", "mt_thunder_peak_secondary")
	elseif SV.test_grounds.Tileset == 13 then
	  SOUND:PlayBGM("Great Canyon.ogg", true)

	  SINGLE_CHAR_SCRIPT.SetTileData("great_canyon_wall", "great_canyon_floor", "great_canyon_secondary")
	elseif SV.test_grounds.Tileset == 14 then

	  SINGLE_CHAR_SCRIPT.SetTileData("lapis_cave_wall", "lapis_cave_floor", "lapis_cave_secondary")
	elseif SV.test_grounds.Tileset == 15 then

	  SINGLE_CHAR_SCRIPT.SetTileData("southern_cavern_2_wall", "southern_cavern_2_floor", "southern_cavern_2_secondary")
	elseif SV.test_grounds.Tileset == 16 then

	  SINGLE_CHAR_SCRIPT.SetTileData("wish_cave_2_wall", "wish_cave_2_floor", "wish_cave_2_secondary")
	elseif SV.test_grounds.Tileset == 17 then

	  SINGLE_CHAR_SCRIPT.SetTileData("rock_path_rb_wall", "rock_path_rb_floor", "rock_path_rb_secondary")
	elseif SV.test_grounds.Tileset == 18 then

	  SINGLE_CHAR_SCRIPT.SetTileData("northern_range_1_wall", "northern_range_1_floor", "northern_range_1_secondary")
	elseif SV.test_grounds.Tileset == 19 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mt_blaze_wall", "mt_blaze_floor", "mt_blaze_secondary")
	elseif SV.test_grounds.Tileset == 20 then

	  SINGLE_CHAR_SCRIPT.SetTileData("snow_path_wall", "snow_path_floor", "snow_path_secondary")
	elseif SV.test_grounds.Tileset == 21 then

	  SINGLE_CHAR_SCRIPT.SetTileData("frosty_forest_wall", "frosty_forest_floor", "frosty_forest_secondary")
	elseif SV.test_grounds.Tileset == 22 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mt_freeze_wall", "mt_freeze_floor", "mt_freeze_secondary")
	elseif SV.test_grounds.Tileset == 23 then

	  SINGLE_CHAR_SCRIPT.SetTileData("ice_maze_wall", "ice_maze_floor", "ice_maze_secondary")
	elseif SV.test_grounds.Tileset == 24 then

	  SINGLE_CHAR_SCRIPT.SetTileData("magma_cavern_2_wall", "magma_cavern_2_floor", "magma_cavern_2_secondary")
	elseif SV.test_grounds.Tileset == 25 then

	  SINGLE_CHAR_SCRIPT.SetTileData("magma_cavern_3_wall", "magma_cavern_3_floor", "magma_cavern_3_secondary")
	elseif SV.test_grounds.Tileset == 26 then

	  SINGLE_CHAR_SCRIPT.SetTileData("howling_forest_2_wall", "howling_forest_2_floor", "howling_forest_2_secondary")
	elseif SV.test_grounds.Tileset == 27 then
	  SOUND:PlayBGM("Sky Tower.ogg", true)

	  SINGLE_CHAR_SCRIPT.SetTileData("sky_tower_wall", "sky_tower_floor", "sky_tower_secondary")
	elseif SV.test_grounds.Tileset == 28 then

	  SINGLE_CHAR_SCRIPT.SetTileData("darknight_relic_wall", "darknight_relic_floor", "darknight_relic_secondary")
	elseif SV.test_grounds.Tileset == 29 then

	  SINGLE_CHAR_SCRIPT.SetTileData("desert_region_wall", "desert_region_floor", "desert_region_secondary")
	elseif SV.test_grounds.Tileset == 30 then

	  SINGLE_CHAR_SCRIPT.SetTileData("howling_forest_1_wall", "howling_forest_1_floor", "howling_forest_1_secondary")
	elseif SV.test_grounds.Tileset == 31 then

	  SINGLE_CHAR_SCRIPT.SetTileData("southern_cavern_1_wall", "southern_cavern_1_floor", "southern_cavern_1_secondary")
	elseif SV.test_grounds.Tileset == 32 then

	  SINGLE_CHAR_SCRIPT.SetTileData("wyvern_hill_wall", "wyvern_hill_floor", "wyvern_hill_secondary")
	elseif SV.test_grounds.Tileset == 33 then

	  SINGLE_CHAR_SCRIPT.SetTileData("solar_cave_1_wall", "solar_cave_1_floor", "solar_cave_1_secondary")
	elseif SV.test_grounds.Tileset == 34 then

	  SINGLE_CHAR_SCRIPT.SetTileData("waterfall_pond_wall", "waterfall_pond_floor", "waterfall_pond_secondary")
	elseif SV.test_grounds.Tileset == 35 then

	  SINGLE_CHAR_SCRIPT.SetTileData("stormy_sea_1_wall", "stormy_sea_1_floor", "stormy_sea_1_secondary")
	elseif SV.test_grounds.Tileset == 36 then

	  SINGLE_CHAR_SCRIPT.SetTileData("stormy_sea_2_wall", "stormy_sea_2_floor", "stormy_sea_2_secondary")
	elseif SV.test_grounds.Tileset == 37 then

	  SINGLE_CHAR_SCRIPT.SetTileData("silver_trench_3_wall", "silver_trench_3_floor", "silver_trench_3_secondary")
	elseif SV.test_grounds.Tileset == 38 then

	  SINGLE_CHAR_SCRIPT.SetTileData("buried_relic_1_wall", "buried_relic_1_floor", "buried_relic_1_secondary")
	elseif SV.test_grounds.Tileset == 39 then

	  SINGLE_CHAR_SCRIPT.SetTileData("buried_relic_2_wall", "buried_relic_2_floor", "buried_relic_2_secondary")
	elseif SV.test_grounds.Tileset == 40 then

	  SINGLE_CHAR_SCRIPT.SetTileData("buried_relic_3_wall", "buried_relic_3_floor", "buried_relic_3_secondary")
	elseif SV.test_grounds.Tileset == 41 then

	  SINGLE_CHAR_SCRIPT.SetTileData("lightning_field_wall", "lightning_field_floor", "lightning_field_secondary")
	elseif SV.test_grounds.Tileset == 42 then

	  SINGLE_CHAR_SCRIPT.SetTileData("northwind_field_wall", "northwind_field_floor", "northwind_field_secondary")
	elseif SV.test_grounds.Tileset == 43 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mt_faraway_2_wall", "mt_faraway_2_floor", "mt_faraway_2_secondary")
	elseif SV.test_grounds.Tileset == 44 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mt_faraway_4_wall", "mt_faraway_4_floor", "mt_faraway_4_secondary")
	elseif SV.test_grounds.Tileset == 45 then

	  SINGLE_CHAR_SCRIPT.SetTileData("northern_range_2_wall", "northern_range_2_floor", "northern_range_2_secondary")
	elseif SV.test_grounds.Tileset == 46 then

	  SINGLE_CHAR_SCRIPT.SetTileData("pitfall_valley_1_wall", "pitfall_valley_1_floor", "pitfall_valley_1_secondary")
	elseif SV.test_grounds.Tileset == 47 then
	  SOUND:PlayBGM("Buried Relic.ogg", true)

	  SINGLE_CHAR_SCRIPT.SetTileData("wish_cave_1_wall", "wish_cave_1_floor", "wish_cave_1_secondary")
	elseif SV.test_grounds.Tileset == 48 then

	  SINGLE_CHAR_SCRIPT.SetTileData("joyous_tower_wall", "joyous_tower_floor", "joyous_tower_secondary")
	elseif SV.test_grounds.Tileset == 49 then

	  SINGLE_CHAR_SCRIPT.SetTileData("purity_forest_2_wall", "purity_forest_2_floor", "purity_forest_2_secondary")
	elseif SV.test_grounds.Tileset == 50 then

	  SINGLE_CHAR_SCRIPT.SetTileData("purity_forest_4_wall", "purity_forest_4_floor", "purity_forest_4_secondary")
	elseif SV.test_grounds.Tileset == 51 then

	  SINGLE_CHAR_SCRIPT.SetTileData("purity_forest_6_wall", "purity_forest_6_floor", "purity_forest_6_secondary")
	elseif SV.test_grounds.Tileset == 52 then

	  SINGLE_CHAR_SCRIPT.SetTileData("purity_forest_7_wall", "purity_forest_7_floor", "purity_forest_7_secondary")
	elseif SV.test_grounds.Tileset == 53 then

	  SINGLE_CHAR_SCRIPT.SetTileData("purity_forest_8_wall", "purity_forest_8_floor", "purity_forest_8_secondary")
	elseif SV.test_grounds.Tileset == 54 then

	  SINGLE_CHAR_SCRIPT.SetTileData("purity_forest_9_wall", "purity_forest_9_floor", "purity_forest_9_secondary")
	elseif SV.test_grounds.Tileset == 55 then

	  SINGLE_CHAR_SCRIPT.SetTileData("murky_cave_wall", "murky_cave_floor", "murky_cave_secondary")
	elseif SV.test_grounds.Tileset == 56 then

	  SINGLE_CHAR_SCRIPT.SetTileData("western_cave_1_wall", "western_cave_1_floor", "western_cave_1_secondary")
	elseif SV.test_grounds.Tileset == 57 then

	  SINGLE_CHAR_SCRIPT.SetTileData("western_cave_2_wall", "western_cave_2_floor", "western_cave_2_secondary")
	elseif SV.test_grounds.Tileset == 58 then

	  SINGLE_CHAR_SCRIPT.SetTileData("meteor_cave_wall", "meteor_cave_floor", "meteor_cave_secondary")
	elseif SV.test_grounds.Tileset == 59 then

	  SINGLE_CHAR_SCRIPT.SetTileData("rescue_team_maze_wall", "rescue_team_maze_floor", "rescue_team_maze_secondary")
	elseif SV.test_grounds.Tileset == 60 then
	  SOUND:PlayBGM("B04. Tropical Path.ogg", true)

	  SINGLE_CHAR_SCRIPT.SetTileData("beach_cave_wall", "beach_cave_floor", "beach_cave_secondary")
	elseif SV.test_grounds.Tileset == 61 then

	  SINGLE_CHAR_SCRIPT.SetTileData("drenched_bluff_wall", "drenched_bluff_floor", "drenched_bluff_secondary")
	elseif SV.test_grounds.Tileset == 62 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mt_bristle_wall", "mt_bristle_floor", "mt_bristle_secondary")
	elseif SV.test_grounds.Tileset == 63 then

	  SINGLE_CHAR_SCRIPT.SetTileData("waterfall_cave_wall", "waterfall_cave_floor", "waterfall_cave_secondary")
	elseif SV.test_grounds.Tileset == 64 then

	  SINGLE_CHAR_SCRIPT.SetTileData("apple_woods_wall", "apple_woods_floor", "apple_woods_secondary")
	elseif SV.test_grounds.Tileset == 65 then

	  SINGLE_CHAR_SCRIPT.SetTileData("craggy_coast_wall", "craggy_coast_floor", "craggy_coast_secondary")
	elseif SV.test_grounds.Tileset == 66 then

	  SINGLE_CHAR_SCRIPT.SetTileData("side_path_wall", "side_path_floor", "side_path_secondary")
	elseif SV.test_grounds.Tileset == 67 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mt_horn_wall", "mt_horn_floor", "mt_horn_secondary")
	elseif SV.test_grounds.Tileset == 68 then

	  SINGLE_CHAR_SCRIPT.SetTileData("rock_path_tds_wall", "rock_path_tds_floor", "rock_path_tds_secondary")
	elseif SV.test_grounds.Tileset == 69 then

	  SINGLE_CHAR_SCRIPT.SetTileData("foggy_forest_wall", "foggy_forest_floor", "foggy_forest_secondary")
	elseif SV.test_grounds.Tileset == 70 then

	  SINGLE_CHAR_SCRIPT.SetTileData("forest_path_wall", "forest_path_floor", "forest_path_secondary")
	elseif SV.test_grounds.Tileset == 71 then

	  SINGLE_CHAR_SCRIPT.SetTileData("steam_cave_wall", "steam_cave_floor", "steam_cave_secondary")
	elseif SV.test_grounds.Tileset == 72 then

	  SINGLE_CHAR_SCRIPT.SetTileData("unused_steam_cave_wall", "unused_steam_cave_floor", "unused_steam_cave_secondary")
	elseif SV.test_grounds.Tileset == 73 then
	  SOUND:PlayBGM("B10. Thunderstruck Pass.ogg", true)

	  SINGLE_CHAR_SCRIPT.SetTileData("amp_plains_wall", "amp_plains_floor", "amp_plains_secondary")
	elseif SV.test_grounds.Tileset == 74 then

	  SINGLE_CHAR_SCRIPT.SetTileData("far_amp_plains_wall", "far_amp_plains_floor", "far_amp_plains_secondary")
	elseif SV.test_grounds.Tileset == 75 then

	  SINGLE_CHAR_SCRIPT.SetTileData("northern_desert_1_wall", "northern_desert_1_floor", "northern_desert_1_secondary")
	elseif SV.test_grounds.Tileset == 76 then

	  SINGLE_CHAR_SCRIPT.SetTileData("northern_desert_2_wall", "northern_desert_2_floor", "northern_desert_2_secondary")
	elseif SV.test_grounds.Tileset == 77 then

	  SINGLE_CHAR_SCRIPT.SetTileData("quicksand_cave_wall", "quicksand_cave_floor", "quicksand_cave_secondary")
	elseif SV.test_grounds.Tileset == 78 then

	  SINGLE_CHAR_SCRIPT.SetTileData("quicksand_pit_wall", "quicksand_pit_floor", "quicksand_pit_secondary")
	elseif SV.test_grounds.Tileset == 79 then

	  SINGLE_CHAR_SCRIPT.SetTileData("quicksand_unused_wall", "quicksand_unused_floor", "quicksand_unused_secondary")
	elseif SV.test_grounds.Tileset == 80 then

	  SINGLE_CHAR_SCRIPT.SetTileData("crystal_cave_1_wall", "crystal_cave_1_floor", "crystal_cave_1_secondary")
	elseif SV.test_grounds.Tileset == 81 then

	  SINGLE_CHAR_SCRIPT.SetTileData("crystal_cave_2_wall", "crystal_cave_2_floor", "crystal_cave_2_secondary")
	elseif SV.test_grounds.Tileset == 82 then

	  SINGLE_CHAR_SCRIPT.SetTileData("crystal_crossing_wall", "crystal_crossing_floor", "crystal_crossing_secondary")
	elseif SV.test_grounds.Tileset == 83 then
	  SOUND:PlayBGM("B29. Treacherous Mountain.ogg", true)

	  SINGLE_CHAR_SCRIPT.SetTileData("chasm_cave_1_wall", "chasm_cave_1_floor", "chasm_cave_1_floor")
	elseif SV.test_grounds.Tileset == 84 then

	  SINGLE_CHAR_SCRIPT.SetTileData("chasm_cave_2_wall", "chasm_cave_2_floor", "chasm_cave_2_floor")
	elseif SV.test_grounds.Tileset == 85 then

	  SINGLE_CHAR_SCRIPT.SetTileData("dark_hill_1_wall", "dark_hill_1_floor", "dark_hill_1_secondary")
	elseif SV.test_grounds.Tileset == 86 then

	  SINGLE_CHAR_SCRIPT.SetTileData("dark_hill_2_wall", "dark_hill_2_floor", "dark_hill_2_secondary")
	elseif SV.test_grounds.Tileset == 87 then

	  SINGLE_CHAR_SCRIPT.SetTileData("sealed_ruin_wall", "sealed_ruin_floor", "sealed_ruin_secondary")
	elseif SV.test_grounds.Tileset == 88 then

	  SINGLE_CHAR_SCRIPT.SetTileData("deep_sealed_ruin_wall", "deep_sealed_ruin_floor", "deep_sealed_ruin_secondary")
	elseif SV.test_grounds.Tileset == 89 then

	  SINGLE_CHAR_SCRIPT.SetTileData("dusk_forest_1_wall", "dusk_forest_1_floor", "dusk_forest_1_secondary")
	elseif SV.test_grounds.Tileset == 90 then

	  SINGLE_CHAR_SCRIPT.SetTileData("dusk_forest_2_wall", "dusk_forest_2_floor", "dusk_forest_2_secondary")
	elseif SV.test_grounds.Tileset == 91 then

	  SINGLE_CHAR_SCRIPT.SetTileData("deep_dusk_forest_1_wall", "deep_dusk_forest_1_floor", "deep_dusk_forest_1_secondary")
	elseif SV.test_grounds.Tileset == 92 then

	  SINGLE_CHAR_SCRIPT.SetTileData("deep_dusk_forest_2_wall", "deep_dusk_forest_2_floor", "deep_dusk_forest_2_secondary")
	elseif SV.test_grounds.Tileset == 93 then

	  SINGLE_CHAR_SCRIPT.SetTileData("treeshroud_forest_1_wall", "treeshroud_forest_1_floor", "treeshroud_forest_1_secondary")
	elseif SV.test_grounds.Tileset == 94 then

	  SINGLE_CHAR_SCRIPT.SetTileData("treeshroud_forest_2_wall", "treeshroud_forest_2_floor", "treeshroud_forest_2_secondary")
	elseif SV.test_grounds.Tileset == 95 then

	  SINGLE_CHAR_SCRIPT.SetTileData("brine_cave_wall", "brine_cave_floor", "brine_cave_secondary")
	elseif SV.test_grounds.Tileset == 96 then

	  SINGLE_CHAR_SCRIPT.SetTileData("lower_brine_cave_wall", "lower_brine_cave_floor", "lower_brine_cave_secondary")
	elseif SV.test_grounds.Tileset == 97 then

	  SINGLE_CHAR_SCRIPT.SetTileData("unused_brine_cave_wall", "unused_brine_cave_floor", "unused_brine_cave_secondary")
	elseif SV.test_grounds.Tileset == 98 then

	  SINGLE_CHAR_SCRIPT.SetTileData("hidden_land_wall", "hidden_land_floor", "hidden_land_secondary")
	elseif SV.test_grounds.Tileset == 99 then

	  SINGLE_CHAR_SCRIPT.SetTileData("hidden_highland_wall", "hidden_highland_floor", "hidden_highland_secondary")
	elseif SV.test_grounds.Tileset == 100 then
	  SOUND:PlayBGM("Temporal Tower.ogg", true)

	  SINGLE_CHAR_SCRIPT.SetTileData("temporal_tower_wall", "temporal_tower_floor", "temporal_tower_secondary")
	elseif SV.test_grounds.Tileset == 101 then

	  SINGLE_CHAR_SCRIPT.SetTileData("temporal_spire_wall", "temporal_spire_floor", "temporal_spire_secondary")
	elseif SV.test_grounds.Tileset == 102 then

	  SINGLE_CHAR_SCRIPT.SetTileData("temporal_unused_wall", "temporal_unused_floor", "temporal_unused_secondary")
	elseif SV.test_grounds.Tileset == 103 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mystifying_forest_wall", "mystifying_forest_floor", "mystifying_forest_secondary")
	elseif SV.test_grounds.Tileset == 104 then

	  SINGLE_CHAR_SCRIPT.SetTileData("southern_jungle_wall", "southern_jungle_floor", "southern_jungle_secondary")
	elseif SV.test_grounds.Tileset == 105 then

	  SINGLE_CHAR_SCRIPT.SetTileData("concealed_ruins_wall", "concealed_ruins_floor", "concealed_ruins_secondary")
	elseif SV.test_grounds.Tileset == 106 then

	  SINGLE_CHAR_SCRIPT.SetTileData("surrounded_sea_wall", "surrounded_sea_floor", "surrounded_sea_secondary")
	elseif SV.test_grounds.Tileset == 107 then

	  SINGLE_CHAR_SCRIPT.SetTileData("miracle_sea_wall", "miracle_sea_floor", "miracle_sea_secondary")
	elseif SV.test_grounds.Tileset == 108 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mt_travail_wall", "mt_travail_floor", "mt_travail_secondary")
	elseif SV.test_grounds.Tileset == 109 then

	  SINGLE_CHAR_SCRIPT.SetTileData("the_nightmare_wall", "the_nightmare_floor", "the_nightmare_secondary")
	elseif SV.test_grounds.Tileset == 110 then

	  SINGLE_CHAR_SCRIPT.SetTileData("spacial_rift_1_wall", "spacial_rift_1_floor", "spacial_rift_1_secondary")
	elseif SV.test_grounds.Tileset == 111 then

	  SINGLE_CHAR_SCRIPT.SetTileData("spacial_rift_2_wall", "spacial_rift_2_floor", "spacial_rift_2_secondary")
	elseif SV.test_grounds.Tileset == 112 then

	  SINGLE_CHAR_SCRIPT.SetTileData("dark_crater_wall", "dark_crater_floor", "dark_crater_secondary")
	elseif SV.test_grounds.Tileset == 113 then

	  SINGLE_CHAR_SCRIPT.SetTileData("deep_dark_crater_wall", "deep_dark_crater_floor", "deep_dark_crater_secondary")
	elseif SV.test_grounds.Tileset == 114 then

	  SINGLE_CHAR_SCRIPT.SetTileData("world_abyss_2_wall", "world_abyss_2_floor", "world_abyss_2_secondary")
	elseif SV.test_grounds.Tileset == 115 then

	  SINGLE_CHAR_SCRIPT.SetTileData("golden_chamber_wall", "golden_chamber_floor", "golden_chamber_secondary")
	elseif SV.test_grounds.Tileset == 116 then
	  SOUND:PlayBGM("B22. Overgrown Wilds.ogg", true)

	  SINGLE_CHAR_SCRIPT.SetTileData("mystery_jungle_1_wall", "mystery_jungle_1_floor", "mystery_jungle_1_secondary")
	elseif SV.test_grounds.Tileset == 117 then

	  SINGLE_CHAR_SCRIPT.SetTileData("mystery_jungle_2_wall", "mystery_jungle_2_floor", "mystery_jungle_2_secondary")
	elseif SV.test_grounds.Tileset == 118 then

	  SINGLE_CHAR_SCRIPT.SetTileData("zero_isle_east_3_wall", "zero_isle_east_3_floor", "zero_isle_east_3_secondary")
	elseif SV.test_grounds.Tileset == 119 then

	  SINGLE_CHAR_SCRIPT.SetTileData("zero_isle_east_4_wall", "zero_isle_east_4_floor", "zero_isle_east_4_secondary")
	elseif SV.test_grounds.Tileset == 120 then

	  SINGLE_CHAR_SCRIPT.SetTileData("zero_isle_south_1_wall", "zero_isle_south_1_floor", "zero_isle_south_1_secondary")
	elseif SV.test_grounds.Tileset == 121 then

	  SINGLE_CHAR_SCRIPT.SetTileData("zero_isle_south_2_wall", "zero_isle_south_2_floor", "zero_isle_south_2_secondary")
	elseif SV.test_grounds.Tileset == 122 then

	  SINGLE_CHAR_SCRIPT.SetTileData("tiny_meadow_wall", "tiny_meadow_floor", "tiny_meadow_secondary")
	elseif SV.test_grounds.Tileset == 123 then

	  SINGLE_CHAR_SCRIPT.SetTileData("final_maze_2_wall", "final_maze_2_floor", "final_maze_2_secondary")
	elseif SV.test_grounds.Tileset == 124 then

	  SINGLE_CHAR_SCRIPT.SetTileData("unused_waterfall_pond_wall", "unused_waterfall_pond_floor", "unused_waterfall_pond_secondary")
	elseif SV.test_grounds.Tileset == 125 then

	  SINGLE_CHAR_SCRIPT.SetTileData("lush_prairie_wall", "lush_prairie_floor", "lush_prairie_secondary")
	elseif SV.test_grounds.Tileset == 126 then

	  SINGLE_CHAR_SCRIPT.SetTileData("rock_aegis_cave_wall", "rock_aegis_cave_floor", "rock_aegis_cave_secondary")
	elseif SV.test_grounds.Tileset == 127 then

	  SINGLE_CHAR_SCRIPT.SetTileData("ice_aegis_cave_wall", "ice_aegis_cave_floor", "ice_aegis_cave_secondary")
	elseif SV.test_grounds.Tileset == 128 then

	  SINGLE_CHAR_SCRIPT.SetTileData("steel_aegis_cave_wall", "steel_aegis_cave_floor", "steel_aegis_cave_secondary")
	elseif SV.test_grounds.Tileset == 129 then
	  SOUND:PlayBGM("B03. Demonstration 3.ogg", true)

	  SINGLE_CHAR_SCRIPT.SetTileData("murky_forest_wall", "murky_forest_floor", "murky_forest_secondary")
	elseif SV.test_grounds.Tileset == 130 then

	  SINGLE_CHAR_SCRIPT.SetTileData("deep_boulder_quarry_wall", "deep_boulder_quarry_floor", "deep_boulder_quarry_secondary")
	elseif SV.test_grounds.Tileset == 131 then

	  SINGLE_CHAR_SCRIPT.SetTileData("limestone_cavern_wall", "limestone_cavern_floor", "limestone_cavern_secondary")
	elseif SV.test_grounds.Tileset == 132 then

	  SINGLE_CHAR_SCRIPT.SetTileData("deep_limestone_cavern_wall", "deep_limestone_cavern_floor", "deep_limestone_cavern_secondary")
	elseif SV.test_grounds.Tileset == 133 then

	  SINGLE_CHAR_SCRIPT.SetTileData("barren_valley_wall", "barren_valley_floor", "barren_valley_secondary")
	elseif SV.test_grounds.Tileset == 134 then

	  SINGLE_CHAR_SCRIPT.SetTileData("dark_wasteland_wall", "dark_wasteland_floor", "dark_wasteland_secondary")
	elseif SV.test_grounds.Tileset == 135 then

	  SINGLE_CHAR_SCRIPT.SetTileData("future_temporal_tower_wall", "future_temporal_tower_floor", "future_temporal_tower_secondary")
	elseif SV.test_grounds.Tileset == 136 then

	  SINGLE_CHAR_SCRIPT.SetTileData("future_temporal_spire_wall", "future_temporal_spire_floor", "future_temporal_spire_secondary")
	elseif SV.test_grounds.Tileset == 137 then

	  SINGLE_CHAR_SCRIPT.SetTileData("spacial_cliffs_wall", "spacial_cliffs_floor", "spacial_cliffs_secondary")
	elseif SV.test_grounds.Tileset == 138 then

	  SINGLE_CHAR_SCRIPT.SetTileData("dark_ice_mountain_wall", "dark_ice_mountain_floor", "dark_ice_mountain_secondary")
	elseif SV.test_grounds.Tileset == 139 then

	  SINGLE_CHAR_SCRIPT.SetTileData("dark_ice_mountain_peak_wall", "dark_ice_mountain_peak_floor", "dark_ice_mountain_peak_secondary")
	elseif SV.test_grounds.Tileset == 140 then

	  SINGLE_CHAR_SCRIPT.SetTileData("icicle_forest_wall", "icicle_forest_floor", "icicle_forest_secondary")
	elseif SV.test_grounds.Tileset == 141 then

	  SINGLE_CHAR_SCRIPT.SetTileData("vast_ice_mountain_wall", "vast_ice_mountain_floor", "vast_ice_mountain_secondary")
	elseif SV.test_grounds.Tileset == 142 then

	  SINGLE_CHAR_SCRIPT.SetTileData("vast_ice_mountain_peak_wall", "vast_ice_mountain_peak_floor", "vast_ice_mountain_peak_secondary")
	elseif SV.test_grounds.Tileset == 143 then

	  SINGLE_CHAR_SCRIPT.SetTileData("sky_peak_4th_pass_wall", "sky_peak_4th_pass_floor", "sky_peak_4th_pass_secondary")
	elseif SV.test_grounds.Tileset == 144 then

	  SINGLE_CHAR_SCRIPT.SetTileData("sky_peak_7th_pass_wall", "sky_peak_7th_pass_floor", "sky_peak_7th_pass_secondary")
	elseif SV.test_grounds.Tileset == 145 then

	  SINGLE_CHAR_SCRIPT.SetTileData("sky_peak_summit_pass_wall", "sky_peak_summit_pass_floor", "sky_peak_summit_pass_secondary")
	elseif SV.test_grounds.Tileset == 146 then

	  SINGLE_CHAR_SCRIPT.SetTileData("test_dungeon_wall", "test_dungeon_floor", "test_dungeon_secondary")
	end
end

---
-- Ends a run in a failure if an allied party member marked with "IsPartner" faints.
-- Additionally, if someone faints and they aren't "IsPartner", then send them home automatically.
-- @tparam nil owner This function accepts four arguments, but none of them are checked.
-- @tparam nil ownerChar
-- @tparam nil context
-- @tparam nil args
function SINGLE_CHAR_SCRIPT.AllyDeathCheck(owner, ownerChar, context, args)
	local player_count = GAME:GetPlayerPartyCount()
	local guest_count = GAME:GetPlayerGuestCount()

	if player_count < 1 then return end -- If there's no party members then we dont need to do anything

	for i = 0, player_count - 1, 1 do
		local player = GAME:GetPlayerPartyMember(i)
		if player.Dead and player.IsPartner then --someone died
			for j = 0, player_count - 1, 1 do --beam everyone else out
				player = GAME:GetPlayerPartyMember(j)
				if not player.Dead then    --dont beam out whoever died
					--delay between beam outs
					GAME:WaitFrames(60)
					TASK:WaitTask(_DUNGEON:ProcessBattleFX(player, player, _DATA.SendHomeFX))
					player.Dead = true
				end
			end
			--beam out guests
			for j = 0, guest_count - 1, 1 do --beam everyone else out
				guest = GAME:GetPlayerGuestMember(j)
				if not guest.Dead then --dont beam out whoever died
					--delay between beam outs
					GAME:WaitFrames(60)
					TASK:WaitTask(_DUNGEON:ProcessBattleFX(guest, guest, _DATA.SendHomeFX))
					guest.Dead = true
				end
			end
			return --cut the script short here if someone died, no need to check guests
		end
	end

	-- check guests as well
	if guest_count < 1 then return end -- If there's no guest members then we dont need to do anything
	for i = 0, guest_count - 1, 1 do
		local guest = GAME:GetPlayerGuestMember(i)
		if guest.Dead and guest.IsPartner then -- someone died
			-- beam player's team out first
			for j = 0, player_count - 1, 1 do -- beam everyone else out
				player = GAME:GetPlayerPartyMember(j)
				if not player.Dead then  -- dont beam out whoever died
					TASK:WaitTask(_DUNGEON:ProcessBattleFX(player, player, _DATA.SendHomeFX))
					player.Dead = true
					GAME:WaitFrames(60)
				end
			end
			for j = 0, guest_count - 1, 1 do --beam everyone else out
				guest = GAME:GetPlayerGuestMember(j)
				if not guest.Dead then -- dont beam out whoever died
					TASK:WaitTask(_DUNGEON:ProcessBattleFX(guest, guest, _DATA.SendHomeFX))
					guest.Dead = true
					GAME:WaitFrames(60)
				end
			end
		end
	end
end

function SINGLE_CHAR_SCRIPT.DungeonTalker(owner, ownerChar, context, args) --Thank you, Halcyon scripters.
	if context.User == nil then return else print(context.User) end
	if context.User == GAME:GetPlayerPartyMember(0) then --this check is needed so that the script runs only once, otherwise it'll run for each entity in the map. 
	  GAME:QueueLeaderEvent(function() SINGLE_CHAR_SCRIPT.DungeonDialogue(owner, ownerChar, context, args) end)
	end
end

function SINGLE_CHAR_SCRIPT.DungeonDialogue(owner, ownerChar, context, args)
	local maru = GAME:GetPlayerPartyMember(0)
	local azura = GAME:GetPlayerPartyMember(1)
	local area_name = DUNGEON:DungeonDisplayName()
	local floor_no = DUNGEON:DungeonCurrentFloor()
	if area_name == "Tarro Forest" and SV.tarro_town.PieChapter < 4 then
		if floor_no == 0 then
			if DUNsection == 1 then
			else
				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("Okay, so we need to find some stairs.")

				UI:SetSpeaker(azura)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Stairs?[pause=30] Where stairs?")

				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Happy")
				UI:WaitShowDialogue("I dunno, but we won't find them just sitting here.")
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("Let's use the arrow keys to walk, and hold " .. STRINGS:LocalKeyString(4) .. " to use a move.")

				UI:SetSpeaker(azura)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("...[pause=50]h[emote=Stunned]uh...?")
			end
		elseif floor_no == 1 then
			UI:SetSpeaker(maru)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("Pretty simple stuff, right?")

			UI:SetSpeaker(azura)
			UI:SetSpeakerEmotion("Happy")
			UI:WaitShowDialogue("Yeah! Big Apple!")

			UI:SetSpeaker(maru)
			UI:SetSpeakerEmotion("Happy")
			UI:WaitShowDialogue("Now let's see if we can't find any items around.")
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("Once we do, we can press " .. STRINGS:LocalKeyString(12) .. " to open the bag.")
		end
	elseif area_name == "Tarro Tree Hallows" and SV.tarro_town.PieChapter < 8 then
		local senna = GAME:GetPlayerPartyMember(2)
		local puchi = GAME:GetPlayerPartyMember(3)
		local ziggy = GAME:GetPlayerPartyMember(4)
		if DUNsection == 0 then
			if floor_no == 0 then
				UI:SetSpeaker(puchi)
				UI:SetSpeakerEmotion("Dizzy")
				UI:WaitShowDialogue("Guys... I'm not making it, I'm way too tired...")
	
				UI:SetSpeaker(azura)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Uh oh...")
	
				UI:SetSpeaker(senna)
				UI:SetSpeakerEmotion("Teary-Eyed")
				UI:WaitShowDialogue("I-I... this is... this is a d-dungeon...??")
				UI:SetSpeakerEmotion("Pain")
				UI:WaitShowDialogue("It's huge...!")
	
				UI:SetSpeaker(ziggy)
				UI:SetSpeakerEmotion("Determined")
				UI:WaitShowDialogue("Guuuuuuys!")
			elseif floor_no == 3 then
				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("I think I'm getting tired of being in front...")
	
				UI:SetSpeaker(ziggy)
				UI:SetSpeakerEmotion("Happy")
				UI:WaitShowDialogue("LEMME LEMME LEMME LEMME!")
	
				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Happy")
				UI:WaitShowDialogue("Mkaaaay, I'll just [emote=Normal]switch up using the number keys: 1, 2, 3, and 4.")

				GAME:WaitFrames(60)
	
				UI:SetSpeaker(ziggy)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Azu, what is he talking about?")
	
				UI:SetSpeaker(azura)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("I don't know...")
			end
		elseif DUNsection == 1 then
			if floor_no == 0 then
				UI:SetSpeaker(puchi)
				UI:SetSpeakerEmotion("Stunned")
				UI:WaitShowDialogue("...is this place getting bigger?!")

				UI:SetSpeaker(senna)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Now I'm getting tired...")

				UI:SetSpeaker(ziggy)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Guys,[pause=20] come on![pause=20] Big Tree![pause=20] Let's go![pause=20]")

				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("To be fair, you never told us about why it's so important...")

				UI:SetSpeaker(ziggy)
				UI:SetSpeakerEmotion("Sad")
				UI:WaitShowDialogue("...momma said that this tree is more alive than all the other trees...")
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Every time she was hurt, this tree seemed to be with her...")

				UI:SetSpeaker(senna)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("I s-still don't believe it but...")
				UI:SetSpeakerEmotion("Determined")
				UI:WaitShowDialogue("We'll fight for her if this tree is her friend.")
			end
		elseif DUNsection == 2 then
			UI:SetSpeaker(senna)
			UI:SetSpeakerEmotion("Worried")
			UI:WaitShowDialogue("W-what's the plan, guys?")

			UI:SetSpeaker(ziggy)
			UI:SetSpeakerEmotion("Angry")
			UI:WaitShowDialogue("Chaaaaaaaaaaarge!")

			UI:SetSpeaker(maru)
			UI:SetSpeakerEmotion("Worried")
			UI:WaitShowDialogue("Um... maybe we shouldn't do that...")
		end
	elseif area_name == "Entoh Thicket" then
		print("You are here!")
		local rexio = GAME:GetPlayerPartyMember(0)
		if floor_no == 0 then
			UI:SetSpeaker(rexio)
			UI:SetSpeakerEmotion("Worried")
			UI:WaitShowDialogue("I guess now would be a good time to practice my aura.")
			UI:WaitShowDialogue("That way Dad would be less angry about me not getting his package, haha.")
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("It's a pretty open space. This'll be easy.")

			UI:ResetSpeaker()
			UI:WaitShowDialogue("While playling as Rexio, use the B key to sense items within 10 tiles")
		end
	elseif area_name == "Entoh Town" then
		print("You are here!")
		local rexio = GAME:GetPlayerPartyMember(0)
		UI:SetSpeaker(rexio)
		UI:SetSpeakerEmotion("Worried")
		UI:WaitShowDialogue("Mm... the usual exit is blocked now...")
		UI:SetSpeakerEmotion("Determined")
		UI:WaitShowDialogue("Where else can we get out...?")
	end
end

---
-- Reimplementation of Audino's C# event for BeginBattleEvent.
-- This will allow us to inject custom function code before ending a battle 
-- (such as clearing existing lava flows when a boss fight ends).
-- @tparam GameEventOwner owner
-- @tparam Character ownerChar
-- @tparam SingleCharContext context
-- @tparam table args Table of format {CustomClearEvent="NameOfFunctionThatRunsOnClear", [other arguments to said script]}
function SINGLE_CHAR_SCRIPT.LuaBeginBattleEvent(owner, ownerChar, context, args)
	local MapCheckState = luanet.import_type('RogueEssence.Dungeon.MapCheckState')
	local SingleCharScriptEvent = luanet.import_type('RogueEssence.Dungeon.SingleCharScriptEvent')
	
	local map_clear_idx = 'map_clear_check'

	if context.User ~= nil then return end
	--if a custom clear event is not given, use the default one.
	if args.CustomClearEvent == nil then args.CustomClearEvent = 'LuaCheckBossClearEvent' end
	
	--Turn on Team Mode if allowed when the boss fight starts.
	if _DUNGEON:CanUseTeamMode() then
		_DUNGEON:SetTeamMode(true)
	end
	
	local clear_status = RogueEssence.Dungeon.MapStatus(map_clear_idx)
	clear_status:LoadFromData()
	
	local check = clear_status.StatusStates:GetWithDefault(luanet.ctype(MapCheckState))
	--The 2nd argument in the function below needs a string that represents a lua table of the arguments to pass. Serpent.line will convert the lua table to a string representing it for us.
	--We only NEED to pass args, as owner, ownerchar, and context are automatically passed in when the check event is called
	check.CheckEvents:Add(SingleCharScriptEvent(args.CustomClearEvent, Serpent.line(args)))
	--check.CheckEvents:Add(LuaCheckBossClearEvent(owner, ownerChar, context, args))
	
	TASK:WaitTask(_DUNGEON:AddMapStatus(clear_status))
end

--Import Serpent library.
Serpent = require 'lib.serpent'

---
-- Reimplementation of the basic CheckBossClearEvent. 
-- Call something different from LuaBeginBattleEvent or edit this accordingly if you 
-- want a different wincon for your map or special effects/anims on win.
-- @tparam GameEventOwner owner
-- @tparam Character ownerChar Not used by this function.
-- @tparam SingleCharContext context Not used by this function.
-- @tparam table args Table of caller-defined arguments. Not used by this function.
function SINGLE_CHAR_SCRIPT.CheckRightTileEvent(owner, ownerChar, context, args)
	local MapCheckState = luanet.import_type('RogueEssence.Dungeon.MapCheckState')
	local SingleCharScriptEvent = luanet.import_type('RogueEssence.Dungeon.SingleCharScriptEvent')
	
	---
	-- Sequence that runs when map is over. Fade out, cut the music, etc.
	-- @usage Coroutine
	function end_sequence()
		_GAME:BGM("", true)
		
		SOUND:PlayBattleSE('EVT_Battle_Transition')
		TASK:WaitTask(_GAME:FadeOut(true))
		 
		_DUNGEON:ResetTurns()
		
		-- restore all and remove all map status
		local statuses_to_remove = {}
		for i = 0, _ZONE.CurrentMap.Status.Keys.Count - 1, 1 do
			statuses_to_remove[i] = _ZONE.CurrentMap.Status.Keys[i]
		end
		
		for i = 0, #statuses_to_remove - 1, 1 do
			TASK:WaitTask(_DUNGEON:RemoveMapStatus(statuses_to_remove[i], false))
		end 
		
		-- heal everyone in the party
		for i = 0, GAME:GetPlayerPartyCount() - 1, 1 do
			_DATA.Save.ActiveTeam.Players[i]:FullRestore()
		end
		
		TASK:WaitTask(_GAME:EndSegment(RogueEssence.Data.GameProgress.ResultType.Cleared))
	end

	-- For each enemy team, check each chara in that team. 
	-- If any are still alive, then fail this check and return early.
	if not Endsouthboss then
		return
	end
	
	
	-- Everyone's dead, clear the scene.
	local checks = owner.StatusStates:GetWithDefault(luanet.ctype(MapCheckState))
	
	-- The call originally for this was to remove(this), which isn't in lua. 
	-- So we need to find the LuaCheckBossClearEvent and remove that (remove ourself)
	for i = 0, checks.CheckEvents.Count - 1, 1 do
		if LUA_ENGINE:TypeOf(checks.CheckEvents[i]) == luanet.ctype(SingleCharScriptEvent) then
			if checks.CheckEvents[i].Script == args.CustomClearEvent then
				checks.CheckEvents:Remove(checks.CheckEvents[i])
			end
		end
	end
	
	if _DATA.CurrentReplay == nil then
		TASK:WaitTask(end_sequence())
	else 
		TASK:WaitTask(_GAME:EndSegment(RogueEssence.Data.GameProgress.ResultType.Cleared))
	end
	
end

function SINGLE_CHAR_SCRIPT.TileCheck()
	Endsouthboss = true
end