require 'explorers_of_friending.common'

Entoh = {}

function Entoh.Dragon()
    local ponya = CH("Ponya")
    local bucks = CH("Bucks")
    local rexio = CH("PLAYER")
    local dragon = CH("Dragon")
    local mud = CH("Mud")
    local ponia = CH("Ponia")
    local chucky = CH("Chucky")
    GAME:CutsceneMode(true)
    if SV.entoh_town.thicket.result == 9 and SV.entoh_town.HelperChapter >= 1 then
        COMMON.FaceEachother("Dragon", "Ponya")
        UI:SetSpeaker(ponya)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Unacceptable!")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("...huh?")

        local cor100000 = TASK:BranchCoroutine(function()
            GAME:MoveCamera(MRKR("Camera").Position.X, MRKR("Camera").Position.Y, 30, false)
        end)	
        local cor200000 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(ponya)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("Three weeks![pause=40] It has been three weeks!")
        end)
        TASK:JoinCoroutines({cor100000, cor200000})
        UI:SetSpeakerEmotion("Determined")
        UI:WaitShowDialogue("How could you possibly have nothing to deliver overland for almost a month!")

        local cor1 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(rexio, 284, 297, false, 1)
        end)	
        local cor2 = TASK:BranchCoroutine(function()
            UI:SetSpeaker(dragon)
            UI:SetSpeakerEmotion("Pain")
            UI:WaitShowDialogue("Ponya, please, you've gotta understand.")
            GROUND:CharTurnToCharAnimated(chucky, ponya, 3)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("All the packages from overseas ain't makin' their way over here.")
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Somethin' interruptin' the flow of things, just give it a little longer...!")
        end)
        TASK:JoinCoroutines({cor1, cor2})
        UI:SetSpeaker(ponya)
        GROUND:CharSetAnim(ponya, "Charge", true)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("We don't have longer!")

        UI:SetSpeaker(bucks)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("It's unfortunate, but we'll just come back some other time.")
        GROUND:CharSetAnim(ponya, "Idle", true)
        COMMON.FaceEachother("Dragon", "Bucks")
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowTimedDialogue("Look, Dragon,[pause=30] we know it's out of your control,[pause=10] b")
        
        local corr1 = TASK:BranchCoroutine(function()
            GROUND:CharTurnToCharAnimated(dragon, ponya, 3)
            GROUND:CharTurnToCharAnimated(bucks, ponya, 3)
            GROUND:CharTurnToCharAnimated(rexio, ponya, 3)
            GROUND:CharTurnToCharAnimated(mud, ponya, 3)
            GROUND:CharTurnToCharAnimated(ponia, ponya, 3)
            GROUND:CharTurnToCharAnimated(chucky, ponya, 3)
            GAME:WaitFrames(40)
            COMMON.CharSweatdrop("Chucky")
        end)	
        local corr2 = TASK:BranchCoroutine(function()
            GROUND:CharSetAnim(ponya, "Charge", true)
            UI:SetSpeaker(ponya)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("Out of his control for[pause=25] three[pause=25] weeks!")
        end)
        TASK:JoinCoroutines({corr1, corr2})

        
        local coror1 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(35)
            UI:SetSpeaker(bucks)
            UI:SetSpeakerEmotion("Stunned")
            COMMON.CharSweating("Bucks")
            UI:WaitShowDialogue("...right.")
            UI:SetSpeakerEmotion("Worried")
            COMMON.FaceEachother("Bucks", "Dragon")
            GROUND:CharTurnToCharAnimated(chucky, bucks, 3)
            UI:WaitShowDialogue("You have got to figure this out.[br]Those boxes have pretty important things that need to go to important people.")

            UI:SetSpeaker(dragon)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowTimedDialogue("I'm trying to see what I can do, but I can't contact anyone and...")
        end)	
        local coror2 = TASK:BranchCoroutine(function()
           GAME:WaitFrames(55)
           COMMON.FaceEachother("Mud", "Ponia")
        end)
        TASK:JoinCoroutines({coror1, coror2})

        
        local coror1 = TASK:BranchCoroutine(function()
            COMMON.FaceEachother("Ponya", "Bucks")
            GROUND:CharSetAnim(ponya, "RearUp", false)
            UI:SetSpeaker(ponya)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowTimedDialogue("Gaaaah![pause=35] We'll go to the delivery place in Grimstine,[pause=30] I just cannot care anymore!", 60)
            local function buckhop()
                COMMON.CharHop("Bucks")
            end
            local function buckchase()
                GROUND:MoveToMarker(bucks, MRKR("BucksExit"), true, 4)
                GROUND:MoveToMarker(bucks, MRKR("PonyaExit2"), true, 4)
                GROUND:Hide("Bucks")
            end
            local function buckworry()
                COMMON.CharSweating("Bucks")
                GROUND:CharSetAnim(bucks, "Walk", true)
            end

            UI:SetSpeaker(bucks)
            UI:SetSpeakerEmotion("Surprised")
            UI:WaitShowDialogue("What?![pause=25][script=0] That's too far away![pause=40] What about your kids,[script=2][pause=30] what about my kids?![pause=20] Who's gonna watch them?![script=1]", {buckhop, buckchase, buckworry})
        end)	
        local coror2 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(10)
            COMMON.CharExclaim("Bucks")
            GAME:WaitFrames(55)
            GROUND:MoveToMarker(ponya, MRKR("PonyaExit"), true, 4)
            GROUND:CharTurnToCharAnimated(rexio, ponya, 3)
            GROUND:MoveToMarker(ponya, MRKR("PonyaExit2"), true, 4)
            GROUND:CharTurnToCharAnimated(rexio, ponya, 3)
            GROUND:Hide("Ponya")
        end)
        TASK:JoinCoroutines({coror1, coror2})

        local cororo1 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(30)
            COMMON.CharSweatdrop("PLAYER")
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("Geez...")
        end)	
        local cororo2 = TASK:BranchCoroutine(function()
            GAME:MoveCamera(0, 0, 100, true)
        end)
        TASK:JoinCoroutines({cororo1, cororo2})
        SV.entoh_town.HelperChapter = 2
        GAME:CutsceneMode(false)
    end
end