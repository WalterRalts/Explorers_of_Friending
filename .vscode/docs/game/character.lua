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
--[[
CanRelearn
Checks if the character can relearn any skills. Returns true if they can, false if they can't.Argument order is GAME:CanRelearn(chara).

CanForget
Checks if the character can forget any skills. Argument order is GAME:CanForget(chara).

Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to check
CanLearn
Checks if the character can learn any skills. Argument order is GAME:CanLearn(chara).

Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to check
CheckLevelSkills
Checks the levels gained by a character and prompts to learn all skills along the levels. Waits until all skills have been accepted or declined before continuing. Argument order is GAME:CheckLevelSkills(chara, pastLevel).

Arguments
Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to check
Name	Type	Technical Type	Purpose
chara	(Undocumented)	(Undocumented)	The character to prompt for learning.
pastLevel	Integer	System.Int32	The level that the character leveled up from.
rom.

Example

GAME:CheckLevelSkills(player, 5)

TryLearnSkill
Attempts to give a new skill to the specified character, prompting to replace an old one if they are full. Waits until all the skill has been accepted or declined before continuing. Argument order is GAME:TryLearnSkill(chara, skill).

Arguments
Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to learn the skill
skill	String	System.String	The skill to learn
Example

GAME:TryLearnSkill(player, "thunder")

LearnSkill
Gives a new skill to a specified character. Fails if the character's skills are full. Argument order is GAME:LearnSkill(chara, skill).



Arguments
Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to learn the skill
skill	String	System.String	The skill to learn
ForgetSkill
Removes a skill from the specified character. Argument order is GAME:ForgetSkill(chara, slot).

Arguments
Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to forget the skill
Slot	Integer	System.Int32	The slot of the skill to forget
LockSkill
Makes a skill impossible to forget or replace for the specified character. Note that this only affects normal gameplay. Scripts can still freely get rid of the skill. Argument order is GAME:LockSkill(chara, slot).

Arguments
Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to lock the skill of
Slot	Integer	System.Int32	The slot of the skill to lock
UnlockSkill
Unlocks a previously locked skill for the specified character, making it possible to be forgotten or replaced during normal gameplay. Argument order is GAME:UnlockSkill(chara, slot).

Arguments
Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to unlock the skill of
Slot	Integer	System.Int32	The slot of the skill to unlock
SetCharacterSkill
Gives a new skill to a specified character, replacing a specifically chosen slot. Argument order is GAME:SetCharacterSkill(chara, skillID, slot).

Arguments
Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to learn the skill
skillID	String	System.String	The skill to learn
slot	Integer	System.Int32	The slot to replace
GetCharacterSkill
Gets the skill from a specified character and specified slot. Argument order is GAME:GetCharacterSkill(chara, slot).

Arguments
Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to get the skill from.
slot	Integer	System.Int32	The slot to get the skill from.
Returns
The ID of the skill in the slot

CanPromote
Checks if the character can be promoted to a new class. Argument order is GAME:CanPromote(chara).

Arguments
Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to check
Returns
True if the character can be promoted, false otherwise.

GetAvailablePromotions
Gets a list of possible classes that the character can promote to. Returns a lua table of PromoteBranch objects.

Arguments
Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to check
bypassItem	String	System.String	An exception item that can bypass checks for promotion, for "evolution item"
PromoteCharacter
Promotes a character to a new class.

Arguments
Name	Type	Technical Type	Purpose
chara	Dungeon Character	RogueEssence.Dungeon.Character	The character to check
branch	Promote Branch	RogueEssence.Data.PromoteBranch	The branch of promotion to use.
bypassItem	String	System.String	An exception item that can bypass checks for promotion, for "evolution item"
]]
