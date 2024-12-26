--[[
    init.lua
    Created: 08/11/2024 14:35:15
    Description: Autogenerated script file for the map TarroTownEast.
]]--
-- Commonly included lua functions and data
require 'origin.common'

-- Package name
local TarroTownEast = {}

-------------------------------
-- Map Callbacks
-------------------------------
---TarroTownEast.Init(map)
--Engine callback function
function TarroTownEast.Init(map)
  
  MapStrings = STRINGS.MapStrings
  COMMON.RespawnAllies()
  local partner = CH('Teammate1')
  if outside_enter == 1 then
    GROUND:TeleportTo(partner, 355, 401, Direction.Down, 0)
    GAME:FadeIn(20)
  else
    GAME:FadeIn(20)
  end
  AI:SetCharacterAI(partner, "origin.ai.ground_partner", CH('PLAYER'), partner.Position)
  partner.CollisionDisabled = true
end

---TarroTownEast.Enter(map)
--Engine callback function
function TarroTownEast.Enter(map)
  if dungeon_oof ~= 1 then
    if chapterpie == 2.1 then
      TarroTownEast.TarroForrestFailed()
    elseif chapterpie == 2.2 then
      TarroTownEast.TarroForrestBossFailed()
    end
  end
  GAME:FadeIn(20)
end

---TarroTownEast.Exit(map)
--Engine callback function
function TarroTownEast.Exit(map)


end

---TarroTownEast.Update(map)
--Engine callback function
function TarroTownEast.Update(map)
  if chapterpie ~= 1 or chapterpie < 2 then
    chapterpie = 1
  end
  local maru = CH("PLAYER")
  local azura = CH('Teammate1')

  if GAME:IsKeyDown(66) then
    print("Partner")
  end
  if GAME:IsKeyDown(66) then
    if chapterpie == 1 then
      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Pie! [pause=20]Pie! [pause=20]Pie! [pause=20]Pie!")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Yeah yeah, I got it.")
    elseif chapterpie == 2 then
      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Determined")
      UI:WaitShowDialogue("Even if it's scary in there...")
      UI:WaitShowDialogue("...we have to get the apple!")
      UI:SetSpeakerEmotion("Shouting")
      UI:WaitShowDialogue("I want my pie!")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("We got this, I'm sure.")
    else
      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Home sweet home.")

      UI:SetSpeaker(azura)
      GROUND:CharTurnToCharAnimated(maru, azura, 4)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowDialogue("Did we we even do anything?")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Probably not.")
    end
  end
  
end

function TarroTownEast.TarroForrestFailed()
  local maru = CH("PLAYER")
  local azura = CH("Teammate1")
  local senna = CH('Senna')

  dungeon_oof = 1
  GAME:CutsceneMode(true)
  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Pain")
  UI:WaitShowDialogue("Oof... that sucked...")

  UI:SetSpeaker(azura)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("Urk...")

  UI:SetSpeaker(senna)
  UI:SetSpeakerEmotion("Surprised")
  UI:WaitShowDialogue("Guys! Are you two okay?!")

  GROUND:TeleportTo(senna, 220, 126, Direction.Up, 0)

  
end

---TarroTownEast.GameSave(map)
--Engine callback function
function TarroTownEast.GameSave(map)


end

---TarroTownEast.GameLoad(map)
--Engine callback function
function TarroTownEast.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------

function TarroTownEast.TTEast_WExit_Touch(obj, activator)
  outside_enter = 1
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("TarroTownOutside", "TTOutside_WEnter")
end

function TarroTownEast.TarroForestEntrance_Touch(obj, activator)

  local maru = CH("PLAYER")
  local azura = CH('Teammate1')

  if chapterpie == 1 then
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("This leads to a dungeon, doesn't it...?")

    UI:SetSpeaker(azura)
    GROUND:CharTurnToCharAnimated(maru, azura, 4)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...can we get our pie first, please...?")
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("...looks scary in there...")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Right. Pie first.")
  elseif chapterpie == 2 then
    GROUND:CharTurnToCharAnimated(maru, azura, 4)
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Alrighty, we should be ready, right?")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Yeah! Pie time!")
    
    GROUND:CharAnimateTurn(maru, Direction.Up, 4, true)
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Let's do it.")
    
    COMMON.UnlockWithFanfare("tarro_forest", false)
    local dungeon_entrances = {"tarro_forest"}
    local ground_entrances = {}
    COMMON.ShowDestinationMenu(dungeon_entrances, ground_entrances)
    dungeon_oof = 0
  elseif chapterpie > 2 then
    local dungeon_entrances = {"tarro_forest"}
    local ground_entrances = {}
    COMMON.ShowDestinationMenu(dungeon_entrances, ground_entrances)
  else
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Hmm... maybe later...")
  end
end

