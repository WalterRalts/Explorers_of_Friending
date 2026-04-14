---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class UI

---Fades in a chosen background image, with a chosen framerate, at a certain fade time, waiting until the fade-in is complete.
---@param bg string
---@param frameTime integer
---@param fadeInTime integer
function UI:WaitShowBG(bg, frameTime, fadeInTime) end

---Sets an image to display. Requires WaitDialog to actually display.
---@param bg string
---@param frameTime integer
---@param fadeInTime integer
function UI:ShowBG(bg, frameTime, fadeInTime) end

---Fades out the current background image, waiting until the fade-out is complete.
---@param time integer
function UI:WaitShowBG(time) end

---Prepares a fade-out of the current image. Requires WaitDialog to actually display.
---@param time integer
function UI:FadeBG(time) end