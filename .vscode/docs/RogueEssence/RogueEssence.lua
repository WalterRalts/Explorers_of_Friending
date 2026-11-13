---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control essentials not given via base scripts like GROUND and UI
---@class RogueEssence
---@class Content content
---@class Dungeon dungeon
---@
---An AnimData object, which has the animation we want to display.
---@param animindex string The string ID of the particle animation to play.
---@param frametime integer An integer amount of time, in frames, to spend on each frame of the animation.
---@param startframe integer The frame to start the animation on.
---@param endframe integer The frame to end the animation on.
---@param alpha integer The opacity of the particle. Set it to 255 to make it completely opaque, or 0 to make it completely transparent.
---@param animflip any Determines whether the particle is flipped in a particular direction.
---@return AnimData
function RogueEssence.Content.AnimData(animindex, frametime, startframe, endframe, alpha, animflip) end

---Returns the context of any single dungeoner
---@param chara any
function RogueEssence.Dungeon.SingleCharContext(chara) end

---Returns the monster ID of a made mon
---@param pokemon string
---@param form integer
---@param color string
---@param gender Gender
---@return MonID
function RogueEssence.Dungeon.MonsterID(pokemon, form, color, gender) end