function TarroTownEast.Ziggy_Action(obj, activator)
  local maru = CH("PLAYER")
  local azura = CH('Teammate1')
  local ziggy = CH("Ziggy")
  if chapterpie <= 2 then
    AI:DisableCharacterAI(azura)
    GROUND:MoveToPosition(maru, 460, 422, false, 2)
    GROUND:MoveToPosition(azura, 460, 400, false, 2)
    GROUND:CharTurnToCharAnimated(maru, ziggy, 4)
    GROUND:CharAnimateTurn(azura, Direction.Right, 4, true)
    if senna_check_ziggy == 1 then
      UI:SetSpeaker(azura)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("ZIG!")
      
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("AZU!")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Senna wanted us to check up on you.")
      UI:WaitShowDialogue("Are you doing okay?")

      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("Yep yep! Just guarding and stuff!")
      senna_check_ziggy = 0
    else
      UI:SetSpeaker(azura)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("ZIG!")
      
      UI:SetSpeaker(ziggy)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("AZU!")

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("What are you doing in front of your house?")

      UI:SetSpeaker(ziggy)
      UI:WaitShowTimedDialogue("[speed=0.8]Okay, [pause=20]so I woke up this morning and \nthere was a surprising lack of Oran berries!", 45)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowTimedDialogue("[speed=1.2]So, I asked my mom what happened to \nthem and she said that I probably ate them all and forgot.", 45)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowTimedDialogue("I couldn't ask my dad because he was \nbusy with whatever he was busy with...", 40)
      UI:WaitShowTimedDialogue("...but he didn't look like he was doing \nanything...", 40)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowTimedDialogue("...and he turned around all startled with \na strange amount of berry juice around his face.", 30)
      UI:SetSpeakerEmotion("Worried")
      UI:WaitShowTimedDialogue("[speed=1.6]The juice also matched the color of the berries and my dad really likes Oran berries...", 30)
      UI:WaitShowTimedDialogue("...so I'm pretty sure he's the one who \nate all of them.", 30);
      UI:SetSpeakerEmotion("Angry")
      UI:WaitShowDialogue("[speed=2.2]But JUST[pause=25] IN[pause=25] CASE[pause=25], whoever decides to steal our berries will FACE[pause=25] MY[pause=25] ZIGGY[pause=25] POWERRRRRRRRR!");
      UI:SetSpeakerEmotion("Sigh")
      UI:WaitShowDialogue("[speed=1.0]Phew... [pause=55]...[emote=Normal]and stuff like that.");

      UI:SetSpeaker(maru)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Understandable, have a nice guarding.")

      AI:EnableCharacterAI(azura)
    end
  else
    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("ZIG!")
    
    UI:SetSpeaker(ziggy)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("AZU!")
  end
  AI:EnableCharacterAI(azura)
end

function TarroTownEast.Sunny_Action(obj, activator)
  local sunny = CH("Sunny")
  local tango = CH('Tango')

  UI:SetSpeaker(sunny)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue("This is the perfect place for my photosynthesis classes!")

  UI:SetSpeaker(tango)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("...you're actually doing that?")
  UI:WaitShowDialogue("Who's attending?")

  UI:SetSpeaker(sunny)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Well... er... [pause=50][emote=Pain]...[br]I uh...[pause=65][br]...")
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue("I'll find someone!")
end

function TarroTownEast.Tango_Action(obj, activator)
  TarroTownEast.Sunny_Action(obj, activator)
end

function TarroTownEast.Tsudo_Action(obj, activator)
  local tsudo = CH("Tsudo")
  UI:SetSpeaker(tsudo)
  tsudo_dialogue = math.random(1, 3)
  if tsudo_dialogue == 1 then
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("[color=#FFC663]Work those legs![color] [pause=60][color=#AAAAA4]Do your best![color] [pause=60][color=#FFC663]Stay hydrated![color]")
    GAME:WaitFrames(25)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("[color=#FFC663]...wait, do you two even need water?[color] [color=#AAAAA4](They probably do, but...)[color]")
  elseif tsudo_dialogue == 2 then
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("[color=#FFC663]Having two heads is great![color] [pause=60][color=#AAAAA4]...and also convenient![color] [pause=60]")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("[color=#FFC663]It's like a sibling![color] [pause=60][color=#AAAAA4]...but that sibling is you![color] [pause=60]")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("[color=#FFC663]Double the thinking![color] [pause=60][color=#AAAAA4]Less of the fights![color] [pause=60]")
  elseif tsudo_dialogue == 3 then
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("[color=#FFC663]Good to get that heart pumping![color] [pause=60][color=#AAAAA4]Good to get those legs moving![color] [pause=60]")
  end
end

