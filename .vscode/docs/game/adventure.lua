---@meta _
---@diagnostic disable: duplicate-set-field
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
---@param entryPoint string
---@param preserveMusic? boolean
---@return self
function GAME:EnterGroundMap(zone, id, entryPoint, preserveMusic) end

---Leave current map, and enter specified ground map within the current zone.
---If the ground map is not within the current zone, the zone must be specified in order to travel to it.
---If the ground map is within the current zone, there is no need to specify the zone to travel to it.
---@param id GroundID | string
---@param entryPoint string
---@param preserveMusic? boolean
---@return self
function GAME:EnterGroundMap(id, entryPoint, preserveMusic) end

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

---Enters a zone and continues the current adventure. 
---Used in rescue team like midpoint contexts (where PP and belly is not restored). 
---@param dunID DungeonID
---@param structID integer | StructID
---@param mapID integer | MapID
---@param entry integer | EntryID
function GAME:ContinueDungeon(dunID, structID, mapID, entry) end

---Ends the current adventure, sending the player to a specified destination.
---@param result Result
---@param zoneID string
---@param structID string
---@param mapID string
---@param entryID string
---@param display any
---@param fanfare boolean
---@param completedZone boolean
function GAME:EndDungeonRun(result, zoneID, structID, mapID, entryID, display, fanfare, completedZone) end

---Enters a zone and begins a new adventure.
---@param dunID integer
---@param structID integer
---@param mapID integer
---@param entry string
function GAME:EnterZone(dunID, structID, mapID, entry) end
