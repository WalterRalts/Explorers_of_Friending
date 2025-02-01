--[[
    init.lua
    Created: 09/05/2024 13:00:56
    Description: Autogenerated script file for the map TarroTownSquare.
]]--
-- Commonly included lua functions and data
require 'explorers_of_friending.common'
require 'explorers_of_friending.ground.TarroTownSquare.cutscene'

-- Package name
local TarroTownSquare = {}

-------------------------------
-- Map Callbacks
-------------------------------
---TarroTownSquare.Init(map)
--Engine callback function
function TarroTownSquare.Init(map)
  
  MapStrings = STRINGS.MapStrings
  COMMON.RespawnAllies()
  local partner = CH('Teammate1')
  local munch = CH('Munch')
  local lax = CH("Lax")
  local ziggy = CH("Ziggy")
  
  partner.CollisionDisabled = true
  
  if SV.tarro_town.PieChapter == 5 then
    Square.FightFightFight()
  end
  if quiz_done == 1 and outside_enter == 1 then
    GROUND:TeleportTo(partner, 504, 378, Direction.Left, 0)
  end
  if outside_enter == 3 then
    GROUND:TeleportTo(partner, 30, 254, Direction.Right, 0)
  end
  if outside_enter == 4 then
    GROUND:TeleportTo(partner, 405, 230, Direction.Down, 0)
  end
  if SV.tarro_town.PieChapter >= 7 then
    ziggy.CollisionDisabled = true
    if SV.tarro_tree_hollows.tree_entered == false then
      Square.AfterQuiz()
    end
    SOUND:PlayBGM("None", false, 0)
    GROUND:TeleportTo(munch, 455, 210, Direction.Down, 2)
    GROUND:TeleportTo(lax, 390, 210, Direction.Left, 2)
    GROUND:Hide("Ziggy")
    if SV.tarro_tree_hollows.tree_entered == true then
      GROUND:Hide("Senna")
      GROUND:Hide("Puchi")
    end
  end
  AI:SetCharacterAI(partner, "origin.ai.ground_partner", CH('PLAYER'), partner.Position)
end

---TarroTownSquare.Enter(map)
--Engine callback function
function TarroTownSquare.Enter(map)

  GAME:FadeIn(20)

end

---TarroTownSquare.Exit(map)
--Engine callback function
function TarroTownSquare.Exit(map)


end

---TarroTownSquare.Update(map)
--Engine callback function
function TarroTownSquare.Update(map)
  local lax = CH("Lax")
  local sleepy_lax = false
  if sleepy_lax == false then
    GROUND:CharSetAnim(lax, "Sleep", true)
    sleepy_lax = true
  end
  
  local maru = CH("PLAYER")
  local azura = CH('Teammate1')

  if GAME:IsKeyDown(66) then
    if SV.tarro_town.PieChapter == 6 then
      if quiz_available then
        UI:SetSpeaker(azura)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("The town isn't that big, right?")

        UI:SetSpeaker(maru)
        GROUND:CharTurnToCharAnimated(maru, azura, 4)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("You getting worried, Azura?")
        UI:WaitShowDialogue("I could answer all the questions if you want me to.")

        UI:SetSpeaker(azura)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("Huh?! [pause=45]N[emote=Angry]o! Don't you dare!")
      else
        UI:SetSpeaker(azura)
        GROUND:CharTurnToCharAnimated(maru, azura, 4)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Let's go meet up with the others!")
        UI:WaitShowDialogue("They might know more about town!")

        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Yep.")
      end
    elseif SV.tarro_town.PieChapter == 7 then
      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("Wonder why no one else is noticing...")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("So do I, but...")
    else
      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Yeah, town!")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Whoo, town!")  
    end
  end
end

---TarroTownSquare.GameSave(map)
--Engine callback function
function TarroTownSquare.GameSave(map)


end

