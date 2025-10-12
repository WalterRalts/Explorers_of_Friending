require 'explorers_of_friending.common'

function BATTLE_SCRIPT.Test(owner, ownerChar, context, args)
  PrintInfo("Test")
end

function BATTLE_SCRIPT.AllyInteract(owner, ownerChar, context, args)
  COMMON.DungeonInteract(context.User, context.Target, context.CancelState, context.TurnCancel)
end

function BATTLE_SCRIPT.ShopkeeperInteract(owner, ownerChar, context, args)

  if COMMON.CanTalk(context.Target) then
	local security_state = COMMON.GetShopPriceState()
    local price = security_state.Cart
    local sell_price = COMMON.GetDungeonSellPrice()
  
    local oldDir = context.Target.CharDir
    DUNGEON:CharTurnToChar(context.Target, context.User)
	
    if sell_price > 0 then
      context.TurnCancel.Cancel = true
      UI:SetSpeaker(context.Target)
	  UI:ChoiceMenuYesNo(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_SELL_%04d", context.Target.Discriminator)):ToLocal(), STRINGS:FormatKey("MONEY_AMOUNT", sell_price)), false)
	  UI:WaitForChoice()
	  result = UI:ChoiceResult()
	  
	  if SV.adventure.Thief then
	    COMMON.ThiefReturn()
	  elseif result then
	    -- iterate player inventory prices and remove total price
        COMMON.PayDungeonSellPrice(sell_price)
	    SOUND:PlayBattleSE("DUN_Money")
	    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_SELL_DONE_%04d", context.Target.Discriminator)):ToLocal()))
	  else
	    -- nothing
	  end
    end
	
    if price > 0 then
      context.TurnCancel.Cancel = true
      UI:SetSpeaker(context.Target)
	  UI:ChoiceMenuYesNo(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_PAY_%04d", context.Target.Discriminator)):ToLocal(), STRINGS:FormatKey("MONEY_AMOUNT", price)), false)
	  UI:WaitForChoice()
	  result = UI:ChoiceResult()
	  if SV.adventure.Thief then
	    COMMON.ThiefReturn()
	  elseif result then
	    if price > GAME:GetPlayerMoney() then
          UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_PAY_SHORT_%04d", context.Target.Discriminator)):ToLocal()))
	    else
	      -- iterate player inventory prices and remove total price
          COMMON.PayDungeonCartPrice(price)
	      SOUND:PlayBattleSE("DUN_Money")
	      UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_PAY_DONE_%04d", context.Target.Discriminator)):ToLocal()))
	    end
	  else
	    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_PAY_REFUSE_%04d", context.Target.Discriminator)):ToLocal()))
	  end
    end
	
	if price == 0 and sell_price == 0 then
      context.CancelState.Cancel = true
      UI:SetSpeaker(context.Target)
      UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey(string.format("TALK_SHOP_%04d", context.Target.Discriminator)):ToLocal()))
      context.Target.CharDir = oldDir
    end
  else

    UI:ResetSpeaker()
	
	local chosen_quote = RogueEssence.StringKey("TALK_CANT"):ToLocal()
    chosen_quote = string.gsub(chosen_quote, "%[myname%]", context.Target:GetDisplayName(true))
    UI:WaitShowDialogue(chosen_quote)
  end
end

function BATTLE_SCRIPT.EscortInteract(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  UI:SetSpeaker(context.Target)
  UI:WaitShowDialogue(RogueEssence.StringKey("TALK_FULL_0820"):ToLocal())
  context.Target.CharDir = oldDir
end

function BATTLE_SCRIPT.EscortInteractSister(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  local tbl = LTBL(context.Target)
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  UI:SetSpeaker(context.Target)
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  UI:SetSpeaker(context.Target)
  
  local ratio = context.Target.HP * 100 // context.Target.MaxHP
  
  if ratio <= 25 then
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_SISTER_PINCH"):ToLocal())
  elseif ratio <= 50 then
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_SISTER_HALF"):ToLocal())
  else 
    UI:SetSpeakerEmotion("Worried")
    if tbl.TalkAmount == nil then
	  UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_SISTER_FULL_001"):ToLocal())
	  tbl.TalkAmount = 1
    else
      if tbl.TalkAmount == 1 then
	    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_SISTER_FULL_002"):ToLocal())
	  elseif tbl.TalkAmount == 2 then
	    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_SISTER_FULL_003"):ToLocal())
	  else
	    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_SISTER_FULL_004"):ToLocal())
	  end
	  tbl.TalkAmount = tbl.TalkAmount + 1
    end
  end

  context.Target.CharDir = oldDir
end



function BATTLE_SCRIPT.EscortInteractMother(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  local tbl = LTBL(context.Target)
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  UI:SetSpeaker(context.Target)
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  UI:SetSpeaker(context.Target)
  
  local ratio = context.Target.HP * 100 // context.Target.MaxHP
  
  if ratio <= 25 then
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_MOTHER_PINCH"):ToLocal())
  elseif ratio <= 50 then
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_MOTHER_HALF"):ToLocal())
  else 
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_MOTHER_FULL_001"):ToLocal())
  end

  context.Target.CharDir = oldDir
end



function BATTLE_SCRIPT.EscortInteractFather(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  local tbl = LTBL(context.Target)
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  UI:SetSpeaker(context.Target)
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  UI:SetSpeaker(context.Target)
  
  local ratio = context.Target.HP * 100 // context.Target.MaxHP
  
  if ratio <= 25 then
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_FATHER_PINCH"):ToLocal())
  elseif ratio <= 50 then
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_FATHER_HALF"):ToLocal())
  else 
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_FATHER_FULL_001"):ToLocal())
  end

  context.Target.CharDir = oldDir
end


function BATTLE_SCRIPT.EscortInteractBrother(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  local tbl = LTBL(context.Target)
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  UI:SetSpeaker(context.Target)
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  UI:SetSpeaker(context.Target)
  
  local ratio = context.Target.HP * 100 // context.Target.MaxHP
  
  if ratio <= 25 then
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_BROTHER_PINCH"):ToLocal())
  elseif ratio <= 50 then
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_BROTHER_HALF"):ToLocal())
  else 
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_BROTHER_FULL_001"):ToLocal())
  end

  context.Target.CharDir = oldDir
end


function BATTLE_SCRIPT.EscortInteractGrandma(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  local tbl = LTBL(context.Target)
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  UI:SetSpeaker(context.Target)
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  UI:SetSpeaker(context.Target)
  
  local ratio = context.Target.HP * 100 // context.Target.MaxHP
  
  if ratio <= 25 then
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_GRANDMA_PINCH"):ToLocal())
  elseif ratio <= 50 then
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_GRANDMA_HALF"):ToLocal())
  else 
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_GRANDMA_FULL_001"):ToLocal())
  end

  context.Target.CharDir = oldDir
end


function BATTLE_SCRIPT.EscortInteractPet(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  local tbl = LTBL(context.Target)
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  UI:SetSpeaker(context.Target)
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  UI:SetSpeaker(context.Target)
  
  local ratio = context.Target.HP * 100 // context.Target.MaxHP
  
  if ratio <= 25 then
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_PET_PINCH"):ToLocal())
  elseif ratio <= 50 then
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_PET_HALF"):ToLocal())
  else 
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(RogueEssence.StringKey("TALK_ESCORT_PET_FULL_001"):ToLocal())
  end

  context.Target.CharDir = oldDir
end


function BATTLE_SCRIPT.SidequestRescueReached(owner, ownerChar, context, args)

  local tbl = LTBL(context.Target)
  local mission = SV.missions.Missions[tbl.Mission]
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  UI:ResetSpeaker()
  local target_name = _DATA:GetMonster(mission.TargetSpecies.Species).Name
  UI:ChoiceMenuYesNo(STRINGS:Format(RogueEssence.StringKey("DLG_MISSION_RESCUE_ASK"):ToLocal(), target_name:ToLocal()), false)
  UI:WaitForChoice()
  result = UI:ChoiceResult()
  if result then
  
    mission.Complete = COMMON.MISSION_COMPLETE
    
    local poseAction = RogueEssence.Dungeon.CharAnimPose(context.User.CharLoc, context.User.CharDir, 50, 0)
    DUNGEON:CharSetAction(context.User, poseAction)
    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("DLG_MISSION_RESCUE_DONE"):ToLocal(), target_name:ToLocal()))
        
    UI:SetSpeaker(context.Target)
    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("DLG_MISSION_RESCUE_THANKS"):ToLocal()))
    
    -- warp out
    TASK:WaitTask(_DUNGEON:ProcessBattleFX(context.Target, context.Target, _DATA.SendHomeFX))
    _DUNGEON:RemoveChar(context.Target)
    
    DUNGEON:CharEndAnim(context.User)

	context.TurnCancel.Cancel = true
  else
	context.Target.CharDir = oldDir
	context.CancelState.Cancel = true
  end
end


function BATTLE_SCRIPT.SidequestEscortReached(owner, ownerChar, context, args)
  
  local tbl = LTBL(context.Target)
  local escort = COMMON.FindMissionEscort(tbl.Mission)
  
  if escort then
    
    local mission = SV.missions.Missions[tbl.Mission]
    mission.Complete = COMMON.MISSION_COMPLETE
  
    local oldDir = context.Target.CharDir
    DUNGEON:CharTurnToChar(context.Target, context.User)
  
    --UI:SetSpeaker(context.Target)
    UI:ResetSpeaker()
    local client_name = _DATA:GetMonster(mission.ClientSpecies.Species).Name
    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("DLG_MISSION_ESCORT_DONE"):ToLocal(), client_name:ToLocal()))
  
    -- warp out
    TASK:WaitTask(_DUNGEON:ProcessBattleFX(escort, escort, _DATA.SendHomeFX))
    _DUNGEON:RemoveChar(escort)
	
    TASK:WaitTask(_DUNGEON:ProcessBattleFX(context.Target, context.Target, _DATA.SendHomeFX))
    _DUNGEON:RemoveChar(context.Target)
  
    UI:ResetSpeaker()
    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("DLG_MISSION_REMINDER"):ToLocal(), client_name:ToLocal()))
	
	context.TurnCancel.Cancel = true
  else
	context.CancelState.Cancel = true
  end
