require 'explorers_of_friending.common'

Outside = {}

function Outside.CloudWatch()
  if SV.tarro_town.PieChapter >= 0 then
  else
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    GAME:CutsceneMode(true)
    UI:WaitShowTitle("Chapter 0", 180)
    GAME:WaitFrames(30)
    UI:WaitHideTitle(180)

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("It's...[pause=40] relaxing.[pause=0] Sitting here, watching the cloud go by...")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Ooh! That one looks like me! Look!")

    UI:WaitShowBG("WalkClouds", 0, 60)

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Ooh, really? [speed=0.05]...[pause=45][emote=Worried]u[speed=1.0]h,[pause=45] where[emote=Stunned]?")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("It's righ-...![pause=70][emote=Worried] Uh, well... it's...")

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Did you already lose it?")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Yeah...")

    COMMON.FaceEachother("PLAYER", "Teammate1")
    UI:WaitHideBG(30)
    GAME:FadeIn(30)

    
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Maybe we should just go,[pause=10] mom promised some pie would be waiting on us by now.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Inspired")
    UI:WaitShowDialogue("Gasp![pause=25] P[emote=Joyous]ie[pause=15] pie[pause=15] pie[pause=15] pie!")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Let's go!")

    SV.tarro_town.PieChapter = 0
    local talk_evt = RogueEssence.Dungeon.BattleScriptEvent("AzuraInteract")
          _DATA.Save.ActiveTeam.Players[1].ActionEvents:Add(talk_evt)
    local talk_evt = RogueEssence.Dungeon.BattleScriptEvent("MaruInteract")
          _DATA.Save.ActiveTeam.Players[0].ActionEvents:Add(talk_evt)
  end
end
