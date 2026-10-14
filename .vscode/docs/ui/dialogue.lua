---@meta _
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class UI

---Waits for the player to press a button before continuing.
---@param anyInput boolean If false, only the Continue button will let the game continue. If true, any button will work.
function UI:WaitInput(anyInput) end

---Waits for the player to press at least one of the given inputs before continuing.
---If an empty table is supplied, then this function behaves like WaitInput.
---@param inputs? table A table of inputs, either as InputTypes or as ints. The game will continue if any one of them are hit. If empty, any button will work.
function UI:WaitForPlayerInput(inputs) end

---Displays a dialogue box with text, waiting until the player completes it.
---Takes a string and an optional callback as an argument.
---@param text string
---@param callback? table
function UI:WaitShowDialogue(text, callback) end
--[[
WaitShowTimedDialogue
UI:WaitShowTimedDialogue(text, waitTime, callbacks)

Displays a dialogue box with text, waiting until the specified time has expired.
Takes a string, integer, and an optional callback as an argument.

Parameters
Name	Type	Description
System.String	System.String	The text to display in the textbox.
System.Int32	System.Int32	The time for the textbox to remain on screen. Pass -1 to wait for layer input.
NLua.LuaTable	NLua.LuaTable	The Lua table of callbacks that the textbox can call using the [script] tag.
Returns
Type	Description
NLua.LuaFunction	


TextDialogue
UI:TextDialogue(text, waitTime, callbacks)

[LuaFunction] WaitShowTimedDialogue
Sets the current dialogue text to be shown. Requires WaitDialog to actually display.

Parameters
Name	Type	Description
System.String	System.String	The text to display in the textbox.
System.Int32	System.Int32	The time for the textbox to remain on screen. Pass -1 to wait for layer input.
NLua.LuaTable	NLua.LuaTable	The Lua table of callbacks that the textbox can call using the [script] tag.]]

---Ask a question answered by yes or no via character dialogue to the player.
---UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
---and for execution to suspend until the choice is returned.
---Then to retrieve the integer value indicating the result of the menu, UI:ChoiceResult() must be called.
---
---The Yes/No menu returns 1 for yes, and 0 for no.
---@param message string Question to be asked to the user.
---@param bdefaultstono boolean Whether the cursor starts on no by default
---@param callbacks? table The Lua table of callbacks for the textbox to call.
function UI:ChoiceMenuYesNo(message, bdefaultstono, callbacks) end

---Displays a custom dialogue of the caller's choice.
---UI:WaitDialog() must be called afterwards for the dialogue to be actually displayed,
---and for execution to suspend until the dialogue is completed.
---@param dialogue any
function UI:SetCustomDialogue(dialogue) end