require 'explorers_of_friending.common'
require 'explorers_of_friending.ground.MaruHomeFood.recipe_book'

local function ingr_quip(player, item)
    UI:SetSpeaker(CH("PLAYER"))
    if item == "tarro_wheat" then
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Some tarro wheat. Pretty basic stuff, but it still makes something delicious.")
    elseif item == "crunchy_leaf" then
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("This thing has some crunch to it.")
    elseif item == "seed_plain" then
        UI:SetSpeakerEmotion("Stunned")
        UI:WaitShowDialogue("A plain seed...[pause=30] it's...[pause=30] uh...[pause=30] a seed...")
    elseif item == "tarro_bread" then
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Our local fluffy bread. I probably don't need the oven to make something with this...")
    elseif item == "ammo_stick" then
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Look at da stick. Not sticky at all.")
    elseif item == "wand_path" then
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("This wand opens new paths![pause=40] L[emote=Happy]iterally!")
    elseif item == "food_apple" then
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Healthy and delicious!")
    elseif item == "berry_oran" then
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("I can't count the number of times this berry helped me through being hurt.")
    elseif item == "berry_leppa" then
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Eating a Leppa helps me remember my moves.")
    end

    local choices = {("Sure!"),
        ("Nah!")}
        UI:BeginChoiceMenu("Should I put it in?", choices, 1, 2)
        UI:WaitForChoice()
        ingr_choice = UI:ChoiceResult()

    return ingr_choice
end


local function ingredients_list()
    item_name = {}

    for i = 0, GAME:GetPlayerBagCount() - 1, 1 do
        item_name[i] = GAME:GetPlayerBagItem(i):GetDisplayName()
    end
    item_name[100] = "Exit"

    UI:BeginMultiPageMenu(
        36,
        112,
        250,
        "Ingredient choice",
        item_name,
        5,
        1,
        100
    )
    UI:WaitForChoice()
    
    if UI:ChoiceResult() == 100 then
        print("Exit chosen.")
        Exit_cooking = true
        return "Exit"
    else
        Ingredient_chosen = UI:ChoiceResult()
        print(Ingredient_chosen)
        Ingredient_ID = GAME:GetPlayerBagItem(Ingredient_chosen).ID

        Ingredient_name = item_name[Ingredient_chosen]
        GAME:TakePlayerBagItem(Ingredient_chosen)
        print(Ingredient_name .. ", also known as " .. Ingredient_ID .. " has been removed from slot " .. Ingredient_chosen + 1)
    end
    
    return Ingredient_ID
end
    

-- Let's get makin'!
function Cooking(player, partner, location)
    local maru = CH("PLAYER")
    local arama = CH('Arama')
    --check if the player has done a tutorial
    if SV.tarro_town.cooking_tutorial_done == 1 then
        SV.tarro_town.cooking_tutorial_done = 2
        UI:SetSpeaker(arama)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I understand you two have already seen me make stuff.")

        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("I'll still be here to watch, but do you need any help?")
        local choices = {("Sure!"),
            ("Nah!")}
        UI:BeginChoiceMenu("It's fine if you don't, but[emote=Worried] I don't need you two burning something.", choices, 1, 2)
        UI:WaitForChoice()
        result = UI:ChoiceResult()
        
        if result == 1 then
            --tutorial here
            UI:SetSpeaker(arama)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Okay, I'll give you three things to start you off.")
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Let's make sure you have space, though...")
            GAME:DepositAll()
            GAME:GivePlayerItem("tarro_wheat", 10)

            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Now take the wheat I gave you and smash it.")
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Three should be enough.")
            ingr = {}

            ingr[1] = ingredients_list()
            ingr[2] = ingredients_list()
            ingr[3] = ingredients_list()

            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("With the power of water, the wheat you smashed can be turned into dough.")
            --add water

            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("Other recipes can be made with this oven and other ovens with different stuff.")
            UI:SetSpeakerEmotion("Dizzy")
            UI:WaitShowDialogue("Trying to remember all of them is really brain-hurty, though.[pause=30][scroll] I[emote=Worried] remember putting an empty journal somewhere, but...")

            UI:SetSpeaker(maru)
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("We'll probably find it later,[pause=15] w[emote=Normal]hat do we do with this?")

            UI:SetSpeaker(arama)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Oh yeah![pause=45] I'll help out with the fire, just put it in there and wait a little.")

            GAME:GivePlayerItem("tarro_bread", 4)
            UI:SetSpeaker(maru)
            UI:SetSpeakerEmotion("Inspired")
            UI:WaitShowDialogue("Cool...!")
        else
            --make me somethin'
            UI:SetSpeaker(arama)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Okay then,[pause=30] make me somethin'.")
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("I still gotta make sure you can control the kitchen well.")

            -- get items from bag
            ingr = {}
            
            for i = 1, 3, 1 do
                ::choose_again::
                local ingritem = ingredients_list()
                chosen = ingr_quip(0, ingritem)
                if chosen == 1 then
                    ingr[i] = ingritem
                else
                    GAME:GivePlayerItem(ingritem)
                    goto choose_again
                end
            end
            Recipes()
            UI:SetSpeaker(arama)
            UI:SetSpeakerEmotion("Happy")
            UI:WaitShowDialogue("Alrighty, I guess you do know how to.")
            UI:SetSpeakerEmotion("Worried")
            UI:WaitShowDialogue("Now I have to check what your dad is up to...")
            UI:SetSpeakerEmotion("Normal")
            UI:WaitShowDialogue("We'll let you know when we're ready.")
        end
        
    else --Tutorial done or skipped
        ingr = {}
            
        for i = 1, 3, 1 do
            ::choose_again::
            local ingritem = ingredients_list()
            print(ingritem)
            if ingritem == "Exit" then
                UI:SetSpeakerEmotion("Normal")
                UI:WaitShowDialogue("Never mind.")
                goto end_cooking
            end
            chosen = ingr_quip(0, ingritem)
            if chosen == 1 then
                ingr[i] = ingritem
            else
                GAME:GivePlayerItem(ingritem)
                UI:WaitShowDialogue("Let's try again.")
                print(ingritem .. " has been put back.")
                goto choose_again
            end
        end
        Recipes()
    end
    ::end_cooking::
    GAME:FadeOut(false, 30)
    GAME:EnterGroundMap("MaruHome", "CookingExit")
end