---TarroTownSquare.GameLoad(map)
--Engine callback function
function TarroTownSquare.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------
---
function TarroTownSquare.Munch_Action(obj, activator)
  local munch = CH("Munch")
  local lax = CH("Lax")

  UI:SetSpeaker(munch)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Pops... getcha self up, would ya.")
  
end

function TarroTownSquare.Lax_Action(obj, activator)
  local munch = CH("Munch")
  local lax = CH("Lax")
  GROUND:CharSetAnim(lax, "Sleep", true)
  
  UI:ResetSpeaker()
  UI:WaitShowDialogue("Zzzzzzzzz...")
  
  UI:SetSpeaker(munch)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Pops... getcha self up, would ya.")
end

function TarroTownSquare.Getic_Action(obj, activator)
  local getic = CH("Getic")
  UI:SetSpeaker(getic)
  UI:SetSpeakerEmotion("Sigh")
  UI:WaitShowDialogue("Why do I have to watch these bothers?")
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue("I have much better things to do with my time.")
end

function TarroTownSquare.Buzzer_Action(obj, activator)
  local buzzer = CH("Buzzer")
  local maru = CH("PLAYER")
  GROUND:CharTurnToCharAnimated(buzzer, maru, 2)
  UI:SetSpeaker(buzzer)
  UI:SetSpeakerEmotion("Angry")
  UI:WaitShowDialogue("Oi! [pause=50]Behind the counter, buzz!")
  GROUND:CharAnimateTurn(buzzer, Direction.Left, 4, true)
end

function TarroTownSquare.Gekis_Action(obj, activator)
  local gekis = CH("Gekis")
  local kek = CH("Kecleon")
  UI:SetSpeaker(gekis)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Ah, hm, [pause=20]what to buy, what to buy?")
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("The decision is much too difficult.")
  UI:WaitShowDialogue("I will purchase everything, thank you.")

  UI:SetSpeaker(kek)
  UI:SetSpeakerEmotion("Surprised")
  UI:WaitShowDialogue("What?! [pause=0]Ms. Piona, please reconsider!")
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("I won't have any stock for my other consumers!")

  UI:SetSpeaker(gekis)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("It matters not, Mr. Kecleon.")
  UI:WaitShowDialogue("I have all the funds necessary, and I am willing to make a payment.")
end

function TarroTownSquare.Ribbon_Action(obj, activator)
  local ribbon = CH("Ribbon")
  local maru = CH("PLAYER")
  GROUND:CharTurnToCharAnimated(ribbon, maru, 2)
  UI:SetSpeaker(ribbon)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Welcome to our little setup, friend.")
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("We aren't ready yet, though. [pause=20]Do come back later.")
  GROUND:CharAnimateTurn(ribbon, Direction.DownLeft, 4, false)
end

function TarroTownSquare.BuzzStore_Action(obj, activator)
  local buzzer = CH("Buzzer")
  local maru = CH("PLAYER")
  GROUND:CharTurnToCharAnimated(buzzer, maru, 2)
  UI:SetSpeaker(buzzer)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Sorry, buzzas.")
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("Can't open the store up yet,[pause=35] setting it up perfectly iz harder then it lookz, buzz.")
  --[[UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Welcome, welcome, buzz!")
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Got some quick stuff here, so buy something, will ya!")
  BuzzerShopStart()]]
end

function TarroTownSquare.TTown_SouthExit_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  outside_enter = 2
  GAME:EnterGroundMap("tarro_town_outside", "TarroTownEast_ch2", "TTSquare_TownExit")
end

