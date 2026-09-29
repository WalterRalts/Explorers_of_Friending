---@meta _
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GAME

---Returns the index of the currently player controlled entity in the party.
---@return integer
function GAME:GetTeamLeaderIndex() end

---Sets the leader to the chosen index within the party.
---@param idx integer
function GAME:SetTeamLeaderIndex(idx) end

---Prevents or allows the switching of leaders for the save file.
---@param flag boolean
function GAME:SetCanSwitch(flag) end

---Prevents or allows the joining of recruits for the save file.
---@param flag boolean
function GAME:SetCanRecruit(flag) end

---Prevents or allows the joining of recruits for the save file.
---@param name string
---@return string
function GAME:SetTeamName(name) end

---Returns the player party count. Does not include guests.
---@return integer
function GAME:GetPlayerPartyCount() end

---Return the party as a LuaTable. Does not include guests.
---@return table
function GAME:GetPlayerPartyTable() end

---Gets the character at the specified index within the player's team.
---@param index integer
---@return DungeonCH | GroundCH
function GAME:GetPlayerPartyMember(index) end

---Adds a character to the player's team.
---@param character CharDef
function GAME:AddPlayerTeam(character) end

---Removes the character from the team, placing its item back in the inventory.
---@param slot integer
function GAME:RemovePlayerTeam(slot) end

---Gets the number of guests currently in the player's party.
---@return integer
function GAME:GetPlayerGuestCount() end

---Return the guests as a LuaTable
---@return table
function GAME:GetPlayerGuestTable() end
--[[
GetPlayerGuestMember
GAME:GetPlayerGuestMember(index)

Gets the character at the specified index within the player's guests.

Parameters
Name	Type	Description
System.Int32	System.Int32	The specified index
Returns
Type	Description
RogueEssence.Dungeon.Character	The team member retrieved.


AddPlayerGuest
GAME:AddPlayerGuest(character)

Adds a character to the player's guests.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to add.


RemovePlayerGuest
GAME:RemovePlayerGuest(slot)

Removes the character from the team's guests, placing its item back in the inventory.

Parameters
Name	Type	Description
System.Int32	System.Int32	The slot of the player to remove.


GetPlayerAssemblyCount
GAME:GetPlayerAssemblyCount()

Gets the number of characters currently in the player's assembly.



Returns
Type	Description
System.Object	The number of characters


GetPlayerAssemblyTable
GAME:GetPlayerAssemblyTable()

Return the assembly as a LuaTable



Returns
Type	Description
NLua.LuaTable	A Lua Table of Characters


GetPlayerAssemblyMember
GAME:GetPlayerAssemblyMember(index)

Gets the character at the specified index within the player's assembly.

Parameters
Name	Type	Description
System.Int32	System.Int32	The specified index
Returns
Type	Description
RogueEssence.Dungeon.Character	The assembly member retrieved.


AddPlayerAssembly
GAME:AddPlayerAssembly(character)

Adds a character to the player's assembly.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to add.]]

---Removes the character from the assembly, placing its item back in the inventory.
---@param slot integer
function GAME:RemovePlayerAssembly(slot) end