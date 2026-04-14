---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class UI

---Sets the position and size of the dialogue box. 
---@param x integer The X position of the topleft of the box
---@param y integer The Y position of the topleft of the box
---@param width integer Width of the box
---@param height integer Height of the box
function UI:SetBounds(x, y, width, height) end

---Resets the position and size of the dialogue box.
function UI:ResetBounds() end

---Sets the centering of the text in the textbox. 
---@param centerH boolean
---@param centerV boolean
function UI:SetCenter(centerH, centerV) end

---Makes the text automatically finish when it shows up. 
---@param autoFinish boolean
function UI:SetAutoFinish(autoFinish) end