function TarroTownEast.Senna_Action(obj, activator)
  local maru = CH("PLAYER")
  local azura = CH("Teammate1")
  local senna = CH('Senna')
  if chapterpie <= 1 and senna_talk ~= 0 then
    senna_talk = 0
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowTimedDialogue("Senna, h-", 20)

    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowTimedDialogue("Eek!!", 60)

    GROUND:CharTurnToCharAnimated(senna, maru, 2)
    UI:SetSpeakerEmotion("Shouting")
    UI:WaitShowDialogue("Gyeeeehh!")

    GAME:WaitFrames(100)

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Uh... [pause=15]...hello to you, too, Senna.")

    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("O-oh...[pause=25] hi[emote=Sad], Maru. [pause=35]Hello, Azura.")
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("I... [pause=35]wasn't expecting [emote=Worried]visitors...")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Glad to see you're still doing well, at least.")

    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Y-yes, thank you for checking in.")

    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Glad my shyness isn't stopping you guys from caring...")

    GROUND:CharAnimateTurn(senna, Direction.Left, 2, true)
    GAME:WaitFrames(70)
    GROUND:CharTurnToCharAnimated(senna, maru, 2)

    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...right?")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("What,[pause=34] are you saying you aren't a good friend?")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("You're a great friend!")

    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("[speed=1.4]N-no, [speed=0.8]no no![pause=15] I [emote=Pain]mean...!")
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowTimedDialogue("[speed=0.8]Thank you, [pause=20]but it's more like...", 45)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("[speed=1.0]Does my anxiety ever get in the way? [pause=20]Like... to keep coming back to me?")

    choices = {("Nope!"),
      (STRINGS:Format(MapStrings['String_1'])),
      (STRINGS:Format(MapStrings['String_2']))}

    UI:BeginChoiceMenu("I know it's a weird question, but...", choices, 1, 3)
    UI:WaitForChoice()
    result = UI:ChoiceResult()
    if result == 1 then
      UI:SetSpeaker(azura)
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("It doesn't matter!")
      UI:WaitShowDialogue("You're fun!")

      UI:SetSpeaker(senna)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("[speed=0.05]...[speed=1.0]hm[emote=Happy]! [pause=23]Thank you, Azura, I appreciate it a lot.")
      UI:WaitShowDialogue("Sorry if I don't hang out with you guys more...")
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("I'll be sure to[speed=0.6] do [emote=Normal]th[speed=0.1]at.[pause=70][emote=Worried].[pause=70][emote=Sad]. [emote=Pain]later...")

      UI:SetSpeaker(azura)
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Now then...")
    elseif result == 2 then
        UI:WaitShowDialogue(STRINGS:Format(MapStrings['Strings_005']))
    else
        UI:WaitShowDialogue(STRINGS:Format(MapStrings['Strings_006']))
    end

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("Pie time!")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Oh yeah, pie time.")

    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Oh?[pause=35] [emote=Happy]Your mom's famous pie? [pause=53]W[emote=Normal]ill she make enough for the whole town again?")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Nah, not this time. Azura basically wants it all to herself.")

    UI:SetSpeaker(senna)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Pfft. Alright, then.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Joyous")
    UI:WaitShowDialogue("Let's goooooooooooooo!")
  else
    UI:SetSpeaker(senna)
    GROUND:CharTurnToCharAnimated(senna, maru, 2)

    senna_dialogue = math.random(1, 3)
    if senna_dialogue == 1 then
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Mm... Maru, Azura.")
      UI:SetSpeakerEmotion("Happy")
      UI:WaitShowDialogue("H-hope all is well with you.")
    elseif senna_dialogue == 2 then
      UI:SetSpeakerEmotion("Normal")
      UI:WaitShowDialogue("Make sure you check on my brother, too.")
      UI:SetSpeakerEmotion("Sigh")
      UI:WaitShowDialogue("He's been sitting in front of our house all day today...")
      senna_check_ziggy = 1
    elseif senna_dialogue == 3 then
      UI:SetSpeakerEmotion("Surprised")
      UI:WaitShowDialogue("Eek![pause=61] Hm, you two [emote=Sigh]startled me.")
    end
    GROUND:CharAnimateTurn(senna, Direction.Left, 2, true)
  end
  
end

function TarroTownEast.SennaHomeEntrance_Touch(obj, activator)
  local maru = CH("PLAYER")
  local ziggy = CH("Ziggy")
  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Angry")
  GROUND:CharAnimateTurn(maru, Direction.Right, 4, true)
  UI:WaitShowDialogue("AHA! YOU'VE BEEN STEALING MY BERRIES![pause=45] E[emote=Worried]r, uh... [pause=20]OUR[emote=Determined] BERRIES!")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Surprised")
  UI:WaitShowDialogue("No! I didn't![pause=25] I haven't been in your house!")

  UI:SetSpeaker(ziggy)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue("...oh, sorry.")
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue("Well...")
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue("NO ENTRY ANYWAY!")

  UI:SetSpeaker(maru)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue("Right...")
end

function TarroTownEast.MaruHomeEntrance_Touch(obj, activator)
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("MaruHome", "MaruHome_MainEnter")
end

return TarroTownEast