function TarroTownSquare.Combeest_Action(obj, activator)
  local combust = CH("Combeest")
  local combat = CH("Combeet")
  local combine = CH("Combeene")

  GROUND:CharSetAnim(combust, "Walk", true)
  UI:SetSpeaker(combust)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Buzz buzz honey!")

  GROUND:CharSetAnim(combat, "Walk", true)
  UI:SetSpeaker(combat)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Buzz buzz pollen!")

  GROUND:CharSetAnim(combine, "Walk", true)
  UI:SetSpeaker(combine)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("Buzz buzz flowers!")

  GROUND:CharSetAnim(combine, "Rotate", true)
  GROUND:CharSetAnim(combat, "Rotate", true)
  GROUND:CharSetAnim(combust, "Rotate", true)

  UI:SetSpeaker(combine)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowTimedDialogue("Buzz,[pause=20] buzz,[pause=20] buzz,[pause=20] buzz!", 20)

  UI:SetSpeaker(combat)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowTimedDialogue("Buzz,[pause=20] buzz,[pause=20] buzz,[pause=20] buzz!", 20)

  UI:SetSpeaker(combust)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowTimedDialogue("Buzz,[pause=20] buzz,[pause=20] buzz,[pause=20] buzz!", 20)

  GROUND:CharSetAnim(combine, "None", true)
  GROUND:CharSetAnim(combat, "None", true)
  GROUND:CharSetAnim(combust, "None", true)
  GAME:WaitFrames(35)

  UI:SetSpeaker(combust)
  UI:SetSpeakerEmotion("Dizzy")
  UI:WaitShowDialogue("[speed=0.4]Urk... [pause=40]dizzy...!")

  UI:SetSpeaker(combine)
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("T-[pause=10]too much spinning...")

  UI:SetSpeaker(combat)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Oogh...[pause=33] it needs work...")
end

function TarroTownSquare.Combeet_Action(obj, activator)
  TarroTownSquare.Combeest_Action()
end

function TarroTownSquare.Combeene_Action(obj, activator)
  TarroTownSquare.Combeest_Action()
end

