Rexio = {}

function Rexio.Luke()
    local rexio = CH("PLAYER")
    local luke = CH("Luke")
    GAME:CutsceneMode(true)
    COMMON.CharRealize("PLAYER")
    
    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowTimedDialogue("Rexio...")

    GAME:MoveCamera(376, 200, 100, false)

    COMMON.CharSweatdrop("PLAYER")
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowTimedDialogue("...dad, you're scaring me.")

    SOUND:PlayBGM("Over.ogg", true)

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowTimedDialogue("Rexio.[pause=35] Dragon got a letter,[pause=10] and it belonged to you.")
    UI:WaitShowTimedDialogue("You're growing up.[pause=30] And I can't keep you stuck here anyone.")

    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowTimedDialogue("...w-what?")

    UI:SetSpeaker(luke)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowTimedDialogue("Now it's time for you and your friends to go make it out there.")
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowTimedDialogue("You have to go and...[pause=35] m[emote=Happy]aybe be a part of the best squad you've ever seen.")

    SOUND:StopBGM()
    UI:SetSpeaker(rexio)
    UI:SetSpeakerEmotion("Normal")
    UI:WaitShowTimedDialogue("Great.")
end