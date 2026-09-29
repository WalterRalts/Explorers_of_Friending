---@meta _
---@diagnostic disable: duplicate-set-field

---Assign the given scripted AI class to the specified GroundChar.
---@param ch GroundCH The character to apply the AI to.
---@param classpath string The Scripted AI to apply.
---@param args? table
function AI:SetCharacterAI(ch, classpath, args) end

---Disable a given groundchar's AI processing until its enabled again.
---@param ch GroundCH
function AI:DisableCharacterAI(ch) end

---Enable a given groundchar's AI processing if its currently disabled.
---@param ch GroundCH
function AI:EnableCharacterAI(ch) end

---Force the AI to change to the specified state if it exists
---@param ch GroundCH
---@param state string
function AI:SetAIState(ch, state) end

---Initializes any LuaFunctions found in the class.
---Automatically on lua initialization.
---@param state engine
function AI:SetupLuaFunctions(state) end