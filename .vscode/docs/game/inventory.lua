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
function GAME:GetGuestEquippedItem(slot) end

---Gives an item and adds it to the player team's bag.
---@param item ItemID
function GAME:GivePlayerItem(item) end

---Gives an item and adds it to the player team's bag.
---In the usual context, the item is given from the RogueEssense item data type.
---The other three arguments are used when the item is defined in script.
---@param item ItemID
---@param count? integer
---@param cursed? boolean
---@param hiddenVal? string
function GAME:GivePlayerItem(item, count, cursed, hiddenVal) end

---Gets the item found at the specified slot of the player's bag.
---@param slot integer
---@return ItemID
function GAME:GetPlayerBagItem(slot) end
--[[
TakePlayerBagItem
GAME:TakePlayerBagItem(slot, takeAll)

Remove an item from player inventory

Parameters
Name	Type	Description
System.Int32	System.Int32	The slot from which to remove the item
System.Boolean	System.Boolean	


TakePlayerEquippedItem
GAME:TakePlayerEquippedItem(slot, takeAll)

Remove the equipped item from a chosen member of the team

Parameters
Name	Type	Description
System.Int32	System.Int32	The slot of the character on the team from which to remove the item
System.Boolean	System.Boolean	Removes all stacks if set to true, removes one if set to false. Has no effect for unstackable items.


TakeGuestEquippedItem
GAME:TakeGuestEquippedItem(slot, takeAll)

Remove the equipped item from a chosen guest of the team

Parameters
Name	Type	Description
System.Int32	System.Int32	The slot of the character on the team's guest list from which to remove the item
System.Boolean	System.Boolean	Removes all stacks if set to true, removes one if set to false. Has no effect for unstackable items.


GetPlayerStorageCount
GAME:GetPlayerStorageCount()

Get the amount of items in the player's storage



Returns
Type	Description
System.Int32	


GetPlayerStorageItemCount
GAME:GetPlayerStorageItemCount(id)

Get the amount of a specific item in the player's storage

Parameters
Name	Type	Description
System.String	System.String	ID of the item ot check
Returns
Type	Description
System.Int32	The amount of copies currently in storage


GivePlayerStorageItem
GAME:GivePlayerStorageItem(item)

Gives an item and adds it to the player team's storage.

Parameters
Name	Type	Description
RogueEssence.Dungeon.InvItem	RogueEssence.Dungeon.InvItem	The item to give


GivePlayerStorageItem
GAME:GivePlayerStorageItem(id, count, cursed, hiddenval)

Gives an item and adds it to the player team's storage.

Parameters
Name	Type	Description
System.String	System.String	The ID of the item
System.Int32	System.Int32	The amount to give. Default 1
System.Boolean	System.Boolean	Whether the item is cursed. Default false.
System.String	System.String	The hidden value of the item. Default empty string.


TakePlayerStorageItem
GAME:TakePlayerStorageItem(id)

Takes an item from the storage

Parameters
Name	Type	Description
System.String	System.String	The ID of the item to take


DepositAll
GAME:DepositAll()

Takes all items in the player team's bag and equipped items, and deposits them in storage.
]]