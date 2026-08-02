---@meta _
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GAME

---Returns the amount of money the player currently has on hand.
---@return integer
function GAME:GetPlayerMoney() end

---Adds money to the player's wallet.
---@param toAdd integer
function GAME:AddToPlayerMoney(toAdd) end

---Removes money from the player's wallet.
---@param toRemove integer
function GAME:RemoveFromPlayerMoney(toRemove) end

---Returns the amount of money in the player's bank.
---@return integer
function GAME:GetPlayerMoneyBank() end

---Adds money to the player's bank.
---@param toAdd integer
function GAME:AddToPlayerMoneyBank(toAdd) end

---Removes money from the player's bank.
---@param toRemove integer
function GAME:RemoveFromPlayerMoneyBank(toRemove) end