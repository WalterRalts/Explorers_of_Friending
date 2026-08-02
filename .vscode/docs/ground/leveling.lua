---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GROUND

---Gives a character a set amount of EXP. Also handles leveling up and learning new moves.
---@param chara GroundCH The characters to level up.
---@param experience integer The amount of EXP to gain.
function GROUND:HandoutEXP(chara, experience) end

---Levels up a character a certain amount of times all at once. Also handles learning new moves.
---@param chara GroundCH The characters to level up.
---@param experience integer The number of level ups.
function GROUND:LevelUpChar(chara, experience) end