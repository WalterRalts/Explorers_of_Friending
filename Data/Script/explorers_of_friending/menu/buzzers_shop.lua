require 'explorers_of_friending.common'
BuzzerShopMenu = Class('BuzzerShopMenu')
  
function BuzzerShopMenu:initialize() --make the menu
  assert(self, "BuzzerShopMenu:initialize(): Error, self is nil!")
  self.menu = RogueEssence.Menu.ScriptableMenu(24, 24, 224, 194, function(input) self:Update(input) end)
  self.cursor = RogueEssence.Menu.MenuCursor(self.menu)
  self.spacer = 40
  self.column0 = 10
  self.column1 = 36
  self.column2 = 90
  self.column3 = 180
  self.menu.Elements:Add(self.cursor)
  local dirtex = RogueEssence.Menu.MenuDirTex(RogueElements.Loc(self.column0, 24 + self.spacer * 0), RogueEssence.Menu.MenuDirTex.TexType.Item, RogueEssence.Content.AnimData("plain_seed", 1))
  self.menu.Elements:Add(RogueEssence.Menu.MenuText("Plain Seed", RogueElements.Loc(self.column1, 24 + self.spacer * 0)))
  self.menu.Elements:Add(RogueEssence.Menu.MenuText(tostring(SV.buzzers_store.plain_seed.count), RogueElements.Loc(self.column2, 24 + self.spacer * 0)))
  self.menu.Elements:Add(RogueEssence.Menu.MenuText(tostring(SV.buzzers_store.plain_seed.sell), RogueElements.Loc(self.column3, 24 + self.spacer * 0)))
  self.items = {}
  self.slots = {}
  local portrait = RogueEssence.Menu.MenuPortrait(RogueElements.Loc(16, 32), RogueEssence.Dungeon.MonsterID("beedrill", 0, "normal", Gender.Male), RogueEssence.Content.EmoteStyle(1, true))
  self.menu.Elements:Add(portrait)
  self.total_items = 4
  self.current_item = 1

  self.menu.Elements:Add(RogueEssence.Menu.MenuText(GAME:GetTeamName(), RogueElements.Loc(16, 8)))
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
      self.cursor.Loc = RogueElements.Loc(26, 24 + self.spacer * self.current_item)
  end
end