function TarroTownSquare.Puchi_Action()
  local maru = CH("PLAYER")
  local azura = CH('Teammate1')
  local puchi = CH("Puchi")
  local senna = CH("Senna")
  local ziggy = CH("Ziggy")

  if SV.tarro_town.PieChapter <= 6 then
    if quiz_available == false or quiz_available == nil then
      AI:DisableCharacterAI(azura)
      GROUND:MoveToPosition(maru, 515, 396, false, 2)
      GROUND:MoveToPosition(azura, 540, 366, false, 2)
      GROUND:CharTurnToCharAnimated(maru, puchi, 4)
      GROUND:CharTurnToCharAnimated(maru, puchi, 4)
      UI:SetSpeaker(puchi)
      UI:SetSpeakerEmotion("Pain")
      UI:WaitShowDialogue("[speed=0.6]Ugh...[pause=35] I'm so tired...")
  
      UI:SetSpeaker(senna)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("Why did you come out here...?")
      UI:SetSpeakerEmotion("Stunned")
      UI:WaitShowDialogue("You're usually home when this happens...")
  
      UI:SetSpeaker(puchi)
      GROUND:CharTurnToCharAnimated(puchi, ziggy, 2)
      UI:SetSpeakerEmotion("Determined")
      UI:WaitShowDialogue("[speed=0.6]...")
  
      UI:SetSpeaker(senna)
      GROUND:CharTurnToCharAnimated(senna, ziggy, 2)
      UI:SetSpeakerEmotion("Sigh")
      UI:WaitShowDialogue("Figured.")
  
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Stunned")
      UI:WaitShowDialogue("[speed=0.6]Well...[pause=15] u-[pause=10]uh...[emote=Normal] h[speed=1.0]ear me out.")
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("If one of us got zapped,[emote=Worried][pause=20] then what are we gonna do?")
      
      UI:SetSpeaker(senna)
      GROUND:CharTurnToCharAnimated(senna, puchi, 2)
      UI:SetSpeakerEmotion("Stunned")
      UI:WaitShowDialogue("...th-[pause=15]that is a good point...")
  
      UI:SetSpeaker(puchi)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("[speed=0.6]I should've stayed home...")
  
      UI:SetSpeaker(senna)
      GROUND:CharTurnToCharAnimated(puchi, senna, 2)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Not like we're stopping you.")
  
      UI:SetSpeaker(puchi)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowTimedDialogue("[speed=0.6]You're right... I'll jus")
  
      GROUND:CharTurnToCharAnimated(senna, ziggy, 7)
      GROUND:CharTurnToCharAnimated(puchi, ziggy, 7)
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Shouting")
      UI:WaitShowDialogue("[speed=1.5]Waaaaaaaaaaait!")
  
      GROUND:CharTurnToCharAnimated(ziggy, maru, 7)
      GROUND:CharTurnToCharAnimated(senna, maru, 7)
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Fwends!")
  
      GROUND:CharTurnToCharAnimated(puchi, maru, 2)
      UI:SetSpeaker(senna)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Welcome to town, Maru, Azura!")
  
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Inspired")
      UI:WaitShowDialogue("Gasp,[pause=15] that means it's time for [color=#FFFE11]the thing[color]!")
  
      UI:SetSpeaker(senna)
      UI:SetSpeakerEmotion("Stunned")
      GROUND:CharTurnToCharAnimated(senna, ziggy, 4)
      UI:WaitShowDialogue("[speed=0.6]...[color=#FFFE11]the thing[color]?")
  
      UI:SetSpeaker(puchi)
      UI:SetSpeakerEmotion("Pain")
      UI:WaitShowDialogue("[speed=0.5]No... I'm too tired for the [color=#FFFE11]Friend Circle[color]...")
  
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Normal")
      GAME:MoveCamera(480, 364, 1, false)
      UI:WaitShowDialogue("[color=#FFFE11]Friend Circle[color] now!")
      local coro1 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(maru, 430, 382, false, 2) end)
                                                    
      local coro2 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(azura, 517, 382, false, 3) end)
    
      TASK:JoinCoroutines({coro1, coro2})
      GROUND:CharAnimateTurn(puchi, Direction.Down, 2, true)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      GROUND:CharTurnToCharAnimated(azura, maru, 4)
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Alrighty, then.[pause=50] Report in with your recent activities!")
      UI:SetSpeaker(puchi)
      UI:SetSpeakerEmotion("Determined")
      UI:WaitShowDialogue("Sleeping...")
  
      UI:SetSpeaker(senna)
      UI:SetSpeakerEmotion("Pain")
      UI:WaitShowDialogue("Hiding...")
  
      UI:SetSpeaker(azura)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Exploring!")
  
      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Ye.")
  
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Inspired")
      UI:WaitShowDialogue("You guys went exploring!?")
      UI:SetSpeakerEmotion("Inspired")
      UI:WaitShowDialogue("You HAVE to invite me next time.[pause=50] I've got this!")
  
      UI:SetSpeaker(senna)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("A-[pause=20]as long as I'm not dragged along.")
  
      UI:SetSpeaker(puchi)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("Where did you two explore?")
  
      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Tarro Forest. Had to get a Big Apple.")
  
      UI:SetSpeaker(puchi)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Oh, in East Tarro. [pause=30]Was it a nice stroll, then?")
  
      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Stunned")
      UI:WaitShowDialogue("...is it that easy to go through.")
  
      UI:SetSpeaker(senna)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("I'm sure it still counts as exploration.")
  
      UI:SetSpeaker(azura)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Does exploring town count, too?")
  
      UI:SetSpeaker(puchi)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("You've...[pause=35] n[emote=Worried]ever been here?")
  
      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Stunned")
      UI:WaitShowDialogue("Only when mom and dad get food.")
  
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("[speed=1.4]You guys have got to see the inside of the [color=#01FE10]Big Tree[color]![pause=35] A[emote=Joyous]ll of the newest new is happening in there!")
  
      UI:SetSpeaker(senna)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("[speed=0.7] Lots of hiding spots in there, too.[pause=30] Good for having some time to yourself.")
  
      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowTimedDialogue("Sounds fun, we should g")
  
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("[speed=1.4]Oh, oh, oh, oh![pause=25] [speed=0.9]What about a quiz first![pause=30] To see if you've really explored!")
  
      UI:SetSpeaker(senna)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Oooh, like a test!")
  
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Let us know when you're ready ready ready!")
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("I already know what I'm gonna ask!")
      GAME:MoveCamera(0, 0, 1, true)
      AI:EnableCharacterAI(azura)
      quiz_available = true
    else
      GROUND:CharTurnToCharAnimated(ziggy, maru, 4)
      GROUND:CharTurnToCharAnimated(senna, maru, 4)
      GROUND:CharTurnToCharAnimated(puchi, maru, 4)
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Inspired")
      local choices = {("Yes!"),
          ("No!")}
      UI:BeginChoiceMenu("Ready ready ready?", choices, 1, 2)
      UI:WaitForChoice()
      result = UI:ChoiceResult()
      if result == 1 then
          UI:SetSpeaker(maru)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Sure.")
  
          UI:SetSpeaker(ziggy)
          UI:SetSpeakerEmotion("Joyous")
          UI:WaitShowDialogue("Okay! Quiz time!")
  
          UI:SetSpeaker(puchi)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("Sleep time...")
  
          UI:SetSpeaker(ziggy)
          UI:SetSpeakerEmotion("Angry")
          UI:WaitShowDialogue("Nuh-uh.")
          GAME:FadeOut(false, 30)
          GAME:EnterGroundMap("QuizTime", "NewObject")
      else
          UI:SetSpeaker(ziggy)
          UI:SetSpeakerEmotion("Normal")
          UI:WaitShowDialogue("Oh, take your time, then.")
  
          UI:SetSpeaker(senna)
          UI:SetSpeakerEmotion("Happy")
          UI:WaitShowDialogue("We'll be here waiting.") 
      end
    end
  else
    UI:SetSpeaker(puchi)
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("[speed=0.6]If I knew this was gonna happen,[pause=0] I would've[emote=Dizzy] stayed asleep...")
  end
  
