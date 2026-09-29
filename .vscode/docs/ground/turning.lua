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
function GROUND:CharTurnToCharAnimated(turner, turnTo, dur) end

---Makes a ground entity turn to face a direction.
---@param entity Entity
---@param dir Dir8
---@return self
function GROUND:EntTurn(entity, dir) end

---Makes a character do an animated turn to face a chosen direction over the specified time. 
---Must specify clockwise or counter-clockwise.
---@param chara GroundCH
---@param dir Dir8
---@param dur integer
---@param isCounterClockwise boolean
function GROUND:CharAnimateTurn(chara, dir, dur, isCounterClockwise) end

---Makes a character do an animated turn to face a chosen direction over the specified time. 
---Waits until the operation is completed.
---@param chara GroundCH
---@param dir Dir8
---@param dur integer
function GROUND:CharAnimateTurnTo(chara, dir, dur) end