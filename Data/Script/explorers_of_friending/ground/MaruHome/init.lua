--[[
    init.lua
    Created: 08/25/2024 12:46:21
    Description: Autogenerated script file for the map MaruHome.
]]--
-- Commonly included lua functions and data
require 'explorers_of_friending.common'
require 'explorers_of_friending.ground.MaruHome.cutscene'

-- Package name
local MaruHome = {}

-------------------------------
-- Map Callbacks
-------------------------------
---MaruHome.Init(map)
--Engine callback function
function MaruHome.Init(map)
  GROUND:Hide("NotApple")
  MapStrings = STRINGS.MapStrings
  COMMON.RespawnAllies()
  local partner = CH('Teammate1')
  partner.CollisionDisabled = true
  if SV.tarro_town.PieChapter <= 1 then
    Bluetails.PieTime()
    SV.tarro_town.PieChapter = 2
  elseif SV.tarro_town.PieChapter == 4 then
    Bluetails.RealPieTime()
    Bluetails.AfterPieTime()
  elseif SV.tarro_town.PieChapter >= 10 then
    GROUND:Hide("Arama")
    GROUND:TeleportTo(CH("Amazuru"), 229, 248, Direction.DownRight, 0)
    if SV.tarro_town.PieChapter == 10 then
      UI:WaitShowTitle("Chapter 2:\nMysteries", 120)
      GAME:WaitFrames(30)
      UI:WaitHideTitle(120)
      Bluetails.MailTime()
    elseif SV.tarro_town.PieChapter == 11 and mail_read == true then
      -- Move checks to DarknessChapter
      Bluetails.AfterMailTime()
    end
    COMMON.CreateWalkArea("Amazuru", 195, 225, 72, 72)
  end
  GAME:FadeIn(20)
  AI:SetCharacterAI(partner, "origin.ai.ground_partner", CH('PLAYER'), partner.Position)
  GAME:CutsceneMode(false)
end

---MaruHome.Enter(map)
--Engine callback function
function MaruHome.Enter(map)

end





---MaruHome.Exit(map)
--Engine callback function
function MaruHome.Exit(map)


end

---MaruHome.Update(map)
--Engine callback function
function MaruHome.Update(map)

  local maru = CH("PLAYER")
  local azura = CH('Teammate1')

  if GAME:IsKeyDown(66) then
    print("Partner")
  end
  if GAME:IsKeyDown(66) then
    if SV.tarro_town.PieChapter == 2 then
      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Let's go find that big apple!")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("That's the new plan.")
    elseif SV.tarro_town.PieChapter == 5 then
      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("Gotta stop them now... I guess.")
    else
      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Inspired")
      UI:WaitShowDialogue("Yay! Home!")
    end
  end
end

---MaruHome.GameSave(map)
--Engine callback function
function MaruHome.GameSave(map)


end

---MaruHome.GameLoad(map)
--Engine callback function
function MaruHome.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------
function MaruHome.MaruOven_Action(obj, activator)
  local maru = CH("PLAYER")

  if SV.tarro_town.PieChapter <= 5 then
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("This is what mom uses to cook with...")

    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Though[pause=25], I should probably ask her for permission use it first...")
  end
end

function MaruHome.Arama_Action(obj, activator)
  local maru = CH("PLAYER")
  local arama = CH("Arama")
  GROUND:CharTurnToCharAnimated(arama, maru, 2)
  if SV.tarro_town.PieChapter < 5 then
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Okay, I know that you two are well-taught for this, but...")
    UI:WaitShowDialogue("Please,[pause=20] take your time. No rushing.")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("We'll be fine, mom, promise!")
  else
    UI:SetSpeaker(arama)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("I don't understand what's happening...")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("But have fun in town,[pause=30] I guess...?")
  end
  
end

function MaruHome.Amazuru_Action(obj, activator)
  local amazuru = CH("Amazuru")
  local azura = CH("Teammate1")
  local maru = CH("PLAYER")
  GROUND:CharTurnToCharAnimated(amazuru, maru, 2)

  if SV.tarro_town.PieChapter < 5 then
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Honestly, you two will be fine in there.")
    UI:WaitShowDialogue("Just try not to[pause=30] b[emote=Happy]ug[pause=30] t[emote=Normal]he locals.")

    GAME:WaitFrames(30)

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Wha-... was that a joke?")

    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Yep.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("[speed=0.05]...b[speed=1.0][emote=Determined]ooooooo.")
  elseif SV.tarro_town.PieChapter < 10 then
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Have fun out there, kiddos!")
  elseif SV.tarro_town.PieChapter < 15 then
    UI:SetSpeaker(amazuru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Shouldn't be too hard to find our mailbox,[pause=30] t[emote=Happy]he handle has our tail on it.")
  end
  
end

function MaruHome.MaruHome_BasementEntrance_Touch(obj, activator)
  local maru = CH("PLAYER")
  local azura = CH("Teammate1")

  if SV.tarro_town.PieChapter < 5 then
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Maru,[pause=35] apple!")
    
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Oh,[pause=15] yes,[pause=15] apple,[pause=15] yep.")
  elseif SV.tarro_town.PieChapter < 8 then
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("(Probably not the time...)")
  end
end

function MaruHome.MaruHomeExit_Touch(obj, activator)
  print("Exiting?")
  outside_enter = 1
  if SV.tarro_town.PieChapter >= 2 and SV.tarro_town.PieChapter <= 4 then
    print("Exiting?")
    GAME:FadeOut(false, 20)
    GAME:EnterGroundMap("TarroTownEast", "TTEast_MaruHomeEnter")
  elseif SV.tarro_town.PieChapter <= 8 then
    print("Exiting?")
    GAME:FadeOut(false, 20)
    GAME:EnterGroundMap("TarroTownEast_ch2", "TTEast_MaruHomeEnter")
  elseif SV.tarro_town.PieChapter <= 15 then
    print("Exiting?")
    GAME:FadeOut(false, 20)
    GAME:EnterGroundMap("TarroTownEast_ch3", "TTEast_MaruHomeEnter")
  else
    print("Exiting?")
    GAME:EnterGroundMap("TarroTownEast_extra", "TTEast_MaruHomeEnter")
  end
end

function MaruHome.Maru_BedSave_Touch(obj, activator)
  local maru = CH("PLAYER")
  UI:ResetSpeaker()
  UI:ChoiceMenuYesNo("Would you like to rest and save the game?", false)
  UI:WaitForChoice()
  local result = UI:ChoiceResult()
  if result then
    GAME:GroundSave()
    UI:WaitShowDialogue("Game saved!")
  else
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("(Not tired yet.[pause=40] L[emote=Happy]et's keep going.)")
  end
end

function MaruHome.WaterHole_Action(obj, activator)
  local maru = CH("PLAYER")
  local azura = CH("Teammate1")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Water hole!")

  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Water hole!")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Water hole. 9/10. Not enough water.")
end

return MaruHome

