require 'origin.common'

South = {}

local wurp = CH("Wurp")
local snow = CH("Snow")
local rexio = CH("PLAYER")

function South.BossBegin()
    GAME:MoveCamera(MRKR("Centered").Position.X, MRKR("Centered").Position.Y, 1, false)
    GAME:FadeIn(50)
    COMMON.CharSweating("Snow")
    UI:SetSpeaker(snow)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("W-wurp...[pause=20][emote=Worried] are you sure you know where we're going?")

    local function yikes()
        COMMON.FaceEachother("PLAYER", "Wurp")
        GAME:WaitFrames(20)
        COMMON.CharSweatdrop("Wurp")
    end

    UI:SetSpeaker(wurp)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Of course I do! We live here, so maybe we go.[emote=Worried]..[script=0] u-uh...", {yikes})

    local function sadsnow()
        COMMON.FaceEachother("Wurp", "Snow")
        COMMON.CharSweating("Snow")
    end
    UI:SetSpeaker(snow)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("Wurp...[emote=Teary-Eyed][script=0] I wanna go home[speed=0.6], but everytime we go to the path...", {sadsnow})

    local function turn()
        COMMON.FaceEachother("PLAYER", "Wurp")
    end

    UI:SetSpeaker(wurp)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Maybe we just awen't twying hawd enough![pause=40][script=0] I shawl go again!", {turn})

    GROUND:MoveToMarker(wurp, MRKR("moving1"), true, 4)
    GROUND:MoveToMarker(wurp, MRKR("moving2"), true, 4)

    GAME:CutsceneMode(true)
    GROUND:TeleportTo(wurp, MRKR("moving3").Position.X, MRKR("moving3").Position.Y, Dir8.Up, 0)
    SOUND:PlayBattleSE("DUN_Pound")
    SOUND:StopBGM()
    GAME:WaitFrames(150)
    

    UI:SetSpeaker(wurp)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...maybe it's... broken.")

    UI:SetSpeaker(snow)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Wurp,[pause=25] how do you \'be\' sometimes?")

    COMMON.FaceEachother("Snow", "Wurp")
    COMMON.CharAngry("Wurp")
    COMMON.CharHop("Wurp")
    UI:SetSpeaker(wurp)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("And wat does that mean?!")
    GAME:CutsceneMode(false)
end