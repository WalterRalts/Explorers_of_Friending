---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control things within dungeons. Most functions in this section are similar to GROUND: functions
---@class DUNGEON

---Makes a character turn to face another.
---@param curch DungeonCH
---@param turnto DungeonCH
function DUNGEON:CharTurnToChar(curch, turnto) end

---Gets the result of the last dungeon adventure. Takes no arguments.
---@return DunResult
function DUNGEON:LastDungeonResult() end

---Gets the result of the last dungeon adventure. Takes no arguments.
---@return integer
function DUNGEON:DungeonCurrentFloor() end

---Returns the internal name for the current dungeon. Takes no arguments.
---@return string
function DUNGEON:DungeonAssetName() end

---Returns the localized name of the current dungeon. Takes no arguments.
---@return string
function DUNGEON:DungeonDisplayName() end

---Set a character's emote in a dungeon map.
---@param chara DungeonCH
---@param emoteID string
---@param cycles integer
function DUNGEON:CharSetEmote(chara, emoteID, cycles) end

---Set a character's animation.
---@param chara DungeonCH Character to animate
---@param emoteID string Name of the animation
---@param doLoop boolean Whether to loop the animation
function DUNGEON:CharStartAnim(chara, emoteID, doLoop) end

---End a character's animation.
---@param chara DungeonCH Character to animate
function DUNGEON:CharEndAnim(chara) end

---Set a character's animation.
---@param chara DungeonCH Character to animate
---@param anim Anim
function DUNGEON:CharWaitAnim(chara, anim) end
--[[
PlayVFX
Plays a VFX in the dungeon map. Usage is DUNGEON:PlayVFX(emitter, x, y, dir).

Arguments
Name	Type	Technical Type	Purpose
emitter	Emitter	RogueEssence.Content.FiniteEmitter	The VFX emitter
X	Integer	System.Int32	X Position in pixels
Y	Integer	System.Int32	Y Position in pixels
dir	Direction	RogueElements.Dir8	Direction to orient the VFX, defaults to Down
PlayVFX
Plays a VFX that has a start position and an end position. It uses a finite emitter that generates BaseAnims. Argument order is DUNGEON:PlayVFX(emitter, x, y, dir, xTo, yTo).

Arguments
Name	Type	Technical Type	Purpose
emitter	Emitter	RogueEssence.Content.FiniteEmitter	The VFX emitter
x	Integer	System.Int32	Start X position in pixels
y	Integer	System.Int32	Start Y Position in pixels
dir	Direction	RogueElements.Dir8	Direction to orient the VFX, defaults to Down.
xTo	Integer	System.Int32	End X position in pixels
yTo	Integer	System.Int32	End Y Position in pixels
PlayVFXAnim
Plays a VFX using just a BaseAnim. Argument order is DUNGEON:PlayVFXAnim(anim, layer).

Arguments
Name	Type	Technical Type	Purpose
anim	Animation	RogueEssence.Content.BaseAnim	The animation to play.
layer	Layer	RogueEssence.Content.DrawLayer	The layer to draw.
MoveScreen
Plays a screen-moving effect. Argument order is DUNGEON:MoveScreen(mover).

Arguments
Name	Type	Technical Type	Purpose
mover	Screen Mover	DUNGEON:MoveScreen(RogueEssence.Content.ScreenMover)	The screen mover.]]

---@class DungeonCH Any character on the dungeon map
---The name of the character
---@field Nickname string 
---
---@field Name string
--- 
---@field Dead boolean
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
---
---@class Marker
---
---@field Position Loc
