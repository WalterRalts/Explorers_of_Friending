---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GROUND

---Plays a VFX using a finite emitter that generates BaseAnims.
---With the xTo and yTo argument, it plays a VFX that has a start position (x, y) and an end position. It uses a finite emitter that generates BaseAnims.
---@param emitter VFX
---@param x integer
---@param y integer
---@param dir? Dir8
---@param xTo? integer
---@param yTo? integer
function GROUND:PlayVFX(emitter, x, y, dir, xTo, yTo) end

---Plays a VFX using just a BaseAnim
---@param anim Anim
---@param layer integer
function GROUND:PlayVFXAnim(anim, layer) end

---Plays a screen-moving effect.
---@param mover Mover
function GROUND:MoveScreen(mover) end