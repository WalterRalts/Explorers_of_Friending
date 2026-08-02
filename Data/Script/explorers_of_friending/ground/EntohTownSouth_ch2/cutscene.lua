require 'explorers_of_friending.common'

South_ch2 = {}

function South_ch2.GoingIn()
    GAME:CutsceneMode(true)
    GAME:SetTeamLeaderIndex(0)
    GAME:RemovePlayerTeam(1)
    GAME:RemovePlayerTeam(1)
    GAME:RemovePlayerTeam(1)
    local rexio = CH("PLAYER")

    COMMON:RespawnAllies()
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Dizzy")
    UI:WaitShowDialogue("Yikes, I'm... not getting used to that...")
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...whatever that was...")

    GAME:FadeIn(50)
    
    GROUND:CharAnimateTurnTo(rexio, Dir8.Left, 3)
    GAME:WaitFrames(20)
    GROUND:CharAnimateTurnTo(rexio, Dir8.Up, 3)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Looks like everyone is here but my dad. Maybe I should ask around.")

    GAME:CutsceneMode(false)
end

function South_ch2.GoingInFull()
    GAME:RemovePlayerTeam(3)
    GAME:RemovePlayerTeam(3)
    COMMON:RespawnAllies()
    GAME:SetTeamLeaderIndex(0)
    GROUND:Unhide("Tidy")
    GROUND:Unhide("Flow")

    local rexio = CH("PLAYER")
    local flow = CH("Teammate1")
    local tidy = CH("Teammate2")
    if SV.Story.flag == {"Flow", "Tidy"} then
        flow = CH('Teammate1')
        tidy = CH('Teammate2')
    elseif SV.Story.flag == {"Tidy", "Flow"} then
        flow = CH('Teammate2')
        tidy = CH('Teammate1')
    end

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Dizzy")
    UI:WaitShowDialogue("Yikes...")

    UI:SetSpeaker(flow)
    UI:SetSpeakerEmotion("Dizzy")
    UI:WaitShowDialogue("Wehhh...")

    UI:SetSpeaker(tidy)
    UI:SetSpeakerEmotion("Dizzy")
    UI:WaitShowDialogue("Oof.[pause=65] [emote=Surprised]Ah![pause=60][emote=Shouting] Momma, help, save me!!")

    UI:SetSpeaker(flow)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...geez, Tidy. We already got out...")
    GAME:FadeIn(50)
    GROUND:CharAnimateTurnTo(rexio, Dir8.Left, 3)
    GAME:WaitFrames(20)
    GROUND:CharAnimateTurnTo(rexio, Dir8.Up, 3)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Looks like everyone is here but my dad. Maybe I should ask around.")
end