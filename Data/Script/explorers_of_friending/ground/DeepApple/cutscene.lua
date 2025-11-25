Core = {}

function Core.AppleOut()
    COMMON.RespawnAllies()
    GAME:CutsceneMode(true)
    GAME:MoveCamera(168, 120, 0, false)
    local maru = CH("PLAYER")
    local azura = CH("Teammate1")
    local rexio = CH("Teammate2")
    maru.CollisionDisabled = true
    azura.CollisionDisabled = true
    rexio.CollisionDisabled = true

    local the1 = TASK:BranchCoroutine(function()
        local wh2 = TASK:BranchCoroutine(function()
            GROUND:AnimateToPosition(rexio, "Walk", Dir8.Up, rexio.Position.X, rexio.Position.Y - 55, 0.7, 0.5, 0)
            end)
        local wh3 = TASK:BranchCoroutine(function()
            GAME:FadeIn(60)
            end)
        TASK:JoinCoroutines({wh2, wh3})
        COMMON.CharRealize("Teammate2")
        GROUND:CharTurnToChar(rexio, azura)
        GROUND:MoveToPosition(maru, rexio.Position.X - 12, rexio.Position.Y + 40, true, 4)
        GAME:WaitFrames(15)
        end)
    local the2 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(90)
        GROUND:MoveToPosition(azura, rexio.Position.X + 12, rexio.Position.Y + 50, false, 2)
        end)
    local the3 = TASK:BranchCoroutine(function()
        COMMON.SetCharAndEmotion(maru, "Shouting")
        GAME:WaitFrames(80)
        UI:WaitShowTimedDialogue("Rexio!", 75)
        end)
    TASK:JoinCoroutines({the1, the2, the3})

    COMMON.SetCharAndEmotion(maru, "Angry")
    UI:WaitShowTimedDialogue("Why would you", 10)

    COMMON.SetCharAndEmotion(rexio, "Normal")
    UI:WaitShowDialogue("No.")

    COMMON.SetCharAndEmotion(maru, "Stunned")
    UI:WaitShowDialogue("Huh?")

    GROUND:CharAnimateTurnTo(rexio, Dir8.Up, 3)
    COMMON.SetCharAndEmotion(rexio, "Normal")
    UI:WaitShowDialogue("I know where this is gonna go,[pause=45] you're gonna tell me it's too dangerous.")
    UI:WaitShowDialogue("You're gonna tell me we don't need to be here.")

    COMMON.SetCharAndEmotion(maru, "Worried")
    UI:WaitShowDialogue("...")

    COMMON.SetCharAndEmotion(rexio, "Determined")
    UI:WaitShowDialogue("I want to be good at dungeoning,[pause=40] just like dad.[pause=40] Just like mom...")
    GROUND:CharAnimateTurnTo(rexio, Dir8.Down, 3)
    COMMON.SetCharAndEmotion(rexio, "Angry")
    UI:WaitShowDialogue("And whether or not you guys go with me, I won't let you slow me down!")

    UI:SetSpeaker(maru, false)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("(...it's getting late...)")
    GROUND:CharTurnToChar(maru, azura)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue("(...and Azura's barely holding out.)")

    local choices = {
        ("Let's not..."),
        ("Let's go!")
    }

    UI:BeginChoiceMenu("(What should I do...?)", choices, 1, 2)
    UI:WaitForChoice()
    local result = UI:ChoiceResult()
    if result == 1 then
        SV.apple_town.teamed = false
        UI:SetSpeaker(maru)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Well, if you're so sure then we'll wait outside for you.")
        UI:SetSpeakerEmotion("Sad")
        UI:WaitShowDialogue("Azura can't really do anything and we wouldn't wanna slow you down.")

        local h1 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(maru, maru.Position.X, 300, false, 3)
            end)
        local h2 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(azura, azura.Position.X, 210, false, 2)

            GROUND:CharAnimateTurnTo(azura, Dir8.Up, 3)
            UI:SetSpeaker(azura)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Good luck!")

            GROUND:CharAnimateTurnTo(azura, Dir8.Down, 3)
            GROUND:MoveToPosition(azura, azura.Position.X, 300, false, 3)
            end)
        TASK:JoinCoroutines({h1, h2})
        
        --remove the other two, add Rexio back as leader
        local new_x = rexio.Position.X
        local new_y = rexio.Position.Y
        SV.guilders.tarro_town.bluetail_stats = GAME:GetPlayerPartyTable()
        GAME:RemovePlayerTeam(0)
        GAME:RemovePlayerTeam(0)
        COMMON.RespawnAllies()
        
        COMMON.TeleportToMarker("PLAYER", new_x, new_y)

        COMMON.SetCharAndEmotion(rexio, "Determined")
        UI:WaitShowDialogue("Let's go. [pause=40][emote=Happy]I've got this!")
    else
        SV.apple_town.teamed = true
        COMMON.SetCharAndEmotion(maru, "Worried")
        UI:WaitShowDialogue("Azura, how long do you think you can hold on for?")

        COMMON.SetCharAndEmotion(azura, "Pain")
        UI:WaitShowDialogue("...I'll try,[pause=35] but...")

        COMMON.SetCharAndEmotion(rexio, "Worried")
        UI:WaitShowDialogue("Does she have to come with?[pause=30] She seems out of it.")

        COMMON.SetCharAndEmotion(azura, "Determined")
        UI:WaitShowDialogue("[speed=0.2]No...")
        UI:WaitShowDialogue("I wanna be strong, too...")

        COMMON.SetCharAndEmotion(maru, "Sad")
        UI:WaitShowDialogue("Azura...")

        COMMON.SetCharAndEmotion(rexio, "Happy")
        UI:WaitShowDialogue("Great! Let's get ready and get goin'!")
    end
    maru.CollisionDisabled = false
    GAME:CutsceneMode(false)
end