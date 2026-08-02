---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GROUND

---Repositions the ground entity in a specified location.
---@param ent GroundCH
---@param x integer
---@param y integer
---@param direction Dir8
---@param height integer
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
---@param ent Entity
---@param anim Anim
---@param animDir Dir8
---@param direction integer
---@param duration integer
---@param animSpeed number Speed of animation, where 1.0 represents normal speed
---@param speed integer
function GROUND:AnimateToPosition(ent, anim, animDir, direction, duration, animSpeed, speed) end
