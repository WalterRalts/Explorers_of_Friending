---@meta _
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class UI

---Marks the start of a multi-choice menu.
---UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
---and for execution to suspend until the choice is returned.
---Then to retrieve the integer value indicating the result of the menu, UI:ChoiceResult() must be called.
---@param message string The question to ask the user.
---@param choicesPairs table A table of choices. Each choice can be either a string, or { string, bool } representing the text and enabled status.
---@param defaultChoice integer The cursor starts on this choice.
---@param cancelChoice integer This choice is chosen if the player presses the cancel button.
---@param callbacks? table The Lua table of callbacks for the textbox to call.
function UI:BeginChoiceMenu(message, choicesPairs, defaultChoice, cancelChoice, callbacks) end

---Marks the start of a multi-paged choice menu.
---UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
---and for execution to suspend until the choice is returned.
---Then to retrieve the integer value indicating the result of the menu, UI:ChoiceResult() must be called.
---@param x integer X position of the menu
---@param y integer Y position of the menu
---@param width integer Width of the menu
---@param title string
---@param choicesPairs table
---@param linesPerPage integer
---@param defaultChoice integer
---@param cancelChoice integer
function UI:BeginMultiPageMenu(x, y, width, title, choicesPairs, linesPerPage, defaultChoice, cancelChoice) end

---Displays a custom menu of the caller's choice.
---UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
---and for execution to suspend until the menu is exited.
---@param menu any
function UI:SetCustomMenu(menu) end

---Get the result of the last choice menu
---@return any
function UI:ChoiceResult() end

---Creates an action that sets the choice result to a specified object.
---@param obj any
---@return any
function UI:GetChoiceAction(obj) end

---Displays the currently set choice menu and waits for the player's selection to complete.
---@return function
function UI:WaitForChoice() end

---Opens the provided menu and starts the menu coroutine.
---This should be called only from non-coroutine sources.
---@param menu any
---@return coroutinelib
function UI:ProcessMenuCoroutine(menu) end