end

function TarroTownSquare.Senna_Action()
  local senna = CH("Senna")
  if SV.tarro_town.PieChapter <= 6 then
    TarroTownSquare.Puchi_Action()
  else
    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("As much as I want to help him,[pause=35] I[emote=Pain] can't deal with things as well as he can...")
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Does that make me a bad older sister?")
  end
end

function TarroTownSquare.Ziggy_Action()
  TarroTownSquare.Puchi_Action()
end

function TarroTownSquare.Minus_Action()
    local plus = CH("Plus")
    local minus = CH("Minus")
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local getic = CH("Getic")
  if plus_minus == nil then

    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("So,[pause=25] like,[pause=25] what now?")

    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Red's still better.")

    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Wrong,[pause=25] like,[pause=25] absolutely wrong!?")

    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Nuh-uh!")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Special1")
    UI:WaitShowDialogue("Oh boy.")

    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Wait...")

    GROUND:CharTurnToCharAnimated(plus, maru, 2)
    GAME:WaitFrames(15)

    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Inspired")
    UI:WaitShowDialogue("Maru, [pause=20]my guy, [pause=20]my homie.")
    UI:WaitShowDialogue("Tell [pause=30]h[emote=Determined]er [pause=20]t[emote=Happy]hat red is better.")

    GROUND:CharTurnToCharAnimated(minus, azura, 2)
    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("That's not true, like, at all!")
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Azi, tell him!")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Well, uh...")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Hmm...")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    local choices = {("Blue!"),
        ("Red!"),
        ("...both?"),
        ("I dunno...")}
    ::retry_question::
    UI:BeginChoiceMenu("Uhhhhhh...", choices, 1, 4)
    UI:WaitForChoice()
    result = UI:ChoiceResult()
    if result == 1 then
        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Blue, I guess.")

        UI:SetSpeaker(minus)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Yeah, I wi[pause=60]- w[emote=Stunned]ait...");
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Aren't you guys blue?");

        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Yes,[pause=45] that's[emote=Happy] why blue is cool.")

        UI:SetSpeaker(plus)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Reasonable...")

        UI:SetSpeaker(minus)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("I'll take it! [emote=Joyous]I win!")

        UI:SetSpeaker(plus)
        UI:SetSpeakerEmotion("Sad")
        UI:WaitShowDialogue("Fine... whatever... you win...")
    elseif result == 2 then
        UI:SetSpeaker(azura)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Red!")

        UI:SetSpeaker(plus)
        UI:SetSpeakerEmotion("Joyous")
        UI:WaitShowDialogue("Whoo!")

        UI:SetSpeaker(minus)
        UI:SetSpeakerEmotion("Teary-Eyed")
        UI:WaitShowDialogue("Azi... why?");

        UI:SetSpeaker(azura)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("We're already blue! I pick red because red is different and cool!")

        UI:SetSpeaker(plus)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("...h-huh?")

        UI:SetSpeaker(minus)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("That's...")

        UI:SetSpeaker(plus)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("You know what,[pause=40] thank you, Azura!")
        UI:SetSpeakerEmotion("Joyous")
        UI:WaitShowDialogue("I win!")

        UI:SetSpeaker(minus)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("Tch...[pause=25] like, whatevs.")
    elseif result == 3 then
        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("...[pause=0]both?")
        GAME:WaitFrames(60)

        UI:SetSpeaker(minus)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("I...")

        UI:SetSpeaker(plus)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Lame.")

        UI:SetSpeaker(minus)
        UI:SetSpeakerEmotion("Sigh")
        UI:WaitShowDialogue("Clearly lame.")

        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("This question is lame!")
        GAME:WaitFrames(30)
        GROUND:CharTurnToCharAnimated(plus, minus, 2)
        GROUND:CharTurnToCharAnimated(minus, plus, 2)
        GAME:WaitFrames(30)
        UI:SetSpeaker(plus)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("You right.")

        UI:SetSpeaker(minus)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Mhm.")
    else
        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("I dunno,[pause=25] do I have to answer this?")
        
        UI:SetSpeaker(minus)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Yes!")

        UI:SetSpeaker(plus)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Don't be lame, Maru.")

        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Special1")
        UI:WaitShowDialogue("Ugh,[pause=20] fine,[emote=Worried] it's...")
        goto retry_question
    end
    
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Glad that's over.")

    GROUND:CharTurnToCharAnimated(minus, plus, 2)
    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Hey, Plus?")
    GROUND:CharTurnToCharAnimated(plus, minus, 2)
    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Wassup?")

    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("If there were, like[pause=20], a fork in the road[pause=0], would you go left or right?")
    UI:WaitShowDialogue("I think left is best.")
    
    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I would go right.")

    GAME:WaitFrames(60)
    GROUND:CharSetAnim(minus, "Charge", true)
    GROUND:CharSetAnim(plus, "Charge", true)

    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Why would you go right?!")
    
    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Why would you go left?!")
    local function togemove()
        GROUND:MoveToPosition(getic, 1685, 220, true, 1)
    end
    local function togeturn()
        GROUND:CharAnimateTurn(getic, Direction.Down, 2, false)
    end
    UI:SetSpeaker(getic)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue("Ugh...[script=0][pause=30] I[script=1] got it...", {togemove, togeturn})

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Okay...")
    plus_minus = 1
  elseif plus_minus == 1 then
    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Left!")

    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Right!")

    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Left!")

    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Right!")

    GROUND:CharTurnToCharAnimated(plus, getic, 1)
    GROUND:CharTurnToCharAnimated(minus, getic, 1)

    UI:SetSpeaker(getic)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowTimedDialogue("[speed=0.4]Stooooooop!!", 40)
    
    GROUND:CharSetAnim(minus, "None", true)
    GROUND:CharSetAnim(plus, "None", true)
    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Apologies.")

    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Sorry.")
    GROUND:CharSetAnim(minus, "Idle", true)
    GROUND:CharSetAnim(plus, "Idle", true)
    plus_minus = 2
  else
    UI:SetSpeaker(getic)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue("Can you two just behave for five seconds?[pause=25] For once?")

    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Me, like, maybe?[pause=40] P[script=0][emote=Happy]lus, no way.", {GROUND:CharTurnToCharAnimated(minus, plus, 1)})

    GROUND:CharTurnToCharAnimated(plus, minus, 1)
    GROUND:CharSetAnim(plus, "Charge", true)
    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("Coming from you!")

    GROUND:CharTurnToCharAnimated(plus, getic, 1)
    GROUND:CharTurnToCharAnimated(minus, getic, 1)
    UI:SetSpeaker(getic)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Ahem.")

    GROUND:CharSetAnim(minus, "None", true)
    GROUND:CharSetAnim(plus, "None", true)
    UI:SetSpeaker(minus)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Sorry.")

    UI:SetSpeaker(plus)
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("Apologies.")
    GROUND:CharSetAnim(minus, "Idle", true)
    GROUND:CharSetAnim(plus, "Idle", true)
  end
