local function countValue(table, targetValue)
    local count = 0
    for _, value in ipairs(table) do
        if value == targetValue then
            count = count + 1
        end
    end
    return count
end

local function cook_result(player, success)
    if success == 1 then
        UI:SetSpeaker(CH("PLAYER"))
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("I think I made something.")
    elseif success == -1 then
        UI:SetSpeaker(CH("PLAYER"))
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("Uhhh... huh?")
    elseif success == 0 then
        UI:SetSpeaker(CH("PLAYER"))
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Here's something.")
    end
end

function Recipes()
    if countValue(ingr, "tarro_wheat") == 3 then
        cook_result("Maru", 1)
        GAME:GivePlayerItem("tarro_bread", 4)
    elseif countValue(ingr, "crunchy_leaf") + countValue(ingr, "seed_plain") == 3 then
        cook_result("Maru", 0)
        GAME:GivePlayerItem("crunchy_salad", 1)
    else
        cook_result("Maru", -1)
        GAME:GivePlayerItem("seed_plain")
    end    
end
