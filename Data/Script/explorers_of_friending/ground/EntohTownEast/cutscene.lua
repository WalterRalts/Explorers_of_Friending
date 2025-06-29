East = {}

function East.TidyUp()
    local mon_id1 = RogueEssence.Dungeon.MonsterID("minccino", 0, "normal", Gender.Female)
  
    local p1 = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id1, 7, "", 0)
    p1.IsFounder = true
    p1.IsPartner = true
    p1.Nickname = "Tidy"

    _DATA.Save.ActiveTeam.Players:Add(p1)

    local talk_npc = RogueEssence.Dungeon.BattleScriptEvent("TidyInteract")
        _DATA.Save.ActiveTeam.Players[1].ActionEvents:Add(talk_npc)

    COMMON.RespawnAllies()
    if SV.entoh_town.firstfind == 1 then
        SV.entoh_town.HelperChapter = 7
        local flow = CH("Teammate1")
        local tidy = CH("Teammate2")
        local rexio = CH("PLAYER")
        local cor1 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(rexio, rexio.Position.X + 50, rexio.Position.Y, false, 1)
            
            COMMON.CharExclaim("PLAYER")

            UI:SetSpeaker(tidy)
            UI:SetSpeakerEmotion("Shouting")
            UI:WaitShowDialogue("Waaeeehhhhh!!")
            GROUND:MoveToPosition(tidy, rexio.Position.X + 50, rexio.Position.Y, true, 12)
            COMMON.CharRealize("Teammate2")

            GROUND:CharSetAnim(CH("Teammate2"), "Trip", true)
        end)	
        local cor2 = TASK:BranchCoroutine(function()
            GAME:FadeIn(80)
        end)
        local cor3 = TASK:BranchCoroutine(function()
            GROUND:TeleportTo(flow, rexio.Position.X - 24, rexio.Position.Y + 24, Direction.Right, 0)
            GAME:WaitFrames(12)
            GROUND:MoveToPosition(flow, flow.Position.X + 50, flow.Position.Y, false, 1)
        end)
        TASK:JoinCoroutines({cor1, cor2, cor3})

        GAME:WaitFrames(45)

        COMMON.CharSweatdrop("PLAYER")
        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("Tidy!")
        GROUND:MoveToPosition(flow, tidy.Position.X - 24, flow.Position.Y, false, 5)
        GROUND:CharTurnToChar(flow, tidy)

        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("It... it was so dirty...")
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("There wasn't... a single speck of clean!")

        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Tidy...![pause=25] Tidy,[pause=10] stay with me![pause=25] Smell the fresh flowers,[pause=25] smell it!")

        GROUND:CharSetAnim(tidy, "Idle", false)
        
        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Your flowers always smelled great, Flow...")

        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Aw, shucks, Tidy...")
        GAME:WaitFrames(30)

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("I would love to keep reuniting,[pause=0] not really, but...")
        UI:WaitShowDialogue("We should probably get going.")


        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Stunned")
        AI:SetCharacterAI(flow, "origin.ai.ground_partner", CH('PLAYER'), flow.Position)
        AI:SetCharacterAI(tidy, "origin.ai.ground_partner", flow, tidy.Position)
        tidy.CollisionDisabled = true
        UI:WaitShowDialogue("Yeah? Alrighty.[pause=40][emote=Normal] Let's go.")
    else
        local tidy = CH("Teammate1")
        local rexio = CH("PLAYER")
        local cor1 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(rexio, rexio.Position.X + 50, rexio.Position.Y, false, 1)
            COMMON.CharExclaim("PLAYER")

            UI:SetSpeaker(tidy)
            UI:SetSpeakerEmotion("Shouting")
            UI:WaitShowDialogue("Waaeeehhhhh!!")
            GROUND:MoveToPosition(tidy, rexio.Position.X + 50, rexio.Position.Y, true, 12)
            COMMON.CharRealize("Teammate1")

            GROUND:CharSetAnim(CH("Teammate1"), "Trip", true)
        end)	
        local cor2 = TASK:BranchCoroutine(function()
            GAME:FadeIn(50)
        end)
        TASK:JoinCoroutines({cor1, cor2})

        GAME:WaitFrames(45)

        COMMON.CharSweating("PLAYER")
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("...um...")

        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("It... it was so dirty...")
        UI:SetSpeakerEmotion("Pain")
        UI:WaitShowDialogue("There wasn't... a single speck of clean!")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Tidy...?")

        GROUND:CharSetAnim(CH("Teammate1"), "Idle", false)

        local cor11 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(tidy, rexio.Position.X + 10, rexio.Position.Y, true, 7)
        end)	
        local cor12 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(10)
            GROUND:AnimateInDirection(rexio, "Walk", Dir8.Right, Dir8.Left, 10, 3, 2)
        end)
        TASK:JoinCoroutines({cor11, cor12})
        
        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Rexio!")

        GROUND:MoveToPosition(tidy, rexio.Position.X + 20, rexio.Position.Y, false, 1)
        GAME:WaitFrames(10)

        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Never[pause=20] make me[emote=Teary-Eyed] go back there again!")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Wha-[pause=20][br] Okay,[emote=Angry] where were you, first of all?[pause=0] Ugh, something[emote=Worried] weird is going on, and we need to figure it out!")

        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Stunned")
        GROUND:AnimateInDirection(tidy, "Walk", Dir8.Left, Dir8.Right, 10, 3, 2)
        AI:SetCharacterAI(tidy, "origin.ai.ground_partner", CH('PLAYER'), tidy.Position)
        tidy.CollisionDisabled = true
        GAME:WaitFrames(15)
        UI:WaitShowDialogue("I don't know what came over me.[pause=40][emote=Normal] Let's just go.")
    end
end