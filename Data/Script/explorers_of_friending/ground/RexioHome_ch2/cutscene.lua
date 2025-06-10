require 'explorers_of_friending.common'

Aurm = {}

function Aurm.AFeeling()
    GAME:CutsceneMode(true)
    local rexio = CH("PLAYER")
    GROUND:CharSetAnim(rexio, "EventSleep", true)
    GAME:FadeIn(180)
    UI:WaitShowTitle("Chapter 4:\nA Feeling", 120)
    GAME:WaitFrames(30)
    UI:WaitHideTitle(120)
    GROUND:CharWaitAnim(rexio, "EventSleep", true)
    GROUND:CharSetAnim(rexio, "Laying", true)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Pain")
    UI:WaitShowDialogue("Hic!")
    
    GROUND:CharWaitAnim(rexio, "Wake", true)
    GROUND:CharSetAnim(rexio, "Idle", true)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue("Good morning, old guy!")

    GAME:WaitFrames(40)
    COMMON.CharQuestion("PLAYER")
    GROUND:MoveToMarker(rexio, MRKR("look1"), false, 2)
    GROUND:CharSetAnim(rexio, "None", true)
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("...dad?")

    GAME:WaitFrames(40)
    COMMON.CharQuestion2("PLAYER")
    GROUND:MoveToMarker(rexio, MRKR("look2"), false, 2)

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("Weird...")
    GAME:CutsceneMode(false)
end