require 'explorers_of_friending.common'
BuzzerShopMenu = Class('BuzzerShopMenu')
  
function BuzzerShopMenu:initialize() --make the menu
  assert(self, "BuzzerShopMenu:initialize(): Error, self is nil!")
  self.menu = RogueEssence.Menu.ScriptableMenu(0, 0, 320, 190, function(input) self:Update(input) end)
  self.cursor = RogueEssence.Menu.MenuCursor(self.menu)
  self.spacer = 40
  self.column0 = 10 --first column, item icon
  self.column1 = 36 --second column, item name
  self.column2 = 90 --third column, item amount
  self.column3 = 180 --fourth column, item price
  UI:ResetBounds()
  UI:ResetSpeaker()
  for i = 1, #SV.buzzers_store, 1 do
    self.menu.Elements:Add(RogueEssence.Menu.MenuDirTex(RogueElements.Loc(self.column0, 24 + self.spacer * (i - 1)), RogueEssence.Menu.MenuDirTex.TexType.Item, RogueEssence.Content.AnimData(SV.buzzers_store[i].sprite, 1)))
    self.menu.Elements:Add(RogueEssence.Menu.MenuText(SV.buzzers_store[i].item, RogueElements.Loc(self.column1, 24 + self.spacer * (i - 1))))
    self.menu.Elements:Add(RogueEssence.Menu.MenuText(tostring(SV.buzzers_store[i].count), RogueElements.Loc(self.column2, 24 + self.spacer * (i - 1))))
    self.menu.Elements:Add(RogueEssence.Menu.MenuText(tostring(SV.buzzers_store[i].sell), RogueElements.Loc(self.column3, 24 + self.spacer * (i - 1))))
  end
  self.items = {}
  self.slots = {}
  self.menu.Elements:Add(self.cursor)
  local portrait = RogueEssence.Menu.MenuPortrait(RogueElements.Loc(216, 132), RogueEssence.Dungeon.MonsterID("beedrill", 0, "normal", Gender.Male), RogueEssence.Content.EmoteStyle(1, true))
  self.menu.Elements:Add(portrait)
  
  self.total_items = 4
  self.current_item = 1
  self.menu.Elements:Add(RogueEssence.Menu.MenuText(GAME:GetTeamName(), RogueElements.Loc(16, 8)))
    self.menu.Elements[9] = RogueEssence.Menu.MenuPortrait(RogueElements.Loc(200, 180), RogueEssence.Dungeon.MonsterID("beedrill", 0, "normal", Gender.Male), RogueEssence.Content.EmoteStyle(4, true))
end

local function SetEmote(emote)
    RogueEssence.Menu.MenuPortrait(RogueElements.Loc(200, 180), RogueEssence.Dungeon.MonsterID("beedrill", 0, "normal", Gender.Male), RogueEssence.Content.EmoteStyle(emote, true))
end
function BuzzerShopMenu:Update(input) --update the menu
  assert(self, "BaseState:Begin(): Error, self is nil!")
  -- default does nothing
    if input:JustPressed(RogueEssence.FrameInput.InputType.Confirm) then
        _GAME:SE("Menu/Confirm")
        if self.current_item == 0 then
            TASK:WaitTask(function()
            SetEmote(4)
            UI:WaitShowDialogue("...you really what one of these, buzz...?")
            SetEmote(1)
            UI:WaitShowDialogue("Alright, more dead weight off of our wingz.")

            SV.buzzers_store[current_item].count = SV.buzzers_store[current_item].count - 1
            GAME:RemoveFromPlayerMoney(SV.buzzers_store[current_item].price)
            GAME:GivePlayerItem(SV.buzzers_store[i].item)
            end)
        end
    elseif input:JustPressed(RogueEssence.FrameInput.InputType.Cancel) then
        _GAME:SE("Menu/Cancel")
        _MENU:RemoveMenu()
    else
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