function Partner()
    local area_name = GAME:GetCurrentGround().AssetName
    if GAME:GetPlayerPartyCount() > 1 then
        if not SV.guilders.fielded_two then
            local maru = CH("PLAYER")
            local azura = CH('Teammate1')
            local puchi = CH('Puchi')
            local rexio = CH("PLAYER")
            local flow = CH('Teammate1')
            local tidy = CH('Teammate2')
            if SV.entoh_town.firstfind == 1 then
                flow = CH('Teammate1')
                tidy = CH('Teammate2')
            elseif SV.entoh_town.firstfind == 2 then
                flow = CH('Teammate2')
                tidy = CH('Teammate1')
            end
            if GAME:IsKeyDown(66) then
                print("Partner")
                COMMON.FaceEachother("PLAYER", "Teammate1")

                if area_name == "TarroTownOutside" then
                    if SV.tarro_town.PieChapter < 2 then
                    UI:SetSpeaker(azura)
                    UI:SetSpeakerEmotion("Happy")
                    UI:WaitShowDialogue("Let's go home and get some pie!")
            
                    UI:SetSpeaker(maru)
                    UI:SetSpeakerEmotion("Normal")
                    UI:WaitShowDialogue("Gee, not like it's going anywhere.")
            
                    UI:SetSpeaker(azura)
                    UI:SetSpeakerEmotion("Sad")
                    UI:WaitShowDialogue("But what if it gets c[speed=0.7]oooo[speed=1.0]ld?!")
                    
                    GROUND:CharTurnToCharAnimated(puchi, maru, 4)
                    UI:SetSpeaker(maru)
                    UI:SetSpeakerEmotion("Normal")
                    UI:WaitShowDialogue("Don't think it would get cold that fast...")
                    
                    GROUND:CharTurnToCharAnimated(maru, puchi, 4)
                    GROUND:CharTurnToCharAnimated(azura, puchi, 4)
                    UI:SetSpeaker(puchi)
                    UI:SetSpeakerEmotion("Inspired")
                    UI:WaitShowDialogue("You guys are getting pie?!")
            
                    UI:SetSpeaker(azura)
                    UI:SetSpeakerEmotion("Angry")
                    UI:WaitShowDialogue("Not enough for you!")
                    elseif SV.tarro_town.PieChapter >= 2 and SV.tarro_town.PieChapter < 4 then
                        if SV.tarro_town.PieChapter == 2.1 then
                            UI:SetSpeaker(azura)
                            UI:SetSpeakerEmotion("Angry")
                            UI:WaitShowDialogue("That fail made me mad...!")
                        elseif SV.tarro_town.PieChapter == 2.2 then
                            UI:SetSpeaker(azura)
                            UI:SetSpeakerEmotion("Angry")
                            UI:WaitShowDialogue("Ugh, dumb bat!")
                        end
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Determined")
                        UI:WaitShowDialogue("What are we doing here?!")
                        UI:WaitShowDialogue("We need the apple before it gets late!")
                    elseif SV.tarro_town.PieChapter == 4 then
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("I'd love to watch clouds more,[pause=15] but can we get pie first?")
                        UI:WaitShowDialogue("The Big Apple might spoil!")
                    else
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Inspired")
                        UI:WaitShowDialogue("Pretty clouds...!")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Cloud watching would be fun, wouldn't it?")
                    end
                elseif area_name == "TarroTownEast" then
                    if SV.tarro_town.PieChapter == 1 then
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Pie! [pause=20]Pie! [pause=20]Pie! [pause=20]Pie!")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Yeah yeah, I got it.")
                    elseif SV.tarro_town.PieChapter < 3 then
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Determined")
                        UI:WaitShowDialogue("Even if it's scary in there...")
                        UI:WaitShowDialogue("...we have to get the apple!")
                        UI:SetSpeakerEmotion("Shouting")
                        UI:WaitShowDialogue("I want my pie!")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("We got this, I'm sure.")
                    elseif SV.tarro_town.PieChapter <= 5 then
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowTimedDialogue("...", 75)
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowTimedDialogue("...", 75)
                
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(azura, maru, 4)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue("Say, Maru...?")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue("Mhm?")
                
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(azura, maru, 4)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue("Why are we just[pause=10] S[emote=Shouting]TANDING HERE[pause=15] WHEN WE CAN GET OUR PIE?!")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Stunned")
                        UI:WaitShowDialogue("T-[pause=25]to relax? [emote=Determined]We just went through a dungeon!")
                
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Determined")
                        UI:WaitShowDialogue("[speed=0.05]...f[speed=1.0][emote=Happy]air enough.")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Special1")
                        UI:WaitShowDialogue("(Ugh...)")
                    else
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Home sweet home.")
                
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("Did we we even do anything?")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue("Probably not.")
                    end
                elseif area_name == "TarroTownEast_ch2" then
                    local maru = CH("PLAYER")
                    local azura = CH('Teammate1')
                    local puchi = CH('Puchi')
                    if GAME:IsKeyDown(66) then
                        print("Partner")
                    end
                    if GAME:IsKeyDown(66) then
                        if SV.tarro_town.PieChapter == 5 then
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("Those two.[pause=65] What are they fighting about now?")
                        else
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Home sweet home.")

                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("Did we even do anything?")

                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue("Probably not.")
                        end
                    end
                elseif area_name == "MaruHome" then
                    if SV.tarro_town.PieChapter == 2 then
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Let's go find that big apple!")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue("That's the new plan.")
                    elseif SV.tarro_town.PieChapter == 5 then
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("Gotta stop them now... I guess.")
                    elseif SV.tarro_town.DarknessChapter == 1 then
                        UI:SetSpeaker(azura)      
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("So... what now...?")
                        COMMON.FaceEachother("Teammate1", "PLAYER")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue("I guess we could try visiting town. [pause=25]Maybe Puchi's mom isn't mad anymore.")
                
                        UI:SetSpeaker(azura)      
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue("Maybe go into the dungeon?")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("I don't see why not.")
                    else
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Inspired")
                        UI:WaitShowDialogue("Yay! Home!")
                    end
                elseif area_name == "TarroForestPassage" then
                    if SV.tarro_town.PieChapter == 3 then
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("Where could it possibly be???")
                        UI:SetSpeakerEmotion("Determined")
                        UI:WaitShowDialogue("[speed=1.3]Hmmmmmmmmmmmmmmmmmmmmmmmmmmmmm\nmmmmmmmmmmmmmmmmmmm...")
                    elseif SV.tarro_town.PieChapter == 4 then
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue("That wasn't so scary, actually.")
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("Kinda wanna go back home now, though...")
                    elseif SV.tarro_town.DarknessChapter == 2 then
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue("Gotta find out what the letter is for, right...?")
                    end
                elseif area_name == "TarroTownSquare" then
                    if SV.tarro_town.PieChapter == 6 then
                        if quiz_available then
                            UI:SetSpeaker(azura)
                            UI:SetSpeakerEmotion("Worried")
                            UI:WaitShowDialogue("The town isn't that big, right?")
                    
                            UI:SetSpeaker(maru)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("You getting worried, Azura?")
                            UI:WaitShowDialogue("I could answer all the questions if you want me to.")
                    
                            UI:SetSpeaker(azura)
                            UI:SetSpeakerEmotion("Surprised")
                            UI:WaitShowDialogue("Huh?! [pause=45]N[emote=Angry]o! Don't you dare!")
                        else
                            UI:SetSpeaker(azura)
                            GROUND:CharTurnToCharAnimated(maru, azura, 4)
                            UI:SetSpeakerEmotion("Happy")
                            UI:WaitShowDialogue("Let's go meet up with the others!")
                            UI:WaitShowDialogue("They might know more about town!")
                    
                            UI:SetSpeaker(maru)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("Yep.")
                        end
                    elseif SV.tarro_town.PieChapter == 7 then
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("Wonder why no one else is noticing...")
                    
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("So am I, but...")
                    else
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Yeah, town!")
                    
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Whoo, town!")  
                    end
                elseif area_name == "TarroTownHive" then
                    if SV.tarro_town.PieChapter == 6 then
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Inspired")
                        UI:WaitShowDialogue("Whoa,[pause=20] the hives are huge. I bet Ms. Mayor lives here.")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Makes you wonder what all the buzz is about.")
                
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Stunned")
                        UI:WaitShowDialogue("...you're starting to sound like dad.")
                
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue(".[pause=60][emote=Sad].[pause=60][emote=Worried].[pause=75] ...[emote=Stunned]oh no.")
                    else
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Inspired")
                        UI:WaitShowDialogue("The smell of honey is so good...!")
                        UI:WaitShowDialogue("We should get some, please please please!")
                        
                        local pouch_money = GAME:GetPlayerMoney()
                        if pouch_money == 0 then
                            UI:SetSpeaker(maru)
                            UI:SetSpeakerEmotion("Stunned")
                            UI:WaitShowDialogue("I would if we had anything to buy it with.")
                    
                            UI:SetSpeaker(azura)
                            UI:SetSpeakerEmotion("Stunned")
                            UI:WaitShowDialogue("Huh, where moneys go?")
                    
                            UI:SetSpeaker(maru)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("Let's just come back later.")
                        elseif pouch_money < 100 then
                            UI:SetSpeaker(maru)
                            UI:SetSpeakerEmotion("Sad")
                            UI:WaitShowDialogue("I don't think we can afford it...")
                    
                            UI:SetSpeaker(azura)
                            UI:SetSpeakerEmotion("Sad")
                            UI:WaitShowDialogue("Awww...")
                        elseif pouch_money < 200 then
                            UI:SetSpeaker(maru)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("We could buy one, but I think it'd be better to save up...")
                    
                            UI:SetSpeaker(azura)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("But the honey smells so good...")
                        else
                            UI:SetSpeaker(maru)
                            UI:SetSpeakerEmotion("Happy")
                            UI:WaitShowDialogue("We could buy one, sure")
                    
                            UI:SetSpeaker(azura)
                            UI:SetSpeakerEmotion("Joyous")
                            UI:WaitShowDialogue("Yippee!")
                        end
                    end
                elseif area_name == "TarroForestPlaza" then
                    UI:SetSpeaker(azura)
                    UI:SetSpeakerEmotion("Normal")
                    UI:WaitShowDialogue("[speed=0.04]...h[speed=0.6][emote=Worried]mmm.")

                    UI:SetSpeaker(maru)
                    UI:SetSpeakerEmotion("Normal")
                    UI:WaitShowDialogue("What's up?")

                    UI:SetSpeaker(azura)
                    UI:SetSpeakerEmotion("Worried")
                    UI:WaitShowDialogue("Well...[pause=0] it's just kinda weird.")
                    UI:WaitShowDialogue("They just wanna... leave?")

                    UI:SetSpeaker(maru)
                    UI:SetSpeakerEmotion("Normal")
                    UI:WaitShowDialogue("Well, yeah. [pause=35]There isn't much to do in here.")
                    
                    UI:SetSpeaker(azura)
                    UI:SetSpeakerEmotion("Normal")
                    UI:WaitShowDialogue("I guess so. [pause=30]I'd miss this place if I were them, though.")
                elseif area_name == "TarroTownWest" then
                    UI:SetSpeaker(azura)
                    UI:SetSpeakerEmotion("Normal")
                    UI:WaitShowDialogue("Puchi's side of town, we should go visit.")
                elseif area_name == "TarroTownSquare_ch3" then
                    if SV.tarro_town.DarknessChapter == 1 then
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Now's probably a great time to go through the Big Tree.") 
                
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Yeah!")
                    else
                        UI:SetSpeaker(azura)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Yeah, town!")
                    
                        UI:SetSpeaker(maru)
                        UI:SetSpeakerEmotion("Happy")
                        UI:WaitShowDialogue("Whoo, town!")  
                    end
                elseif area_name == "TarroTownBigTree_ch3" then
                    if SV.tarro_town.DarknessChapter == 1 then
                        UI:SetSpeaker(azura)
                        GROUND:CharTurnToCharAnimated(maru, azura, 4)
                        UI:SetSpeakerEmotion("Normal")
                        UI:WaitShowDialogue("...what's with the crowd up there?")
                    end
                elseif area_name == "TheField" then
                    UI:SetSpeaker(azura)
                    UI:SetSpeakerEmotion("Worried")
                    UI:WaitShowDialogue("Over there, who is that...?")
                elseif area_name == "EntohTownNorth_ch2" then
                    UI:SetSpeaker(flow)
                    UI:SetSpeakerEmotion("Worried")
                    UI:WaitShowDialogue("Mom's strong.[pause=30] She'll be fine.")
                elseif area_name == "EntohTownCenter_ch2" then
                    if GAME:GetPlayerPartyCount() == 2 then
                        if SV.entoh_town.firstfind == 2 then
                            UI:SetSpeaker(tidy)
                            UI:SetSpeakerEmotion("Worried")
                            UI:WaitShowDialogue("...")

                            UI:SetSpeaker(rexio)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("...try to take your mind off of the grime, Tides.")                            
                        else
                            if FlowRexTalk == 0 then
                                UI:SetSpeaker(flow)
                                UI:SetSpeakerEmotion("Worried")
                                UI:WaitShowDialogue("Hey, Rexio...")

                                UI:SetSpeaker(rexio)
                                UI:SetSpeakerEmotion("Normal")
                                UI:WaitShowDialogue("Hm?")

                                UI:SetSpeaker(flow)
                                UI:SetSpeakerEmotion("Worried")
                                UI:WaitShowDialogue("Are you... okay?[pause=75] Without your dad around, I mean...")

                                UI:SetSpeaker(rexio)
                                UI:SetSpeakerEmotion("Normal")
                                UI:WaitShowDialogue("Pssh,[pause=35] you're kidding.[pause=30] I'm probably outpacing that old guy.")

                                UI:SetSpeaker(flow)
                                UI:SetSpeakerEmotion("Stunned")
                                UI:WaitShowDialogue("Oh.[pause=30] If you say so.")

                                UI:SetSpeaker(rexio)
                                UI:SetSpeakerEmotion("Normal")
                                UI:WaitShowDialogue("I know so!")
                                FlowRexTalk = 1
                            elseif FlowRexTalk == 1 then
                                UI:SetSpeaker(rexio)
                                UI:SetSpeakerEmotion("Worried")
                                UI:WaitShowDialogue("...")

                                UI:SetSpeaker(flow)
                                UI:SetSpeakerEmotion("Stunned")
                                UI:WaitShowDialogue("...you know, without my mom, I wouldn't have learned about the power of flower.")
                                UI:SetSpeakerEmotion("Happy")
                                UI:WaitShowDialogue("I'm sure your dad taught you something, right?")

                                UI:SetSpeaker(rexio)
                                UI:SetSpeakerEmotion("Sad")
                                UI:WaitShowDialogue("...")

                                UI:SetSpeaker(flow)
                                UI:SetSpeakerEmotion("Worried")
                                UI:WaitShowDialogue("...you okay, Rexio?")

                                UI:SetSpeaker(rexio)
                                UI:SetSpeakerEmotion("Normal")
                                UI:WaitShowDialogue("Yeah...[pause=85] I'm fine.")
                                FlowRexTalk = 2
                            elseif SV.entoh_town.firstfind == 1 then
                                UI:SetSpeaker(flow)
                                UI:SetSpeakerEmotion("Normal")
                                UI:WaitShowDialogue("Oh yeah![pause=30] You think we could also find Tidy?")

                                UI:SetSpeaker(rexio)
                                UI:SetSpeakerEmotion("Worried")
                                UI:WaitShowDialogue("Tidy?[pause=20] Oh yeah, the nice gal in town?")

                                UI:SetSpeaker(flow)
                                UI:SetSpeakerEmotion("Happy")
                                UI:WaitShowDialogue("My bestie![pause=40] She's somewhere...")

                                UI:SetSpeaker(rexio)
                                UI:SetSpeakerEmotion("Normal")
                                UI:WaitShowDialogue("If you're sure,[emote=Happy] then I'll find her.")
                            end
                        end
                    else
                        UI:SetSpeaker(tidy)
                        UI:SetSpeakerEmotion("Sad")
                        UI:WaitShowDialogue("...")

                        UI:SetSpeaker(flow)
                        UI:SetSpeakerEmotion("Sad")
                        UI:WaitShowDialogue("...")

                        UI:SetSpeaker(rexio)
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("...")

                        UI:SetSpeaker(tidy)
                        UI:SetSpeakerEmotion("Worried")
                        UI:WaitShowDialogue("This sucks...")

                        UI:SetSpeaker(flow)
                        UI:SetSpeakerEmotion("Sad")
                        UI:WaitShowDialogue("I miss my mom...")

                        UI:SetSpeaker(tidy)
                        UI:SetSpeakerEmotion("Teary-Eyed")
                        UI:WaitShowDialogue("Saaaaaame...")

                        UI:SetSpeaker(rexio)
                        UI:SetSpeakerEmotion("Pain")
                        UI:WaitShowDialogue("...")
                    end
                end
            end
        else
            if GAME:IsKeyDown(66) then
                local leader = CH("PLAYER")
                local second = CH('Teammate1')
                local third = CH('Teammate2')
                local talk = math.random(5)
                COMMON.FaceEachother("PLAYER", "Teammate1")
                local play = GAME:GetCharacterNickname(GAME:GetPlayerPartyMember(GAME:GetTeamLeaderIndex()))
                if area_name == "GuildFieldMain" then
                    if play == "Maru" then
                        if talk == 1 then
                            UI:SetSpeaker(leader)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("This'll be fun.")

                            UI:SetSpeaker(second)
                            UI:SetSpeakerEmotion("Joyous")
                            UI:WaitShowDialogue("Apple hunting![pause=60] ...without the [emote=Worried]pie.")

                            UI:SetSpeaker(leader)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("We should know how to make one by now.")

                            UI:SetSpeaker(second)
                            UI:SetSpeakerEmotion("Sad")
                            UI:WaitShowDialogue("It won't be the same...")

                            UI:SetSpeaker(third)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("You two do all the work.[pause=40] I[emote=Happy]'ll eat me some pie.")

                            UI:SetSpeaker(second)
                            UI:SetSpeakerEmotion("Determined")
                            UI:WaitShowDialogue("Nuh-uh...")
                        elseif talk == 2 then
                            UI:SetSpeaker(third)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("You would think there'd be something here with all this empty space...")

                            UI:SetSpeaker(leader)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("Maybe it's one of those open roof guilds.")

                            UI:SetSpeaker(second)
                            UI:SetSpeakerEmotion("Stunned")
                            UI:WaitShowDialogue("This is a big roof...")
                        elseif talk == 3 then
                            UI:SetSpeaker(second)
                            UI:SetSpeakerEmotion("Happy")
                            UI:WaitShowDialogue("Let's get some apples!")
                        elseif talk == 4 then
                            UI:SetSpeaker(third)
                            UI:SetSpeakerEmotion("Stunned")
                            UI:WaitShowDialogue("Fetch quest, by the way.")
                        elseif talk == 5 then
                            UI:SetSpeaker(second)
                            UI:SetSpeakerEmotion("Joyous")
                            UI:WaitShowDialogue("Apple tiiiiime!")
                        end
                    elseif play == "Azura" then
                        if talk == 1 then
                            UI:SetSpeaker(second)
                            UI:SetSpeakerEmotion("Happy")
                            UI:WaitShowDialogue("Apple time.")

                            UI:SetSpeaker(leader)
                            UI:SetSpeakerEmotion("Joyous")
                            UI:WaitShowDialogue("Yippee!")

                            UI:SetSpeaker(third)
                            UI:SetSpeakerEmotion("Worried")
                            UI:WaitShowDialogue("...right.")
                        elseif talk == 2 then
                            
                        elseif talk == 3 then
                            
                        elseif talk == 4 then
                            UI:SetSpeaker(third)
                            UI:SetSpeakerEmotion("Stunned")
                            UI:WaitShowDialogue("Fetch quest, by the way.")
                        elseif talk == 5 then
                            UI:SetSpeaker(second)
                            UI:SetSpeakerEmotion("Normal")
                            UI:WaitShowDialogue("Hopefully we get enough apples, don't feel like doing too much today.")
                        end
                    elseif play == "Rexio" then
                    end
                end
            end
        end
    end
end