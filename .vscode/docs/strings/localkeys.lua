---@meta
---@diagnostic disable: duplicate-set-field
---Functions to control strings and text in textboxes
---@class STRINGS

---Returns the current language setting of the game, represented by a locale code.
---@return string
function STRINGS:LocaleCode() end
--[[
Format
Formats a string. Will unescape escaped characters and process grammar tags. Returns the formatted string. Argument order is STRINGS:Format(str, args).

Arguments
Name	Type	Technical Type	Purpose
str	String	System.String	The string to format.
args	Table	System.Object[]	Additional arguments to pass into the string being formatted.
FormatKey
Formats a string given a string key. Will unescape escaped characters. Argument order is STRINGS:FormatKey(str, args).

Arguments
Name	Type	Technical Type	Purpose
str	String	System.String	The string to format.
args	Table	System.Object[]	Additional arguments to pass into the string being formatted.
LocalKeyString
Returns the string representing a button or key. Argument order is STRINGS:LocalKeyString(index).

Arguments
Name	Type	Technical Type	Purpose
inputID	Integer	System.Int32	The input type of the input.
CreateList
Builds and returns a single string of comma separated elements. Argument order is STRINGS:CreateList().

Arguments
Name	Type	Technical Type	Purpose
listStrings	Table of Strings	NLua.LuaTable	LuaTable of strings containing the elements to build the list from.]]
