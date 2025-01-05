--[[---------------------------------------------------------------------------
DarkRP custom entities
---------------------------------------------------------------------------

This file contains your custom entities.
This file should also contain entities from DarkRP that you edited.

Note: If you want to edit a default DarkRP entity, first disable it in darkrp_config/disabled_defaults.lua
    Once you've done that, copy and paste the entity to this file and edit it.

The default entities can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:CustomEntityFields

Add entities under the following line:
---------------------------------------------------------------------------]]

local function CanBuyPrinters(ply)
    local char = VWAR:GetCharacter(ply)
    if (not char) then
        return false
    end

    if (ply:isCP()) then
        return false
    end

    return char.team == VWAR.Team3
end

DarkRP.createEntity("Mop Bucket", {
    ent = "vwar_cleaning_mop_bucket",
    model = "models/props_junk/mopbucket02.mdl",
    price = 10,
    max = 1,
    cmd = "/BuyMopBucket",
    customCheck = function(ply)
        local team = ply:Team()
        return team == TEAM_JANITOR or team == TEAM_CLASS_D_JANITOR
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You must be a Janitor or D-Class Janitor to buy this!"
    end,
})

DarkRP.createEntity("Vacuum Cleaner", {
    ent = "vwar_cleaning_vacuum_box2",
    model = "models/pylemod/vac/vihrj_8a.mdl",
    price = 10,
    max = 1,
    cmd = "/BuyVacuumCleaner",
    customCheck = function(ply)
        local team = ply:Team()
        return team == TEAM_JANITOR
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You must be a Janitor to buy this!"
    end,
})

DarkRP.createEntity("Cooking Pot", {
    ent = "vcraft_pot",
    model = "models/props_c17/metalPot001a.mdl",
    price = 10,
    max = 4,
    cmd = "/BuyPot",
})

DarkRP.createEntity("Oven Tray", {
    ent = "vcraft_oven_tray",
    model = "models/props_c17/metalPot002a.mdl",
    price = 10,
    max = 2,
    cmd = "/BuyOvenTray",
})

DarkRP.createEntity("Oven", {
    ent = "vcraft_oven",
    model = "models/props_c17/furnitureStove001a.mdl",
    price = 25,
    max = 1,
    cmd = "/BuyOven",
    allowed = {TEAM_CHEF},
})

DarkRP.createEntity("Chopping Board", {
    ent = "vcraft_chopping_board",
    model = "models/props_c17/FurnitureShelf001b.mdl",
    price = 5,
    max = 1,
    cmd = "/BuyChoppingBoard",
    allowed = {TEAM_CHEF},
})

DarkRP.createEntity("Music Player", {
    ent = "whk_radio",
    model = "models/props_lab/citizenradio.mdl",
    price = 10,
    max = 1,
    cmd = "/BuyMusicPlayer",
    allowed = {TEAM_SCP_CHEF, TEAM_CHEF},
})

DarkRP.createEntity("Cyclops Full Color", {
    ent = "arctic_nvg_pvs14",
    model = "models/arctic_nvgs/nvg_n15.mdl",
    price = 1000,
    max = 1,
    cmd = "/BuyCyclopsFullColor",
    allowed = {TEAM_O5},
})

DarkRP.createEntity("Drone", {
    ent = "entity_drone_base",
    model = "models/anthon/drone_body.mdl",
    price = 250,
    max = 1,
    category = "Other",
    cmd = "/BuyDrone",
    customCheck = function(ply)
    return ply:Team() == TEAM_DIRECTOR_OF_EXTERNAL_AFFAIRS
        or ply:Team() == TEAM_DEPUTY_DIRECTOR_OF_EXTERNAL_AFFAIRS
        or ply:Team() == TEAM_EXTERNAL_AFFAIRS_AGENCY_MANAGER
        or ply:Team() == TEAM_EXTERNAL_AFFAIRS_SPECIAL_AGENT
        or ply:Team() == TEAM_EXTERNAL_AFFAIRS_SENIOR_AGENT
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You must be DEA Senior Agent+ to buy this!"
    end,
})

--/////////////
-- Chemistry //
--/////////////
DarkRP.createEntity("Conical Flask", {
    ent = "vcraft_conical_flask",
    model = "models/labware/flask2.mdl",
    price = 220,
    max = 6,
    category = "Chemistry",
    cmd = "/BuyConicalFlask",
    customCheck = function(ply)
        return ply:Team() == TEAM_CHEMIST
        or ply:Team() == TEAM_RESEARCH_CHEMIST
        or ply:Team() == TEAM_DIRECTOR_OF_RESEARCH
        or ply:Team() == TEAM_DIRECTOR_OF_MEDICINE
        or ply:Team() == TEAM_CI_CHEMIST
        or ply:Team() == TEAM_UNGOC_CHEMIST
        or ply:Team() == TEAM_MARSHALL_CARTER_DARK_SALESMAN
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You must be chemist to buy new flasks!"
    end,
})

DarkRP.createEntity("Beaker", {
    ent = "vcraft_beaker",
    model = "models/labware/beaker2.mdl",
    price = 250,
    max = 6,
    category = "Chemistry",
    cmd = "/BuyBeaker",
    customCheck = function(ply)
        return ply:Team() == TEAM_CHEMIST
        or ply:Team() == TEAM_RESEARCH_CHEMIST
        or ply:Team() == TEAM_DIRECTOR_OF_RESEARCH
        or ply:Team() == TEAM_DIRECTOR_OF_MEDICINE
        or ply:Team() == TEAM_CI_CHEMIST
        or ply:Team() == TEAM_UNGOC_CHEMIST
        or ply:Team() == TEAM_MARSHALL_CARTER_DARK_SALESMAN
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You must be chemist to buy new beakers!"
    end,
})

