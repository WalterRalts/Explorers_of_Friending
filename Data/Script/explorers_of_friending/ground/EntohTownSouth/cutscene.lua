require 'explorers_of_friending.common'

South = {}

function South.BossBegin()
    local wurp = CH("Wurp")
    local snow = CH("Snow")
    local apple = OBJ("Apple")
    local a1 = CH("applin_1")
    local a2 = CH("applin_2")
    local a3 = CH("applin_3")
    local a4 = CH("applin_4")
    local a5 = CH("applin_5")
    local a6 = CH("applin_6")
    Todungeonscene = true

    COMMON:RespawnAllies()
    GAME:MoveCamera(MRKR("Centered").Position.X, MRKR("Centered").Position.Y, 1, false)
    GAME:FadeIn(50)
    COMMON.CharSweating("Snow")
    UI:SetSpeaker(snow)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("W-wurp...[pause=20][emote=Worried] are you sure you know where we're going?")

    local function yikes()
        GAME:WaitFrames(20)
        COMMON.CharSweatdrop("Wurp")
    end

    UI:SetSpeaker(wurp)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Of course I do![pause=25] We live here, so maybe we go.[emote=Worried]..[script=0] u-uh...", {yikes})

    local function sadsnow()
        COMMON.CharSweating("Snow")
    end
    UI:SetSpeaker(snow)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue("Wurp...[pause=45][emote=Teary-Eyed][script=0] I wanna go home[pause=25][speed=0.4], but everytime we go to the path...", {sadsnow})

    COMMON.CharHop("Wurp")
    UI:SetSpeaker(wurp)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue("Maybe we just awen't twying hawd enough![pause=40] I shall go again!")

    GROUND:MoveToMarker(wurp, MRKR("move_1"), false, 2)
    GROUND:MoveToMarker(wurp, MRKR("move_2"), false, 2)
    COMMON.TeleportToMarker(wurp, "move_3", Dir8.Up)

    SOUND:PlayBattleSE("DUN_Pound")
    SOUND:StopBGM()
    GAME:WaitFrames(150)

    UI:SetSpeaker(wurp)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("...maybe it's... broken.")

    UI:SetSpeaker(snow)
    UI:SetSpeakerEmotion("Stunned")
    UI:WaitShowDialogue("Wurp,[pause=25] how do you[pause=20] \'be\'[pause=20] sometimes?")

    COMMON.FaceEachother(snow, wurp)
    COMMON.CharAngry("Wurp")
    UI:SetSpeaker(wurp)
    UI:SetSpeakerEmotion("Angry")
    UI:WaitShowDialogue("And wat does that mean?!")

    if SV.entoh_town.firstfind == 0 then -- Neither of them were found
        local rexio = CH("PLAYER")
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("Ah! Someone else!")
        GROUND:MoveToPosition(rexio, wurp.Position.X - 45, wurp.Position.Y, false, 2)
        
        COMMON.FaceEachother(rexio, wurp)
        COMMON.CharHop("PLAYER")
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Where were you guys?!")

        UI:SetSpeaker(snow)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("H-[pause=40]hi, Rexio.")

        local coro3 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(50)
            GROUND:CharAnimateTurn(snow, Dir8.Left, 6, true)
            end)
        local coro4 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(20)
            UI:SetSpeaker(wurp)
            UI:SetSpeakerEmotion("Sad")
            UI:WaitShowTimedDialogue("We can't weave![pause=20] We wanted to go find you[pause=10] or someone! But...!", 40)
            GROUND:CharAnimateTurn(wurp, Dir8.Left, 4, true)

            GAME:WaitFrames(35)            
            COMMON.CharQuestion2("Wurp")
            UI:WaitShowDialogue("Wexio...? Awe you wistening?")
            end)
        local coro5 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(rexio, 140, 200, false, 1)
            GROUND:CharAnimateTurn(rexio, Dir8.Right, 10, true)
            GAME:WaitFrames(25)
            GROUND:CharAnimateTurn(rexio, Dir8.Left, 10, true)
            GAME:WaitFrames(25)
            COMMON.CharQuestion("Snow")
            end)
        TASK:JoinCoroutines({coro3, coro4, coro5})

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("...I dunno,[pause=15] just felt like having an apple for some reason.")

        local coro31 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(10)
            COMMON.CharSweatdrop("Snow")

            GROUND:CharAnimateTurnTo(snow, Dir8.Right, 2)

            GAME:WaitFrames(80)
            COMMON.CharRealize("Snow")
            end)
        local coro41 = TASK:BranchCoroutine(function() 
            UI:SetSpeaker(wurp)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("Wuh huh?")
            UI:WaitShowTimedDialogue("Wut dus...?[pause=50] Anyway, I think it would be best if you actually thought about", 10)
            end)
        local coro51 = TASK:BranchCoroutine(function() 
            COMMON.FaceEachother(rexio, wurp)
            end)
        TASK:JoinCoroutines({coro31, coro41, coro51})

        UI:SetSpeaker(snow)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("W-wait, he's right!")

        COMMON.FaceEachother(snow, wurp)

        UI:SetSpeaker(wurp)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Huh? About what?")

        UI:SetSpeaker(snow)
        UI:SetSpeakerEmotion("Sigh")
        UI:WaitShowDialogue("...I kinda want a-an apple, too...")

        COMMON.CharAngry("Wurp")
        COMMON.CharHop("Wurp")
        UI:SetSpeaker(wurp)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Wut's an appwe gotta do with getting us out of hewe?!")

        SOUND:PlayBGM("None", true, 95)
        GROUND:MoveObjectToPosition(apple, 86, rexio.Position.Y, 5)
        SOUND:PlaySE("Battle/EVT_CH02_Item_Place")
        GROUND:CharAnimateTurnTo(rexio, Dir8.Left, 3)
        GROUND:CharAnimateTurnTo(snow, Dir8.Left, 2)
        GROUND:CharAnimateTurnTo(wurp, Dir8.Left, 2)

        GAME:WaitFrames(75)
        COMMON.CharSweatdrop("Wurp")
        GAME:WaitFrames(25)
        COMMON.CharSweating("Snow")
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I'm probably not dumb enough to just take a random apple that seemingly lowered from the sky.")

        COMMON.CharRealize("PLAYER")
        UI:ResetSpeaker()
        UI:WaitShowDialogue("I told you he wouldn't fall for it! Stupid plan!")

        local emitter5 = RogueEssence.Content.SingleEmitter(RogueEssence.Content.AnimData("Leaf_Storm_Shoot", 3))

        GROUND:Hide("Apple")
        GROUND:PlayVFX(emitter5, apple.Bounds.Center.X, apple.Bounds.Center.Y)
        SOUND:PlaySE("Battle/_UNK_DUN_Charge")
        GAME:WaitFrames(15)

        SOUND:PlaySE("Battle/DUN_Leaf_Storm_3")
        GROUND:Unhide("applin_1")
        GROUND:Unhide("applin_2")
        GROUND:Unhide("applin_3")
        GROUND:Unhide("applin_4")
        GROUND:Unhide("applin_5")
        GROUND:Unhide("applin_6")
        GROUND:PlayVFX(emitter5, a1.Bounds.Center.X, a1.Bounds.Center.Y)
        GROUND:PlayVFX(emitter5, a2.Bounds.Center.X, a2.Bounds.Center.Y)
        GROUND:PlayVFX(emitter5, a3.Bounds.Center.X, a3.Bounds.Center.Y)
        GROUND:PlayVFX(emitter5, a4.Bounds.Center.X, a4.Bounds.Center.Y)
        GROUND:PlayVFX(emitter5, a5.Bounds.Center.X, a5.Bounds.Center.Y)
        GROUND:PlayVFX(emitter5, a6.Bounds.Center.X, a6.Bounds.Center.Y)
        COMMON.FaceEachother(a1, a2)
        GAME:WaitFrames(10)
        SOUND:PlaySE("Battle/DUN_Leaf_Storm_2")

        COMMON.CharAngry("applin_1")
        UI:SetSpeaker(a1)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("YOU'RE A STUPID PLAN!")

        COMMON.CharAngry("applin_2")
        UI:SetSpeaker(a2)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("YOU'RE A STUPID![pause=30] PERIOD!")

        COMMON.CharHop("applin_4")
        UI:SetSpeaker(a4)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("[speed=0.3]Anyway...")
        GROUND:CharAnimateTurnTo(snow, Dir8.Right, 2)
        GROUND:CharAnimateTurnTo(wurp, Dir8.Right, 2)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("We have been taken from our home, so the group has unanimously decided that we're taking over.")

        COMMON.CharExclaim("Snow")
        UI:SetSpeaker(snow)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("I-isn't that a-[pause=20]a little hasty...?")

        UI:SetSpeaker(wurp)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Why awe you doing this, we witerawwy just met you!")
        UI:WaitShowDialogue("We couldn't hav dun anythin wwong!")

        UI:SetSpeaker(a5)
        UI:SetSpeakerEmotion("Sigh")
        UI:WaitShowDialogue("Sorry kids, but it's Apple code.[pause=35] First sight's the suspect.")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Sigh")
        UI:WaitShowDialogue("...[pause=25]let's just get this over with.[emote=Determined] Out of our way.")
    elseif SV.entoh_town.firstfind == 1 then -- Flow was found
    
        local flow = CH('Teammate1')
        local rexio = CH("PLAYER")
        if SV.entoh_town.HelperChapter < 7 then -- Tidy was not...
            GROUND:MoveToPosition(flow, 145, 164, true, 6)
            GROUND:MoveToPosition(rexio, 120, wurp.Position.Y, true, 6)
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Surprised")
            UI:WaitShowDialogue("Ah! Someone else!")
            COMMON.FaceEachother(rexio, wurp)
            COMMON.CharHop("PLAYER")
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("Where were you guys?!")

            UI:SetSpeaker(snow)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("H-[pause=40]hi, Rexio. H-hi, Flow...")

            UI:SetSpeaker(flow)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("Snow, how long have you been stuck here?")

            local coro3 = TASK:BranchCoroutine(function()
                GAME:WaitFrames(50)
                GROUND:CharAnimateTurn(snow, Dir8.Left, 6, true)
                end)
            local coro4 = TASK:BranchCoroutine(function()
                GAME:WaitFrames(20)
                UI:SetSpeaker(snow)
                UI:SetSpeakerEmotion("Sad")
                UI:WaitShowTimedDialogue("A while.[pause=30] W-wurp doesn't... know what he's doing...", 45)

                UI:SetSpeaker(wurp)
                UI:SetSpeakerEmotion("Sad")
                UI:WaitShowTimedDialogue("AT WEAST I'M TWYING!", 45)
                GROUND:CharAnimateTurn(wurp, Dir8.Left, 4, true)

                GAME:WaitFrames(35)            
                COMMON.CharQuestion2("Wurp")
                UI:WaitShowDialogue("WEXIO!")
                end)
            local coro5 = TASK:BranchCoroutine(function()
                GROUND:MoveToPosition(rexio, 140, 200, false, 1)
                GROUND:CharAnimateTurn(rexio, Dir8.Right, 10, true)
                GAME:WaitFrames(55)
                GROUND:CharAnimateTurn(rexio, Dir8.Left, 10, true)
                GAME:WaitFrames(25)
                COMMON.CharQuestion("Snow")
                end)
            TASK:JoinCoroutines({coro3, coro4, coro5})

            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Oh, sorry,[pause=15] just felt like not listening.")
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Anyone else feeling like eating apple for some reason?")
            
            local coro31 = TASK:BranchCoroutine(function()
                COMMON.CharSweatdrop("Teammate1")
                GAME:WaitFrames(10)
                COMMON.CharSweatdrop("Snow")

                GROUND:CharAnimateTurn(snow, Dir8.Right, 2, true)

                GAME:WaitFrames(80)
                COMMON.CharRealize("Snow")
                end)
            local coro41 = TASK:BranchCoroutine(function() 
                UI:SetSpeaker(wurp)
                UI:SetSpeakerEmotion("Stunned")
                UI:WaitShowDialogue("Wuh huh?")
                UI:WaitShowTimedDialogue("Wut dus...?[pause=50] Anyway, I think it would be best if you actually thought about", 10)
                end)
            local coro51 = TASK:BranchCoroutine(function() 
                COMMON.FaceEachother(rexio, wurp)
                end)
            TASK:JoinCoroutines({coro31, coro41, coro51})

            UI:SetSpeaker(snow)
            UI:SetSpeakerEmotion("Surprised")
            UI:WaitShowDialogue("W-wait, he's right!")

            COMMON.FaceEachother(snow, wurp)

            UI:SetSpeaker(wurp)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Huh? About what?")

            UI:SetSpeaker(snow)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("...I kinda want a-an apple, too...")

            UI:SetSpeaker(flow)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Me three.")

            COMMON.CharAngry("Wurp")
            COMMON.CharHop("Wurp")
            UI:SetSpeaker(wurp)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("Wut's an appwe gotta do with getting us out of hewe?!")

            SOUND:PlayBGM("None", true, 95)
            GROUND:MoveObjectToPosition(apple, 86, rexio.Position.Y, 5)
            SOUND:PlaySE("Battle/EVT_CH02_Item_Place")
            GROUND:CharAnimateTurn(rexio, Dir8.Left, 3, true)
            GROUND:CharAnimateTurnTo(flow, Dir8.Left, 3)
            GROUND:CharAnimateTurnTo(snow, Dir8.Left, 2)
            GROUND:CharAnimateTurnTo(wurp, Dir8.Left, 2)

            GAME:WaitFrames(75)
            COMMON.CharSweatdrop("Wurp")
            GAME:WaitFrames(25)
            COMMON.CharSweating("Snow")
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("I'm probably not dumb enough to just take a random apple that seemingly lowered from the sky.")

            UI:ResetSpeaker()
            UI:WaitShowDialogue("I told you he wouldn't fall for it! Stupid plan!")

            local emitter5 = RogueEssence.Content.SingleEmitter(RogueEssence.Content.AnimData("Leaf_Storm_Shoot", 3))

            GROUND:Hide("Apple")
            GROUND:PlayVFX(emitter5, apple.Bounds.Center.X, apple.Bounds.Center.Y)
            SOUND:PlaySE("Battle/_UNK_DUN_Charge")
            GAME:WaitFrames(15)

            SOUND:PlaySE("Battle/DUN_Leaf_Storm_3")
            GROUND:Unhide("applin_1")
            GROUND:Unhide("applin_2")
            GROUND:Unhide("applin_3")
            GROUND:Unhide("applin_4")
            GROUND:Unhide("applin_5")
            GROUND:Unhide("applin_6")
            GROUND:PlayVFX(emitter5, a1.Bounds.Center.X, a1.Bounds.Center.Y)
            GROUND:PlayVFX(emitter5, a2.Bounds.Center.X, a2.Bounds.Center.Y)
            GROUND:PlayVFX(emitter5, a3.Bounds.Center.X, a3.Bounds.Center.Y)
            GROUND:PlayVFX(emitter5, a4.Bounds.Center.X, a4.Bounds.Center.Y)
            GROUND:PlayVFX(emitter5, a5.Bounds.Center.X, a5.Bounds.Center.Y)
            GROUND:PlayVFX(emitter5, a6.Bounds.Center.X, a6.Bounds.Center.Y)
            COMMON.FaceEachother(a1, a2)
            GAME:WaitFrames(10)
            SOUND:PlaySE("Battle/DUN_Leaf_Storm_2")

            UI:SetSpeaker(a1)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("YOU'RE A STUPID PLAN!")

            UI:SetSpeaker(a2)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("YOU'RE A STUPID![pause=30] PERIOD!")

            COMMON.CharHop("applin_4")
            UI:SetSpeaker(a4)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("[speed=0.3]Anyway...")
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("We have been taken from our home, so the group has unanimously decided that we're taking over.")

            COMMON.CharExclaim("Snow")
            UI:SetSpeaker(snow)
            UI:SetSpeakerEmotion("Surprised")
            UI:WaitShowDialogue("I-isn't that a-[pause=20]a little hasty...?")

            UI:SetSpeaker(wurp)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("Why awe you doing this, we witerawwy just met you!")
            UI:WaitShowDialogue("We couldn't hav dun anythin wwong!")

            UI:SetSpeaker(a5)
            UI:SetSpeakerEmotion("Sigh")
            UI:WaitShowDialogue("Sorry kids, but it's Apple code.[pause=35] First sight's the suspect.")

            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Sigh")
            UI:WaitShowDialogue("...[pause=25]let's just get this over with.[emote=Determined] Out of our way.")
        else
            AllFoundSouth()
        end
    elseif SV.entoh_town.firstfind == 2 then --Tidy was found
        local tidy = CH('Teammate1')
        local rexio = CH("PLAYER")        
        if SV.entoh_town.HelperChapter < 7 then --Flow was not
            GROUND:MoveToPosition(tidy, 145, 164, true, 6)
            GROUND:MoveToPosition(rexio, wurp.Position.X - 45, wurp.Position.Y, false, 2)
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Surprised")
            UI:WaitShowDialogue("Ah! Someone else!")
            COMMON.FaceEachother(rexio, wurp)
            COMMON.CharHop("PLAYER")
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("Where were you guys?!")

            UI:SetSpeaker(snow)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("H-[pause=40]hi, Rexio. H-hi, Tidy...")

            UI:SetSpeaker(tidy)
            UI:SetSpeakerEmotion("Sigh")
            UI:WaitShowDialogue("Snow, girl, you need to stop following Wurp.")

            local coro3 = TASK:BranchCoroutine(function()
                GAME:WaitFrames(50)
                GROUND:CharAnimateTurn(snow, Dir8.Left, 6, true)
                end)
            local coro4 = TASK:BranchCoroutine(function()
                GAME:WaitFrames(20)
                UI:SetSpeaker(snow)
                UI:SetSpeakerEmotion("Sad")
                UI:WaitShowTimedDialogue("I know,[pause=20] but this is out of my control kinda...", 45)

                UI:SetSpeaker(wurp)
                UI:SetSpeakerEmotion("Angry")
                UI:WaitShowTimedDialogue("AT WEAST I'M TWYING!", 45)
                GROUND:CharAnimateTurn(wurp, Dir8.Left, 4, true)

                GAME:WaitFrames(35)            
                COMMON.CharQuestion2("Wurp")
                UI:WaitShowDialogue("WEXIO!")
                end)
            local coro5 = TASK:BranchCoroutine(function()
                GROUND:MoveToPosition(rexio, 140, 200, false, 1)
                GROUND:CharAnimateTurn(rexio, Dir8.Right, 10, true)
                GAME:WaitFrames(55)
                GROUND:CharAnimateTurn(rexio, Dir8.Left, 10, true)
                GAME:WaitFrames(25)
                COMMON.CharQuestion("Snow")
                end)
            TASK:JoinCoroutines({coro3, coro4, coro5})

            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Oh, sorry,[pause=15] just felt like not listening.")
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Anyone else feeling like eating apple for some reason?")
            
            local coro31 = TASK:BranchCoroutine(function()
                COMMON.CharSweatdrop("Teammate1")
                GAME:WaitFrames(10)
                COMMON.CharSweatdrop("Snow")

                GROUND:CharAnimateTurn(snow, Dir8.Right, 2, true)

                GAME:WaitFrames(80)
                COMMON.CharRealize("Snow")
                end)
            local coro41 = TASK:BranchCoroutine(function() 
                UI:SetSpeaker(wurp)
                UI:SetSpeakerEmotion("Stunned")
                UI:WaitShowDialogue("Wuh huh?")
                UI:WaitShowTimedDialogue("Wut dus...?[pause=50] Anyway, I think it would be best if you actually thought about", 10)
                end)
            local coro51 = TASK:BranchCoroutine(function() 
                COMMON.FaceEachother(rexio, wurp)
                end)
            TASK:JoinCoroutines({coro31, coro41, coro51})

            UI:SetSpeaker(snow)
            UI:SetSpeakerEmotion("Surprised")
            UI:WaitShowDialogue("W-wait, he's right!")

            COMMON.FaceEachother(snow, wurp)

            UI:SetSpeaker(wurp)
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Huh? About what?")

            UI:SetSpeaker(snow)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("...I kinda want a-an apple, too...")

            UI:SetSpeaker(tidy)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Me three.")

            COMMON.CharAngry("Wurp")
            COMMON.CharHop("Wurp")
            UI:SetSpeaker(wurp)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("Wut's an appwe gotta do with getting us out of hewe?!")

            SOUND:PlayBGM("None", true, 95)
            GROUND:MoveObjectToPosition(apple, 86, rexio.Position.Y, 5)
            SOUND:PlaySE("Battle/EVT_CH02_Item_Place")
            GROUND:CharAnimateTurn(rexio, Dir8.Left, 3, true)
            GROUND:CharAnimateTurnTo(tidy, Dir8.Left, 3)
            GROUND:CharAnimateTurnTo(snow, Dir8.Left, 2)
            GROUND:CharAnimateTurnTo(wurp, Dir8.Left, 2)

            GAME:WaitFrames(75)
            COMMON.CharSweatdrop("Wurp")
            GAME:WaitFrames(25)
            COMMON.CharSweating("Snow")
            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("I'm probably not dumb enough to just take a random apple that seemingly lowered from the sky.")

            UI:ResetSpeaker()
            UI:WaitShowDialogue("I told you he wouldn't fall for it! Stupid plan!")

            local emitter5 = RogueEssence.Content.SingleEmitter(RogueEssence.Content.AnimData("Leaf_Storm_Shoot", 3))

            GROUND:Hide("Apple")
            GROUND:PlayVFX(emitter5, apple.Bounds.Center.X, apple.Bounds.Center.Y)
            SOUND:PlaySE("Battle/_UNK_DUN_Charge")
            GAME:WaitFrames(15)

            SOUND:PlaySE("Battle/DUN_Leaf_Storm_3")
            GROUND:Unhide("applin_1")
            GROUND:Unhide("applin_2")
            GROUND:Unhide("applin_3")
            GROUND:Unhide("applin_4")
            GROUND:Unhide("applin_5")
            GROUND:Unhide("applin_6")
            GROUND:PlayVFX(emitter5, a1.Bounds.Center.X, a1.Bounds.Center.Y)
            GROUND:PlayVFX(emitter5, a2.Bounds.Center.X, a2.Bounds.Center.Y)
            GROUND:PlayVFX(emitter5, a3.Bounds.Center.X, a3.Bounds.Center.Y)
            GROUND:PlayVFX(emitter5, a4.Bounds.Center.X, a4.Bounds.Center.Y)
            GROUND:PlayVFX(emitter5, a5.Bounds.Center.X, a5.Bounds.Center.Y)
            GROUND:PlayVFX(emitter5, a6.Bounds.Center.X, a6.Bounds.Center.Y)
            COMMON.FaceEachother(a1, a2)
            GAME:WaitFrames(10)
            SOUND:PlaySE("Battle/DUN_Leaf_Storm_2")

            UI:SetSpeaker(a1)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("YOU'RE A STUPID PLAN!")

            UI:SetSpeaker(a2)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("YOU'RE A STUPID![pause=30] PERIOD!")

            COMMON.CharHop("applin_4")
            UI:SetSpeaker(a4)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("[speed=0.3]Anyway...")
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("We have been taken from our home, so the group has unanimously decided that we're taking over.")

            COMMON.CharExclaim("Snow")
            UI:SetSpeaker(snow)
            UI:SetSpeakerEmotion("Surprised")
            UI:WaitShowDialogue("I-isn't that a-[pause=20]a little hasty...?")

            UI:SetSpeaker(wurp)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowDialogue("Why awe you doing this, we witerawwy just met you!")
            UI:WaitShowDialogue("We couldn't hav dun anythin wwong!")

            UI:SetSpeaker(a5)
            UI:SetSpeakerEmotion("Sigh")
            UI:WaitShowDialogue("Sorry kids, but it's Apple code.[pause=35] First sight's the suspect.")

            UI:SetSpeaker(rexio)
            UI:SetSpeakerEmotion("Sigh")
            UI:WaitShowDialogue("...[pause=25]let's just get this over with.[emote=Determined] Out of our way.")
        end
    else
        local rexio = CH("PLAYER")
        local tidy = CH('Teammate1')
        local flow = CH('Teammate2')
        if CH("Teammate1").Nickname == "Flow" then
            flow = CH('Teammate1')
            tidy = CH('Teammate2')
        end
        
        flow.CollisionDisabled = true
        tidy.CollisionDisabled = true
        GROUND:MoveToPosition(rexio, wurp.Position.X - 45, wurp.Position.Y, false, 2)
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("Ah! Someone else!")
        COMMON.FaceEachother(rexio, wurp)
        COMMON.CharHop("PLAYER")
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Where were you guys?!")
        local c1 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(50)
            GROUND:MoveToPosition(flow, 145, 164, true, 3)
            GROUND:CharAnimateTurn(snow, Dir8.Left, 6, true)
            end)
        local c2 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(tidy, 120, 156, true, 3)
            GAME:WaitFrames(20)
            UI:SetSpeaker(snow)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("H-[pause=40]hi, Rexio. H-hi, Tidy...[pause=30] and Flow...")

            UI:SetSpeaker(tidy)
            UI:SetSpeakerEmotion("Sigh")
            UI:WaitShowDialogue("Snow, girl, you need to stop following Wurp.")
            end)
        TASK:JoinCoroutines({c1, c2})
        
        local coro3 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(50)
            GROUND:CharAnimateTurn(snow, Dir8.Left, 6, true)
            end)
        local coro4 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(20)
            UI:SetSpeaker(snow)
            UI:SetSpeakerEmotion("Sad")
            UI:WaitShowTimedDialogue("I know,[pause=20] but this is out of my control kinda...", 45)

            UI:SetSpeaker(wurp)
            UI:SetSpeakerEmotion("Angry")
            UI:WaitShowTimedDialogue("AT WEAST I'M TWYING!", 45)
            GROUND:CharAnimateTurn(wurp, Dir8.Left, 4, true)

            GAME:WaitFrames(35)            
            COMMON.CharAngry("Wurp")
            UI:WaitShowDialogue("WEXIO!")
            end)
        local coro5 = TASK:BranchCoroutine(function()
            GROUND:MoveToPosition(rexio, 140, 200, false, 1)
            GROUND:CharAnimateTurn(rexio, Dir8.Right, 10, true)
            GAME:WaitFrames(55)
            GROUND:CharAnimateTurn(rexio, Dir8.Left, 10, true)
            GAME:WaitFrames(25)
            COMMON.CharQuestion("Snow")
            end)
        TASK:JoinCoroutines({coro3, coro4, coro5})

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Oh, sorry,[pause=15] just felt like not listening.")
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Anyone else feeling like eating apple for some reason?")
        
        local coro31 = TASK:BranchCoroutine(function()
            COMMON.CharSweatdrop("Teammate1")
            GAME:WaitFrames(10)
            COMMON.CharSweatdrop("Snow")

            GROUND:CharAnimateTurn(snow, Dir8.Right, 2, true)

            GAME:WaitFrames(80)
            COMMON.CharRealize("Snow")
            end)
        local coro41 = TASK:BranchCoroutine(function() 
            UI:SetSpeaker(wurp)
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("Wuh huh?")
            UI:WaitShowTimedDialogue("Wut dus...?[pause=50] Anyway, I think it would be best if you actually thought about", 10)
            end)
        local coro51 = TASK:BranchCoroutine(function() 
            COMMON.FaceEachother(rexio, wurp)
            end)
        TASK:JoinCoroutines({coro31, coro41, coro51})

        UI:SetSpeaker(snow)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("W-wait, he's right!")

        COMMON.FaceEachother(snow, wurp)

        UI:SetSpeaker(wurp)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Huh? About what?")

        UI:SetSpeaker(snow)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("...I kinda want a-an apple, too...")

        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I dunno, kinda feeling like a salad today...")

        COMMON.CharAngry("Wurp")
        COMMON.CharHop("Wurp")
        UI:SetSpeaker(wurp)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("Guys?!")

        SOUND:PlayBGM("None", true, 95)
        GROUND:MoveObjectToPosition(apple, 86, rexio.Position.Y, 5)
        SOUND:PlaySE("Battle/EVT_CH02_Item_Place")
        GROUND:CharAnimateTurn(rexio, Dir8.Left, 3, true)
        GROUND:CharAnimateTurnTo(tidy, Dir8.Left, 3)
        GROUND:CharAnimateTurnTo(flow, Dir8.Left, 3)
        GROUND:CharAnimateTurnTo(snow, Dir8.Left, 2)
        GROUND:CharAnimateTurnTo(wurp, Dir8.Left, 2)

        GAME:WaitFrames(75)
        COMMON.CharSweatdrop("Wurp")
        GAME:WaitFrames(25)
        COMMON.CharSweating("Snow")
        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I'm probably not dumb enough to just take a random apple that seemingly lowered from the sky.")

        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("...ooh, maybe...")
        COMMON.FaceEachother(flow, tidy)

        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Ooh, apple bread!")

        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Bestie yeeees!")

        GROUND:CharTurnToCharAnimated(rexio, CH("Teammate1"), 2)
        COMMON.FaceEachother(flow, snow)
        COMMON.FaceEachother(tidy, snow)

        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Snow! Snow! We can have frozen apples, right!?")

        UI:SetSpeaker(snow)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("U-uh, yes, I can... ask my mom for th-that")

        UI:ResetSpeaker()
        UI:WaitShowDialogue("I told you they wouldn't fall for it! Stupid plan!")

        local emitter5 = RogueEssence.Content.SingleEmitter(RogueEssence.Content.AnimData("Leaf_Storm_Shoot", 3))

        GROUND:Hide("Apple")
        GROUND:PlayVFX(emitter5, apple.Bounds.Center.X, apple.Bounds.Center.Y)
        SOUND:PlaySE("Battle/_UNK_DUN_Charge")
        GAME:WaitFrames(15)

        SOUND:PlaySE("Battle/DUN_Leaf_Storm_3")
        GROUND:Unhide("applin_1")
        GROUND:Unhide("applin_2")
        GROUND:Unhide("applin_3")
        GROUND:Unhide("applin_4")
        GROUND:Unhide("applin_5")
        GROUND:Unhide("applin_6")
        GROUND:PlayVFX(emitter5, a1.Bounds.Center.X, a1.Bounds.Center.Y)
        GROUND:PlayVFX(emitter5, a2.Bounds.Center.X, a2.Bounds.Center.Y)
        GROUND:PlayVFX(emitter5, a3.Bounds.Center.X, a3.Bounds.Center.Y)
        GROUND:PlayVFX(emitter5, a4.Bounds.Center.X, a4.Bounds.Center.Y)
        GROUND:PlayVFX(emitter5, a5.Bounds.Center.X, a5.Bounds.Center.Y)
        GROUND:PlayVFX(emitter5, a6.Bounds.Center.X, a6.Bounds.Center.Y)
        COMMON.FaceEachother(a1, a2)
        GAME:WaitFrames(10)
        SOUND:PlaySE("Battle/DUN_Leaf_Storm_2")

        UI:SetSpeaker(a1)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("YOU'RE A STUPID PLAN!")

        UI:SetSpeaker(a2)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("YOU'RE A STUPID![pause=30] PERIOD!")

        COMMON.CharHop("applin_4")
        UI:SetSpeaker(a4)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("[speed=0.3]Anyway...")
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowTimedDialogue("We have been taken from our home,")

        GROUND:CharTurnToCharAnimated(rexio, snow, 2)
        UI:SetSpeaker(snow)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("A-actually... my mom has a special recipe for... a-apple stuff...")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Sigh")
        UI:WaitShowDialogue("That recipe sucks.")

        UI:SetSpeaker(snow)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("W-what...?!")

        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Yeah,[pause=50] bananas aren't really common around here...")

        COMMON.CharSweatdrop("Wurp")
        UI:SetSpeaker(wurp)
        UI:SetSpeakerEmotion("Sigh")
        UI:WaitShowDialogue("(Just ignowe the thweat, mkay...)")
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Snow's mama was awways good at finding them...")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Yeah, but we aren't. Like, what's the point in making it so hard to make.")

        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("To make it delicious?????")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("But it's messy.")

        UI:SetSpeaker(wurp)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowTimedDialogue("Wuh...", 15)

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowTimedDialogue("Oops...!", 15)

        UI:SetSpeaker(snow)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowTimedDialogue("R-rexio!", 15)

        UI:SetSpeaker(flow)
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowTimedDialogue("...!!!", 15)

        UI:SetSpeaker(tidy)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowTimedDialogue("...m-messy...?[pause=40] L-like... like a mess??", 20)

        COMMON.CharAngry("applin_1")
        UI:SetSpeaker(a1)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("HELLOOOOOOOO?!")

        COMMON.CharAngry("applin_2")
        UI:SetSpeaker(a2)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("DID WE JUST TURN INVISIBLE OR SOMETHING?!")
        
        COMMON.FaceEachother(rexio, a2)
        GAME:WaitFrames(70)

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("...sorry, were you saying something?")

        COMMON.CharAngry("applin_2")
        UI:SetSpeaker(a2)
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("WE ARE BATTLIIIIIING! RIGHT NOOOOOOOOW!!")

        UI:SetSpeaker(rexio)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("oh ok")
    end

    local mon_id1 = RogueEssence.Dungeon.MonsterID("wurmple", 0, "normal", Gender.Male)
  
    local p1 = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id1, 6, "", 0)
    p1.IsFounder = false
    p1.IsPartner = false
    p1.Nickname = "Wurp"

    _DATA.Save.ActiveTeam.Players:Add(p1)

    local talk_npc = RogueEssence.Dungeon.BattleScriptEvent("WurpInteract")
        _DATA.Save.ActiveTeam.Players[GAME:GetPlayerPartyCount() - 1].ActionEvents:Add(talk_npc)

    local mon_id2 = RogueEssence.Dungeon.MonsterID("snom", 0, "normal", Gender.Female)
  
    local p2 = _DATA.Save.ActiveTeam:CreatePlayer(_DATA.Save.Rand, mon_id2, 8, "", 0)
    p2.IsFounder = false
    p2.IsPartner = false
    p2.Nickname = "Snow"

    _DATA.Save.ActiveTeam.Players:Add(p2)

    local talk_npc = RogueEssence.Dungeon.BattleScriptEvent("SnowInteract")
        _DATA.Save.ActiveTeam.Players[GAME:GetPlayerPartyCount() - 1].ActionEvents:Add(talk_npc)

    COMMON.BossTransition(true)
    GAME:CutsceneMode(false)
    GAME:EnterZone("entoh_town", 0, 0, 0)
end