---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GROUND

---Adds a mapstatus to the ground map. Map statuses only have an aesthetic effect in ground maps.
---@param statusIdx any The ID of the Map Status
function GROUND:AddMapStatus(statusIdx) end

---Removes a map status from the ground map. Map statuses only have an aesthetic effect in ground maps.
---@param statusIdx any The ID of the Map Status to remove.
function GROUND:RemoveMapStatus(statusIdx) end