end

function TarroTownSquare.Plus_Action()
  TarroTownSquare.Minus_Action()
end

function TarroTownSquare.Teddums_Action(obj, activator)
    local maru = CH("PLAYER")
    local azura = CH('Teammate1')
    local ted = CH("Teddums")

    UI:SetSpeaker(ted)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Looks like Mr. Kecleon is busy...")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Luckily there's sweet store in the Hive.")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("It's just in that direction.", {GROUND:CharAnimateTurn(maru, Direction.Left, 4, true), GROUND:CharAnimateTurn(ted, Direction.Left, 4, true), GROUND:CharAnimateTurn(azura, Direction.Left, 4, false)})
    GROUND:CharTurnToCharAnimated(ted, maru, 3)
    GROUND:CharTurnToCharAnimated(maru, ted, 3)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Just gotta ask all nice and they'll give you the most delicious honey.")
    if quiz_available == true then
        UI:SetSpeaker(azura)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Ziggy never mentioned anything about the hive...")

        GROUND:CharTurnToCharAnimated(azura, maru, 3)
        GROUND:CharTurnToCharAnimated(maru, azura, 3)

        UI:SetSpeaker(azura)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Maybe it's not a part of the quiz.")

        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Wouldn't hurt to check it out, though.")
    end
end

function TarroTownSquare.Dr_Chance_Action(obj, activator)
    local maru = CH("PLAYER")
    local azura = CH('Teammate1')
    local doc = CH("Dr_Chance")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Hello, Dr. Chance!")

    UI:SetSpeaker(doc)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Ah, Maru, Azura. You're staying healthy, I presume.")
