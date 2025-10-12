require 'explorers_of_friending.common'

Entoh2 = {}

function Entoh2.TheFlow()
    local mon_id1 = RogueEssence.Dungeon.MonsterID("flabebe", 0, "normal", Gender.Female)
  
    local p1 = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id1, 5, "", 0)
    p1.IsFounder = true
    p1.IsPartner = true
    p1.Nickname = "Flow"

    _DATA.Save.ActiveTeam.Players:Add(p1)

    local talk_npc = RogueEssence.Dungeon.BattleScriptEvent("FlowInteract")
        _DATA.Save.ActiveTeam.Players[GAME:GetPlayerPartyCount() - 1].ActionEvents:Add(talk_npc)

    COMMON.RespawnAllies()
    if SV.entoh_town.firstfind == 2 then
        SV.entoh_town.HelperChapter = 7
        local flow = CH("Teammate2")
        local tidy = CH("Teammate1")
        local chucky = CH("Chucky")
        local rexio = CH("PLAYER")
        GROUND:TeleportTo(tidy, rexio.Position.X - 24, rexio.Position.Y - 24, Direction.Right, 0)
        GAME:WaitFrames(12)
        UI:SetSpeaker(chucky)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Oh geez...")

        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("\'OH GEEZ?!\'")

        GAME:MoveCamera(MRKR("Centered").Position.X, MRKR("Centered").Position.Y, 1, false)
        GAME:FadeIn(50)

        UI:SetSpeaker(chucky)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Dude, I can't help, I can't find anyone around.[pause=50] I'm looking for Dragon, man.")
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("He's a total wimp, and if I can't find him then he's probably gonna lose his mind...")

        COMMON.CharExclaim("Chucky")

        local cor1 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(rexio, 352, 376, false, 3)
            GROUND:MoveToPosition(tidy, 320, 416, false, 3)
        end)	
        local cor2 = TASK:BranchCoroutine(function()
            COMMON.CharHop("Teammate1")
            UI:SetSpeaker(flow)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("I NEED TO FIND MY MOTHER!")

            UI:SetSpeaker(chucky)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("You need to calm down.")

            UI:SetSpeaker(flow)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("YOU NEED TO CALM UP!")
        end)
        TASK:JoinCoroutines({cor1, cor2})

        COMMON.FaceEachother(tidy, flow)
        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Flow, what's going on?")
        
            
        local cor3 = TASK:BranchCoroutine(function()
            COMMON.CharSweatdrop("Chucky")
            GAME:WaitFrames(45)
            GROUND:MoveToMarker(chucky, MRKR("exit1"), true, 5)
            GROUND:MoveToMarker(chucky, MRKR("exit2"), true, 5)
        end)	
        local cor4 = TASK:BranchCoroutine(function()
            COMMON.CharHop("Teammate1")
            UI:SetSpeaker(flow)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("I NEED TO FIND MY MOTHER AND CHUCKY ISN'T HELPING!")

            UI:SetSpeaker(tidy)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("Chucky is probably busy...")

            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Doesn't look busy.")
        end)
        TASK:JoinCoroutines({cor3, cor4})

        GROUND:Hide("Chucky")
        GROUND:CharAnimateTurn(flow, Direction.Right, 8, false)


        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("CHUCKYYYYYYYYY!!")
        
        AI:SetCharacterAI(tidy, "origin.ai.ground_partner", CH('PLAYER'), tidy.Position)
        AI:SetCharacterAI(flow, "origin.ai.ground_partner", tidy, flow.Position)
        flow.CollisionDisabled = true

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("We should go.")
        SV.entoh_town.firstfind = 3
        GAME:MoveCamera(0, 0, 0, true)
    elseif SV.entoh_town.firstfind < 3 then
        local flow = CH("Teammate1")
        local chucky = CH("Chucky")
        local rexio = CH("PLAYER")
        UI:SetSpeaker(chucky)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Oh geez...")

        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("\'OH GEEZ?!\'")

        GAME:MoveCamera(MRKR("Centered").Position.X, MRKR("Centered").Position.Y, 1, false)
        GAME:FadeIn(50)

        UI:SetSpeaker(chucky)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Dude, I can't help, I can't find anyone around.[pause=50] I'm looking for Dragon, man.")
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("He's a total wimp, and if I can't find him then he's probably gonna lose his mind...")

        COMMON.CharExclaim("Chucky")

        local cor1 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(rexio, 352, 376, false, 3)
        end)	
        local cor2 = TASK:BranchCoroutine(function()
            COMMON.CharHop("Teammate1")
            UI:SetSpeaker(flow)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("I NEED TO FIND MY MOTHER!")

            UI:SetSpeaker(chucky)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("You need to calm down.")

            UI:SetSpeaker(flow)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("YOU NEED TO CALM UP!")
        end)
        TASK:JoinCoroutines({cor1, cor2})

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Um...[pause=85] ...h-hello?")

        local function chuck_leave()
            GROUND:MoveToMarker(chucky, MRKR("exit1"), true, 5)
            GROUND:MoveToMarker(chucky, MRKR("exit2"), true, 5)
        end
        
        UI:SetSpeaker(chucky)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowTimedDialogue("Rex![pause=30] Hey, dude![pause=20][emote=Joyous] Time for me to go![pause=20] You gotta babysit,[pause=20] okay bye![script=0]", 90, {chuck_leave})

        GROUND:Hide("Chucky")
        GROUND:CharAnimateTurn(rexio, Direction.Left, 8, false)

        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("Grr...")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Well, he's gone so I guess I'm in charge...?")
        
        AI:SetCharacterAI(flow, "origin.ai.ground_partner", CH('PLAYER'), flow.Position)
        flow.CollisionDisabled = true

        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Just... hurry it up a little.[pause=35] Mother's probably worried sick...")
        COMMON.FaceEachother(rexio, chucky)
        GAME:MoveCamera(0, 0, 0, true)
    end
end