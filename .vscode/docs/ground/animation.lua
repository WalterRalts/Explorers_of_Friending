---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GROUND

---Make a character emote on the ground map.
---@param chara GroundCH Character to emote
---@param emoteid Emote ID of the emote
---@param cycles integer The number of times to play the emote.
---@return self
function GROUND:CharSetEmote(chara, emoteid, cycles) end

---Sets the ground character's draw effect to become invisible, shaking, still, etc.
---@param chara GroundCH Target ground character
---@param effect Effect The draw effect
---@return self
function GROUND:CharSetDrawEffect(chara, effect) end

---Stops the ground character's draw effect.
---@param chara GroundCH Target ground character
---@param effect Effect The draw effect to end
---@return self
function GROUND:CharEndDrawEffect(chara, effect) end

---Gets the fallback animation for the character.
---@param chara GroundCH Target ground character
---@param anim Anim The anim to set the fallback anim to
---@return self
function GROUND:CharGetAnimFallback(chara, anim) end

---Gets a character's current animation as a string.
---@param chara GroundCH 
function GROUND:CharGetAnim(chara) end

---Gets the chosen action point of the character at this specific frame.
---@param chara GroundCH
---@param actpoint ActionPoint
---@return Loc
function GROUND:CharGetAnimPoint(chara, actpoint) end

---Set a character's animation.
---@param chara GroundCH
---@param anim Anim
---@param loop boolean
function GROUND:CharSetAnim(chara, anim, loop) end
--[[
GROUND:CharEndAnim(RogueEssence.Ground.GroundChar)
Stops a character's current animation, reverting them to default idle.



Arguments
chara: Character to stop animating
GROUND:CharWaitAnim
Makes the character perform an animation and waits until it's over.



Arguments
ent: Character to animate
anim: Animation to play
Example

GROUND:CharWaitAnim(player, "Hurt")

GROUND:CharSetAction(RogueEssence.Ground.GroundChar,RogueEssence.Ground.GroundAction)
Set a character's action.



Arguments
chara: Character to perfom the action
action: The action to perform
GROUND:CharWaitAction
Makes the character perform an action and waits until it's over.



Arguments
ent: Character to animate
action: Action to perform
Example

GROUND:CharWaitAction(player, action)

GROUND:ObjectSetAnim(RogueEssence.Ground.GroundObject,System.Int32,System.Int32,System.Int32,RogueElements.Dir8,System.Int32)
Sets a ground object's animation. After it finishes, it will return to the default animation.



Arguments
obj: The object to animate
frameTime: The duration of each frame of animation
startFrame: The start frame of animation
endFrame: The end frame of animation
dir: The direction of the animation
cycles: The number of times to repeat the animation
GROUND:ObjectSetDefaultAnim(RogueEssence.Ground.GroundObject,System.String,System.Int32,System.Int32,System.Int32,RogueElements.Dir8)
Sets a ground object's default animation.



Arguments
obj: The object to animate
animName: The name of the animation
frameTime: The duration of each frame of animation
startFrame: The start frame of animation
endFrame: The end frame of animation
dir: The direction of the animation
GROUND:ObjectWaitAnimFrame
Waits for the object to reach a specific frame before continuing.



Arguments
obj: The object ot wait on
frame: The frame of animation to wait on.
Example

GROUND:WaitObjectAnim(fountain, 3)
]]