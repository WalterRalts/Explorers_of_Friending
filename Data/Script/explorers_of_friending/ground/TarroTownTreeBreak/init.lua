--[[
    init.lua
    Created: 12/28/2024 20:32:14
    Description: Autogenerated script file for the map TarroTownTreeBreak.
]]--
-- Commonly included lua functions and data
require 'explorers_of_friending.common'

-- Package name
local TarroTownTreeBreak = {}

-------------------------------
-- Map Callbacks
-------------------------------
---TarroTownTreeBreak.Init(map)
--Engine callback function
function TarroTownTreeBreak.Init(map)
  SleepingPuchi = false
  MapStrings = STRINGS.MapStrings
  COMMON.RespawnAllies()
  local partner = CH('Teammate1')
  AI:SetCharacterAI(partner, "origin.ai.ground_partner", CH('PLAYER'), partner.Position)
  partner.CollisionDisabled = true
  if SV.tarro_tree_hollows.revisit == true then
    GROUND:Hide("Puchi")
    GROUND:Hide("Senna")
    GROUND:Hide("Ziggy")
  else
    Cute_talk = false
    TarroTownTreeBreak.BreakTime()
  end
end

---TarroTownTreeBreak.Enter(map)
--Engine callback function
function TarroTownTreeBreak.Enter(map)
  
  GAME:FadeIn(20)

end

---TarroTownTreeBreak.Exit(map)
--Engine callback function
function TarroTownTreeBreak.Exit(map)


end

---TarroTownTreeBreak.Update(map)
--Engine callback function
function TarroTownTreeBreak.Update(map)
  local puchi = CH('Puchi')
  if SleepingPuchi == false then
    GROUND:CharSetEmote(puchi, "Sleep", 0)
    GROUND:CharSetAnim(puchi, "Sleep", true)
    SleepingPuchi = true
  end
end

---TarroTownTreeBreak.GameSave(map)
--Engine callback function
function TarroTownTreeBreak.GameSave(map)


end

---TarroTownTreeBreak.GameLoad(map)
--Engine callback function
function TarroTownTreeBreak.GameLoad(map)

  GAME:FadeIn(20)

end

function TarroTownTreeBreak.BreakTime()
  local azura = CH('Teammate1')
  local maru = CH('PLAYER')

  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Inspired")
  UI:WaitShowDialogue("Ooh, what's this place?")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Looks like it's break time!")
end
-------------------------------
-- Entities Callbacks
-------------------------------

function TarroTownTreeBreak.Cute_Action(obj, activator)
  local cute = CH("Cute")
  local azura = CH('Teammate1')
  local maru = CH('PLAYER')
  pouch_money = GAME:GetPlayerMoney()

  if Cute_talk == false then
    UI:SetSpeaker(cute)
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("Oh my goodness, hi hi hi!")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Aren't you that honey seller...?")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("And how did you get through the [color=#01FE10]Big Tree[color]'s defenses?")

    UI:SetSpeaker(cute)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("The Tree doesn't seem to recognize me![pause=10] Don't know why, but I would've been toast!")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("[speed=0.6]...[speed=1.2]anyway...")
    Cute_talk = true
  end

  UI:SetSpeaker(cute)
  UI:SetSpeakerEmotion("Happy")
  local choices = {("Yes!"),
        ("No!")}
    UI:BeginChoiceMenu("What some honey?! Only 100 Poke!", choices, 1, 2)
    UI:WaitForChoice()
    result = UI:ChoiceResult()
    if result == 1 then
      if pouch_money < 100 then
        COMMON.CharSweatdrop("Cute")
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Sorry, I can't just give these on a discount.")
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Besides, I'm sure getting through here is worth the honey, so[emote=Happy] I'd get your money up if I were you.")
      else
        SOUND:PlaySE("Battle/DUN_Money")
        GAME:RemoveFromPlayerMoney(100)
        SOUND:PlaySE("EVT_CH02_Item_Place")
        GAME:WaitFrames(20)
        for i = 1, 10, 1 do
          local cute_spin = math.random(1, 4)
          if cute_spin == 1 then
            GROUND:CharAnimateTurn(cute, Direction.Up, 2, true)
          elseif cute_spin == 2 then
            GROUND:CharAnimateTurn(cute, Direction.Down, 2, true)
          elseif cute_spin == 3 then
            GROUND:CharAnimateTurn(cute, Direction.Down, 2, false)
          elseif cute_spin then
            GROUND:CharAnimateTurn(cute, Direction.Up, 2, false)
          end
        end
        GAME:WaitFrames(10)
        GROUND:CharAnimateTurn(cute, Direction.DownLeft, 2, false)        
        UI:SetSpeakerEmotion("Happy")
        GAME:GivePlayerItem("packed_honey")
        UI:WaitShowDialogue("There you go! Enjoy!")
        
        GROUND:Hide("PurchasedHoney")
        UI:SetSpeaker(azura)
        UI:SetSpeakerEmotion("Joyous")
        UI:WaitShowDialogue("Yeah! Honey!")
      end
    else
      UI:SetSpeaker(cute)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Oh? Not today? Oh well,[pause=35] s[emote=Happy]afe travels, then!")
    end

