---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control essentials not given via base scripts like GROUND and UI
---@class RogueEssence
---@class Dungeon
---@class ExplorerTeam
---@field MAX_TEAM_SLOTS integer

---Returns the monster ID of a made mon
---@param pokemon string
---@param form integer
---@param color string
---@param gender Gender
---@return MonID
function RogueEssence.Dungeon.MonsterID(pokemon, form, color, gender) end