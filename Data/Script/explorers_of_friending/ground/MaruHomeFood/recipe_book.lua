local function countValue(table, targetValue)
    local count = 0
    for _, value in ipairs(table) do
        if value == targetValue then
            count = count + 1
        end
    end
    return count
end

local function cook_result(player, success, item, amount)
    PrintInfo(_DATA:GetItem(item):GetColoredName())
    UI:ResetSpeaker()
    UI:WaitShowDialogue("You made " .. _DATA:GetItem(item):GetColoredName() .. "!")
    GAME:GivePlayerItem(item, amount)
    if player == "Maru" then
        if success == 1 then
            UI:SetSpeaker(CH("PLAYER"))
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("I think I made something.")
        elseif success == -1 then
            UI:SetSpeaker(CH("PLAYER"))
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("Uhhh... huh?")
        elseif success == 2 then
            UI:SetSpeaker(CH("PLAYER"))
            UI:SetSpeakerEmotion("Inspired")
            UI:WaitShowDialogue("Whoa, amazing!")
        elseif success == 0 then
            UI:SetSpeaker(CH("PLAYER"))
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Here's something.")
        end
    elseif player == "Rexio" then
        if success == 1 then
            UI:SetSpeaker(CH("PLAYER"))
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Heh. Nice.")
        elseif success == -1 then
            UI:SetSpeaker(CH("PLAYER"))
            UI:SetSpeakerEmotion("Stunned")
            UI:WaitShowDialogue("...yikes.")
        elseif success == 2 then
            UI:SetSpeaker(CH("PLAYER"))
            UI:SetSpeakerEmotion("Joyous")
            UI:WaitShowDialogue("Let's gooooooooo!")
        elseif success == 0 then
            UI:SetSpeaker(CH("PLAYER"))
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Yep yep.")
        end
    end
end

-- the actual recipes

function Recipes()
    local salad = false
    if countValue(ingr, "crunchy_salad") >= 1 then
        salad = true
    else
        salad = false
    end
    if countValue(ingr, "tarro_wheat") == 3 then --three tarro wheat 
        cook_result("Maru", 1, "tarro_bread", 4)
    elseif countValue(ingr, "crunchy_leaf") + countValue(ingr, "seed_plain") == 3 then --three crunchy leaves and plain seeds
        cook_result("Maru", 0, "crunchy_salad", 1)
    elseif countValue(ingr, "crunchy_salad") + countValue(ingr, "berry_oran") == 3 and salad == true then --salad and oran
        cook_result("Maru", 1, "crunchy_oran", 2)
    elseif countValue(ingr, "crunchy_salad") + countValue(ingr, "food_apple") == 3 and salad == true then --salad and apple
        if countValue(ingr, "food_apple") == 1 then
            cook_result("Maru", 1, "crunchy_apple", 1)
        elseif countValue(ingr, "food_apple") == 2 then
            cook_result("Maru", 1, "crunchy_apple", 2)
        end
    elseif countValue(ingr, "ammo_stick") == 1 and countValue(ingr, "berry_oran") == 1 and countValue(ingr, "berry_leppa") == 1 then --berries and a stick
        cook_result("Maru", 1, "berry_kebab", 3)
    else --oops
        cook_result("Maru", -1, "seed_plain", 1)
    end
end
