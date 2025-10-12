Rexio = {}

function Rexio.Luke()
    SV.entoh_town.AdventureChapter = 2
    local rexio = CH("PLAYER")
    local luke = CH("Luke")
    
    GAME:CutsceneMode(true)
    COMMON.CharRealize("PLAYER")
    
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Rexio...")

    GAME:MoveCamera(376, 200, 100, false)

    COMMON.CharSweatdrop("PLAYER")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...dad, you're scaring me.")

    SOUND:PlayBGM("Over.ogg", true)

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Rexio.[pause=35] Dragon got a letter,[pause=10] and it belonged to you.")
    UI:WaitShowDialogue("You're growing up.[pause=30] And I can't keep you stuck here anyone.")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...w-what?")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Now it's time for you and your friends to go make it out there.")
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("You have to go and...[pause=35] m[emote=Happy]aybe be a part of the best squad you've ever seen.")

    SOUND:StopBGM()
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("Great.")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("...that's it?")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("I mean, yeah.[pause=20] It's not too bad cuz I'll be doing some real chores.")
    GROUND:CharAnimateTurnTo(rexio, Dir8.Down, 3)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Unless it's one of those places that make you do the boring chores first.")
    GROUND:CharAnimateTurnTo(rexio, Dir8.Right, 3)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowDialogue("So yeah. I'm ready. I'll go.")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue("...at least try to be a little homesick...")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowTimedDialogue("Oh!", 25)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowTimedDialogue("Uh...", 25)

    SOUND:PlayBGM("Over.ogg", true)
    UI:SetSpeakerEmotion("Teary-Eyed")
    UI:WaitShowDialogue("D-dad... I'll miss you so much.")
    UI:SetSpeakerEmotion("Teary-Eyed")
    UI:WaitShowDialogue("Will I ever get to see you again?")
    
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("Yes, Rexio.[pause=30] I'm [emote=Teary-Eyed]sure you will.")
    GROUND:CharAnimateTurnTo(luke, Dir8.Left, 3)

    GAME:WaitFrames(90)
    SOUND:StopBGM()
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Have fun with your friends.")

    GAME:MoveCamera(0, 0, 100, true)
    GROUND:Hide("Luke")

    --Flow
    GROUND:Hide("Flow")
    local mon_id1 = RogueEssence.Dungeon.MonsterID("flabebe", 0, "normal", Gender.Female)
  
    local p1 = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id1, 6, "flower_veil", 0)
    p1.IsFounder = true
    p1.IsPartner = true
    p1.Nickname = "Flow"

    _DATA.Save.ActiveTeam.Players:Add(p1)

    local talk_npc = RogueEssence.Dungeon.BattleScriptEvent("FlowInteract")
        _DATA.Save.ActiveTeam.Players[1].ActionEvents:Add(talk_npc)
    
    --Tidy
    GROUND:Hide("Tidy")
    local mon_id2 = RogueEssence.Dungeon.MonsterID("minccino", 0, "normal", Gender.Female)
    
    local p2 = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id2, 8, "", 0)
    p2.IsFounder = true
    p2.IsPartner = true
    p2.Nickname = "Tidy"

    _DATA.Save.ActiveTeam.Players:Add(p2)

    local talk_npc = RogueEssence.Dungeon.BattleScriptEvent("TidyInteract")
        _DATA.Save.ActiveTeam.Players[2].ActionEvents:Add(talk_npc)

    --Wurp
    GROUND:Hide("Wurp")
    local mon_id3 = RogueEssence.Dungeon.MonsterID("wurmple", 0, "normal", Gender.Male)
  
    local p3 = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id3, 7, "", 0)
    p3.IsFounder = true
    p3.IsPartner = true
    p3.Nickname = "Wurp"

    _DATA.Save.ActiveTeam.Players:Add(p3)

    local talk_npc = RogueEssence.Dungeon.BattleScriptEvent("WurpInteract")
        _DATA.Save.ActiveTeam.Players[3].ActionEvents:Add(talk_npc)

    --Snow
    GROUND:Hide("Snow")
    local mon_id4 = RogueEssence.Dungeon.MonsterID("snom", 0, "normal", Gender.Female)
  
    local p4 = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id4, 9, "", 0)
    p4.IsFounder = true
    p4.IsPartner = true
    p4.Nickname = "Snow"

    _DATA.Save.ActiveTeam.Players:Add(p4)

    local talk_npc = RogueEssence.Dungeon.BattleScriptEvent("SnowInteract")
        _DATA.Save.ActiveTeam.Players[4].ActionEvents:Add(talk_npc)

    local flow = CH('Teammate1')
    local tidy = CH('Teammate2')
    local wurp = CH('Teammate3')
    local snow = CH('Teammate4')
    COMMON.RespawnAllies()

    UI:SetSpeaker(flow)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Let's flow, Rexio!")
    
    GAME:CutsceneMode(false)
    SV.bag_size = 999
    AI:SetCharacterAI(flow, "origin.ai.ground_partner", rexio, flow.Position)
    AI:SetCharacterAI(tidy, "origin.ai.ground_partner", flow, tidy.Position)
    AI:SetCharacterAI(wurp, "origin.ai.ground_partner", tidy, wurp.Position)
    AI:SetCharacterAI(snow, "origin.ai.ground_partner", wurp, snow.Position)
end