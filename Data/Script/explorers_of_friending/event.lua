require 'explorers_of_friending.event_single'
require 'explorers_of_friending.event_battle'
require 'explorers_of_friending.event_misc'
require 'explorers_of_friending.event_mapgen'

function SINGLE_CHAR_SCRIPT.EndEntohSouthBoss()

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
function SINGLE_CHAR_SCRIPT.LuaCheckBossClearEvent(owner, ownerChar, context, args)
	local MapCheckState = luanet.import_type('RogueEssence.Dungeon.MapCheckState')
	local SingleCharScriptEvent = luanet.import_type('RogueEssence.Dungeon.SingleCharScriptEvent')
	
	---
	-- Sequence that runs when map is over. Fade out, cut the music, etc.
	-- @usage Coroutine
	function LocationalEnd()
		_GAME:BGM("", true)
		 
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
	for i = 0, _ZONE.CurrentMap.MapTeams.Count - 1, 1 do 
		local team = _ZONE.CurrentMap.MapTeams[i].Players
		for j = 0, team.Count - 1, 1 do
			-- Break and return early if even one enemy is not dead.
			if not team[j].Dead then return end
		end
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
		TASK:WaitTask(LocationalEnd())
	else 
		TASK:WaitTask(_GAME:EndSegment(RogueEssence.Data.GameProgress.ResultType.Cleared))
	end
	
end