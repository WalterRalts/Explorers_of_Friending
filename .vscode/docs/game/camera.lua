---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control things in the game
---@class GAME

---Fade out the screen. Waits to complete before continuing.
---@param isWhite boolean Fade to white if set to true. Fades to black otherwise.
---@param dur integer The amount of time to fade out in frames.
---@return self
function GAME:FadeOut(isWhite, dur) end

---Fade into the screen. Waits to complete before continuing.
---@param dur integer The amount of time to fade out in frames.
---@return self
function GAME:FadeIn(dur) end

---Fade out the screen. Waits to complete before continuing.
---@param x integer X coordinate of the camera center
---@param y integer Y coordinate of the camera center
---@param dur integer The amount of time it takes to move to the destination
---@param relativeToPlayer boolean True to have coordinates in relation to player character, false to use the absolute coordinates of the map.
---@return self
function GAME:MoveCamera(x, y, dur, relativeToPlayer) end

---Centers the camera on a character. 
---As we are simply moving the camera to a character, this will simply set ViewCenter and not ViewOffset.
---@param x any
---@param y any
---@param dur any
---@param chara any
---@return self
function GAME:MoveCameraToChara(x, y, dur, chara) end

---Gets the current center of the camera.
---@return Loc
function GAME:GetCameraCenter() end

---Determines whether the camera is centered relative to the player.
---@return boolean
function GAME:IsCameraOnChar() end