require 'explorers_of_friending.common'
require 'explorers_of_friending.event_interact'
function BATTLE_SCRIPT.Test(owner, ownerChar, context, args)
  PrintInfo("Test")
end
--boss interacts
local zoomed = false
function BATTLE_SCRIPT.ZoomerSass(owner, ownerChar, context, args)
  local ratio = context.User.HP / context.User.MaxHP
  PrintInfo(ratio)
  PrintInfo(context.User.Name)
  if context.User.Name == "???" and zoomed == false then
    if ratio <= 0.6 then
      UI:SetSpeaker(context.User)
      UI:SetSpeakerEmotion("Angry")
      UI:WaitShowDialogue("Buncha lousy kids,[pause=40] this is NOT over!")

      UI:SetSpeaker(_DATA.Save.ActiveTeam.Players[0])
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Wow, this guy sucks.")

      UI:SetSpeaker(_DATA.Save.ActiveTeam.Players[1])
      UI:SetSpeakerEmotion("Shouting")
      UI:WaitShowDialogue("Yeah! The pie is mine!")

      UI:SetSpeaker(_DATA.Save.ActiveTeam.Players[0])
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Guess we don't need too much planning, so, " .. STRINGS:LocalKeyString(7) .. " will turn Team Mode off.")
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("You still can't lead, though, Azura.")

      UI:SetSpeaker(_DATA.Save.ActiveTeam.Players[1])
      UI:SetSpeakerEmotion("Sad")
      UI:WaitShowDialogue("Awww...")

      zoomed = true
    end
  end
end

function BATTLE_SCRIPT.ItemGoal(owner, ownerChar, context, args)
  PrintInfo("TRIGGERED!")
  local baggy = {}
  for i = 0, GAME:GetPlayerBagCount() - 1, 1 do
    baggy[i] = GAME:GetPlayerBagItem(i).ID
  end

  --up to four random items with four random amounts in a table
  --compare with pairs to get item check and compare tables
  local tile_check = {}
  local bag_check = {}
  local slot = 0
  local count = map.Rand:Next(0, 4) + 1
  local item = map.Rand:Next(1, count)
  local amount = map.Rand:Next(1, 5)
  local function addToTable(itemID)
    for i = 0, amount do
      tile_check[slot + i] = itemID
    end
    slot = slot + amount
  end
  if item == 1 then
    addToTable("apple")
  elseif item == 2 then
    addToTable("crunchy_leaf")
  elseif item == 3 then
    addToTable("berry_oran")
  elseif item == 4 then
    addToTable("ammo_cacnea_spike")
  end
  table.sort(tile_check)
  local goodCheck = 0
  for i, v in ipairs(tile_check) do
    print(i, v)
    for ii, w in pairs(baggy) do
      print(ii, w)
      if v == w then
        goodCheck = goodCheck + 1
        bag_check[goodCheck] = w
        i = 1
      end
    end
  end
  table.sort(bag_check)
  if tile_check == bag_check then
    PrintDebug("PASS!")
  else
    context.User.Position.Y = context.User.Position.Y + 1
  end
end