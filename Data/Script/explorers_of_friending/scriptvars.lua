--[[
    scriptvars.lua
      This file contains all the default values for the script variables. AKA on a new game this file is loaded!
      Script variables are stored in a table  that gets saved when the game is saved.
      Its meant to be used for scripters to add data to be saved and loaded during a playthrough.
      
      You can simply refer to the "SV" global table like any other table in any scripts!
      You don't need to write a default value in this lua script to add a new value.
      However its good practice to set a default value when you can!
      
      It is important to stress that this file initializes the SV table ONCE when the player begins a new save file, and NEVER EVER again.
      This means that edits on this file will NOT be added on the script variables of an already existing file!
      To upgrade existing script variables, use the OnUpgrade in script services.  Example found in Data/Script/services/debug_tools/init.lua
      
    --Examples:
    SV.SomeVariable = "Smiles go for miles!"
    SV.AnotherVariable = 2526
    SV.AnotherVariable = { something={somethingelse={} } }
    SV.AnotherVariable = function() PrintInfo('lmao') end
]]--

SV = {}

-----------------------------------------------
-- Services Defaults
-----------------------------------------------
SV.Services =
{
  --Anything that applies to services should be put in here, or assigned to this or a subtable of this in the service's definition script
}

-----------------------------------------------
-- General Defaults
-----------------------------------------------

SV.Experimental = false

SV.General =
{
  Rescue = nil,
  Starter = MonsterID("missingno", 0, "normal", Gender.Genderless)
  --Anything that applies to more than a single level, and that is too small to make a sub-table for, should be put in here ideally, or a sub-table of this
}

SV.checkpoint = 
{
  Zone    = 'guildmaster_island', Segment  = -1,
  Map  = 1, Entry  = 0
}


SV.adventure = 
{
  Thief    = false,
  Tutors = { }
}

SV.base_shop = {
	{ Index = "food_apple", Amount = 0, Price = 50},
	{ Index = "food_apple_big", Amount = 0, Price = 150},
	{ Index = "food_banana", Amount = 0, Price = 500},
	{ Index = "food_chestnut", Amount = 0, Price = 80},
	{ Index = "berry_leppa", Amount = 0, Price = 80}
}
SV.base_trades = {
	{ Item="xcl_family_bulbasaur_02", ReqItem={"",""}},
	{ Item="xcl_family_charmander_02", ReqItem={"",""}},
	{ Item="xcl_family_squirtle_02", ReqItem={"",""}}
}

SV.unlocked_trades = {
}

SV.missions =
{
  Missions = { },
  FinishedMissions = { },
}

SV.magnagate =
{
  Cards = 0
}

-----------------------------------------------
-- Level Specific Defaults
-----------------------------------------------
--- Tarro Town
--- Locations

SV.tarro_town = 
{
  PieChapter = -1,
  DarknessChapter = 0,
  spent_dungpoints = 0,
  puchi_tired = true,
  
  cooking_tutorial_done = 1
}
--- Dungeons

SV.dungeon_tutorial = 0
SV.bag_size = 5

SV.tarro_forest = 
{
  ZoomerDefeated = false,
  revisit = false,
  dungpoints = 0,
  caterpie_name = "a25ee5",
  apple_tree_get = false
}

SV.deep_tarro_forest = 
{
  revisit = false,
  dungpoints = 0,
}

SV.tarro_tree_hollows = 
{
  tree_entered = false,
  revisit = false,
  dungpoints = 0,
  sprout_money_give = false,
  stairs_unlocked = false,
  entering_party = 0,
  AmasDefeat = false
}

SV.entoh_thicket = 
{
  revisit = false,
  dungpoints = 0,
}

SV.dreaded_depths = 
{
  revisit = false,
  dungpoints = 0,
}

--- Entoh Town
--- Locations

SV.entoh_town = 
{
  revisit = false,
  HelperChapter = -1,
  AdventureChapter = -1,
  spent_dungpoints = 0,
  package_received = false,
  bag_size = 3,
  thicket = 
  {
    result = -1
  },
  firstfind = 0 -- 1 is for Flow, 2 is for Tidy
}

--- Guild

SV.guilders = 
{
  tarro_town = 
  {
    bluetail_stats = {},
    bluetail_storage = {}
  },
  entoh_town = 
  {
    scan_level = 1
  },
  fielded_two = false
}

SV.guild = 
{
  time = 0,
  day = 0,
  event = 0
}

----------------------------------------------
--- Minigames and others
----------------------------------------------

SV.buzzers_store = 
{
  plain_seed = 
  {
    count = 10,
    price = 5
  }
}

SV.GroundTutorial = 0

--Dungeon generation
SV.rent_number = 0