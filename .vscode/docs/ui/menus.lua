--[[NameMenu
UI:NameMenu(title, desc, maxLength, defaultName)

Displays the name input box.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the choice is returned.
Then to retrieve the string value indicating the result of the menu, UI:ChoiceResult() must be called.

Parameters
Name	Type	Description
System.String	System.String	The text to show above the input line.
System.String	System.String	The text to show below the input line.
System.Int32	System.Int32	The length limit of the text in pixels.
System.String	System.String	Name to start the textbox with.

AssemblyMenu
UI:AssemblyMenu()

Displays a menu for replacing party members with the assembly.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the choice is returned.
Then to retrieve the boolean value indicating whether the team composition was changed or not, UI:ChoiceResult() must be called.]]

---Displays the Shop menu.
---UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
---and for execution to suspend until the choice is returned.
---Then to retrieve the table indicating the indices of items chosen, UI:ChoiceResult() must be called.
---@param goods table A table of items to be sold. The format is { Item=InvItem, Price=int } for each item.
function UI:ShopMenu(goods) end

---Displays the Sell menu.
---UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
---and for execution to suspend until the choice is returned.
---Then to retrieve the table indicating the indices of items to sell, UI:ChoiceResult() must be called.
function UI:SellMenu() end

--[[StorageMenu
UI:StorageMenu()

Displays the Storage menu for which to exchange items in the inventory with.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the menu is exited.





WithdrawMenu
UI:WithdrawMenu()

Displays the Storage menu for which to withdraw from.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the menu is exited.





BankMenu
UI:BankMenu()

Displays the Bank menu.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the menu is exited.





SpoilsMenu
UI:SpoilsMenu(appraisalMap)

Displays the Spoils menu.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the menu is exited.

Parameters
}
Name	Type	Description
NLua.LuaTable	NLua.LuaTable	A table of mappings from containers to items, in the format of { Box=InvItem , Item=InvItem


AppraiseMenu
UI:AppraiseMenu()

Displays the Appraisal menu.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the choice is returned.
Then to retrieve the table indicating the indices of items chosen, UI:ChoiceResult() must be called.





TutorTeamMenu
UI:TutorTeamMenu(eligibleCheck)

Displays the Tutor Team menu.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the choice is returned.
Then to retrieve the integer representing the chosen team member, UI:ChoiceResult() must be called.

Parameters
Name	Type	Description
NLua.LuaFunction	NLua.LuaFunction	


RelearnMenu
UI:RelearnMenu(chara)

Displays the Relearn menu for a character.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the choice is returned.
Then to retrieve the integer representing the chosen skill, UI:ChoiceResult() must be called.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to relearn skills


LearnMenu
UI:LearnMenu(chara, skillNum)

Displays the Learn menu for a character to replace an existing skill with a new one.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the choice is returned.
Then to retrieve the integer representing the chosen skill, UI:ChoiceResult() must be called.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to relearn skills
System.String	System.String	The new skill


ForgetMenu
UI:ForgetMenu(chara)

Displays the Forget menu for a character to forget a skill.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the choice is returned.
Then to retrieve the integer representing the chosen skill, UI:ChoiceResult() must be called.

Parameters
Name	Type	Description
RogueEssence.Dungeon.Character	RogueEssence.Dungeon.Character	The character to relearn skills


ShowPromoteMenu
UI:ShowPromoteMenu()

Displays the Promote menu to choose a team member to promote.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the choice is returned.
Then to retrieve the integer representing the chosen team slot, UI:ChoiceResult() must be called.





CanSwapMenu
UI:CanSwapMenu(goods)

Determines if the swap menu has any valid items to display.

Parameters
Name	Type	Description
NLua.LuaTable	NLua.LuaTable	The list of goods to filter for valid items.
Returns
Type	Description
System.Boolean	True if there is at least one item that can be displayed, false otherwise.


SwapMenu
UI:SwapMenu(goods, prices)

Displays the swap menu with a table of goods and prices.

Parameters
Name	Type	Description
NLua.LuaTable	NLua.LuaTable	
NLua.LuaTable	NLua.LuaTable	


TributeMenu
UI:TributeMenu(spaces)

Displays the tribute menu.

Parameters
Name	Type	Description
System.Int32	System.Int32	


ShowMusicMenu
UI:ShowMusicMenu(hardMod, spoilerUnlocks)

Displays the Music menu to browse music for the game.

UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the choice is returned.
Then to retrieve the string representing the chosen song, UI:ChoiceResult() must be called.

Parameters
Name	Type	Description
System.Boolean	System.Boolean	Set to true if you want to only include music of the current quest mod.
NLua.LuaTable	NLua.LuaTable	A lua table of strings representing progression flags that have been completed.
Any ogg file that uses this tag as a spoiler tag will display in the menu only if the flag has been passed.


DungeonChoice
UI:DungeonChoice(name, dest)

Ask to enter a destintion via character dialogue to the player.
UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the choice is returned.
Then to retrieve the integer value indicating the result of the menu, UI:ChoiceResult() must be called.

The Yes/No menu returns 1 for yes, and 0 for no.

Parameters
Name	Type	Description
System.String	System.String	Name of the destination
RogueEssence.Dungeon.ZoneLoc	RogueEssence.Dungeon.ZoneLoc	The ZoneLoc location of the destination.


DestinationMenu
UI:DestinationMenu(destinations, defaultChoice)

Marks the start of a choice menu for choosing destinations, showing a preview of restrictions and requirements for dungeons.
UI:WaitForChoice() must be called afterwards for the menu to be actually displayed,
and for execution to suspend until the choice is returned.
Then to retrieve the ZoneLoc indicating the chosen destination, UI:ChoiceResult() must be called.

Parameters
}
Name	Type	Description
NLua.LuaTable	NLua.LuaTable	A lua table representing the list of destinations with each element in the format of { Name=string, Dest=ZoneLoc
System.Object	System.Object	
]]