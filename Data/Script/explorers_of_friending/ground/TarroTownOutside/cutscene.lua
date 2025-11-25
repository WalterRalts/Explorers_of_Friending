require 'explorers_of_friending.common'

Outside = {}

function Outside.CloudWatch()
  if SV.tarro_town.PieChapter >= 0 then
  else
    SOUND:PlayBGM("Heroes.ogg", true)
    GAME:WaitFrames(50)
    UI:ResetSpeaker()
    UI:SetCenter(true)
    UI:WaitShowVoiceOver("The world of Pokemon.[pause=20] It's been through a lot in the past.", -1)
    UI:WaitShowVoiceOver("But that itself makes it so beautiful,[pause=20]\nhow it's managed to go through everything.", -1)
    UI:WaitShowVoiceOver("The legends of the world have kept everything\n in order before all of the mystery dungeons appeared.", -1)
    UI:WaitShowVoiceOver("Ever since then, monsters have become much more hostile.[pause=20]\nTheir home became much more erratic;[pause=30] their belongings gone to the whims and winds.", -1)
    UI:WaitShowVoiceOver("The legends of the world,[pause=20] even they with their strength, could not predict the disasters.", -1)
    UI:WaitShowVoiceOver("The legends of the world,[pause=20] even they with their will, wished for a miracle.", -1)
    SOUND:StopBGM()
    UI:WaitHideBG(5)
    UI:WaitShowVoiceOver("The hero was introduced.", -1)
    SOUND:PlayBGM("HeroesOf.ogg", true)
    UI:WaitShowBG("LegacyA", 0, 30)
    UI:WaitShowVoiceOver("This creature,[pause=20] disguised as a monster,[pause=20] mysteriously appeared in times of need.", -1)
    UI:WaitShowVoiceOver("No one knows where they came from.[pause=30]\nThey don't remember where they came from.", -1)
    UI:WaitShowVoiceOver("But with a friends help,[pause=20] this creature achieved great things.", -1)
    UI:WaitShowBG("LegacyB", 0, 0)
    UI:WaitShowVoiceOver("Stopping a meteor.", -1)
    UI:WaitShowBG("LegacyC", 0, 0)
    UI:WaitShowVoiceOver("Mending time.", -1)
    UI:WaitShowBG("LegacyD", 0, 0)
    UI:WaitShowVoiceOver("Warmed the cold.", -1)
    UI:WaitShowBG("LegacyE", 0, 0)
    UI:WaitShowVoiceOver("Lit the darkness.", -1)
    
    UI:WaitShowBG("LegacyA", 0, 0)
    UI:WaitShowVoiceOver("Chaos has been cured; the hero hasn't shown up for ages.", -1)
    UI:WaitHideBG(30)
    UI:WaitShowVoiceOver("Stories spread as the world grew.[pause=20] Towns advanced, dungeon grow and shrink.", -1)
    UI:WaitShowVoiceOver("Question rise:[pause=20] \"What will happen to our world without the hero?\"", -1)
    UI:WaitShowVoiceOver("\"Will our world go back into turmoil again?\"", -1)
    UI:WaitShowVoiceOver("\"Can't we defend ourselves?\"", -1)
    UI:WaitShowVoiceOver("No one was there to answer.\n[pause=20]But there didn't seem to be a reason for one.", -1)
    UI:WaitShowVoiceOver("No chaos to solve,[pause=30] growth continued,[pause=30] cultures advancing...", -1)
    SOUND:StopBGM()
    UI:WaitShowVoiceOver("[speed=0.4] ...what's even happening now...?", 120)
    
    UI:ResetSpeaker()
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    GAME:CutsceneMode(true)
    UI:WaitShowTitle("Prologue A-0", 180)
    GAME:WaitFrames(30)
    UI:WaitHideTitle(180)

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("It's...[pause=40] relaxing.[pause=0] Sitting here, watching the clouds go by, we should really do this more often.")

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

    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Wow.")

    COMMON.FaceEachother(maru, azura)
    UI:WaitHideBG(30)
    GAME:FadeIn(30)
    
    UI:SetSpeaker(maru)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Maybe we should just go,[pause=10] mom promised some pie would be waiting on us by now.")

    UI:SetSpeaker(azura)
    UI:SetSpeakerEmotion("Inspired")
    COMMON.CharExclaim("Teammate1")
    UI:WaitShowDialogue("Gasp![pause=25] P[emote=Joyous]ie[pause=15] pie[pause=15] pie[pause=15] pie!")
    COMMON.CharHop("Teammate1")
    COMMON.CharHappy("Teammate1")
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Let's go!")

    SV.tarro_town.PieChapter = 0
    local talk_evt = RogueEssence.Dungeon.BattleScriptEvent("AzuraInteract")
          _DATA.Save.ActiveTeam.Players[1].ActionEvents:Add(talk_evt)
    local talk_evt = RogueEssence.Dungeon.BattleScriptEvent("MaruInteract")
          _DATA.Save.ActiveTeam.Players[0].ActionEvents:Add(talk_evt)
  end
end