end

function TarroTownTreeBreak.Sproutious_Action(obj, activator)
  local sprout = CH("Sproutious")

  if SV.tarro_tree_hollows.sprout_money_give == false then
    UI:SetSpeaker(sprout)
    UI:SetSpeakerEmotion("Inspired")
    UI:WaitShowDialogue("O heaven, dost my mouth decieve me so.")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("For this honey is the most delectable delicacy that my buds of taste hast ever layest against.")
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("Alas, I haveth not sufficient Poke more on my person to consume more of these well crafted jars...")
    COMMON.FaceEachother("Sproutious", "PLAYER")
    UI:SetSpeakerEmotion("Surprised")
    GAME:WaitFrames(25)
    COMMON.CharExclaim("Sproutious")
    UI:WaitShowDialogue("GASP!")
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Ah[pause=15], you dare etch my eyes with not tasting this fine honey.")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("It is within luck that I may well be generous, since while it isn't enough, it shall only get you closer.")
    local honeymoney = math.random(30, 60)
    GAME:AddToPlayerMoney(honeymoney)
    SOUND:PlaySE("Battle/DUN_Money")
    UI:ResetSpeaker()
    UI:WaitShowDialogue("Sir Sproutious gives Maru "..honeymoney.." Poke.")

    GROUND:CharAnimateTurn(sprout, Direction.Left, 2, false)
    UI:SetSpeaker(sprout)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Next time, you shall return and I will give more.[pause=0] As for now, leave me be with my delectable sweet...!")
    SV.tarro_tree_hollows.sprout_money_give = true
  else
    UI:SetSpeaker(sprout)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Next time, you shall return and I will give more.[pause=0] L[emote=Inspired]eave me be with my delectable sweet...!")
  end
end

function TarroTownTreeBreak.Puchi_Action(obj, activator)
  local maru = CH("PLAYER")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("(Puchi was pretty tired in that dungeon...)")
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("(I think I'll let him sleep until we're ready to go.)")
end

function TarroTownTreeBreak.Senna_Action(obj, activator)
  local maru = CH("PLAYER")
  local azura = CH("Teammate1")
  local senna = CH('Senna')
  COMMON.FaceEachother("PLAYER", "Senna")
  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Sigh")
  UI:WaitShowDialogue("Phew. What a relief.")
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowTimedDialogue("Let us know when you're ready to go.[pause=45] I'm sure we[emote=Determined]'re almost there.", 35)

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowTimedDialogue("Yep yep!", 40)

  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowTimedDialogue("Yeah!", 40)

  GAME:WaitFrames(30)
  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("By the way...")
  GROUND:CharAnimateTurn(senna, Direction.UpLeft, 4, false)
  GAME:WaitFrames(10)
  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("I've seen these things all over the place.")
  UI:WaitShowDialogue("I think dad said we could use it to store things, but...")
  COMMON.FaceEachother("PLAYER", "Senna")
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("...you know I don't get involved with dungeon stuff,[pause=25] h[emote=Happy]ehe.")
end

