---@meta _
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GAME

---Sets a character's nickname.
---@param chara GroundID The character to give the nickname to
---@param name string
function GAME:SetCharacterNickname(chara, name) end

---Returns the nickname of the passed character.
---@param chara GroundID The character to get the nickname of
---@return string
function GAME:GetCharacterNickname(chara) end

---Sets the name of the player's team
---@param teamname string The new team name
function GAME:SetTeamName(teamname) end

---Gets the name of the player's team
---@return string 
function GAME:GetTeamName() end

---Checks if the character can relearn any skills.
---@param character GroundCH | DungeonCH The character to check
function GAME:CanRelearn(character) end

---Checks if the character can forget any skills.
---@param character GroundCH | DungeonCH The character to check
---@return boolean
function GAME:CanForget(character) end

---Checks if the character can learn any skills.
---@param character GroundCH | DungeonCH The character to check
---@return boolean
function GAME:CanLearn(character) end

---Checks the levels gained by a character and prompts to learn all skills along the levels.
---Waits until all skills have been accepted or declined before continuing.
---@param chara DungeonCH
---@param oldLevel integer
---@return function
function GAME:CheckLevelSkills(chara, oldLevel) end
--[[
TryLearnSkill
GAME:TryLearnSkill(chara, skill)

Attempts to give a new skill to the specified character, prompting to replace an old one if they are full.
Waits until the skill has been accepted or declined before continuing.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to learn the skill
System.String	System.String	The skill to learn
Returns
Type	Description
NLua.LuaFunction	


LearnSkill
GAME:LearnSkill(chara, skill)

Gives a new skill to a specified character.
Fails if the character's skills are full.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to learn the skill
System.String	System.String	The skill to learn


ForgetSkill
GAME:ForgetSkill(chara, slot)

Removed a skill from the specified character.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to forget the skill
System.Int32	System.Int32	The slot of the skill to forget


LockSkill
GAME:LockSkill(chara, slot)

Makes a skill impossible to forget or replace for the specified character.
Note that this only affects normal gameplay. Scripts can still freely get rid of the skill.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to lock the skill
System.Int32	System.Int32	The slot of the skill to lock


UnlockSkill
GAME:UnlockSkill(chara, slot)

Unlocks a previously locked skill for the specified character, making it possible to be forgotten or replaced during normal gameplay.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to unlock the skill
System.Int32	System.Int32	The slot of the skill to unlock


SetCharacterSkill
GAME:SetCharacterSkill(character, skillId, slot, enabled)

Gives a new skill to a specified character, replacing a specifically chosen slot.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to learn the skill
System.String	System.String	The skill to learn
System.Int32	System.Int32	The slot to replace
System.Boolean	System.Boolean	


GetCharacterSkill
GAME:GetCharacterSkill(chara, slot)

Gets the skill from a specified character and specified slot.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to get the skill from.
System.Int32	System.Int32	The slot to get the skill from.
Returns
Type	Description
System.String	The ID of the skill in the slot


CanPromote
GAME:CanPromote(character)

Checks if the character can be promoted to a new class.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to check
Returns
Type	Description
System.Boolean	True if the character can be promoted, false otherwise.


GetAvailablePromotions
GAME:GetAvailablePromotions(character, bypassItem)

Gets a list of possible classes that the character can prmote to.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to check
System.String	System.String	An exception item that can bypass checks for promotion
Returns
Type	Description
NLua.LuaTable	A lua table of PromoteBranch objects


PromoteCharacter
GAME:PromoteCharacter(character, branch, bypassItem)

Promotes a character ot a new class.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to promote
RogueEssence.Data.PromoteBranch	RogueEssence.Data.PromoteBranch	The PromoteBranch to promote with
System.String	System.String	An exception item that can bypass checks for promotion
]]
