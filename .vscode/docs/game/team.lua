---@meta _
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GAME

---Returns the index of the currently player controlled entity in the party.
---@return integer
function GAME:GetTeamLeaderIndex() end

---Sets the leader to the chosen index within the party.
---@param idx integer
function GAME:SetTeamLeaderIndex(idx) end

---Prevents or allows the switching of leaders for the save file.
---@param flag boolean
function GAME:SetCanSwitch(flag) end

---Prevents or allows the joining of recruits for the save file.
---@param flag boolean
function GAME:SetCanRecruit(flag) end

---Prevents or allows the joining of recruits for the save file.
---@param name string
---@return string
function GAME:SetTeamName(name) end