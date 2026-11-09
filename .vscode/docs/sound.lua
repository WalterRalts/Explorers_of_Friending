---@meta _
---@diagnostic disable: duplicate-set-field
---Functions to control things for sounds
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

---Plays a continuous sound effect.
---@param name string Sound file name, relative to the Content/SE folder
function SOUND:LoopSE(name) end

---Plays a continuous sound effect
---@param name string Sound file name, relative to the Content/SE/Battle folder
function SOUND:LoopBattleSE(name) end

---Stops a continuous sound effect
---@param name string
function SOUND:StopSE(name) end

---Sound file name, relative to the Content/SE/Battle folder
---@param name string
function SOUND:StopBattleSE(name) end

---Plays a continuous sound effect, fading in over a specified amount of time.
---@param name string Sound file name, relative to the Content/SE folder
---@param fadeTime integer Time in frames for the sound to fade in
function SOUND:FadeInSE(name, fadeTime) end

---Plays a continuous sound effect, fading in over a specified amount of time
---@param name string Sound file name, relative to the Content/SE/Battle folder
---@param fadeTime integer Time in frames for the sound to fade in
function SOUND:FadeInBattleSE(name, fadeTime) end

---Stops a continuous sound effect, fading out over a specified amount of time
---@param name string Sound file name, relative to the Content/SE folder
---@param fadeTime integer Time in frames for the sound to fade out
function SOUND:FadeOutSE(name, fadeTime) end

---Stops a continuous sound effect, fading out over a specified amount of time
---@param name string Sound file name, relative to the Content/SE/Battle folder
---@param fadeTime integer Time in frames for the sound to fade out
function SOUND:FadeOutBattleSE(name, fadeTime) end

---Plays a sound effect that temporarily mutes the music for its duration
---@param name string Sound file name, relative to the Content/SE folder
function SOUND:PlayFanfare(name) end

---This function waits for the currently playing fanfare to complete before continuing.
---@return function
function SOUND:WaitFanfare() end

---Plays a song, replacing the current one.
---@param name string The file name of the song, relative to the Content/Music folder.
---@param fade boolean Whether to fade the old song out, or start a new one.
---@param fadeTime? integer The amount of time, in frames, to fade out the old song.
function SOUND:PlayBGM(name, fade, fadeTime) end

---Stops playing the current song.
function SOUND:StopBGM() end

---Fades out the current song.
---@param fadeTime integer The amount of time, in frames, to fade out the song.
function SOUND:FadeOutBGM(fadeTime) end

---Sets the current volume of the song.
---@param val number A float value between 0 and 1
function SOUND:SetBGMVolume(val) end

---Gets the currently playing song. If the current song is fading out, gets the next song to be played.
---@return string
function SOUND:GetCurrentSong() end

---Initializes any LuaFunctions found in the class.
---Automatically on lua initialization.
---@param state engine The lua engine to initialize with.
function SOUND:SetupLuaFunctions(state) end