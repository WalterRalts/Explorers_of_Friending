---@meta _
---@diagnostic disable: duplicate-set-field
---Functions to control things in the front, for UI
---@class UI

---Exports the speaker settings as a lua table.
---@return table
function UI:ExportSpeakerSettings() end

---Imports speaker settings from a lua table.
---@param tbl table
function UI:ImportSpeakerSettings(tbl) end

---Clears the current speaker, so none is displayed the next time TextDialogue is called.
---This also resets any custom dialogue box positions, portrait positions, and choice positions.
---@param keysound? boolean If true, the text from the dialogue boxes make sounds. Default is on.
function UI:ResetSpeaker(keysound) end

---Sets the speaker to be displayed during the following calls to the TextDialogue functions. It resets speaker emotion.
---@param name string
---@param keysound? boolean
---@param specie? string
---@param form? integer
---@param skin? string
---@param gender? Gender
function UI:SetSpeaker(name, keysound, specie, form, skin, gender) end

---Sets the speaker to be displayed during the following calls to the TextDialogue functions.
---It takes an existing GroundChar as a parameter.
---It resets speaker emotion.
---@param chara GroundCH
---@param keysound boolean
function UI:SetSpeaker(chara, keysound) end

---Reverses the speaker orientation to face left instead of right. This depends on the boolean passed in.
---@param reverse boolean Faces right if false, left if true.
function UI:SetSpeakerReverse(reverse) end

---Sets the position of the choices for a question dialog.
---@param x integer
---@param y integer
function UI:SetChoiceLoc(x, y) end

---Sets the position of the choices for a question dialog back to default.
function UI:ResetChoiceLoc() end

---Sets the position and size of the dialogue box.
---@param x integer The X position of the box, upper left
---@param y integer The Y position of the box, upper left
---@param width integer Width of the box
---@param height integer Height of the box
function UI:SetBounds(x, y, width, height) end

---Resets the position and size of the dialogue box.
function UI:ResetBounds() end

---Sets the centering of the text in the textbox.
---@param centerH boolean
---@param centerV boolean
function UI:SetCenter(centerH, centerV) end

---Sets the position of the speaker in a dialogue box.
---@param x integer
---@param y integer
function UI:SetSpeakerLoc(x, y) end

---Resets the position of the speaker in a dialogue box.
function UI:ResetSpeakerLoc() end

---Sets the emotion of the speaker in the dialogue box.
---@param emo PortEmote Emotion to display
---@param reverse? boolean Faces right if false or nil, left if true.
function UI:SetSpeakerEmotion(emo, reverse) end

--[[
SetAutoFinish
UI:SetAutoFinish(autoFinish)

Makes the text automatically finish when it shows up.

Parameters
Name	Type	Description
System.Boolean	System.Boolean	Auto-finishes text if true.


SetSe
UI:SetSe(newSe, speakTime)

Sets the speaker sound effect and speak frames played in the TextDialogue functions.

Parameters
Name	Type	Description
System.String	System.String	The sound effect of the box
System.Int32	System.Int32	The amount of frames to wait between each sound effect


SetSe
UI:SetSe(newSe)

Sets the speaker sound effect played in the TextDialogue functions.

Parameters
Name	Type	Description
System.String	System.String	The sound effect of the box]]

---Sets the speak frames played in the TextDialogue functions.
---@param speakTime integer The amount of frames to wait between each sound effect
function UI:SetSpeakTime(speakTime) end

---Resets to the default speaker sound effect and speaker frames.
function UI:ResetSe() end

---Displays the currently set dialogue box and waits for the player to complete it.
---@return function
function UI:WaitDialog() end