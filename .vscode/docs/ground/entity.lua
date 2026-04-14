--- @meta
--- @diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GROUND

---Hides an entity.
---@param entity Entity
---@return self
function GROUND:Hide(entity) end

---Unhides an entity.
---@param entity Entity
---@return self
function GROUND:Unhide(entity) end

---TODO
---@param objType ObjType
---@param instName string
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@return self
function GROUND:CreateObject(objType, instName, x, y, w, h) end

---TODO
---@param charType CharType
---@param instName string
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@return self
function GROUND:CreateCharacter(charType, instName, x, y, w, h) end

---Deletes an object from the ground map, identified by its instance name.
---Returns true if succeeded, false otherwise.
---@param instName string
---@return boolean
function GROUND:RemoveObject(instName) end

---Deletes a character from the ground map, identified by its instance name.
---Returns true if succeeded, false otherwise.
---@param instName string
---@return boolean
function GROUND:RemoveCharacter(instName) end

---Creates a ground character, given a dungeon character.
---@param instName string
---@param dunCH DungeonCH
---@param x integer
---@param y integer
---@dir Dir8
---@return self
function GROUND:CreateCharacterFromCharData(instName, dunCh, x, y, dir) end

---Reloads the controllable player's character data to be the current team's leader.
---@return self
function RefreshPlayer() end

---Sets the controllable player to use new character data.
---@param charData CharData
---@return self
function GROUND:SetPlayer(charData) end

---Make the specified spawner run its spawn method.
---@param spawner string
---@return GroundCH
function GROUND:SpawnerDoSpawn(spawner) end

---Make the specified spawner run its spawn method.
---@param spawner string
---@param chara DungeonCH
---@return self
function GROUND:SpawnerSetSpawn(spawner, chara) end