end

function TarroTownSquare.Gepii_Action(obj, activator)
    local gepii = CH("Gepii")
    local happy = CH('Happy')
    local maru = CH("PLAYER")
    local azura = CH('Teammate1')
    local doc = CH("Dr_Chance")
    happy_dialogue = math.random(1, 4)
    if happy_dialogue == 1 then
        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("One of these days, I'll ask my mum if I can go on a journey.")
        UI:SetSpeakerEmotion("Happy")
        GROUND:CharTurnToCharAnimated(happy, maru, 3)
        GROUND:CharTurnToCharAnimated(gepii, maru, 3)
        UI:WaitShowDialogue("...oh, hey![pause=45] Mars and Azure!")
        UI:WaitShowDialogue("You guys are a great help in stopping those two!")
        
        GROUND:CharTurnToCharAnimated(gepii, happy, 3)
        UI:SetSpeaker(happy)
        UI:SetSpeakerEmotion("Sigh")
        UI:WaitShowDialogue("Yes, thank you.[pause=25] It's getting[emote=Worried] difficult to keep our supplies in check with them.")
    elseif happy_dialogue == 2 then
        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("How do you manage to remember what all those medicines do anyway?")

        UI:SetSpeaker(happy)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Remember?[pause=30] No need[emote=Happy]! It's all written in the hospital record books.")
        UI:SetSpeakerEmotion("Worried")
        GROUND:CharTurnToCharAnimated(doc, happy, 3)
        UI:WaitShowDialogue("What's it called again...? [pause=0] A... [pause=15][speed=0.5]a condemning...?[pause=25] Commendum...? [speed=0.3]Colendar?")
        local function turntodoc()
            GROUND:CharTurnToCharAnimated(happy, doc, 3)
            GROUND:CharTurnToCharAnimated(gepii, doc, 3)
            GROUND:CharTurnToCharAnimated(azura, doc, 3)
        end
        UI:SetSpeaker(doc)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("A com[script=0]pendium, sweetie.", {turntodoc})

        UI:SetSpeaker(happy)
        UI:SetSpeakerEmotion("Normal")
        GROUND:CharTurnToCharAnimated(gepii, happy, 3)
        UI:WaitShowDialogue("Yeah, that.[pause=30] Thanks,[emote=Happy] mom!")
        GROUND:CharAnimateTurn(doc, Direction.Down, 2, false)
    elseif happy_dialogue == 3 then
        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Does the hospital need extra funds?")
        
        GROUND:CharTurnToCharAnimated(doc, happy, 3)
        UI:SetSpeaker(happy)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I dunno, I'll have to ask mom. Why do you ask?")

        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("I was think of giving you some, it's the reason[emote=Sigh] I'm not sick as often.")

        UI:SetSpeaker(doc)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Awww,[pause=15] that's so nice of you, Gepii.")
        GROUND:CharAnimateTurn(doc, Direction.Down, 2, false)
    elseif happy_dialogue == 4 then
        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Inspired")
        UI:WaitShowDialogue("I love this town.[pause=35] The job my dad has lets us live in luxury.")
        
        COMMON.CharSweatdrop("Happy")
        UI:SetSpeaker(happy)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("I get jealous of you sometimes, Gepii.")

        UI:SetSpeaker(gepii)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Huh?[pause=35] There's no reason to be...")
    end
    
