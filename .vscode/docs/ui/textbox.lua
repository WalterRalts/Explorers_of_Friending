---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class UI

---Displays a dialogue box with text, waiting until the player completes it. 
---Takes a string as an argument.
---@param text string
---@param callbacks? table
function UI:WaitShowDialogue(text, callbacks) end

---Displays a dialogue box with text, waiting until the player completes it. 
---Takes a string as an argument.
---@param text string
---@param waitTime integer
---@param callbacks? table
function UI:WaitShowTimedDialouge(text, waitTime, callbacks) end

---Sets the current dialogue text to be shown. 
---Requires WaitDialog to actually display.
---@param text string
---@param waitTime integer
---@param callbacks? table
function UI:TextDialogue(text, waitTime, callbacks) end

---Displays a voice over, waiting until the player completes it.
---@param text string
---@param expireTime integer
---@param x? integer
---@param y? integer
---@param width? integer
---@param height? integer
---@param callbacks? table
function UI:WaitShowVoiceOver(text, expireTime, x, y, width, height, callbacks) end

---Sets the current voice-over text to be shown. 
---Requires WaitDialog to actually display.
---@param text string
---@param expireTime integer
---@param x? integer
---@param y? integer
---@param width? integer
---@param height? integer
---@param callbacks? table
function UI:TextVoiceOver(text, expireTime, x, y, width, height, callbacks) end

---Makes text pop up in the bottom-left corner by default. 
---Displays concurrently with any other process.
---@param text string
---@param expireTime integer
---@param x? integer
---@param y? integer
---@param width? integer
---@param height? integer
---@param centerH? boolean
---@param centerV? boolean
function UI:TextPopUp(text, expireTime, x, y, width, height, centerH, centerV) end

---Fades in a title text, waiting until the fade-in is complete.
---@param text string
---@param time integer
function UI:WaitShowTitle(text, time) end

---Shows text in the format of a title drop. Requires WaitDialog to actually display.
---@param text string
---@param time integer
function UI:TextShowTitle(text, time) end

---Shows text in the format of a title drop. Requires WaitDialog to actually display.
---@param time integer
function UI:WaitHideTitle(time) end
--[[
TextFadeTitle
Fades out the text set in a title drop. Requires WaitDialog to actually fade.

Arguments
Name	Type	Technical Type	Purpose
time	Integer	System.Int32	The time for the text to fade in.
WaitDialog
Displays the currently set dialogue box and waits for the player to complete it.

Example

UI:WaitDialog()

_DummyWait
Instantly break. Used as default/invalid value when returning a yieldable value.]]