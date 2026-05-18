---@meta _

---@alias Entity string An object on the ground map
---@alias DungeonCH string Any character on the dungeon map

---@class GroundCH
---The name of the character
---@field Nickname string 
---
---@field Name string
---The X and Y parts
---@field Position Loc
---Whether or not you can collide with the character
---@field CollisionDisabled boolean
---
---@field Direction Dir8
---
---@field Bounds Bounds
---
---@field Data Data
---
---@class Data
---
---@field Nickname string
---
---@class Bounds
---
---@field Center Loc

---@class Marker

---@field Position Loc