DarkRP.createEntity("Large Beaker", {
    ent = "vcraft_beaker2",
    model = "models/labware/beaker2.mdl",
    price = 600,
    max = 3,
    category = "Chemistry",
    cmd = "/BuyLargeBeaker",
    customCheck = function(ply)
        return ply:Team() == TEAM_CHEMIST
        or ply:Team() == TEAM_RESEARCH_CHEMIST
        or ply:Team() == TEAM_DIRECTOR_OF_RESEARCH
        or ply:Team() == TEAM_DIRECTOR_OF_MEDICINE
        or ply:Team() == TEAM_CI_CHEMIST
        or ply:Team() == TEAM_UNGOC_CHEMIST
        or ply:Team() == TEAM_MARSHALL_CARTER_DARK_SALESMAN
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You must be chemist to buy new beakers!"
    end,
})

DarkRP.createEntity("Vial", {
    ent = "vcraft_vial",
    model = "models/labware/tube1.mdl",
    price = 100,
    max = 12,
    category = "Chemistry",
    cmd = "/BuyVial",
    customCheck = function(ply)
        return ply:Team() == TEAM_CHEMIST
        or ply:Team() == TEAM_RESEARCH_CHEMIST
        or ply:Team() == TEAM_DIRECTOR_OF_RESEARCH
        or ply:Team() == TEAM_DIRECTOR_OF_MEDICINE
        or ply:Team() == TEAM_CI_CHEMIST
        or ply:Team() == TEAM_UNGOC_CHEMIST
        or ply:Team() == TEAM_MARSHALL_CARTER_DARK_SALESMAN
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You must be chemist to buy new vials!"
    end,
})

DarkRP.createEntity("Injection Vial", {
    ent = "vcraft_injection_vial",
    model = "models/civilgamers/injection_vial/vial.mdl",
    price = 120,
    max = 12,
    category = "Chemistry",
    cmd = "/BuyInjectionVial",
    customCheck = function(ply)
        return not VWAR.SCP:IsClassD(ply)
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You cannot buy this as Class D!"
    end,
})

DarkRP.createEntity("Injection Vial Case", {
    ent = "vcraft_vial_case",
    model = "models/civilgamers/injection_vial/case_closed.mdl",
    price = 300,
    max = 2,
    category = "Chemistry",
    cmd = "/BuyVialCase",
    customCheck = function(ply)
        return not VWAR.SCP:IsClassD(ply)
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You cannot buy this as Class D!"
    end,
})

DarkRP.createEntity("Rift Bridge - 22415 Dimension", {
    ent = "vwar_instance_bridge_scp_22415_realm",
    model = "models/props/map/fd1/dimbridge/dimension_bridge_capsule.mdl",
    price = 5000,
    max = 3,
    category = "Chemistry",
    cmd = "/BuyRiftBridge22415",
    customCheck = function(ply)
        return ply:Team() == TEAM_DIRECTOR_OF_RESEARCH
        or ply:Team() == TEAM_EXECUTIVE_RESEARCHER
        or ply:Team() == TEAM_SENIOR_RESEARCHER
        or ply:Team() == TEAM_RESEARCHER
        or ply:Team() == TEAM_FOUNDATION_THAUMATOLOGIST
        or ply:Team() == TEAM_CI_RD
        or ply:Team() == TEAM_CI_TYPEBLUE
        or ply:Team() == TEAM_BIOHAZARD_RESEARCHER
        or ply:Team() == TEAM_UNGOC_THAUMATOLOGIST
        or ply:Team() == TEAM_UNGOC_RD
        or ply:Team() == TEAM_DIMENSIONAL_CARTOGRAPHER
        or ply:Team() == TEAM_UNGOC_DIMENSIONAL_CARTOGRAPHER
        or ply:Team() == TEAM_CL_DIMENSIONAL_CARTOGRAPHER
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You must be Foundation Researcher, thaumotologist, R&D or Type Blue!"
    end,
})

DarkRP.createEntity("Rift Bridge - Shadow Dimension", {
    ent = "vwar_instance_bridge_shadow_realm",
    model = "models/props/map/fd1/dimbridge/dimension_bridge_capsule.mdl",
    price = 30000,
    max = 3,
    category = "Chemistry",
    cmd = "/BuyRiftBridgeShadow",
    customCheck = function(ply)
        return ply:Team() == TEAM_MCD
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You must be MC&D!"
    end,
})

--////////////
-- PRINTERS //
--////////////
DarkRP.createEntity("Silver Printer", {
    ent = "rprint_silverprinter",
    model = "models/props_c17/consolebox01a.mdl",
    price = 900,
    max = 1,
    category = "Printers",
    cmd = "/BuySilverPrinter",
    customCheck = function(ply)
        return CanBuyPrinters(ply)
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You cannot purchase printers as this team!"
    end,
})

DarkRP.createEntity("Gold Printer", {
    ent = "rprint_goldprinter",
    model = "models/props_c17/consolebox01a.mdl",
    price = 2600,
    max = 1,
    category = "Printers",
    cmd = "/BuyGoldPrinter",
    customCheck = function(ply)
        return CanBuyPrinters(ply)
    end,
    CustomCheckFailMsg = function(ply, entTable)
        return "You cannot purchase printers as this team!"
    end,
})