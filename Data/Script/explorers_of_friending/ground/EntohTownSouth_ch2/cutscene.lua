require 'origin.common'

South_ch2 = {}

function South_ch2.GoingIn()
    GAME:RemovePlayerTeam(1)
    GAME:RemovePlayerTeam(1)
    GAME:RemovePlayerTeam(1)
    local rexio = CH("PLAYER")

    COMMON:RespawnAllies()
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Dizzy")
    UI:WaitShowDialogue("Yikes... I'm... not getting used to that...")

    GAME:FadeIn(50)
    
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Looks like everyone is here but my dad... maybe I should ask around.")
end

function South_ch2.GoingInFull()
    local rexio = CH("PLAYER")
    local flow = CH("Teammate1")
    local tidy = CH("Teammate2")

    COMMON:RespawnAllies()
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Dizzy")
    UI:WaitShowDialogue("Yikes...")

    UI:SetSpeaker(flow)
    UI:SetSpeakerEmotion("Dizzy")
    UI:WaitShowDialogue("Wehhh...")

    UI:SetSpeaker(tidy)
    UI:SetSpeakerEmotion("Dizzy")
    UI:WaitShowDialogue("Oof...")
    GAME:FadeIn(50)
end