end

function TarroTownSquare.TTown_HiveEntrance_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  outside_enter = 2
  GAME:EnterGroundMap("TarroTownHive", "TTSquare_HiveEnter")
end

function TarroTownSquare.PlumiHouse_Entrance_Touch(obj, activator)
  local maru = CH("PLAYER")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("If I go in there and touch anything, the two of them would probably start fighting again...")
end

function TarroTownSquare.Happy_Action(obj, activator)
  local gepii = CH("Gepii")
  local happy = CH('Happy')
  local maru = CH("PLAYER")
  local azura = CH('Teammate1')
  local doc = CH("Dr_Chance")
  happy_dialogue = math.random(1, 2)
  if happy_dialogue == 1 then
    UI:SetSpeaker(happy)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Aren't you and your sister the richest kids in town?")

    UI:SetSpeaker(gepii)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("We are?[pause=0] I [emote=Happy]didn't even notice.")

    UI:SetSpeaker(happy)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("That's a weird thing to not notice...")
  elseif happy_dialogue == 2 then
    UI:SetSpeaker(happy)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue("Ugh,[pause=55] now that a fight's been stopped,[pause=20] I[emote=Worried] should probably get back to practicing...")

    UI:SetSpeaker(gepii)
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("I could never do what you do, Haps.")

    UI:SetSpeaker(happy)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I think you could.[pause=35] J[emote=Happy]ust get some practice in.")
  end
end

function TarroTownSquare.BigTree_Entrance_Touch(obj, activator)
  if SV.tarro_town.PieChapter == 7.1 then
    SV.tarro_town.PieChapter = 7
  end
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("TarroTownBigTree", "Tree_Enter")
end

return TarroTownSquare