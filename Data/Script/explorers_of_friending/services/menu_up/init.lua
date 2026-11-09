require 'origin.services.baseservice'

local EditMenu = Class('EditMenu', BaseService)

function ItemDescriber()
      UI:BeginMultiPageMenu(24, 24, 196, "Description", choices, 8, 1, #choices)
      UI:WaitForChoice()
end

function EditMenu:initialize()
      BaseService.initialize(self)
      PrintInfo('EditMenu:initialize()')
      self.item_menu = true
end

function EditMenu:OnAddMenu(menu)
      local labels = RogueEssence.Menu.MenuLabel
      
      if menu:HasLabel() then
            PrintInfo((menu.Label .. " has been opened."))
            PrintInfo(("The F key was held during its opening: " .. tostring(GAME:IsKeyDown(70))))
            if RogueEssence.GameManager.Instance.CurrentScene == RogueEssence.Dungeon.DungeonScene.Instance then
                  --[[if menu.Label == "ITEM_CHOSEN_MENU" then
                        self.item_menu = false
                        PrintInfo("This is the menu to change.")
                        local index = menu:GetChoiceIndexByLabel(labels.ITEM_CHOSEN_MENU)
                        if index < 0 then
                              index = math.min(1, menu.Choices.Count)
                        end
                        PrintInfo(index)
                        local choices = menu:ExportChoices()
                        choices:Insert(index, RogueEssence.Menu.MenuTextChoice("ITEM_CHOSEN_MENU", "More Details", function() _MENU:AddMenu(RecruitmentListMenu:new().menu, false) end))
                        menu:ImportChoices(choices)
                  elseif menu.Label == "INVENTORY_MENU" then
                        self.item_menu = true
                  end]]
            end
      end
end

function EditMenu:Subscribe(med)
      med:Subscribe("EditMenu", EngineServiceEvents.AddMenu, function(_, args) self:OnAddMenu(args[0]) end )
end

SCRIPT:AddService("EditMenu", EditMenu:new())
return EditMenu