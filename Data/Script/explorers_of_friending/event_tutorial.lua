function SINGLE_CHAR_SCRIPT.DungeonDialogue(owner, ownerChar, context, args)
	local maru = GAME:GetPlayerPartyMember(0)
	local azura = GAME:GetPlayerPartyMember(1)
	local area_name = DUNGEON:DungeonDisplayName()
	local floor_no = DUNGEON:DungeonCurrentFloor()
	PrintInfo(floor_no)
	PrintInfo(area_name)
	if area_name == "Tarro Forest" then
		if SV.Story.chap == -1 then
			if floor_no == 0 then
				if SV.Story.dunsect == 1 and not SV.TutorialSkip then
					UI:SetSpeaker(maru)
					UI:SetSpeakerEmotion("Normal")
					UI:WaitShowDialogue("This is where we need to take our time and think of our moves.")

					DUNGEON:CharTurnToChar(azura, maru)
					UI:SetSpeaker(azura)
					UI:SetSpeakerEmotion("Worried")
					UI:WaitShowDialogue("...so he's just gonna stand there until we move?")

					DUNGEON:CharTurnToChar(maru, azura)
					UI:SetSpeaker(maru)
					UI:SetSpeakerEmotion("Determined")
					UI:WaitShowDialogue("Yeah, like he thinks he's the boss or something.")
					UI:WaitShowDialogue("Let's show him what we can do!")
					
					UI:SetSpeaker(azura)
					UI:SetSpeakerEmotion("Determined")
					UI:WaitShowDialogue("For the PIE!!!")
                        elseif not SV.TutorialSkip then
					UI:SetSpeaker(maru)
					UI:SetSpeakerEmotion("Normal")
					UI:WaitShowDialogue("Okay, so we need to find some stairs.")

					UI:SetSpeaker(azura)
					UI:SetSpeakerEmotion("Worried")
					UI:WaitShowDialogue("Stairs?[pause=30] Where stairs?")

					UI:SetSpeaker(maru)
					UI:SetSpeakerEmotion("Happy")
					UI:WaitShowDialogue("I dunno, but we won't find them just sitting here.")
					UI:SetSpeakerEmotion("Normal")
					UI:WaitShowDialogue("Let's go around and hold " .. STRINGS:LocalKeyString(4) .. " or press " .. STRINGS:LocalKeyString(2) .. " to attack.")

					UI:SetSpeaker(azura)
					UI:SetSpeakerEmotion("Worried")
					UI:WaitShowDialogue("...[pause=50]h[emote=Stunned]uh...?")
				end
			elseif floor_no == 1 and not SV.TutorialSkip then
				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("Pretty simple stuff, right?")

				UI:SetSpeaker(azura)
				UI:SetSpeakerEmotion("Happy")
				UI:WaitShowDialogue("Yeah! Big Apple!")

				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Happy")
				UI:WaitShowDialogue("Not yet.[pause=40] Now let's see if we can't find any items around.")
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("Once we do, we can press " .. STRINGS:LocalKeyString(12) .. " to open the bag.")
			elseif floor_no == 2 and not SV.TutorialSkip then
				UI:SetSpeaker(azura)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Hey, how come we can't use the apples on the ground for pies?")

				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("I think the size of Big Apples make it taste better.")

				UI:SetSpeaker(azura)
				UI:SetSpeakerEmotion("Stunned")
				UI:WaitShowDialogue("(How does that work...?)")

				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Happy")
				UI:WaitShowDialogue("It's easier to get hungry in a dungeon anyway, so we should munch on them in here.")
			end
		else
			if floor_no == 0 then
				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("It would be nice to work on our skills here.")

				UI:SetSpeaker(azura)
				UI:SetSpeakerEmotion("Joyous")
				UI:WaitShowDialogue("ANOTHER BIG APPLE FOR PIIIIE!!")
			elseif floor_no == 1 and not SV.TutorialSkip then
				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("Hey, Azura, if you're having trouble aiming, try adjusting with " .. STRINGS:LocalKeyString(5) .. ".")

				UI:SetSpeaker(azura)
				UI:SetSpeakerEmotion("Stunned")
				UI:WaitShowDialogue("Uhh... okay?")

				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("Diagonals are tricky, too, so use " .. STRINGS:LocalKeyString(6) .. " for those.")
			end
		end
	elseif area_name == "Tarro Tree Hallows" and SV.Story.chap == -2 then
		local senna = GAME:GetPlayerPartyMember(2)
		local puchi = GAME:GetPlayerPartyMember(3)
		local ziggy = GAME:GetPlayerPartyMember(4)
		if SV.Story.dunsect == 0 then
			if floor_no == 0 then
				UI:SetSpeaker(puchi)
				UI:SetSpeakerEmotion("Dizzy")
				UI:WaitShowDialogue("Guys... I'm not making it, I'm way too tired...")

				UI:SetSpeaker(azura)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Uh oh...")

				UI:SetSpeaker(senna)
				UI:SetSpeakerEmotion("Teary-Eyed")
				UI:WaitShowDialogue("I-I... this is... this is a d-dungeon...??")
				UI:SetSpeakerEmotion("Pain")
				UI:WaitShowDialogue("It's huge...!")

				UI:SetSpeaker(ziggy)
				UI:SetSpeakerEmotion("Determined")
				UI:WaitShowDialogue("Guuuuuuys, come ooooooooon!")
			elseif floor_no == 2 and not SV.TutorialSkip then
				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("I think I'm getting tired of being in front...")

				UI:SetSpeaker(ziggy)
				UI:SetSpeakerEmotion("Happy")
				UI:WaitShowDialogue("LEMME LEMME LEMME LEMME!")

				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Happy")
				UI:WaitShowDialogue("Mkaaaay, I'll just [emote=Normal]switch up using the number keys: 1, 2, 3, and 4.")

				GAME:WaitFrames(60)

				UI:SetSpeaker(ziggy)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Azu, what is he talking about?")

				UI:SetSpeaker(azura)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("I don't know...")
			elseif floor_no == 3 and not SV.TutorialSkip then
				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("Puchi is pretty strong, maybe he can go in front and get all the dungeon monsters out of the way.")

				UI:SetSpeaker(ziggy)
				UI:SetSpeakerEmotion("Happy")
				UI:WaitShowDialogue("Yeah! Let's change tactics team!")

				UI:SetSpeaker(puchi)
				UI:SetSpeakerEmotion("Pain")
				UI:WaitShowDialogue("(I'm so tired.)")

				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Normal")
				UI:WaitShowDialogue("I'll consider opening the menu and choosing Tactics.")
			end
		elseif SV.Story.dunsect == 1 then
			if floor_no == 0 then
				UI:SetSpeaker(puchi)
				UI:SetSpeakerEmotion("Stunned")
				UI:WaitShowDialogue("...is this place getting bigger?!")

				UI:SetSpeaker(senna)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Now I'm getting tired...")

				UI:SetSpeaker(ziggy)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Guys,[pause=20] come on![pause=20] Big Tree![pause=20] Let's go![pause=20]")

				UI:SetSpeaker(maru)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Ziggy, you never told us about why it's so important...")

				UI:SetSpeaker(ziggy)
				UI:SetSpeakerEmotion("Sad")
				UI:WaitShowDialogue("...momma said that this tree is more alive than all the other trees...")
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("Every time she was hurt, this tree seemed to be with her...")

				UI:SetSpeaker(senna)
				UI:SetSpeakerEmotion("Worried")
				UI:WaitShowDialogue("I still don't believe it but...")
				UI:SetSpeakerEmotion("Determined")
				UI:WaitShowDialogue("We'll fight for her if this tree is her friend.")
			end
		elseif SV.Story.dunsect == 2 then
			UI:SetSpeaker(senna)
			UI:SetSpeakerEmotion("Worried")
			UI:WaitShowDialogue("W-what's the plan, guys?")

			UI:SetSpeaker(ziggy)
			UI:SetSpeakerEmotion("Angry")
			UI:WaitShowDialogue("Chaaaaaaaaaaarge!")

			UI:SetSpeaker(maru)
			UI:SetSpeakerEmotion("Worried")
			UI:WaitShowDialogue("Um, maybe we shouldn't do that.")
		end
	elseif area_name == "Entoh Thicket" then
		local rexio = GAME:GetPlayerPartyMember(0)
		if floor_no == 0 then
			UI:SetSpeaker(rexio)
			UI:SetSpeakerEmotion("Worried")
			UI:WaitShowDialogue("(I guess now would be a good time to practice aura sensy whatever.)")
			UI:WaitShowDialogue("(That way Dad would be less angry about me not getting his package.)")
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("(It's a pretty open space. This'll be easy.)")

			UI:ResetSpeaker()
			UI:WaitShowDialogue("While playing as Rexio, use the B key to sense items within 15 tiles.")
		end
	elseif area_name == "Entoh Town" then
		local rexio = GAME:GetPlayerPartyMember(0)
		UI:SetSpeaker(rexio)
		UI:SetSpeakerEmotion("Worried")
		UI:WaitShowDialogue("Mm... the usual exit is blocked now...")
		UI:SetSpeakerEmotion("Determined")
		UI:WaitShowDialogue("Where else can we get out...?")
	elseif area_name == "Dreaded Depths" then
		local rexio = GAME:GetPlayerPartyMember(0)
		local flow = GAME:GetPlayerPartyMember(1)
		local tidy = GAME:GetPlayerPartyMember(2)
		local wurp = GAME:GetPlayerPartyMember(3)
		local snow = GAME:GetPlayerPartyMember(4)
		if floor_no == 0 then
			UI:SetSpeaker(tidy)
			UI:SetSpeakerEmotion("Shouting")
			UI:WaitShowDialogue("Aaaaaaaaaaa!!!!")

			UI:SetSpeaker(flow)
			UI:SetSpeakerEmotion("Surprised")
			UI:WaitShowDialogue("Tidy! Stay close, stay close!")

			UI:SetSpeaker(snow)
			UI:SetSpeakerEmotion("Stunned")
			UI:WaitShowDialogue("...n-never seen it get... th-this bad...!")

			UI:SetSpeaker(rexio)
			UI:SetSpeakerEmotion("Sigh")
			UI:WaitShowDialogue("Great, just another thing to worry about...")
		elseif floor_no == 2 and not SV.TutorialSkip then
			UI:SetSpeaker(rexio)
			UI:SetSpeakerEmotion("Worried")
			UI:WaitShowDialogue("Tidy's right, this grime is gross.")

			UI:SetSpeaker(flow)
			UI:SetSpeakerEmotion("Happy")
			UI:WaitShowDialogue("Not to worry,[pause=50] I can block all those bad effects if you eat them next to me.")

			UI:SetSpeaker(wurp)
			UI:SetSpeakerEmotion("Happy")
			UI:WaitShowDialogue("We could thwow the yucky stuff at the dungeon mons, too!")

			UI:SetSpeaker(rexio)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("If it'll help, it'll help.")

			UI:SetSpeaker(flow)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("Grime's not too bad when it helps.")

			UI:SetSpeaker(tidy)
			UI:SetSpeakerEmotion("Dizzy")
			UI:WaitShowDialogue(".....................................................")
		end
	elseif area_name == "Apple Forest" then
		if floor_no == 2 then
			local leader = GAME:GetPlayerPartyMember(0)
			local second = GAME:GetPlayerPartyMember(1)
			local third = GAME:GetPlayerPartyMember(2)
			UI:SetSpeaker(leader)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("There are a lot of hidden switches here.")

			UI:SetSpeaker(second)
			UI:SetSpeakerEmotion("Stunned")
			UI:WaitShowDialogue("And a lot of walls.")

			UI:SetSpeaker(third)
			UI:SetSpeakerEmotion("Happy")
			UI:WaitShowDialogue("Let's just flip all of them.")

			UI:SetSpeaker(leader)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("What if it's a trap...?")

			UI:SetSpeaker(third)
			UI:SetSpeakerEmotion("Worried")
			UI:WaitShowDialogue("[speed=0.1]...[pause=75][speed=1.0]f[emote=Normal]lip 'em.")

			UI:SetSpeaker(second)
			UI:SetSpeakerEmotion("Joyous")
			UI:WaitShowDialogue("Yeah, flip flip flip!")
		elseif floor_no == 6 then
			local leader = GAME:GetPlayerPartyMember(0)
			local second = GAME:GetPlayerPartyMember(1)
			local third = GAME:GetPlayerPartyMember(2)
			UI:SetSpeaker(second)
			UI:SetSpeakerEmotion("Joyous")
			UI:WaitShowDialogue("Apples! Apples! Apples!")

			UI:SetSpeaker(third)
			UI:SetSpeakerEmotion("Stunned")
			UI:WaitShowDialogue("...is your sister usually this obsessed?")

			UI:SetSpeaker(leader)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("They're her favorite food, I think.")

			UI:SetSpeaker(second)
			UI:SetSpeakerEmotion("Joyous")
			UI:WaitShowDialogue("Yay! Apples!")
		end
	elseif string.sub(area_name, 1, 5) == "Hertz" and string.find(area_name, "T") > 5 then
		if Tunnel_discovered == nil then
			local leader = GAME:GetPlayerPartyMember(0)
			local second = GAME:GetPlayerPartyMember(1)
			local third = GAME:GetPlayerPartyMember(2)
			UI:SetSpeaker(third)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("...wow, dungeon tunnel.")

			UI:SetSpeaker(leader)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("Cool.")
			Tunnel_discovered = true
		end
	elseif area_name == "Osias Ruins" then
		local leader = GAME:GetPlayerPartyMember(0)
		local second = GAME:GetPlayerPartyMember(1)
		local third = GAME:GetPlayerPartyMember(2)
		local fourth = GAME:GetPlayerGuestMember(0)
		if floor_no == 0 then
			UI:SetSpeaker(leader)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("Nothing different so far.")

			UI:SetSpeaker(second)
			UI:SetSpeakerEmotion("Worried")
			UI:WaitShowDialogue("Just more sand...")

			DUNGEON:CharTurnToChar(leader, fourth)
			DUNGEON:CharTurnToChar(second, fourth)
			DUNGEON:CharTurnToChar(third, fourth)
			UI:SetSpeaker(leader)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("Where are the stairs?")

			fourth.CharDir = Dir8.UpRight
			UI:SetSpeaker(fourth)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("Right there.")

			UI:SetSpeaker(third)
			UI:SetSpeakerEmotion("Stunned")
			UI:WaitShowDialogue("There's nothing there...")

			UI:SetSpeaker(fourth)
			UI:SetSpeakerEmotion("Happy")
			UI:WaitShowDialogue("Well duh, that's where they're going to be.[pause=0] Don't you see that trap right there?")
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("We need to deliver items to the tile to reveal the stairs.")
			fourth.CharDir = Dir8.Down
			UI:SetSpeakerEmotion("Happy")
			UI:WaitShowDialogue("It's great training on item management, but you guys are newbies, so you'll need me around here.")

			UI:SetSpeaker(leader)
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("Right, let's go.")
		elseif floor_no == 1 and not SV.TutorialSkip then
			UI:SetSpeaker(third)
			UI:SetSpeakerEmotion("Surprised")
			UI:WaitShowDialogue("Wait, it feels like we were just here!")

			UI:SetSpeaker(fourth)
			UI:SetSpeakerEmotion("Happy")
			UI:WaitShowDialogue("Of course!")
			UI:SetSpeakerEmotion("Normal")
			UI:WaitShowDialogue("Dungeons act differently nowadays,[pause=45] and some of them will put you in the same spot a lot.")
			UI:WaitShowDialogue("Not too big of an issue here, but you never know what other dungeons'll do.")
		end
	end
end