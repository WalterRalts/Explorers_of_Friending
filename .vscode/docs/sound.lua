---@meta _
---@diagnostic disable: duplicate-set-field
---Functions to control things in the front, for UI
---@class SOUND

---Plays a sound effect
---@param name string
function SOUND:PlaySE(name) end

---Plays a sound effect specifically from the Battle/ subdirectory
---@param name string Sound file name, relative to the Content/SE/Battle folder
function SOUND:PlayBattleSE(name) end

---Wait for the currently played sound effect to end. CURRENTLY NOT IMPLEMENTED PROPERLY.
---@return function
function SOUND:WaitSE() end

--[[
LoopSE
SOUND:LoopSE(name)

Plays a continuous sound effect.

Parameters
Name	Type	Description
System.String	System.String	Sound file name, relative to the Content/SE folder


LoopBattleSE
SOUND:LoopBattleSE(name)

Plays a continuous sound effect

Parameters
Name	Type	Description
System.String	System.String	Sound file name, relative to the Content/SE/Battle folder


StopSE
SOUND:StopSE(name)

Stops a continuous sound effect

Parameters
Name	Type	Description
System.String	System.String	Sound file name, relative to the Content/SE folder


StopBattleSE
SOUND:StopBattleSE(name)

Stops a continuous sound effect

Parameters
Name	Type	Description
System.String	System.String	Sound file name, relative to the Content/SE/Battle folder


FadeInSE
SOUND:FadeInSE(name, fadeTime)

Plays a continuous sound effect, fading in over a specified amount of time.

Parameters
Name	Type	Description
System.String	System.String	Sound file name, relative to the Content/SE folder
System.Int32	System.Int32	Time in frames for the sound to fade in


FadeInBattleSE
SOUND:FadeInBattleSE(name, fadeTime)

Plays a continuous sound effect, fading in over a specified amount of time

Parameters
Name	Type	Description
System.String	System.String	Sound file name, relative to the Content/SE/Battle folder
System.Int32	System.Int32	Time in frames for the sound to fade in


FadeOutSE
SOUND:FadeOutSE(name, fadeTime)

Stops a continuous sound effect, fading out over a specified amount of time

Parameters
Name	Type	Description
System.String	System.String	Sound file name, relative to the Content/SE folder
System.Int32	System.Int32	Time in frames for the sound to fade out


FadeOutBattleSE
SOUND:FadeOutBattleSE(name, fadeTime)

Stops a continuous sound effect, fading out over a specified amount of time

Parameters
Name	Type	Description
System.String	System.String	Sound file name, relative to the Content/SE/Battle folder
System.Int32	System.Int32	Time in frames for the sound to fade out


PlayFanfare
SOUND:PlayFanfare(name)

Plays a sound effect that temporarily mutes the music for its duration

Parameters
Name	Type	Description
System.String	System.String	Sound file name, relative to the Content/SE folder


WaitFanfare
SOUND:WaitFanfare()

This function waits for the currently playing fanfare to complete before continuing.



Returns
Type	Description
NLua.LuaFunction	


PlayBGM
SOUND:PlayBGM(name, fade, fadeTime)

Plays a song, replacing the current one.

Parameters
Name	Type	Description
System.String	System.String	The file name of the song, relative to the Content/Music folder.
System.Boolean	System.Boolean	Whether to fade the old song out, or start a new one.
System.Int32	System.Int32	The amount of time, in frames, to fade out the old song.


StopBGM
SOUND:StopBGM()

Stops playing the current song.





FadeOutBGM
SOUND:FadeOutBGM(fadeTime)

Fades out the current song.

Parameters
Name	Type	Description
System.Int32	System.Int32	The amount of time, in frames, to fade out the song.


SetBGMVolume
SOUND:SetBGMVolume(val)

Sets the current volume of the song.

Parameters
Name	Type	Description
System.Single	System.Single	A float value between 0 and 1


GetCurrentSong
SOUND:GetCurrentSong()

Gets the currently playing song. If the current song is fading out, gets the next song to be played.



Returns
Type	Description
System.String	The filename of the song, relative to the Content/Music folder


SetupLuaFunctions
SOUND:SetupLuaFunctions(state)

Initializes any LuaFunctions found in the class.
Automatically on lua initialization.

Parameters
Name	Type	Description
RogueEssence.Script.LuaEngine	RogueEssence.Script.LuaEngine	The lua engine to initialize with.
]]