end

function BATTLE_SCRIPT.SidequestEscortOutReached(owner, ownerChar, context, args)
  
  local tbl = LTBL(context.Target)
  
    local mission = SV.missions.Missions[tbl.Mission]
  
    local oldDir = context.Target.CharDir
    DUNGEON:CharTurnToChar(context.Target, context.User)
  
    UI:SetSpeaker(context.Target)
    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey(args.EscortStartMsg):ToLocal()))
    
	-- ask to join
    UI:ResetSpeaker()
	UI:ChoiceMenuYesNo(STRINGS:Format(RogueEssence.StringKey("TALK_ESCORT_ASK"):ToLocal()), false)
	UI:WaitForChoice()
	result = UI:ChoiceResult()
	if result then
	  -- join the team

	  _DUNGEON:RemoveChar(context.Target)
	  local tactic = _DATA:GetAITactic(_DATA.DefaultAI)
	  context.Target.Tactic =  RogueEssence.Data.AITactic(tactic)
	  _DATA.Save.ActiveTeam.Guests:Add(context.Target)
	  context.Target:RefreshTraits()
	  context.Target.Tactic:Initialize(context.Target)

	  context.Target:FullRestore()
		
	  context.Target.ActionEvents:Clear()
	  local talk_evt = RogueEssence.Dungeon.BattleScriptEvent(args.EscortInteract)
	  context.Target.ActionEvents:Add(talk_evt)
	  
	  SOUND:PlayFanfare("Fanfare/Note")
      UI:ResetSpeaker()
	  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("MSG_RECRUIT_GUEST"):ToLocal(), context.Target:GetDisplayName(true)))
      UI:SetSpeaker(context.Target)
      UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey(args.EscortAcceptMsg):ToLocal()))
	  
	  context.TurnCancel.Cancel = true
	else
	  context.Target.CharDir = oldDir
	  context.CancelState.Cancel = true
	end
	
end

