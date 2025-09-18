function CupShufflePlay(difficulty, speed)
    local begin_position = {OBJ("Cup_1").Position.X + 11, OBJ("Cup_2").Position.X + 11, OBJ("Cup_3").Position.X + 11}
    local ball_position = 2
    local cup_win = 0
    --check if the player has done a tutorial (WIP)

    --shuffle function
    local function switch_cups()
        cup1 = math.random(1, 3)
        cup2 = math.random(1, 3)
        while cup1 == cup2 do
            cup2 = math.random(1, 3)
        end

        -- ball position should then be checked
        if ball_position == cup1 then
            ball_position = cup2
        elseif ball_position == cup2 then
            ball_position = cup1
        end
        local coro1 = TASK:BranchCoroutine(function() 
            GROUND:MoveObjectToPosition(OBJ("Cup_" .. cup1), OBJ("Cup_" .. cup2).Position.X, 111, speed)
            GAME:WaitFrames(math.floor(50 / speed) + 5)
            end)	
        local coro2 = TASK:BranchCoroutine(function() 
            GROUND:MoveObjectToPosition(OBJ("Cup_" .. cup2), OBJ("Cup_" .. cup1).Position.X, 111, speed)
            end)
        TASK:JoinCoroutines({coro1, coro2})
    end
    
    
    --function for playing the game
    local function challenge_start()
        GROUND:Hide("Ball")
        
        --shuffle based on difficulty
        for i = 1, difficulty, 1 do
            switch_cups()
        end
        --move all cups to closest position
        local pos_1 = 54
        local pos_2 = 147
        local pos_3 = 240
        local pos_1_occ = false
        local pos_2_occ = false
        local pos_3_occ = false
        local cup_center_check1 = math.abs(OBJ("Cup_1").Position.X - 147)
        local cup_center_check2 = math.abs(OBJ("Cup_2").Position.X - 147)
        local cup_center_check3 = math.abs(OBJ("Cup_3").Position.X - 147)

        if cup_center_check1 <= cup_center_check2 and cup_center_check1 <= cup_center_check3 then
            pos_2_occ = true --the center is occupied now
            GROUND:MoveObjectToPosition(OBJ("Cup_1"), pos_2, 111, 9) --move the first cup to the center
            if OBJ("Cup_2").Position.X > pos_2 and pos_3_occ == false then
                GROUND:MoveObjectToPosition(OBJ("Cup_2"), pos_3, 111, 9)
                pos_3_occ = true
            elseif OBJ("Cup_2").Position.X < pos_2 and pos_1_occ == false then
                GROUND:MoveObjectToPosition(OBJ("Cup_2"), pos_1, 111, 9)
                pos_1_occ = true
            end

            if pos_3_occ == false then
                GROUND:MoveObjectToPosition(OBJ("Cup_3"), pos_3, 111, 9)
                pos_3_occ = true
            elseif pos_1_occ == false then
                GROUND:MoveObjectToPosition(OBJ("Cup_3"), pos_1, 111, 9)
                pos_1_occ = true
            end
        else -- The first cup is not in the center
            if OBJ("Cup_1").Position.X > pos_2 and pos_3_occ == false then
                GROUND:MoveObjectToPosition(OBJ("Cup_1"), pos_3, 111, 9) --pos 3 filled
                pos_3_occ = true

                if cup_center_check2 < math.abs(OBJ("Cup_3").Position.X - pos_3) and pos_2_occ == false then
                    GROUND:MoveObjectToPosition(OBJ("Cup_2"), pos_2, 111, 9) -- 2
                    pos_2_occ = true
                elseif OBJ("Cup_2").Position.X < pos_2 and pos_1_occ == false then
                    GROUND:MoveObjectToPosition(OBJ("Cup_2"), pos_1, 111, 9) -- 1
                    pos_1_occ = true
                end
    
                if pos_2_occ == false then
                    GROUND:MoveObjectToPosition(OBJ("Cup_3"), pos_3, 111, 9) -- 2
                    pos_2_occ = true
                elseif pos_1_occ == false then
                    GROUND:MoveObjectToPosition(OBJ("Cup_3"), pos_1, 111, 9) -- 1
                    pos_1_occ = true
                end
            elseif OBJ("Cup_1").Position.X < pos_2 and pos_1_occ == false then
                GROUND:MoveObjectToPosition(OBJ("Cup_1"), pos_1, 111, 9) -- pos 1 filled
                pos_1_occ = true

                if cup_center_check2 < math.abs(OBJ("Cup_3").Position.X - pos_3) and pos_2_occ == false then
                    GROUND:MoveObjectToPosition(OBJ("Cup_2"), pos_2, 111, 9) -- 2
                    pos_2_occ = true
                elseif OBJ("Cup_2").Position.X < pos_2 and pos_3_occ == false then
                    GROUND:MoveObjectToPosition(OBJ("Cup_2"), pos_3, 111, 9) -- 3
                    pos_3_occ = true
                end
    
                if pos_2_occ == false then
                    GROUND:MoveObjectToPosition(OBJ("Cup_3"), pos_3, 111, 9) -- 2
                    pos_2_occ = true
                elseif pos_3_occ == false then
                    GROUND:MoveObjectToPosition(OBJ("Cup_3"), pos_3, 111, 9) -- 3
                    pos_3_occ = true
                end
            end
        end

        PrintInfo("The ball is under cup " .. ball_position)

        --Ask the player to choose a cup
        brasi = CH("Brasion")
        UI:SetSpeaker(brasi)
        UI:SetSpeakerEmotion("Happy")
        local choices = {("1"),
                        ("2"), 
                        ("3")}
        UI:BeginChoiceMenu("Choose a cup!", choices, 1, 3)
        UI:WaitForChoice()
        local cup_choice = UI:ChoiceResult()
        --relate the choice to the ball position
        SOUND:PlaySE("EVT_Evolution_Start")
        --after all is said and done, show the ball under the correct cup.
        local coro00 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(7)
            GROUND:MoveObjectToPosition(OBJ("Cup_1"), OBJ("Cup_1").Position.X, 80, 9)
            end)
        local coro01 = TASK:BranchCoroutine(function()
            GROUND:MoveObjectToPosition(OBJ("Cup_2"), OBJ("Cup_2").Position.X, 80, 9)
            end)
        local coro02 = TASK:BranchCoroutine(function()
            GAME:WaitFrames(14)
            GROUND:MoveObjectToPosition(OBJ("Cup_3"), OBJ("Cup_3").Position.X, 80, 9)
            end)
        TASK:JoinCoroutines({coro00, coro01, coro02})

        GROUND:Unhide("Ball")
        GROUND:MoveObjectToPosition(OBJ("Ball"), begin_position[ball_position], 133, 100)
        PrintInfo("The ball is under cup " .. ball_position .. " and was revealed under either cup " .. cup1 .. " or " .. cup2)
        
        if cup_choice == ball_position then
            SOUND:PlaySE("Battle/EVT_Minigame_Correct")
            cup_win = cup_win + 1
            print("Winner!")
        else
            SOUND:PlaySE("Battle/EVT_Minigame_Wrong")
            cup_win = cup_win - 1
            print("Loser!")
        end
        local function go_again()
            UI:SetSpeaker(brasi)
            UI:SetSpeakerEmotion("Happy")
            local again_choices = {
                ("Sure!"),
                ("No thanks...")
            }
            UI:BeginChoiceMenu("Wanna try again?", again_choices, 1, 2)
            UI:WaitForChoice()
            local result = UI:ChoiceResult()
    
            if result == 1 then
                GROUND:MoveObjectToPosition(OBJ("Cup_1"), OBJ("Cup_1").Position.X, 111, 9) 
                GROUND:MoveObjectToPosition(OBJ("Cup_2"), OBJ("Cup_2").Position.X, 111, 9)
                GROUND:MoveObjectToPosition(OBJ("Cup_3"), OBJ("Cup_3").Position.X, 111, 9)
                challenge_start()
            end
        end
        go_again()
    end

    challenge_start()
    
    --return win value
    return cup_win
end