--- @meta
--- @diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GAME

---Gets the current ground map.
---@return GroundID
function GAME:GetCurrentGround() end

---Gets the current dungeon map.
---@return integer
function GAME:GetCurrentFloor() end

---Gets the current zone, also known as dungeon.
---@return DungeonID
function GAME:GetCurrentDungeon() end

---Leave current map, and enter specified ground map within the current zone.
---If the ground map is not within the current zone, the zone must be specified in order to travel to it.
---If the ground map is within the current zone, there is no need to specify the zone to travel to it.
---@param zone? Zone
---@param id GroundID
---@param entryPoint Marker
---@param preserveMusic? boolean
---@return self
function GAME:EnterGroundMap(zone, id, entryPoint, preserveMusic) end

---Enters a zone and begins a new adventure.
---@param dunID integer | DungeonID The id of the dungeon to travel to.
---@param structID integer | StructID The segment (or structure ID) within the zone to start in. -1 represents ground maps.
---@param mapID integer | MapID The id of the ground map or dungeon map within the dungeon segment.
---@param entry integer | EntryID The entry point on the resulting map.
---@param stakes Stakes Declares the stakes of the exploration.
---@param recorded boolean True if the dungeon should be recorded in a replay, false if not.
---@param silentRestrict boolean True if the dungeon restrictions should be silent, false if not.
---@return self
function GAME:EnterDungeon(dunID, structID, mapID, entry, stakes, recorded, silentRestrict) end

--[[
GAME:ContinueDungeon
Enters a zone and continues the current adventure. Used in rescue team like midpoint contexts (where PP and belly is not restored). Argument order is GAME:ContinueDungeon(dunID, structID, mapID, entry).

Name	Type	Technical Type	Purpose
dunID	Integer	System.Integer	The id of the dungeon to travel to.
structID	Integer	System.Integer	The segment (or structure ID) within the zone to start in. -1 represents ground maps.
mapID	Integer	System.Integer	The id of the ground map or dungeon map within the dungeon segment.
entry	String	System.String	The entry point on the resulting map.
Example

GAME:ContinueDungeon(1, 1, 0, 0)

EndDungeonRun
Ends the current adventure, sending the player to a specified destination. Argument order is GAME:EndDungeonRun(result, zoneID, structID, mapID, entryID, display, fanfare, completedZone).

Arguments
Name	Type	Technical Type	Purpose
result	(undocumented)	(undocumented)	The result of the adventure.
zoneID	String	System.String	The id of the dungeon to travel to.
structID	String	System.String	The segment within the dungeon to start in. -1 represents ground maps.
mapID	String	System.String	The id of the ground map or dungeon map within the dungeon segment.
entryID	String	System.String	The entry point on the resulting map
display	(undocumented)	(undocumented)	Display an epitaph marking the end of the adventure.
fanfare	Boolean	System.Boolean	Play a fanfare.
completedZone	Boolean	System.Boolean	Zone to mark as completed. Defaults to current zone.
Example

GAME:EndDungeonRun(GameProgress.ResultType.Cleared, 0, -1, 1, 0, true, true)

EnterZone
Enters a zone and begins a new adventure.

Arguments
Name	Type	Technical Type	Purpose
dunID	Integer	System.Integer	The id of the dungeon to travel to.
structID	Integer	System.Integer	The segment (or structure ID) within the zone to start in. -1 represents ground maps.
mapID	Integer	System.Integer	The id of the ground map or dungeon map within the dungeon segment.
entry	String	System.String	The entry point on the resulting map.]]