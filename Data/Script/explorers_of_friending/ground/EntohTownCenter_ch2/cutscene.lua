require 'explorers_of_friending.common'

Center = {}

function Center.Feeling()
    local rexio = CH("PLAYER")

    GAME:CutsceneMode(true)

    COMMON.CharExclaim("PLAYER")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Surprised")
    UI:WaitShowDialogue("(Not just dad![pause=45] Everyone!)")

    GAME:WaitFrames(90)
    GROUND:CharAnimateTurn(rexio, Direction.Left, 1, false)
    COMMON.CharSweatdrop("PLAYER")
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("(...guess I have the place to myself for a while.)")

    GROUND:CharAnimateTurn(rexio, Direction.Left, 8, false)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("(...the heck did everyone go?![pause=40] And without telling me!)")

    GAME:CutsceneMode(false)
end