--- @meta
--- @diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GROUND

---Makes a character turn to face another character instantly.
---@param turner GroundCH The character that is turning.
---@param turnTo GroundCH The character to turn to.
---@return self
function GROUND:CharTurnToChar(turner, turnTo) end

---Makes a character do an animated turn to face another character over the specified time. 
---Clockwise or counter-clockwise are chosen based on the closest direction. 
---Waits until the operation is completed.
---@param turner GroundCH The character that is turning.
---@param turnTo GroundCH The character to turn to.
---@param dur integer Time spent on each direction, in frames
---@return self
function GROUND:CharTurnToCharAnimated(turner, turnTo, dur) end

---Makes a ground entity turn to face a direction.
---@param entity Entity
---@param dir Dir8
---@return self
function GROUND:EntTurn(entity, dir) end

--[[
EntTurn
Makes a ground entity turn to face a direction. Argument order is GROUND:EntTurn(entity, dir).

Arguments
Name	Type	Technical Type	Purpose
entity	Ground Entity	RogueEssence.Ground.GroundEntity	
dir	Direction	ogueElements.Dir8	The direction to face.
CharAnimateTurn
Makes a character do an animated turn to face a chosen direction over the specified time. Must specify clockwise or counter-clockwise. Waits until the operation is completed. Argument order is GROUND:CharAnimateTurn(chara, dir, dur, isCounterClockwise).

Arguments
Name	Type	Technical Type	Purpose
entity	Ground Entity	RogueEssence.Ground.GroundEntity	
dir	Direction	RogueElements.Dir8	The direction to face.
name=isCounterClockwise	type=Boolean	techt=System.Bool	purp=false if clockwise, true if counter-clockwise
}}

Example

GROUND:CharTurnToCharAnimated(charFrom, Dir8.Left, 3, true)

CharAnimateTurnTo
Makes a character do an animated turn to face a chosen direction over the specified time. Waits until the operation is completed. Argument order is GROUND:CharAnimateTurnTo(chara, dir, dur).

Arguments
Name	Type	Technical Type	Purpose
chara	(undocumented)	(undocumented)	The character to turn
dir	(undocumented)	(undocumented)	The direction to turn to
dur	(undocumented)	(undocumented)	The time spent in each intermediate direction, in frames
Example

CharAnimateTurnTo(charFrom, Dir8.Left, 3)]]