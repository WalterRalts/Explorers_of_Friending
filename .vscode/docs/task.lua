---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class TASK

---Helper function to make an entity run the specified task.
---Will not replace a running task!
---Tasks are run interlocked with the script processing and game processing, and characters cannot run multiple tasks at the same time.
---@param ent GroundCH Entity which will run the task.
---@param fn function The task the entity will run.
---@return any
function TASK:StartEntityTask(ent, fn) end

---Helper function to force stop an entity's current task.
---@param ent GroundCH
function TASK:StopEntityTask(ent) end
--[[
WaitStartEntityTask
TASK:WaitStartEntityTask(obj)

Makes an entity run a specified task, and waits for it to complete.

Parameters
Name	Type	Description
System.Object	System.Object	The task to wait on.
Returns
Type	Description
NLua.LuaFunction	


WaitEntityTask
TASK.WaitEntityTask

Type: NLua.LuaFunction

Makes an entity run a specified task, and waits for it to complete.



WaitTask
TASK.WaitTask

Type: NLua.LuaFunction

Runs a task and waits for it to complete.
C# methods that return Coroutines or IEnumerator<YieldInstruction> need to be wrapped with this.



StartScriptLocalCoroutine
TASK:StartScriptLocalCoroutine(fn, args)

A wrapper around the StartCoroutine method of the GameManager, so lua coroutines can be executed locally to the script context.
It will block the script execution while its executed.

Parameters
Name	Type	Description
NLua.LuaFunction	NLua.LuaFunction	The function to execute with blocking.
System.Object[]	System.Object[]	Arguments to call the function with.
Returns
Type	Description
RogueEssence.Coroutine	


BranchCoroutine
TASK:BranchCoroutine(obj)

Starts a new coroutine to run parallel to the current execution.
Useful for performing multiple actions at once.

Parameters
Name	Type	Description
System.Object	System.Object	The task to run in parallel
Returns
Type	Description
RogueEssence.Coroutine	


JoinCoroutines
TASK:JoinCoroutines(coroTable)

Waits for all specified coroutines to finish before continuing execution.
Often used for coroutines created using TASK:BranchCoroutine()

Parameters
Name	Type	Description
NLua.LuaTable	NLua.LuaTable	A table of coroutines to wait on.
Returns
Type	Description
NLua.LuaFunction
]]

---Initializes any LuaFunctions found in the class.
---Automatically on lua initialization.
---@param state engine
function TASK:SetupLuaFunctions(state) end