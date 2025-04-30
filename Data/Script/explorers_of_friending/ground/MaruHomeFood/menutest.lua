function CookingMenu:initialize()
    assert(self, "ExampleMenu:initialize(): Error, self is nil!")
    self.menu = RogueEssence.Menu.ScriptableMenu(36, 112, 250, 128, function(input) self:Update(input) end)
    self.cursor = RogueEssence.Menu.MenuCursor(self.menu)
    self.menu.Elements:Add(self.cursor)

    for i = 1, GAME:GetPlayerBagCount() - 1, 1 do
        self.menu.Elements:Add(RogueEssence.Menu.MenuText(GAME:GetPlayerBagItem(i).ID, RogueElements.Loc(16, 8 + (12 * (i - 1)))))
        local icon = RogueEssence.Menu.MenuDirTex(RogueElements.Loc(64, 32), RogueEssence.Menu.MenuDirTex.TexType.Item, RogueEssence.Content.AnimData(GAME:GetPlayerBagItem(i).Sprite, 1))
        self.menu.Elements:Add(icon)
    end
    self.total_items = GAME:GetPlayerBagCount()
    self.current_item = 0
    self.cursor.Loc = RogueElements.Loc(8 + 12 * (self.current_item % 2), 8 + 80 * (self.current_item // 2))
  end
  
  function ExampleMenu:Update(input)
    assert(self, "BaseState:Begin(): Error, self is nil!")
    -- default does nothing
    if input:JustPressed(RogueEssence.FrameInput.InputType.Confirm) then
      _GAME:SE("Menu/Confirm")
      Ingredient_chosen = self.current_item
      Ingredient_name = self.current_item
      GAME:TakePlayerBagItem(Ingredient_chosen)

      --[[if self.current_item > 2 then
        local choices = { RogueEssence.Menu.MenuTextChoice(STRINGS:FormatKey("DLG_CHOICE_YES"), LUA_ENGINE:MakeLuaAction(function() _GAME:SE("Fanfare/RankUp")  end) ),
          { STRINGS:FormatKey("MENU_INFO"), false, function() end  },
          { STRINGS:FormatKey("DLG_CHOICE_NO"), true, function() _MENU:RemoveMenu() end }}
        submenu = RogueEssence.Menu.ScriptableSingleStripMenu(220, 24, 24, choices, 1, function() _MENU:RemoveMenu() end)
        _MENU:AddMenu(submenu, true)
      end]]--
    elseif input:JustPressed(RogueEssence.FrameInput.InputType.Cancel) then
      _GAME:SE("Menu/Cancel")
      _MENU:RemoveMenu()
    else
      moved = false
      if RogueEssence.Menu.InteractableMenu.IsInputting(input, LUA_ENGINE:MakeLuaArray(Dir8, { Dir8.Down, Dir8.DownLeft, Dir8.DownRight })) then
        moved = true
        self.current_item = (self.current_item + 1) % self.total_items
      elseif RogueEssence.Menu.InteractableMenu.IsInputting(input, LUA_ENGINE:MakeLuaArray(Dir8, { Dir8.Up, Dir8.UpLeft, Dir8.UpRight })) then
        moved = true
        self.current_item = (self.current_item + self.total_items - 1) % self.total_items
      end
      if moved then
        _GAME:SE("Menu/Select")
        self.cursor:ResetTimeOffset()
        self.cursor.Loc = RogueElements.Loc(8 + 80 * (self.current_item % 2), 8 + 12 * (self.current_item // 2))
      end
    end
  end


  item_name = {}

  for i = 0, GAME:GetPlayerBagCount() - 1, 1 do
      item_name[i] = GAME:GetPlayerBagItem(i).ID
  end
  item_name[100] = "Exit"

  UI:BeginMultiPageMenu(
      36,
      112,
      250,
      "Ingredient choice",
      item_name,
      5,
      1,
      100
  )
  UI:WaitForChoice()
  
  if UI:ChoiceResult() == 100 then
      print("Exit chosen.")
      Exit_cooking = true
      return "Exit"
  else
      Ingredient_chosen = UI:ChoiceResult()
      print(Ingredient_chosen)
      Ingredient_name = item_name[Ingredient_chosen]
      GAME:TakePlayerBagItem(Ingredient_chosen)
      print(Ingredient_name .. " has been removed from slot " .. Ingredient_chosen + 1)
  end
  
  return Ingredient_name