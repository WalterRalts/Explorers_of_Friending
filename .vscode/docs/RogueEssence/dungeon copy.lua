---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control essentials not given via base scripts like GROUND and UI
---@class RogueEssence
---@field Data RogueEssence --Data that looks into your save.
---@field GameProgress Data
---@field ResultType GameProgress
---@field Failed boolean --Failed a dungeon

---Returns the monster ID of a made mon
---@param pokemon string
---@param form integer
---@param color string
---@param gender Gender
---@return MonID
function RogueEssence.Dungeon.MonsterID(pokemon, form, color, gender) end

---An event to be given to any character in a dungeon
---@param event string
---@return BattleScript
function RogueEssence.Dungeon.BattleScriptEvent(event) end