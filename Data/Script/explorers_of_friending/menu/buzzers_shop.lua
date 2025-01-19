require 'explorers_of_friending.common'

function BuzzerShopStart()
--- @param title "Buzzer's Shop" the title this window will have, string.
--- @param specialties table the specialties available in the menu. See ``ground.base_camp_2.base_camp_2_juice`` for format examples.
--- @param confirm_action function the function called when the selection is confirmed.
--- @param refuse_action function the function called when the player presses the cancel or menu button.
--- @param menu_width number the width of this window. Default is 152.
    local BuzzerShopMenu = Class('BuzzerShopMenu')
  function BuzzerShopMenu:initialize() --make the menu
    assert(self, "BuzzerShopMenu:initialize(): Error, self is nil!")
  
    self.items = {}
    self.slots = {}
    self.spacer = 30
    self.total_items = 5
  
    local height = 16 + 8 + self.total_items * self.spacer + 8 + 12
  
    self.menu = RogueEssence.Menu.ScriptableMenu(12, 12, 300, height, function(input) self:Update(input) end)
    self.cursor = RogueEssence.Menu.MenuCursor(self.menu)
    self.menu.Elements:Add(self.cursor)
  
  
    self.menu.Elements:Add(RogueEssence.Menu.MenuText(GAME:GetTeamName(), RogueElements.Loc(16, 8)))
    self.menu.Elements:Add(RogueEssence.Menu.MenuDivider(RogueElements.Loc(12, 8 + 12), self.menu.Bounds.Width - 12 * 2));
  
  
    -- Offset from menu divider and team name
    local offset = 16 + 8
  
    self.menu.Elements:Add(RogueEssence.Menu.MenuDivider(RogueElements.Loc(12, offset), self.menu.Bounds.Width - 12 * 2));
    self.current_item = 0
    --self.cursor.Loc = RogueElements.Loc(offset +)
    self.cursor.Loc = RogueElements.Loc(16, 24 + self.spacer * self.current_item)
  end

  function BuzzerShopMenu:SortCommand()
    
  end
  
  function BuzzerShopMenu:Update(input) --update the menu
    assert(self, "BaseState:Begin(): Error, self is nil!")
    -- default does nothing
    if input:JustPressed(RogueEssence.FrameInput.InputType.Confirm) then
        _GAME:SE("Menu/Confirm")
        _MENU:RemoveMenu()
    end
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
        self.cursor.Loc = RogueElements.Loc(16, 24 + self.spacer * self.current_item)
    end
  end
  local menu = BuzzerShopMenu:new()
  UI:SetCustomMenu(menu.menu)
  UI:WaitForChoice()
end


return BuzzerShopMenu