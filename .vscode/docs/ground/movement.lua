---@meta
---@diagnostic disable: duplicate-set-field
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

---Repositions the ground entity in a specified location.
---@param ent GroundCH
---@param x integer
---@param y integer
---@param direction Dir8
---@param height? integer
function GROUND:TeleportTo(ent, x, y, direction, height) end

---Make ground character move in a direction.
---@param chara GroundCH
---@param direction Dir8
---@param duration integer
---@param run boolean
---@param speed integer
function GROUND:MoveInDirection(chara, direction, duration, run, speed) end

---Make ground character move to a position.
---@param chara GroundCH
---@param x integer
---@param y integer
---@param run boolean
---@param speed integer
function GROUND:MoveToPosition(chara, x, y, run, speed) end

---Make ground character move to a ground marker.
---@param chara GroundCH
---@param mark Marker
---@param run boolean
---@param speed integer
function GROUND:MoveToMarker(chara, mark, run, speed) end

---Make ground character move to a position.
---@param ent Entity
---@param x integer
---@param y integer
---@param speed integer
function GROUND:MoveObjectToPosition(ent, x, y, speed) end

---Make a ground character move in a direction with custom animation
---@param chara GroundCH
---@param anim Anim
---@param animDir Dir8
---@param direction integer
---@param duration integer
---@param animSpeed number Speed of animation, where 1.0 represents normal speed
---@param speed integer
function GROUND:AnimateInDirection(chara, anim, animDir, direction, duration, animSpeed, speed) end

---Make a ground entity move to a position with custom animation
---@param ent GroundCH Entity to move
---@param anim Anim Name of the animation
---@param animDir Dir8 Direction of animation
---@param x integer X coordinate of the destination
---@param y integer Y coordinate of the destination
---@param animSpeed number Speed of animation, where 1.0 represents normal speed
---@param speed number Speed movement, in pixels per frame
---@param height integer Height of the destination
function GROUND:AnimateToPosition(ent, anim, animDir, x, y, animSpeed, speed, height) end

---Make a ground entity action to a position with custom animation
---@param ent GroundCH Entity to move
---@param baseAction Action Action for the entity to perform
---@param x integer X coordinate of the destination
---@param y integer Y coordinate of the destination
---@param animSpeed number Speed of animation, where 1.0 represents normal speed
---@param speed number Speed movement, in pixels per frame
---@param height integer Height of the destination
function GROUND:ActionToPosition(ent, baseAction, x, y, animSpeed, speed, height) end