function BATTLE_SCRIPT.CountTalkTest(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  
  local tbl = LTBL(context.Target)
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  UI:SetSpeaker(context.Target)
  
  if tbl.TalkAmount == nil then
    UI:WaitShowDialogue("I will remember how many times I've been talked to.")
	tbl.TalkAmount = 1
  else
	tbl.TalkAmount = tbl.TalkAmount + 1
  end
  UI:WaitShowDialogue("You've talked to me "..tostring(tbl.TalkAmount).." times.")
  
  context.Target.CharDir = oldDir
end


function BATTLE_SCRIPT.PairTalk(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  UI:SetSpeaker(context.Target)
  
  if args.Pair == 0 then
    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_ADVICE_TEAM_MODE"):ToLocal(), _DIAG:GetControlString(RogueEssence.FrameInput.InputType.TeamMode)))
  else
    if _DIAG.GamePadActive then
	  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_ADVICE_SWITCH_GAMEPAD"):ToLocal(), _DIAG:GetControlString(RogueEssence.FrameInput.InputType.LeaderSwapBack), _DIAG:GetControlString(RogueEssence.FrameInput.InputType.LeaderSwapForth)))
	else
	  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_ADVICE_SWITCH_KEYBOARD"):ToLocal(), _DIAG:GetControlString(RogueEssence.FrameInput.InputType.LeaderSwap1), _DIAG:GetControlString(RogueEssence.FrameInput.InputType.LeaderSwap2), _DIAG:GetControlString(RogueEssence.FrameInput.InputType.LeaderSwap3), _DIAG:GetControlString(RogueEssence.FrameInput.InputType.LeaderSwap4)))
	end
  end
  
  
  context.Target.CharDir = oldDir
end


StackType = luanet.import_type('RogueEssence.Dungeon.StackState')

function BATTLE_SCRIPT.AccuracyTalk(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  UI:SetSpeaker(context.Target)
  
  local sanded = false
  local acc_mod = context.Target:GetStatusEffect("mod_accuracy")
  if acc_mod ~= nil then
    local stack = acc_mod.StatusStates:Get(luanet.ctype(StackType))
	if stack.Stack < 0 then
	  sanded = true
	end
  end
  
  if sanded then
    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_ADVICE_STAT_DROP"):ToLocal()))
  else
    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_ADVICE_STAT_DROP_CLEAR"):ToLocal()))
  end
  
  context.Target.CharDir = oldDir
end


function BATTLE_SCRIPT.Tutor_Sequence(chara)

	GAME:WaitFrames(10)
	DUNGEON:CharStartAnim(chara, "Strike", false)
	GAME:WaitFrames(15)
	local emitter = RogueEssence.Content.FlashEmitter()
	emitter.FadeInTime = 2
	emitter.HoldTime = 4
	emitter.FadeOutTime = 2
	emitter.StartColor = Color(0, 0, 0, 0)
	emitter.Layer = DrawLayer.Top
	emitter.Anim = RogueEssence.Content.BGAnimData("White", 0)
	DUNGEON:PlayVFX(emitter, chara.MapLoc.X, chara.MapLoc.Y)
	SOUND:PlayBattleSE("EVT_Battle_Flash")
	GAME:WaitFrames(30)
end

function BATTLE_SCRIPT.TutorTalk(owner, ownerChar, context, args)

    local oldDir = context.Target.CharDir
    DUNGEON:CharTurnToChar(context.Target, context.User)
  
    UI:SetSpeaker(context.Target)
	
	local tbl = LTBL(context.Target)
	
	if tbl.TaughtMove ~= nil then
	  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_TUTOR_DONE"):ToLocal()))
	  
	  context.Target.CharDir = oldDir
	  context.CancelState.Cancel = true
	  return
	end
	
	local move_idx = context.Target.BaseSkills[0].SkillNum
	local skill_data = _DATA:GetSkill(move_idx)
	
	local already_learned = context.User:HasBaseSkill(move_idx)
	if already_learned then
	  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_TUTOR_ALREADY"):ToLocal(), skill_data:GetIconName()))

	  SV.base_town.TutorMoves[move_idx] = true
		context.TurnCancel.Cancel = true
	  return
	end
	
	
	  local team_id = context.User.BaseForm
	  local mon = _DATA:GetMonster(team_id.Species)
	  local form = mon.Forms[team_id.Form]
	
	local can_learn = false
	local skill = COMMON.TUTOR[move_idx]
	  if not skill.Special then
		--iterate the shared skills
		for learnable in luanet.each(form.SharedSkills) do
		  if learnable.Skill == move_idx then
			can_learn = true
			break
		  end
		end
	  else
		--iterate the secret skills
		for learnable in luanet.each(form.SecretSkills) do
		  if learnable.Skill == move_idx then
			can_learn = true
			break
		  end
		end
	  end
	
	if can_learn then
		UI:ChoiceMenuYesNo(STRINGS:Format(RogueEssence.StringKey("TALK_TUTOR_ASK"):ToLocal(), skill_data:GetIconName()), false)
		UI:WaitForChoice()
		result = UI:ChoiceResult()
		
		if result then
		  local replace_msg = STRINGS:Format(RogueEssence.StringKey("TALK_TUTOR_REPLACE"):ToLocal(), skill_data:GetIconName())
		  result = COMMON.LearnMoveFlow(context.User, move_idx, replace_msg)
		end
		
		if result then
		  -- attempt to learn move
		  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_TUTOR_ACCEPT"):ToLocal(), skill_data:GetIconName()))
		  
		  --attack in a 90-degree turn from the talk
		  context.Target.CharDir = Direction.Down
		  context.User.CharDir = Direction.Down
		  
		  BATTLE_SCRIPT.Tutor_Sequence(context.Target)
		  
		  --player does the same animation offset by a little time
		  BATTLE_SCRIPT.Tutor_Sequence(context.User)
		  
		  SOUND:PlayFanfare("Fanfare/LearnSkill")
		  local orig_settings = UI:ExportSpeakerSettings()
		  UI:ResetSpeaker(false)
		  UI:WaitShowDialogue(STRINGS:FormatKey("DLG_SKILL_LEARN", context.User:GetDisplayName(true), skill_data:GetIconName()))
		  UI:ImportSpeakerSettings(orig_settings)
		  
		  DUNGEON:CharTurnToChar(context.Target, context.User)
		  DUNGEON:CharTurnToChar(context.User, context.Target)
		  
		  tbl.TaughtMove = true
		  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_TUTOR_VISIT"):ToLocal()))
		else
		  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_TUTOR_DECLINE"):ToLocal(), skill_data:GetIconName()))
		end
		
		SV.base_town.TutorMoves[move_idx] = true
		
		context.TurnCancel.Cancel = true
	else
	  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_TUTOR"):ToLocal(), skill_data:GetIconName()))

	  context.Target.CharDir = oldDir
	  context.CancelState.Cancel = true
	end
end


function BATTLE_SCRIPT.DisguiseTalk(owner, ownerChar, context, args)
  context.TurnCancel.Cancel = true
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  local appearance = context.Target.Appearance
  local name = _DATA:GetMonster(appearance.Species).Name:ToLocal()
  UI:SetSpeaker("[color=#00FF00]"..name.."[color]", true, appearance.Species, appearance.Form, appearance.Skin, appearance.Gender)
  
  local tbl = LTBL(context.Target)

  if tbl.TalkAmount == nil then
    UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_OUTLAW_DISGUISE_001"):ToLocal()))
    tbl.TalkAmount = 1
  else
    if tbl.TalkAmount == 1 then
      UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_OUTLAW_DISGUISE_002"):ToLocal()))
    elseif tbl.TalkAmount == 2 then
      UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_OUTLAW_DISGUISE_003"):ToLocal()))
    else
      SOUND:PlayBGM("", false)
      UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_OUTLAW_DISGUISE_004"):ToLocal()))
      UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_OUTLAW_DISGUISE_005"):ToLocal()))
      
        local teamIndex = _ZONE.CurrentMap.AllyTeams:IndexOf(context.Target.MemberTeam)
      _DUNGEON:RemoveTeam(RogueEssence.Dungeon.Faction.Friend, teamIndex)
      _DUNGEON:AddTeam(RogueEssence.Dungeon.Faction.Foe, context.Target.MemberTeam)
      local tactic = _DATA:GetAITactic("boss") -- shopkeeper attack tactic
      context.Target.Tactic = RogueEssence.Data.AITactic(tactic)
      context.Target.Tactic:Initialize(context.Target)
      TASK:WaitTask(context.Target:RemoveStatusEffect("attack_response", false))
    
      TASK:WaitTask(context.Target:RemoveStatusEffect("illusion", true))
      
      COMMON.TriggerAdHocMonsterHouse(owner, ownerChar, context.Target)
    end
	tbl.TalkAmount = tbl.TalkAmount + 1
  end
end


function BATTLE_SCRIPT.DisguiseHit(owner, ownerChar, context, args)
  
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  local appearance = context.Target.Appearance
  local name = _DATA:GetMonster(appearance.Species).Name:ToLocal()
  UI:SetSpeaker("[color=#00FF00]"..name.."[color]", true, appearance.Species, appearance.Form, appearance.Skin, appearance.Gender)


  SOUND:PlayBGM("", false)
  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_OUTLAW_DISGUISE_ATTACKED"):ToLocal()))
	
  UI:WaitShowDialogue(STRINGS:Format(RogueEssence.StringKey("TALK_OUTLAW_DISGUISE_005"):ToLocal()))
	  
      local teamIndex = _ZONE.CurrentMap.AllyTeams:IndexOf(context.Target.MemberTeam)
	  _DUNGEON:RemoveTeam(RogueEssence.Dungeon.Faction.Friend, teamIndex)
	  _DUNGEON:AddTeam(RogueEssence.Dungeon.Faction.Foe, context.Target.MemberTeam)
	  local tactic = _DATA:GetAITactic("boss") -- shopkeeper attack tactic
	  context.Target.Tactic = RogueEssence.Data.AITactic(tactic)
	  context.Target.Tactic:Initialize(context.Target)
	
	
	  TASK:WaitTask(context.Target:RemoveStatusEffect("attack_response", false))
  TASK:WaitTask(context.Target:RemoveStatusEffect("illusion", true))
	  
  COMMON.TriggerAdHocMonsterHouse(owner, ownerChar, context.Target)
end


function BATTLE_SCRIPT.LegendRecruitCheck(owner, ownerChar, context, args)

  --TODO: check to see if heatran is in the party/assembly
  --if so set gotHeatran to true
  if not SV.sleeping_caldera.GotHeatran then
    --check for item throw, the only way to recruit
	if context.ActionType == RogueEssence.Dungeon.BattleActionType.Throw then
	  local found_legend = nil
	  local player_count = _DUNGEON.ActiveTeam.Players.Count
	  for player_idx = 0, player_count-1, 1 do
	    player = _DUNGEON.ActiveTeam.Players[player_idx]
	    --if so, iterate the team and the assembly for heatran
	    --check for a lua table that marks it as THE guardian
		local player_tbl = LTBL(player)
	    if player.BaseForm.Species == "heatran" and player_tbl.IsLegend == true then
		  found_legend = player
		  break
		end
	  end
	  
	  if found_legend == nil then
	    local assemblyCount = GAME:GetPlayerAssemblyCount()
		
		for assembly_idx = 0,assemblyCount-1,1 do
		  player = GAME:GetPlayerAssemblyMember(assembly_idx)
		  local player_tbl = LTBL(player)
		  if player.BaseForm.Species == "heatran" and player_tbl.IsLegend == true then
			found_legend = player
			break
		  end
		end
	  end
	  
	  if found_legend ~= nil then
	    --if so, set obtained to true
	    SV.sleeping_caldera.GotHeatran = true
	    --remove the lua table
		local player_tbl = LTBL(found_legend)
		player_tbl.FoundLegend = nil
	  end
	end
  end
end

function BATTLE_SCRIPT.PuchiInteract(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  local tbl = LTBL(context.Target)
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  UI:SetSpeaker(context.Target)
  
  local ratio = context.Target.HP * 100 // context.Target.MaxHP
  local say_choice = math.random(4)
  if SV.tarro_town.PieChapter == 7 or SV.tarro_town.PieChapter == 8 then
    if context.Target:GetStatusEffect("sleep") == nil then
      if ratio <= 25 then
        if say_choice <= 3 then
          UI:SetSpeaker(context.Target)
          UI:SetSpeakerEmotion("Pain")
          UI:WaitShowDialogue("[speed=0.4]Usually... not this difficult... too tired...")
        elseif say_choice == 4 then
          UI:SetSpeakerEmotion("Teary-Eyed")
          UI:WaitShowDialogue("[speed=0.6]I'm sorry, [color=#01FE10]Big Tree[color]![pause=55] [emote=Pain]I'm just... too tired...!")
        end
      elseif ratio <= 50 then
        UI:SetSpeaker(context.Target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("I should've gotten more sleep before this.")
      else
        if context.User.BaseForm.Species == "zigzagoon" then
          if say_choice == 1 then
            UI:SetSpeaker(context.Target)
            UI:SetSpeakerEmotion("Determined")
            UI:WaitShowDialogue("...when this is over, Ziggy, you owe[emote=Angry] me so much!")

            UI:SetSpeaker(context.User)
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("Meep!")
          elseif say_choice == 2 then
            UI:SetSpeaker(context.Target)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Couldn't you have just let me sleep?")
            
            UI:SetSpeaker(context.User)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("No, not really, this was too important.")
          elseif say_choice <= 4 then
            UI:SetSpeaker(context.Target)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Maybe this can help me wake up a bit...")
          end
        else
          if say_choice == 1 then
            UI:SetSpeaker(context.Target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("This should be easy, just stay alert!")
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("...more than me, at least.")
          elseif say_choice == 2 then
            UI:SetSpeaker(context.Target)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("The faster we do this, the quicker I can sleep...")
          elseif say_choice <= 4 then
            UI:SetSpeaker(context.Target)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Maybe this can help me wake up a bit...")
          end
        end
      end
    end
  elseif SV.tarro_town.PieChapter == 9 then
    if context.Target:GetStatusEffect("sleep") == nil then
      if ratio <= 25 then
        if say_choice <= 3 then
          UI:SetSpeaker(context.Target)
          UI:SetSpeakerEmotion("Pain")
          UI:WaitShowDialogue("[speed=0.4]No... I[pause=30][speed=1.0] can't[emote=Determined] lose here!")
        elseif say_choice == 4 then
          UI:SetSpeakerEmotion("Determined")
          UI:WaitShowDialogue("[speed=1.0]Hey, [color=#01FE10]Big Tree[color]![pause=55] [emote=Happy]We can do it,[pause=15] we promise!")
        end
      elseif ratio <= 50 then
        UI:SetSpeaker(context.Target)
        UI:SetSpeakerEmotion("Dizzy")
        UI:WaitShowDialogue("I still should've gotten more sleep!")
      else
        if say_choice == 1 then
          UI:SetSpeaker(context.Target)
          UI:SetSpeakerEmotion("Determined")
          UI:WaitShowDialogue("So many of them![pause=35] Stay up,[pause=15] Puchi,[pause=25] stay awake!")
          UI:SetSpeakerEmotion("Pain")
          UI:WaitShowTimedDialogue("[speed=1.5]Don't yawn[pause=15] don't yawn[pause=15] don't yawn[pause=15] don't yawn...!!", 15)
        elseif say_choice == 2 then
          UI:SetSpeaker(context.Target)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("Really hoping I can help in my state...")
        elseif say_choice <= 4 then
          UI:SetSpeaker(context.Target)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("Well, I'm more awake than before,[pause=15] at least.")
        end
      end
    end
  end

  context.Target.CharDir = oldDir
end

function BATTLE_SCRIPT.SennaInteract(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  local tbl = LTBL(context.Target)
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)  
  local target = context.Target
  local user = context.User
  
  UI:SetSpeaker(context.Target)
  local ratio = context.Target.HP * 100 // context.Target.MaxHP
  local say_choice = math.random(3)
  if SV.tarro_town.PieChapter == 7 or SV.tarro_town.PieChapter == 8 then
    if ratio <= 25 then
      if say_choice <= 2 then
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("I don't...[pause=50] I ca[emote=Teary-Eyed]n't fail here...!")
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("I have to...[pause=40] urk[emote=Pain]...!")
      elseif say_choice == 3 then
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("We promise to you, [color=#01FE10]Tarro Tree[color]![pause=55] [emote=Pain]Your history will live on!")
      end
    elseif ratio <= 50 then
      UI:SetSpeakerEmotion("Pain")
      UI:WaitShowDialogue("Oh... oh no oh no...")
      
    else
      if say_choice == 1 then
        if user.BaseForm.Species == "zigzagoon" then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Have fun in front, Ziggy.")

          UI:SetSpeaker(user)
          UI:SetSpeakerEmotion("Joyous")
          UI:WaitShowDialogue("I will![pause=35] WHOO!")
        elseif user.BaseForm.Species == "marill" then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Right behind you, Maru.")
        else
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("I'll do my best, I think.")
        end
      elseif say_choice == 2 then
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("I-[pause=15]I guess the tree still doesn't accept random guests...")
        UI:WaitShowDialogue("Is it summoning more Pokemon or something?")
      elseif say_choice == 3 then
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("I wish I practiced before this.[pause=0] S[emote=Stunned]omething about that thing is still scaring me...")
      end
    end
  elseif SV.tarro_town.PieChapter == 9 then
    if ratio <= 25 then
      if say_choice <= 2 then
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("I don't...[pause=50] I ca[emote=Teary-Eyed]n't fail here...!")
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("I have to...[pause=40] urk[emote=Pain]...!")
      elseif say_choice == 3 then
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("T-this[pause=15] isn't[emote=Angry] over until we say it is!")
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("[color=#01FE10]Big Tree[color]![pause=55] [emote=Happy]You'll be fine,[pause=15] I hope...!")
      end
    elseif ratio <= 50 then
      UI:SetSpeakerEmotion("Pain")
      UI:WaitShowDialogue("...[pause=35]no, no no[emote=Determined]! I can still do this!")
      
    else
      if say_choice == 1 then
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("I'll still do my best!")
      elseif say_choice == 2 then
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Th-[pause=15]this can't be the tree's summoning...")
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("It's helping us, what are these things?")
      elseif say_choice == 3 then
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Their moves are weird, I think,[pause=20] but they don't have anything blocking us.")
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("You should go in full force...![pause=30] A[emote=Pain]head of me...")
      end
    end
  end
  context.Target.CharDir = oldDir
end

function BATTLE_SCRIPT.ZiggyInteract(owner, ownerChar, context, args)
	context.CancelState.Cancel = true
  local tbl = LTBL(context.Target)
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  UI:SetSpeaker(context.Target)
  
  local ratio = context.Target.HP * 100 // context.Target.MaxHP
  local say_choice = math.random(4)
  if context.User.BaseForm.Species == "marill" then
    if SV.tarro_town.PieChapter == 7 or SV.tarro_town.PieChapter == 8 then
      if ratio <= 25 then
        if say_choice <= 3 then
          UI:SetSpeakerEmotion("Stunned")
          UI:WaitShowDialogue("Okay...[pause=40] maybe this isn't so fun[emote=Pain]...!")
        elseif say_choice == 4 then
          UI:SetSpeakerEmotion("Teary-Eyed")
          UI:WaitShowDialogue("I'm sorry, [color=#01FE10]Tarro Tree[color]![pause=55] [emote=Pain]...maybe we can rescue you after...!")
        end
      elseif ratio <= 50 then
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I'll keep going, Maru!")
      else
        if say_choice == 1 then
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Let go beat that thing up![pause=30] W[emote=Joyous]hoo!")
        elseif say_choice == 2 then
          UI:SetSpeakerEmotion("Determined")
          UI:WaitShowDialogue("Whatever that thing was doesn't matter! Let's go let's go let's go!!")
        elseif say_choice <= 4 then
          UI:SetSpeakerEmotion("Joyous")
          UI:WaitShowDialogue("I finally get to explore with you guys!")
          local concern_mon = math.random(4)
          local mon_define = _DATA.Save.ActiveTeam.Players[concern_mon - 1]
    
          if concern_mon == 1 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Yeah, that's so co-[speed=0.1]..[emote=Worried].[speed=1.0][pause=70] W[emote=Surprised]AIT![pause=20] We have[emote=Determined] to save the tree, Ziggy!")
          elseif concern_mon == 2 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Joyous")
            UI:WaitShowDialogue("Yeah! This is fun!")
          elseif concern_mon == 3 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("S-[pause=15]so fun...![pause=35] So...[pause=32] s[emote=Pain]o fun...")
          elseif concern_mon == 4 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("Ziggy, I don't think that's our greatest concern right now...")
          end
        end
      end
    else
      if ratio <= 25 then
        if say_choice <= 3 then
          UI:SetSpeakerEmotion("Pain")
          UI:WaitShowDialogue("No...[pause=35] no, I can't fall! Not now!")
        elseif say_choice == 4 then
          UI:SetSpeakerEmotion("Teary-Eyed")
          UI:WaitShowDialogue("[color=#01FE10]Tarro Tree[color]![pause=55] [emote=Pain]You are going to be freed from this!")
        end
      elseif ratio <= 50 then
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("I like a challenge good...[pause=30] u[emote=Worried]h... wait...")
      else
        if say_choice == 1 then
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("We got this, right, I'm sure we do. This is gonna be fun!")
        elseif say_choice == 2 then
          UI:SetSpeakerEmotion("Determined")
          UI:WaitShowDialogue("Whatever these things are doesn't matter! Let's go let's go let's go!!")
        elseif say_choice <= 4 then
          UI:SetSpeakerEmotion("Joyous")
          UI:WaitShowDialogue("You guys still holding up well?!")
          local concern_mon = math.random(4)
          local mon_define = _DATA.Save.ActiveTeam.Players[concern_mon - 1]
    
          if concern_mon == 1 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("I'm doing fine![pause=20] Let's[emote=Determined] save the tree!")
          elseif concern_mon == 2 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Shouting")
            UI:WaitShowDialogue("Raaaaaaaah!")
          elseif concern_mon == 3 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("I-... I'm holding up! Heh... haha[emote=Worried]...")
          elseif concern_mon == 4 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("I'm still a little tired,[pause=35] but I[emote=Happy] can do it.")
          end
        end
      end
    end
  elseif context.User.BaseForm.Species == "sentret" then
    if SV.tarro_town.PieChapter == 7 or SV.tarro_town.PieChapter == 8 then
      if ratio <= 25 then
        if say_choice <= 3 then
          UI:SetSpeakerEmotion("Stunned")
          UI:WaitShowDialogue("Okay...[pause=40] maybe this isn't so fun[emote=Pain]...!")
        elseif say_choice == 4 then
          UI:SetSpeakerEmotion("Teary-Eyed")
          UI:WaitShowDialogue("I'm sorry, [color=#01FE10]Tarro Tree[color]![pause=55] [emote=Pain]...maybe we can rescue you after...!")
        end
      elseif ratio <= 50 then
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I like a good challenge.")
      else
        if say_choice == 1 then
          UI:SetSpeakerEmotion("Surprised")
          UI:WaitShowDialogue("Sensen, you're leading?!")

          UI:SetSpeaker(context.User)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("I'm not used to it, but I'll do my best, Ziggy.")
        elseif say_choice == 2 then
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Yeah! Let's go, Senna!")
        elseif say_choice <= 4 then
          UI:SetSpeakerEmotion("Joyous")
          UI:WaitShowDialogue("I finally get to explore with you guys!")
          local concern_mon = math.random(4)
          local mon_define = _DATA.Save.ActiveTeam.Players[concern_mon - 1]
    
          if concern_mon == 1 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Yeah, that's so co-[speed=0.1]..[emote=Worried].[speed=1.0][pause=70] W[emote=Surprised]AIT![pause=20] We have[emote=Determined] to save the tree, Ziggy!")
          elseif concern_mon == 2 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Joyous")
            UI:WaitShowDialogue("Yeah! This is fun!")
          elseif concern_mon == 3 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("S-[pause=15]so fun...![pause=35] So...[pause=32] s[emote=Pain]o fun...")
          elseif concern_mon == 4 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("Ziggy, I don't think that's our greatest concern right now...")
          end
        end
      end
    else
      if ratio <= 25 then
        if say_choice <= 3 then
          UI:SetSpeakerEmotion("Pain")
          UI:WaitShowDialogue("No...[pause=35] no, I can't fall! Not now!")
        elseif say_choice == 4 then
          UI:SetSpeakerEmotion("Teary-Eyed")
          UI:WaitShowDialogue("[color=#01FE10]Tarro Tree[color]![pause=55] [emote=Pain]You are going to be freed from this!")
        end
      elseif ratio <= 50 then
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("I like a challenge good...[pause=30] u[emote=Worried]h... wait...")
      else
        if say_choice == 1 then
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("We got this, right, I'm sure we do. This is gonna be fun!")
        elseif say_choice == 2 then
          UI:SetSpeakerEmotion("Determined")
          UI:WaitShowDialogue("Whatever these things are doesn't matter! Let's go let's go let's go!!")
        elseif say_choice <= 4 then
          UI:SetSpeakerEmotion("Joyous")
          UI:WaitShowDialogue("You guys still holding up well?!")
          local concern_mon = math.random(4)
          local mon_define = _DATA.Save.ActiveTeam.Players[concern_mon - 1]
    
          if concern_mon == 1 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("I'm doing fine![pause=20] Let's[emote=Determined] save the tree!")
          elseif concern_mon == 2 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Shouting")
            UI:WaitShowDialogue("Raaaaaaaah!")
          elseif concern_mon == 3 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("I-... I'm holding up! Heh... haha[emote=Worried]...")
          elseif concern_mon == 4 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("I'm still a little tired,[pause=35] but I[emote=Happy] can do it.")
          end
        end
      end
    end
  else
    if SV.tarro_town.PieChapter == 7 or SV.tarro_town.PieChapter == 8 then
      if ratio <= 25 then
        if say_choice <= 3 then
          UI:SetSpeakerEmotion("Stunned")
          UI:WaitShowDialogue("Okay...[pause=40] maybe this isn't so fun[emote=Pain]...!")
        elseif say_choice == 4 then
          UI:SetSpeakerEmotion("Teary-Eyed")
          UI:WaitShowDialogue("I'm sorry, [color=#01FE10]Tarro Tree[color]![pause=55] [emote=Pain]...maybe we can rescue you after...!")
        end
      elseif ratio <= 50 then
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I like a good challenge.")
      else
        if say_choice == 1 then
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Let go beat that thing up![pause=30] W[emote=Joyous]hoo!")
        elseif say_choice == 2 then
          UI:SetSpeakerEmotion("Determined")
          UI:WaitShowDialogue("Whatever that thing was doesn't matter! Let's go let's go let's go!!")
        elseif say_choice <= 4 then
          UI:SetSpeakerEmotion("Joyous")
          UI:WaitShowDialogue("I finally get to explore with you guys!")
          local concern_mon = math.random(4)
          local mon_define = _DATA.Save.ActiveTeam.Players[concern_mon - 1]
    
          if concern_mon == 1 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Yeah, that's so co-[speed=0.1]..[emote=Worried].[speed=1.0][pause=70] W[emote=Surprised]AIT![pause=20] We have[emote=Determined] to save the tree, Ziggy!")
          elseif concern_mon == 2 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Joyous")
            UI:WaitShowDialogue("Yeah! This is fun!")
          elseif concern_mon == 3 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("S-[pause=15]so fun...![pause=35] So...[pause=32] s[emote=Pain]o fun...")
          elseif concern_mon == 4 then
            UI:SetSpeaker(mon_define)
            DUNGEON:CharTurnToChar(context.Target, mon_define)
            DUNGEON:CharTurnToChar(mon_define, context.Target)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("Ziggy, I don't think that's our greatest concern right now...")
          end
        end
      end
    end
  end
end

function BATTLE_SCRIPT.ZoomerInteract(owner, ownerChar, context, args)
	context.CancelState.Cancel = true
  local tbl = LTBL(context.Target)
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  UI:SetSpeaker(context.Target)
  
  local oldDir = context.Target.CharDir
  DUNGEON:CharTurnToChar(context.Target, context.User)
  
  UI:SetSpeaker(context.Target)
  local current_dungeon = DUNGEON:DungeonDisplayName()
  
  local ratio = context.Target.HP * 100 // context.Target.MaxHP
  local say_choice = math.random(5)
  if current_dungeon == "Deep Tarro Forest" then
    if ratio <= 25 then
      if say_choice <= 2 then
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("Stupid brats...! Putting me in trouble...!")
      elseif say_choice == 3 then
        UI:SetSpeakerEmotion("Dizzy")
        UI:WaitShowDialogue("Maybe I should consider retirin'...")
      elseif say_choice <= 5 then
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Can I get some help here?!")
      end
    elseif ratio <= 50 then
      UI:SetSpeakerEmotion("Pain")
      UI:WaitShowDialogue("Just... keep pushin'...!")
    else
      if say_choice == 1 then
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Yep, we're really doing this...")
      elseif say_choice == 2 then
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("If I were leading, I'd get this done.")
      elseif say_choice <= 4 then
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Let's go then.")
      elseif say_choice == 5 then
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Oi, quit talking to me and hurry it up!")
      end
    end
  else
    if ratio <= 25 then
      if say_choice <= 3 then
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("No...[pause=35] no, I can't fall! Not now!")
      elseif say_choice == 4 then
        UI:SetSpeakerEmotion("Teary-Eyed")
        UI:WaitShowDialogue("[color=#01FE10]Tarro Tree[color]![pause=55] [emote=Pain]You are going to be freed from this!")
      end
    elseif ratio <= 50 then
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("I like a challenge good...[pause=30] u[emote=Worried]h... wait...")
    else
      if say_choice == 1 then
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Hah!")
      elseif say_choice == 2 then
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Keep it going, keep it going!")
      elseif say_choice <= 4 then
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I should be impressed, but I can't be when YOU TWO BEAT ME UP FOR SOME PIE!")
      end
    end
  end
end

function BATTLE_SCRIPT.AzuraInteract(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  DUNGEON:CharTurnToChar(context.Target, context.User)
  -- TODO: create a charstate for being unable to talk and have talk-interfering statuses cause it
  if COMMON.CanTalk(context.Target) then
    
    local ratio = context.Target.HP * 100 // context.Target.MaxHP
    local user_ratio = context.User.HP * 100 // context.User.MaxHP
    local current_dungeon = DUNGEON:DungeonDisplayName()
    local say_choice = math.random(3)
    local target = context.Target
    local user = context.User
    
    if current_dungeon == "Tarro Forest" and SV.tarro_town.PieChapter < 5 then
      if ratio <= 25 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("I... I can't... need pie...!")
      elseif ratio <= 50 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("It's tough, but I need my pie!")
      else
        if say_choice == 1 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Okay, Maru! Let's go get that apple!")
        elseif say_choice == 2 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("Where are those stairs?")

          UI:SetSpeaker(user)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("If we knew, we'd be out by now.")

          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("We have to find it now...?")
          UI:WaitShowDialogue("[speed=0.05]...[speed=1.0][emote=Happy]the pie'll be worth it!")
        elseif say_choice == 3 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Shouting")
          UI:WaitShowDialogue("For the pie!")
        end
      end
    elseif current_dungeon == "Tarro Tree Hallows" then
      if ratio <= 25 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("Urk...[pause=30] the tree[emote=Dizzy] is winning...!")
      elseif ratio <= 50 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("I can still keep going!")
      else
        if say_choice == 1 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("What was that thing...?")
        elseif say_choice == 2 then
          if user.BaseForm.Species == "marill" then
            UI:SetSpeaker(target)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Stairs?")

            UI:SetSpeaker(user)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Nope.")

            UI:SetSpeaker(target)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Twists and turns...[pause=40] u[emote=Angry]gh.")
          elseif user.BaseForm.Species == "sentret" then
            UI:SetSpeaker(user)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("I forgot to ask, how was the pie?")

            UI:SetSpeaker(target)
            UI:SetSpeakerEmotion("Joyous")
            UI:WaitShowDialogue("Amazing! It was the best pie![pause=40] [emote=Shouting]EVER!")

            UI:SetSpeaker(user)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("...I see.")
          elseif user.BaseForm.Species == "zigzagoon" then
            UI:SetSpeaker(user)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Azu!")

            UI:SetSpeaker(target)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Zig!")

            UI:SetSpeaker(user)
            UI:SetSpeakerEmotion("Joyous")
            UI:WaitShowDialogue("AZU!")

            UI:SetSpeaker(target)
            UI:SetSpeakerEmotion("Joyous")
            UI:WaitShowDialogue("ZIG!")
          elseif user.BaseForm.Species == "poochyena" then
            UI:SetSpeaker(target)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Puchi? [pause=30]Are you okay?")

            if user_ratio < 25 then
              UI:SetSpeaker(user)
              UI:SetSpeakerEmotion("Pain")
              UI:WaitShowDialogue("I'll manage... but an Oran berry would be great...")

              UI:SetSpeaker(target)
              UI:SetSpeakerEmotion("Normal")
              UI:WaitShowDialogue("If you say so...")
            elseif user_ratio < 50 then
              UI:SetSpeaker(user)
              UI:SetSpeakerEmotion("Pain")
              UI:WaitShowDialogue("Oh, yeah, yeah I'm fine...")

              UI:SetSpeaker(target)
              UI:SetSpeakerEmotion("Stunned")
              UI:WaitShowDialogue("You look more tired than usual.")

              UI:SetSpeaker(user)
              UI:SetSpeakerEmotion("Pain")
              UI:WaitShowDialogue("I wonder why...")
            elseif user_ratio <= 100 then
              UI:SetSpeaker(user)
              UI:SetSpeakerEmotion("Happy")
              UI:WaitShowDialogue("I'm fine, thanks for worrying.")
            end
            
          end
        elseif say_choice == 3 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("Whatever that thing was,[pause=20] we[emote=Normal] can beat it.")
        end
      end
    elseif current_dungeon == "Deep Tarro Forest" then
      if ratio <= 25 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("...is it getting darker or what...?")
      elseif ratio <= 50 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("The dark is too dark...!")
      else
        if say_choice == 1 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("What was that letter about...?")
        elseif say_choice == 2 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Angry")
          UI:WaitShowDialogue("Ugh.[pause=25] Mama got dirt stuck to my tail.")

          if user.BaseForm.Species == "marill" then
            UI:SetSpeaker(user)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("I'm sure we can clean it later.")

            UI:SetSpeaker(target)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Wish later was sooner.")
          elseif user.BaseForm.Species == "zubat" then
            UI:SetSpeaker(user)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("Oh my Arceus, who caaaaaaaaaaares!")
          end
        elseif say_choice == 3 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Let's do our best!")
        end
      end
    else
      if ratio <= 25 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("Ack... I'm sorry...")
      elseif ratio <= 50 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Nothing to worry 'bout.")
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("...I think.")
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Let's go! Can't wait!")
      end
    end
  end
end

function BATTLE_SCRIPT.MaruInteract(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  DUNGEON:CharTurnToChar(context.Target, context.User)
  local target = context.Target
  local user = context.User
  -- TODO: create a charstate for being unable to talk and have talk-interfering statuses cause it
  if COMMON.CanTalk(target) then
    
    local ratio = target.HP * 100 // target.MaxHP
    local current_dungeon = DUNGEON:DungeonDisplayName()
    local say_choice = math.random(3)
    
    if current_dungeon == "Tarro Tree Hallows" then
      if ratio <= 25 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("Can't hold on...!")
      elseif ratio <= 50 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("We've still got this!")
      else
        if say_choice == 1 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("I wonder what that thing was...")
        elseif say_choice == 2 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("Where are those stairs...?")
        elseif say_choice == 3 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("Let's go.")
        end
      end
    elseif current_dungeon == "Deep Tarro Forest" then
      if ratio <= 25 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("Some light would be great right now...")
      elseif ratio <= 50 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("It's normal to get lost around here...")
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("...that's what I've heard, at least.")
      else
        if say_choice == 1 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("Weird that mom was in a rush to push us away.")
        elseif say_choice == 2 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("Hope I don't get lost in this dark.")
        elseif say_choice == 3 then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Let's do our best!")
        end
      end
    else
      if ratio <= 25 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("Ack... I'm sorry...")
      elseif ratio <= 50 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Nothing to worry about.")
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Let's go!")
      end
    end
  end  
end

function BATTLE_SCRIPT.FlowInteract(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  DUNGEON:CharTurnToChar(context.Target, context.User)
  local target = context.Target
  local user = context.User
  -- TODO: create a charstate for being unable to talk and have talk-interfering statuses cause it
  if COMMON.CanTalk(target) then
    local ratio = target.HP * 100 // target.MaxHP
    local current_dungeon = DUNGEON:DungeonDisplayName()
    local say_choice = math.random(3)
    
    if current_dungeon == "Dreaded Depths" then
      if say_choice == 3 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Don't worry about the grime.[pause=15] My flower is good at dealing with that.")
      elseif say_choice == 2 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("...the winds here aren't too strong.[pause=10] If[emote=Happy] I fall, one of you will have to carry me.")
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Just have to feel the flowers. Not too hard, yes?")

        UI:SetSpeaker(user)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Where are they, though...?")

        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Ah... um...")
      end
    else
      if say_choice == 3 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("Why this town, of all of towns?")
      elseif say_choice == 2 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("We'll find you, mama!")
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Just have to feel the flowers. Not too hard, yes?")
      end
    end
  end
end

function BATTLE_SCRIPT.TidyInteract(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  DUNGEON:CharTurnToChar(context.Target, context.User)
  local target = context.Target
  local user = context.User
  
  -- TODO: create a charstate for being unable to talk and have talk-interfering statuses cause it
  if COMMON.CanTalk(target) then
    local ratio = target.HP * 100 // target.MaxHP
    local current_dungeon = DUNGEON:DungeonDisplayName()
    local say_choice = math.random(3)
    
    if current_dungeon == "Dreaded Depths" then
      if say_choice == 3 then
        if user.Name == "Flow" then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Crying")
          UI:WaitShowDialogue("FLOOOOOOOOOOW!")

          UI:SetSpeaker(user)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("Yeah yeah,[pause=20] I know,[pause=40] just keep close to my flower and you'll be fine.")

          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Teary-Eyed")
          UI:WaitShowDialogue("Flooooow...")

          UI:SetSpeaker(user)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("I gotcha.")
        else
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Dizzy")
          UI:WaitShowDialogue("THIS PLACE IS SO DIRTY GET ME OUUUUUT!")
        end        
      elseif say_choice == 2 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("I'll... need to take, like... 30 baths...")
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("GET US OUT![pause=10] PRONTO!")
      end
    else
      if say_choice == 3 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Keep things fresh! Keep things clean!")
      elseif say_choice == 2 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Moving forward, I'll cover our tracks.")
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("We're doing great, guys!")
      end
    end
  end
end

function BATTLE_SCRIPT.WurpInteract(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  DUNGEON:CharTurnToChar(context.Target, context.User)
  local target = context.Target
  local user = context.User
  local mon_define = _DATA.Save.ActiveTeam.Players[4]
  -- TODO: create a charstate for being unable to talk and have talk-interfering statuses cause it
  if COMMON.CanTalk(target) then
    local ratio = target.HP * 100 // target.MaxHP
    local current_dungeon = DUNGEON:DungeonDisplayName()
    local say_choice = math.random(3)
    
    if current_dungeon == "Dreaded Depths" then
      if say_choice == 3 then
        if context.User.BaseForm.Species == "riolu" then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Determined")
          UI:WaitShowDialogue("I'll help you thwew, Wexio!")
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("Even such a mowtal wike you needs my assistance!")
          
          UI:SetSpeaker(mon_define)
          UI:SetSpeakerEmotion("Sad")
          UI:WaitShowDialogue("Wurp...")

          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("I'm kidding, hehe.")
        elseif context.User.BaseForm.Species == "minccino" then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Stunned")
          UI:WaitShowDialogue("Tidy, you wook wike you'we gonna expwode...")
          
          UI:SetSpeaker(mon_define)
          UI:SetSpeakerEmotion("Stunned")
          UI:WaitShowDialogue("She, u-uh... i-isn't a fan of... dirty.")

          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Wew, yeah, but...")

          UI:SetSpeaker(user)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowTimedDialogue("How about we just NOT talk about it,[pause=20] good?[pause=20] Good.[pause=20] G[emote=Angry]ood!", 45)
        else
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("Gonna be hard to aim in this darkness...")
        end
      elseif say_choice == 2 then
        if user.BaseForm.Species == "riolu" then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("You weally wemind me of youw dad, Wexio...")

          UI:SetSpeaker(user)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("...'cuz I'm cool?")

          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("'Cuz ya weird.")
        else
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("Gonna be hard to aim in this darkness...")
        end
        
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("Dawk pwace... can't see...")
      end
    else
      if say_choice == 3 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Stwiiiing shot!")
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Pwactice is always good!")
      elseif say_choice == 2 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Push thwew, I'll get 'em!")
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("We're doing great, guys!")
      end
    end
  end
end

function BATTLE_SCRIPT.SnowInteract(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  DUNGEON:CharTurnToChar(context.Target, context.User)
  local target = context.Target
  local user = context.User
  -- TODO: create a charstate for being unable to talk and have talk-interfering statuses cause it
  if COMMON.CanTalk(target) then
    local ratio = target.HP * 100 // target.MaxHP
    local current_dungeon = DUNGEON:DungeonDisplayName()
    local say_choice = math.random(3)

    if current_dungeon == "Dreaded Depths" then
      if say_choice == 3 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I... n-never been in a dungeon with th-this big of a team...")
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("I-I'm glad it's this... t-this team.")
      elseif say_choice == 2 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("J-just gotta go.")
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Sad")
        UI:WaitShowDialogue("...feels desolate here...")
      end
    else
      if say_choice == 3 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("I-I'll help...")
      elseif say_choice == 2 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("W-we have to keep moving forward...")
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I w-wonder what's up with the world today...")
      
      end
    end
  end
end

function BATTLE_SCRIPT.RexioInteract(owner, ownerChar, context, args)
  context.CancelState.Cancel = true
  DUNGEON:CharTurnToChar(context.Target, context.User)
  local target = context.Target
  local user = context.User
  -- TODO: create a charstate for being unable to talk and have talk-interfering statuses cause it
  if COMMON.CanTalk(target) then
    local ratio = target.HP * 100 // target.MaxHP
    local current_dungeon = DUNGEON:DungeonDisplayName()
    local say_choice = math.random(3)

    if current_dungeon == "Dreaded Depths" then
      if say_choice == 3 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I'll try to sense things out.")
      elseif say_choice == 2 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("...ugh,[pause=20] I feel like this would've been so easy with dad here.")
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Try to keep up.")
      end
    elseif current_dungeon == "Apple Forest" then
      if say_choice == 3 then
        if user.Name == "Maru" then
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("Hey,[pause=40] Maru, yeah?")

          UI:SetSpeaker(user)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("Mhm?")

          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("Don't get in my way,[pause=30] I got this.")

          UI:SetSpeaker(user)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("Sure, I think.")
        else
          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Worried")
          UI:WaitShowDialogue("...a strange feeling of apples again.[pause=30] Geez, I can't get away from apples.")
        end
        
      elseif say_choice == 2 then
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("I'd sense things, but there are apples everywhere...")

        if user.Name == "Maru" and SV.apple_forest.revisit == false then
          UI:SetSpeaker(user)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("Sense?")

          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("Yeah,[pause=40] I'm just cool enough to feel the aura of stuff or whatever.")
          
          local mon_define = _DATA.Save.ActiveTeam.Players[1]
          UI:SetSpeaker(mon_define)
          UI:SetSpeakerEmotion("Inspired")
          UI:WaitShowDialogue("Cooooooool...!")

          UI:SetSpeaker(target)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Heh. Yeah, I am.")
        end
      else
        UI:SetSpeaker(target)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Try to keep up.")
      end
    end
  end
end