function TarroTownTreeBreak.Ziggy_Action(obj, activator)
  local ziggy = CH("Ziggy")

  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Sigh")
  UI:WaitShowDialogue("[color=#01FE10]This Big Tree[color] has so much history with everyone in the town...")
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("I couldn't imagine losing it... [pause=25]and all the people that love it.")

  GROUND:CharAnimateTurn(ziggy, Direction.Left, 4, false)
  UI:SetSpeakerEmotion("Sad")
  UI:WaitShowDialogue("My mom was[pause=10] born in here... [speed=0.75][pause=25]and [emote=Teary-Eyed]all the people that...")

  for i = 1, 2, 1 do
    GROUND:CharSetEmote(ziggy, "sweating", 1)
    GROUND:CharAnimateTurn(ziggy, Direction.DownLeft, 4, true)
    GROUND:CharAnimateTurn(ziggy, Direction.Left, 4, false)
    GROUND:CharAnimateTurn(ziggy, Direction.UpLeft, 4, false)
    GROUND:CharAnimateTurn(ziggy, Direction.Left, 4, true)
  end

  GAME:WaitFrames(15)
  COMMON.FaceEachother("Ziggy", "PLAYER")
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("But you know what,[pause=11] I think we can do it,[pause=25][emote=Joyous] and we probably won't stop trying until the tree is saved!")
  UI:SetSpeakerEmotion("Joyous")
  UI:WaitShowDialogue("Plus,[pause=11] exploring with you guys is fun![pause=35] You guys are the best!")
end

function TarroTownTreeBreak.Storage_Action(obj, activator)
  local senna = CH('Senna')
  GROUND:CharAnimateTurn(senna, Direction.UpLeft, 4, false)
  COMMON:ShowTeamStorageMenu()
  
  local senna_curious = math.random(1, 4)
  if senna_curious == 1 then
    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("How does that thing work anyway...?")
  elseif senna_curious == 2 then
    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("All ready?")
  elseif senna_curious == 3 then
    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Did you double check?[pause=65] J[emote=Happy]ust kidding...~")
  else
    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Hopefully it won't be too much trouble in there...")
  end
end

function TarroTownTreeBreak.LockedStairs_Action(obj, activator)
  if SV.tarro_tree_hollows.stairs_unlocked == false then
    UI:ResetSpeaker()
    UI:WaitShowDialogue("The way seems locked...")
    if GAME:FindPlayerItem("key_tree", true, true) >= 0 then
      SV.tarro_tree_hollows.stairs_unlocked = true
    else
      UI:WaitShowDialogue("There's a strange keyhole over the cover.")
    end
  else
  end
end

function TarroTownTreeBreak.TarroTreeHollows_Continue_Touch(obj, activator)
  local maru = CH("PLAYER")
  UI:ResetSpeaker()
  local choices = {
    ("Let's keep going!"),
    ("Wait...")
  }
  UI:BeginChoiceMenu("Continue?", choices, 1, 2)
  UI:WaitForChoice()
  result = UI:ChoiceResult()
  if result == 1 then
    --Keep Maru and Azura in the front
    --Add back the other members
    local total = 1
    local playeridx = GAME:GetTeamLeaderIndex()
    for i, p in ipairs(SV.tarro_tree_hollows.entering_party) do
      if i ~= (playeridx + 1) and i ~= (playeridx + 2) then --Indices in lua tables begin at 1
        GAME:AddPlayerTeam(_DATA.Save.ActiveTeam.Players:Add(p))
        --GROUND:GiveCharIdleChatter(chara)
        total = total + 1
        print(total)
      end
    end
    _DATA.Save.ActiveTeam.Players[2]:RefreshTraits()
    _DATA.Save.ActiveTeam.Players[3]:RefreshTraits()
    _DATA.Save.ActiveTeam.Players[4]:RefreshTraits()
    GAME:FadeOut(false, 20)
    GAME:ContinueDungeon("tarro_tree_hollows", 1, 0, 0)
  else
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("(Maybe there's more I can do first...?)")
  end
end

function TarroTownTreeBreak.TarroTreeHollows_End_Touch(obj, activator)
  local maru = CH("PLAYER")
  local ziggy = CH("Ziggy")
  UI:ResetSpeaker()
  local choices = {
    ("Time to go!"),
    ("Wait...")
  }
  UI:BeginChoiceMenu("Leave?", choices, 1, 2)
  UI:WaitForChoice()
  result = UI:ChoiceResult()
  if result == 1 then
    if SV.tarro_town.PieChapter == 8 then
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Angry")
      UI:WaitShowDialogue("OI![pause=35] Don't give up on me, Mar! Let's go let's go let's go!")
    else
      GAME:ContinueDungeon("tarro_tree_hollows", -1, 0, 0)
    end
  else
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("(We've got this!)")
  end
end

return TarroTownTreeBreak

