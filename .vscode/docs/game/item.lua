---@meta _
---@diagnostic disable: duplicate-set-field
---Functions to control things on the ground
---@class GAME

---Finds an item in the player's team and returns its slot within the inventory or among its team's equips.
---Returns the inventory slot of the item, but is invalid if no item was found.
---@param ID string | ItemID
---@param checkHeld boolean
---@param checkInv boolean
---@return integer
function GAME:FindPlayerItem(ID, checkHeld, checkInv) end

---Returns the number of items equipped by players. Does not include guests.
---@return integer
function GAME:GetPlayerEquippedCount() end

---Returns the number of items in the bag.
---@return integer
function GAME:GetPlayerBagCount() end

---Returns the maximum amount of item the player's team can carry.
---@return integer
function GAME:GetPlayerBagLimit() end

---Returns the equipped item for the character in the specified slot. 
---@param slot integer
---@return ItemID
function GAME:GetPlayerEquippedItem(slot) end

---Returns the equipped item for the character in the specified guest slot.
---@param slot integer
---@return ItemID
function GAME:GetPlayerEquippedItem(slot) end


---Gives an item and adds it to the player team's bag.
---In the usual context, the item is given from the RogueEssense item data type.
---The other three arguments are used when the item is defined in script.
---@param item any
---@param count? integer
---@param cursed? boolean
---@param hiddenVal? string
function GAME:GivePlayerItem(item, count, cursed, hiddenVal) end
--[[
GetPlayerBagItem
Returns the item found at the specified slot of the player's bag. Argument order is GAME:().

Arguments
Name	Type	Technical Type	Purpose
TakePlayerBagItem
Remove an item from player's inventory. Argument order is GAME:TakePlayerBagItem(takeAll, slot).

Arguments
Name	Type	Technical Type	Purpose
slot	Integer	System.Int32	The slot from which to remove the item
takeAll	Boolean	System.Boolean	True to remove all of that item, false to not
TakePlayerEquippedItem
Remove the equipped item from a chosen member of the team. Argument order is GAME:TakePlayerEquippedItem(slot, takeAll).

Arguments
Name	Type	Technical Type	Purpose
slot	Integer	System.Int32	The slot of the character on the team from which to remove the item
takeAll	Boolean	System.Boolean	(Undocumented)
TakeGuestEquippedItem
Remove the equipped item from a chosen guest of the team. Argument order is GAME:TakeGuestEquippedItem(slot, takeAll).

Arguments
Name	Type	Technical Type	Purpose
slot	Integer	System.Int32	The slot of the character in the guest list from which to remove the item
takeAll	Boolean	System.Boolean	(Undocumented)
GetPlayerStorageCount
Returns the amount of items in the player's storage.

GetPlayerStorageItemCount
Returns the amount of a specific item in the player's storage. Argument order is GAME:GetPlayerStorageItemCount(id).

Arguments
Name	Type	Technical Type	Purpose
id	Integer	System.Int32	The ID of the item to take
GivePlayerStorageItem
Returns an item and adds it to the player team's storage.

Context 1
In this context, the item is given from the RogueEssense item data type. Argument order is GAME:GivePlayerStorageItem(item).

Name	Type	Technical Type	Purpose
item	Inventory Item	RogueEssence.Dungeon.InvItem	
Context 2
In this context, the item is defined in the script. Argument order is GAME:GivePlayerStorageItem(id, count, cursed, hiddenVal).

Name	Type	Technical Type	Purpose
id	String	System.String	The ID of the item
count	Integer	System.Int32	The amount to give. Default 1
isCursed	Boolean	System.Boolean	Whether the item is cursed. Default false.
hiddenVal	String	System.String	The hidden value of the item. Default empty string.


TakePlayerStorageItem
Takes an item from the storage. Argument order is GAME:TakePlayerStorageItem(id).

Arguments
Name	Type	Technical Type	Purpose
id	String	System.String	The ID of the item to take
DepositAll
Takes all items in the player team's bag and equipped items, and deposits them in storage.]]