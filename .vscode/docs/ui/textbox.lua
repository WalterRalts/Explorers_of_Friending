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
--[[
WaitShowTitle
Fades in a title text, waiting until the fade-in is complete.

Arguments
Argument order is UI:WaitShowTitle(text, time)

Name	Type	Technical Type	Purpose	Required
text	String	System.String	The text to display with the textbox.	Yes
time	Integer	System.Int32	How long the text takes to fade in.	No
Example

UI:WaitShowTitle("Hello World!", 60)

TextShowTitle
Shows text in the format of a title drop. Requires WaitDialog to actually display.

Arguments
Name	Type	Technical Type	Purpose
text	String	System.String	The text to display.
time	Integer	System.Int32	The time for the text to fade in.
WaitHideTitle
Fades out the currently displayed title, waiting until the fade-out is complete.

Arguments
Name	Type	Technical Type	Purpose
time	Integer	System.Int32	The time for the text to fade in.
Example

UI:WaitHideTitle(60)

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