--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------
This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
      Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:CustomJobFields

Add your custom jobs under the following line:
---------------------------------------------------------------------------]]

--[[
If you're reading this then i have not long to live. I have recivied a total of like 2 modles of coolioo and now mystic is joining in sending models that belong on cumRP. The job colours
	are "Done" aswell as the names and catagories. I have no clue what the "VwarTeams" will be so dont piss on me. the commands for the job are pretty scuffed but they will be completed
	and flushed out when Benjamin aka "Coolioo" sends me some fucking models that iv asked over a week for. have mercy on my soul. unrelated note funny haha skeleton model "models/player/skeleton.mdl"
	and ventz has a small cock lol also i got drip. CJobs by the way.

DON'T FUCKING TOUCH JOB TABLE NAMES (E.G. TEAM_CLASS_D) WITHOUT UPDATING THE VWAR NICK CONFIG
DON'T FUCKING TOUCH JOB TABLE NAMES (E.G. TEAM_CLASS_D) WITHOUT UPDATING THE VWAR NICK CONFIG
DON'T FUCKING TOUCH JOB TABLE NAMES (E.G. TEAM_CLASS_D) WITHOUT UPDATING THE VWAR NICK CONFIG
DON'T FUCKING TOUCH JOB TABLE NAMES (E.G. TEAM_CLASS_D) WITHOUT UPDATING THE VWAR NICK CONFIG
DON'T FUCKING TOUCH JOB TABLE NAMES (E.G. TEAM_CLASS_D) WITHOUT UPDATING THE VWAR NICK CONFIG
]]

local mtfERTPriority = 30

local cicomRank = 29
local brigcomRank = 26
local delcomRank = 25
local deltaRank = 24
local gammaRank = 23
local betaRank = 22
local alphaRank = 21

local commanderRank = 11
local officerRank = 8
local comsergeantRank = 7
local sergeantRank = 6
local corporalRank = 5
local lancecorporalRank = 4
local privateRank = 3

-- Don't change: identifiers for passive XP gain
local COMBAT = 1
local DCLASS = 2
local RESEARCH = 3
local SCP = 4
local SUPPORT = 5
-- e.g. add PassiveXP = COMBAT to make a job give passive combat XP

local mtfZombieType = {
    healthMultiplier = 1.5,
    model = {
        "models/scp/soldier_shock_z.mdl",
        "models/scp/soldier_z_com.mdl",
        "models/scp/soldier_z_med.mdl",
        "models/scp/soldier_z_noob.mdl",
        "models/scp/soldier_z_regular.mdl",
    }
}

local medicZombieType = {
    healthMultiplier = 1.2,
    model = "models/scp/medic_z.mdl",
}

local guardZombieType = {
    healthMultiplier = 1.2,
    model = "models/player/zombies/zombie_guard.mdl",
}

local dclassZombieType = {
    healthMultiplier = 1,
    model = "models/scp/class_d_z.mdl",
}

local dclassBruteZombieType = {
    healthMultiplier = 3,
    model = "models/scp/class_d_z.mdl",
}

function GetClassDNumber(ply)
    local storedSeed = math.random(999999999)
    math.randomseed(ply:AccountID())

    local number = math.random(9999)
    local numberStr = tostring(number)

    if (string.len(numberStr) < 4) then
        numberStr = string.rep("0", 4 - string.len(numberStr))..numberStr
    end

    math.randomseed(storedSeed)

    return numberStr
end

local dclassJobPrefix = function(ply)
    return "D-"..tostring(GetClassDNumber(ply))
end

-- COMMENT OUT EVENT JOBS WHEN NOT IN USE
/////////////
// Events  //
/////////////

-- See scp-super-admin-chat

///////////////
// Class D  //
//////////////

TEAM_CLASS_D = AddExtraTeam("Class D Personnel", {
    color = Color(255,128,0),
    model = {
        "models/player/kerry/Class_D_1.mdl",
        "models/player/kerry/Class_D_2.mdl",
        "models/player/kerry/Class_D_3.mdl",
        "models/player/kerry/Class_D_4.mdl",
        "models/player/kerry/Class_D_5.mdl",
        "models/player/kerry/Class_D_6.mdl",
        "models/player/kerry/Class_D_7.mdl",
    },
    description = [[D-Class Personnel are expendable personnel used for experimentation and other tasks the SCP Foundation requires. With their population often sourced from violent inmates, riots are common, and escape attempts are frequent, although no recorded attempts have succeeded. Despite common belief, D-Class Personnel still have rights, and frequent abuse by Foundation staff will invite a visit from the Ethics Committee.
]],
    weapons = {},
    command = "classd",
    max = 0,
    admin = 0,
    salary = 0,
    hasLicense = false,
    candemote = false,
    category = "Class D Personnel",
    VWarBodygroups = {
        [1] = 1, // Arms
    },
    VWarTeam = "foundation",
	PassiveXP = DCLASS,
    PassiveXPAmount = 50,
    VWarSCPZombieType = dclassZombieType,
    VComputersDocument = "foundation/global_operations_database/secure_sector/3186935",
    DClass = true,
    JobNickConfig = dclassJobPrefix,
})

TEAM_CLASS_D_TANK = AddExtraTeam("Class D Brute", {
    color = Color(255,128,0),
    model = {
		"models/gta5/prisoners/prisonermusclepm.mdl",
		"models/gta5/prisoners/prisonerlatinopm.mdl",
	},
    description = [[D-Class Personnel are expendable personnel used for experimentation and other tasks the SCP Foundation requires. 
    The Brute has been around for longer than anyone else in D-Block and survived his fair share of encounters. His endurance allows him to take and give more punishment than anyone else.
]],
    weapons = {"weapon_fists"},
    command = "classdtank",
    max = 3,
    admin = 0,
    salary = 0,
    hasLicense = false,
    candemote = false,
    category = "Class D Personnel",
    VWarBodygroups = {
        [1] = 1, // Arms
    },
    VWarTeam = "foundation",
	PassiveXP = DCLASS,
    PassiveXPAmount = 50,
    VWarSCPZombieType = dclassBruteZombieType,
    VComputersDocument = "foundation/global_operations_database/secure_sector/3186935",
	VWarLevel = {
        type = "dclass",
        level = 15,
    },
    DClass = true,
    PlayerLoadout = function(ply)
        ply:SetHealth(250)
		ply:SetMaxHealth(250)
    end,
    JobNickConfig = dclassJobPrefix,
})

TEAM_CLASS_D_SCOUT = AddExtraTeam("Class D Scout", {
    color = Color(255,128,0),
    model = {
        "models/player/cheddar/class_d/class_d_scout_ted.mdl",
        "models/player/cheddar/class_d/class_d_scout_mike.mdl",
        "models/player/cheddar/class_d/class_d_scout_art.mdl",
        "models/player/cheddar/class_d/class_d_scout_eric.mdl",
    },
    description = [[D-Class Personnel are expendable personnel used for experimentation and other tasks the SCP Foundation requires. 
    The Scout is an especially athletic member of the prison block, you wouldn't want to challenge him in a fight, he also has his ways of acquiring strange items.
]],
    weapons = {"weapon_fists", "velkon_guitar", "vwar_scp_500", "dradio"},
    command = "classdscout",
    max = 3,
    admin = 0,
    salary = 0,
    hasLicense = false,
    candemote = false,
    category = "Class D Personnel",
    VWarBodygroups = {
        [1] = 1, // Hat
        [3] = 1, // Body
    },
    VWarTeam = "foundation",
	PassiveXP = DCLASS,
    PassiveXPAmount = 50,
    VWarSCPZombieType = dclassZombieType,
    VComputersDocument = "foundation/global_operations_database/secure_sector/3186935",
    DClass = true,
    VAchievementsCompletion = {
        serverId = "SCP-RP",
        percentage = 50,
    },
    PlayerLoadout = function(ply)
        ply:SetHealth(150)
		ply:SetMaxHealth(150)
    end,
    JobNickConfig = dclassJobPrefix,
})

// Speed hook for D Class scout
hook.Add("PlayerChangedTeam", "class_d_scout", function(ply, oldTeam, newTeam)
    if (newTeam == TEAM_CLASS_D_SCOUT and oldTeam != TEAM_CLASS_D_SCOUT) then
        ply.dScoutRunSpeed = ply:GetRunSpeed()
        ply.dScoutMaxSpeed = ply:GetMaxSpeed()

        local hookName = "dclass_scout_"..ply:SteamID()
        hook.Add("Think", hookName, function()
            if (not IsValid(ply)) then
                hook.Remove("Think", hookName)
                return
            end

            ply:SetRunSpeed(ply.dScoutRunSpeed * 1.3)
            ply:SetMaxSpeed(ply.dScoutMaxSpeed * 1.3)
        end)
    elseif (oldTeam == TEAM_CLASS_D_SCOUT and newTeam != TEAM_CLASS_D_SCOUT) then
        if (ply.dScoutRunSpeed) then
            ply:SetRunSpeed(ply.dScoutRunSpeed)
            ply.dScoutRunSpeed = nil
            ply:SetMaxSpeed(ply.dScoutMaxSpeed)
            ply.dScoutMaxSpeed = nil
        end

        hook.Remove("Think", "dclass_scout_"..ply:SteamID())
    end
end)

//////////////////////////////
// Service Foundation Jobs //
////////////////////////////

TEAM_SCP_CHEF = AddExtraTeam("SCP Foundation Chef", {
    color = Color(255, 180, 100, 255),
    model = {
        "models/fearless/chef1.mdl",
        "models/fearless/chef2.mdl",
    },
    description = [[Chefs are at the heart of Foundation life, feeding staff in order to keep the Foundation moving. They use their skills in order to produce nutritious meals on a regular basis.
]],
    weapons = {"vkeycard_level_1", "vwar_scp_personnel_tablet"},
    command = "scp_chef",
    max = 5,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Site Staff",
    VWarTeam = "foundation",
    PassiveXP = SUPPORT,
    VWarTotalLevel = 5,
    JobNickConfig = "Chef",
})

TEAM_ENGINEER = AddExtraTeam("Engineer", {
    color = Color(255, 180, 100, 255),
    model = {
        "models/player/engineer/engineer_mike.mdl",
        "models/player/engineer/engineer_art.mdl",
        "models/player/engineer/engineer_eric.mdl",
        "models/player/engineer/engineer_ted.mdl",
        "models/player/engineer/engineer_joe.mdl",
        "models/player/engineer/engineer_van.mdl",
        "models/player/engineer/engineer_balaclava.mdl",
    },
    description = [[Engineers aid in the upkeep of the facility, repairing broken equipment in order to keep the facility working.
]],
    weapons = {"vkeycard_level_1", "vwar_scp_personnel_tablet", "vwar_scp_repair_tool"},
    command = "engineer",
    max = 0,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Site Staff",
    VWarTeam = "foundation",
    PassiveXP = SUPPORT,
    VWarTotalLevel = 5,
    JobNickConfig = "Engineer",
})

TEAM_IT_SPECIALIST = AddExtraTeam("IT Specialist", {
    color = Color(255, 180, 100, 255),
    model = {
        "models/player/kleiner.mdl",
    },
    description = [[IT Technicians assist in resolving issues with SCiPNET terminals and restoring their proper function.
]],
    weapons = {"vkeycard_level_1", "vwar_scp_personnel_tablet", "vwar_scp_technician_tool"},
    command = "technician",
    max = 0,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Site Staff",
    VWarTeam = "foundation",
    PassiveXP = SUPPORT,
    VWarTotalLevel = 5,
    JobNickConfig = "Technician",
})

TEAM_TECHNICAL_EXPERT = AddExtraTeam("Technical Expert", {
    color = Color(255, 180, 100, 255),
    model = {
		"models/player/cheddar/tech/tech_expert.mdl",
    },
    description = [[Technical Experts are experienced members of the Foundation's technical teams, with an improved clearance level and the ability to resolve both mechanical and IT issues.
]],
    weapons = {"vkeycard_level_2", "vwar_scp_personnel_tablet", "vwar_scp_technician_tool", "vwar_scp_repair_tool"},
    command = "technicalexpert",
    max = 5,
    admin = 0,
    salary = 60,
    hasLicense = false,
    candemote = false,
    category = "Site Staff",
    VWarTeam = "foundation",
    PassiveXP = SUPPORT,
	VWarLevel = {
        type = "support",
        level = 10,
    },
    VWarTotalLevel = 20,
})

TEAM_ERT = AddExtraTeam("Emergency Response Team", {
    color = Color(255, 60, 50, 255),
    model = {
        "models/player/cheddar/qrf/ert_soldier1.mdl",
    },
    description = [[The Emergency Response Team (ERT) is an elite unite dedicated to dealing with emergency containment breach situations.
This team comes equipped with state-of-the-art equipment specialized in the recontainment of various SCPs.

The ERT will be deployed to the facility when a catastrophic breach cannot be handled by on-site personnel.
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "vwar_scp_shieldwall_swep", "vwar_first_aid_kit", "m9k_nerve_gas", "vwar_scp_repair_tool", "weapon_cuff_scp", "vwar_scp_anomaly_containment_beam", "dradio", "vwar_decontaminator_infinite", "vwar_infection_scanner", "vwar_infection_testing_kit"},
    command = "ert",
    max = 3,
    admin = 0,
    salary = 80,
    hasLicense = false,
    candemote = false,
    VWarTeam = "foundation",
    VWarGasMask = 3,
    VWarImmuneToNeedles = true,
    VWarElectrician = true,
    PassiveXP = COMBAT,
    SCPDamageBuff = 2,
    SCP173Immunity = true,
    SCP035Immunity = true,
    VWarERT = true,
    PermaScramble = true,
    hidden = true,
})

/////////////////
// Medic Jobs //
////////////////

TEAM_MEDIC_TRAIN = AddExtraTeam("Medical Trainee", {
    color = Color(255, 180, 100, 255),
    model = {
        "models/player/kerry/medic/medic_01.mdl",
        "models/player/kerry/medic/medic_01_f.mdl",
        "models/player/kerry/medic/medic_02.mdl",
        "models/player/kerry/medic/medic_02_f.mdl",
        "models/player/kerry/medic/medic_03.mdl",
        "models/player/kerry/medic/medic_03_f.mdl",
        "models/player/kerry/medic/medic_04.mdl",
        "models/player/kerry/medic/medic_04_f.mdl",
        "models/player/kerry/medic/medic_05.mdl",
        "models/player/kerry/medic/medic_05_f.mdl",
        "models/player/kerry/medic/medic_06.mdl",
        "models/player/kerry/medic/medic_06_f.mdl",
        "models/player/kerry/medic/medic_07.mdl",
    },
    description = [[Medical Trainees are entry-level members of medical staff. They assist Medical Doctors in treating patients, and work towards training for their medical licence.
	
	All members of medical staff are expected to read the medical manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to treat patients being revoked.
]],
    weapons = {"vwar_first_aid_kit", "vclipboard", "vwar_field_kit", "vkeycard_level_1", "vwar_scp_personnel_tablet", "weapon_lordi_defib"},
    command = "medic_trainee",
    max = 0,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Medical Staff",
    VWarTeam = "foundation",
    VWarDeploymentSpots = {
        ["Facility Medical"] = true,
    },
    PassiveXP = SUPPORT,
    VWarTotalLevel = 5,
    VWarSCPZombieType = medicZombieType,
    VComputersDocument = "foundation/global_operations_database/manuals/medical/279406",
    JobNickConfig = "Trainee",
})

TEAM_DOCTOR = AddExtraTeam("Doctor", {
    color = Color(255, 180, 100, 255),
    model = {
        "models/player/kerry/medic/medic_01.mdl",
        "models/player/kerry/medic/medic_01_f.mdl",
        "models/player/kerry/medic/medic_02.mdl",
        "models/player/kerry/medic/medic_02_f.mdl",
        "models/player/kerry/medic/medic_03.mdl",
        "models/player/kerry/medic/medic_03_f.mdl",
        "models/player/kerry/medic/medic_04.mdl",
        "models/player/kerry/medic/medic_04_f.mdl",
        "models/player/kerry/medic/medic_05.mdl",
        "models/player/kerry/medic/medic_05_f.mdl",
        "models/player/kerry/medic/medic_06.mdl",
        "models/player/kerry/medic/medic_06_f.mdl",
        "models/player/kerry/medic/medic_07.mdl",
    },
    description = [[Medical Doctors are mid-level members of medical staff. They treat patients, working with Chemists to obtain prescriptions, and assisting in training Medical Trainees.
	
	All members of medical staff are expected to read the medical manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to treat patients being revoked.
]],
    weapons = {"vwar_first_aid_kit", "vclipboard", "vwar_field_kit", "vkeycard_level_2", "vwar_scp_personnel_tablet", "weapon_lordi_defib"},
    command = "doctor",
    max = 5,
    admin = 0,
    salary = 60,
    hasLicense = false,
    candemote = false,
    category = "Medical Staff",
    VWarTeam = "foundation",
    VWarDeploymentSpots = {
        ["Facility Medical"] = true,
    },
    PassiveXP = SUPPORT,
    VWarTotalLevel = 20,
    VWarLicenses = {
        ["medical"] = true,
    },
    VWarLevel = {
        type = "support",
        level = 10,
    },
    VWarSCPZombieType = medicZombieType,
    VComputersDocument = "foundation/global_operations_database/manuals/medical/279406",
    JobNickConfig = "Doctor",
})

TEAM_COMBAT_MEDIC = AddExtraTeam("Combat Medic", {
    color = Color(255, 180, 100, 255),
    model = {
        "models/payday2/units/medic_player.mdl",
    },
    description = [[Combat Medics are mid-level members of medical staff. They treat patients in high-risk scenarios where regular Doctor would be in danger, working with MTF Units and Security to ensure injured combative staff are able to fight another day and assisting in training Medical Trainees.
	
	All members of medical staff are expected to read the medical manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to treat patients being revoked.
]],
    weapons = {"vwar_first_aid_kit", "vclipboard", "vwar_field_kit", "vkeycard_level_3", "vguns_m4_9mm", "vguns_m9", "vwar_scp_personnel_tablet", "dradio", "weapon_lordi_defib"},
    command = "combat_medic",
    max = 4,
    admin = 0,
    salary = 60,
    hasLicense = false,
    candemote = false,
    category = "Medical Staff",
    VWarTeam = "foundation",
    VWarDeploymentSpots = {
        ["Facility Medical"] = true,
    },
    PassiveXP = SUPPORT,
    VWarTotalLevel = 40,
    VWarLicenses = {
        ["medical"] = true,
    },
    VWarLevel = {
        type = "support",
        level = 20,
    },
    VWarSCPZombieType = mtfZombieType,
    VComputersDocument = "foundation/global_operations_database/manuals/medical/279406",
    JobNickConfig = "Doctor",
})

-- TEAM_CHEMIST = AddExtraTeam("Chemist", {
--     color = Color(255, 180, 100, 255),
--     model = {
--         "models/worker/chemwork_02.mdl",
--         "models/worker/chemwork_04.mdl",
--         "models/worker/chemwork_05.mdl",
--         "models/worker/chemwork_06.mdl",
--         "models/worker/chemwork_07.mdl",
--         "models/worker/chemwork_08.mdl",
--         "models/worker/chemwork_09.mdl",
--         "models/worker/chemwork_10.mdl",
--     },
--     description = [[Chemists are mid-level members of medical staff. They work with doctors to create prescriptions for patients, by creating drugs and other useful medical devices.
	
-- 	All members of medical staff are expected to read the medical manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to treat patients being revoked.
-- ]],
--     weapons = {"vwar_first_aid_kit", "vclipboard", "vwar_field_kit", "vkeycard_level_2", "vwar_scp_personnel_tablet", "weapon_lordi_defib"},
--     command = "chemist",
--     max = 5,
--     admin = 0,
--     salary = 60,
--     hasLicense = false,
--     candemote = false,
--     category = "Medical Staff",
--     VWarTeam = "foundation",
--     VWarDeploymentSpots = {
--         ["Facility Medical"] = true,
--     },
--     VWarBodygroups = {
--         [3] = 1, // Gloves
--         [5] = 1, // Mask
--     },
--     PassiveXP = SUPPORT,
--     VWarSCPZombieType = medicZombieType,
--     VComputersDocument = "foundation/global_operations_database/manuals/medical/279406",

--     CustomCheckFailMsg = "You need to be at least Thaumiel VIP to play this job!",
--     customCheck = function(ply)
--         return ply:AtLeastRanked("Thaumiel VIP")
--     end,
--     JobNickConfig = "Doctor",
-- })

TEAM_MEDIC_CHIEF = AddExtraTeam("Chief of Medicine", {
    color = Color(255, 180, 100, 255),
    model = "models/player/medical/director/director_mesa.mdl",
    description = [[The Chief of Medicine oversees the entirety of the medical team, and is personally appointed by the O5 Council & the Ethics Committee. They have the final say on what medical operations take place, unless overruled by the Director of Medicine or a Level 5 member of staff.
]],
    weapons = {"vwar_first_aid_kit", "vclipboard", "vwar_field_kit", "vkeycard_level_4", "vwar_scp_personnel_tablet", "weapon_lordi_defib"},
    command = "cheifmed",
    max = 3,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "Medical Staff",
    VWarDeploymentSpots = {
        ["Facility Medical"] = true,
    },
    VWarTeam = "foundation",
    VWarBodygroups = {
        [1] = 1, // Boots
        [3] = 3, // Sleeves
    },
    VWarLicenses = {
        ["medical"] = true,
    },
    PassiveXP = SUPPORT,
    VWarSCPZombieType = medicZombieType,
    VComputersDocument = "foundation/global_operations_database/manuals/medical/279406",
    JobNickConfig = "Dpt. Chief",
})

TEAM_MEDIC_DIRECTOR = AddExtraTeam("Director of Medicine", {
    color = Color(255, 180, 100, 255),
    model = {
        "models/player/suits/male_01_shirt_tie.mdl",
        "models/player/suits/male_02_shirt_tie.mdl",
        "models/player/suits/male_03_shirt_tie.mdl",
        "models/player/suits/male_04_shirt_tie.mdl",
        "models/player/suits/male_05_shirt_tie.mdl",
        "models/player/suits/male_06_shirt_tie.mdl",
        "models/player/suits/male_07_shirt_tie.mdl",
        "models/player/suits/male_08_shirt_tie.mdl",
        "models/player/suits/male_09_shirt_tie.mdl",
    },
    description = [[The Director of Medicine oversees the entirety of the medical team, and is personally appointed by the O5 Council & the Ethics Committee. They have the final say on what medical operations take place, unless overruled by a Level 5 member of staff.
]],
    weapons = {"vwar_first_aid_kit", "vclipboard", "vwar_field_kit", "vkeycard_level_4", "vwar_scp_personnel_tablet", "weapon_lordi_defib"},
    command = "directormed",
    max = 1,
    admin = 0,
    salary = 150,
    hasLicense = false,
    candemote = false,
    category = "Medical Staff",
    VWarDeploymentSpots = {
        ["Facility Medical"] = true,
    },
    VWarTeam = "foundation",
    VWarLicenses = {
        ["medical"] = true,
    },
    VWarBodygroups = {
        [1] = 1, // Sleeves
        [2] = 16, // Ties
    },
    VWarSkin = 14,
    PassiveXP = SUPPORT,
    VComputersDocument = "foundation/global_operations_database/manuals/medical/279406",
    JobNickConfig = "Dpt. Director",
})

//////////////////////
// Researcher Jobs //
/////////////////////

TEAM_JR_RESEARCHER = AddExtraTeam("Junior Researcher", {
    color = Color(204,204,255),
    model = {
    	"Models/Armacham/scientists/scientists_1.mdl",
    	"Models/Armacham/scientists/scientists_2.mdl",
    	"Models/Armacham/scientists/scientists_3.mdl",
    	"Models/Armacham/scientists/scientists_4.mdl",
    	"Models/Armacham/scientists/scientists_5.mdl",
    	"Models/Armacham/scientists/scientists_6.mdl",
    	"Models/Armacham/scientists/scientists_7.mdl",
    	"Models/Armacham/scientists/scientists_8.mdl",
        "Models/Armacham/scientists/scientists_9.mdl",
    },
    description = [[Junior Researchers are entry-level members of research staff. They perform experiments on Level 1 SCPs, and may perform experiments on Level 2 SCPs if escorted by a Level 2+ member of staff. Using their clipboard, they write and submit experiment reports based on the information they have gathered.
	
	All members of research staff are expected to read the research manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to run experiments being revoked.
]],
    weapons = {"vkeycard_level_1", "vwar_scp_personnel_tablet", "vclipboard"},
    command = "jrresearcher",
    max = 0,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Research Staff",
    VWarTeam = "foundation",
    PassiveXP = RESEARCH,
    VWarTotalLevel = 5,
    VComputersDocument = "foundation/global_operations_database/manuals/research/7064890",
    JobNickConfig = "Jr. Researcher",
})

TEAM_RESEARCHER = AddExtraTeam("Researcher", {
    color = Color(204,204,255),
    model = {
    	"Models/Armacham/scientists/scientists_1.mdl",
    	"Models/Armacham/scientists/scientists_2.mdl",
    	"Models/Armacham/scientists/scientists_3.mdl",
    	"Models/Armacham/scientists/scientists_4.mdl",
    	"Models/Armacham/scientists/scientists_5.mdl",
    	"Models/Armacham/scientists/scientists_6.mdl",
    	"Models/Armacham/scientists/scientists_7.mdl",
    	"Models/Armacham/scientists/scientists_8.mdl",
        "Models/Armacham/scientists/scientists_9.mdl",
    },
    description = [[Researchers are mid-level members of research staff. They perform experiments on Level 1-2 SCPs, and may perform experiments on Level 3 SCPs if escorted by a Level 3+ member of staff. Using their clipboard, they write and submit experiment reports based on the information they have gathered.
	
	All members of research staff are expected to read the research manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to run experiments being revoked.
]],
    weapons = {"vkeycard_level_2", "vwar_scp_personnel_tablet", "vclipboard"},
    command = "researcher",
    max = 8,
    admin = 0,
    salary = 60,
    hasLicense = false,
    candemote = false,
    category = "Research Staff",
    VWarTeam = "foundation",
    PassiveXP = RESEARCH,
    VWarTotalLevel = 15,
    VWarLevel = {
        type = "research",
        level = 5,
    },
    VComputersPrinterCreditRefundTime = 60 * 20,
    VComputersDocument = "foundation/global_operations_database/manuals/research/7064890",
    JobNickConfig = "Researcher",
})

TEAM_SENIOR_RESEARCHER = AddExtraTeam("Senior Researcher", {
    color = Color(204,204,255),
    model = {
    	"Models/Armacham/scientists/scientists_1.mdl",
    	"Models/Armacham/scientists/scientists_2.mdl",
    	"Models/Armacham/scientists/scientists_3.mdl",
    	"Models/Armacham/scientists/scientists_4.mdl",
    	"Models/Armacham/scientists/scientists_5.mdl",
    	"Models/Armacham/scientists/scientists_6.mdl",
    	"Models/Armacham/scientists/scientists_7.mdl",
    	"Models/Armacham/scientists/scientists_8.mdl",
        "Models/Armacham/scientists/scientists_9.mdl",
    },
    description = [[Senior Researchers are senior members of research staff. They perform experiments on Level 1-3 SCPs, and may perform experiments on Level 4 SCPs if escorted by a Level 4 member of staff. Using their clipboard, they write and submit experiment reports based on the information they have gathered.
	
	All members of research staff are expected to read the research manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to run experiments being revoked.
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "vclipboard"},
    command = "sresearcher",
    max = 5,
    admin = 0,
    salary = 80,
    hasLicense = false,
    candemote = false,
    category = "Research Staff",
    VWarTeam = "foundation",
    PassiveXP = RESEARCH,
    VWarTotalLevel = 30,
    VWarLevel = {
        type = "research",
        level = 15,
    },
    VComputersPrinterCreditRefundTime = 60 * 10,
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VComputersDocument = "foundation/global_operations_database/manuals/research/7064890",
    JobNickConfig = "Sr. Researcher",
})

TEAM_RESEARCHER_BIOHAZARD_SPECIALIST = AddExtraTeam("Biohazard Researcher", {
    color = Color(204,204,255),
    model = "models/dxn/cod_ghosts/hazmat_pm.mdl",
    description = [[Biohazard Researchers are senior members of research staff who have been outfitted with a flame-retardant biohazard suit, protecting them against SCPs such as SCP-457, SCP-049, and SCP-008. Using their clipboard, they write and submit experiment reports based on the information they have gathered.
	
	All members of research staff are expected to read the research manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to run experiments being revoked.
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "vclipboard"},
    command = "researcher_biohazard_specialist",
    max = 3,
    admin = 0,
    salary = 80,
    hasLicense = false,
    candemote = false,
    category = "Research Staff",
    VWarTeam = "foundation",
    PassiveXP = RESEARCH,
    VWarGasMask = 2, // 1 = Regular gas mask, 2 = complete protection
	VWarFlameRetardant = true,
    VWarTotalLevel = 40,
    VWarLevel = {
        type = "research",
        level = 20,
    },
    VComputersPrinterCreditRefundTime = 60 * 20,
    VComputersDocument = "foundation/global_operations_database/manuals/research/7064890",
    JobNickConfig = "Biohazard Researcher",
})

TEAM_EXECUTIVE_RESEARCHER = AddExtraTeam("Executive Researcher", {
    color = Color(204,204,255),
    model = {
    	"Models/Armacham/scientists/scientists_1.mdl",
    	"Models/Armacham/scientists/scientists_2.mdl",
    	"Models/Armacham/scientists/scientists_3.mdl",
    	"Models/Armacham/scientists/scientists_4.mdl",
    	"Models/Armacham/scientists/scientists_5.mdl",
    	"Models/Armacham/scientists/scientists_6.mdl",
    	"Models/Armacham/scientists/scientists_7.mdl",
    	"Models/Armacham/scientists/scientists_8.mdl",
        "Models/Armacham/scientists/scientists_9.mdl",
    },
    description = [[Executive Researchers are executive members of research staff. They may perform experiments on all SCPs, and are the most elite members of research staff that the Foundation has access to.
	
	All members of research staff are expected to read the research manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to run experiments being revoked.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "vclipboard"},
    command = "eresearcher",
    max = 4,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "Research Staff",
    VWarTeam = "foundation",
    PassiveXP = RESEARCH,
    VComputersPrinterCreditRefundTime = 60 * 5,
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VComputersDocument = "foundation/global_operations_database/manuals/research/7064890",
    JobNickConfig = "Executive Researcher",
})

////////////////////
// Security Jobs //
///////////////////

TEAM_SECURITY_CADET = AddExtraTeam("Security Cadet", {
    color = Color(0,51,102),
    model = {
        "models/player/cheddar/security/security_male023.mdl",
        "models/player/cheddar/security/security_male05.mdl",
        "models/player/cheddar/security/security_male07.mdl",
        "models/player/cheddar/security/security_male09.mdl",
        "models/player/cheddar/security/security_male1.mdl",
        "models/player/cheddar/security/security_male4.mdl",
        "models/player/cheddar/security/security_male8.mdl",
    },
    description = [[Security Cadets are entry-level members of security staff. They provide basic security for Level 1 areas of the site, and may access Level 2 areas when accompanied by a Level 2+ keycard holder. They also provide escorts to research and other site staff (who are accessing Level 2 areas or below).
	
	All members of security staff are expected to read the security manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your security credentials being revoked.
]],
    weapons = {"vkeycard_level_1", "vwar_scp_personnel_tablet", "dradio", "weaponchecker", "vguns_mp5a4", "vguns_usp", "weapon_cuff_elastic", "weapon_stunstick"},
    command = "security",
    max = 0,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Security Staff",
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    VWarTotalLevel = 5,
    VWarSCPZombieType = guardZombieType,
    VWarBodygroups = {
        [7] = 1, // goggles
    },
	VComputersDocument = "foundation/global_operations_database/manuals/security/7967450",

	PlayerLoadout = function( ply ) return ply:SetArmor( 50 ) end,
    JobNickConfig = "Cadet",
})

TEAM_SECURITY_SERGEANT = AddExtraTeam("Security Officer", {
    color = Color(0,51,102),
    model = {
        "models/player/cheddar/officer/officer_male1.mdl",
        "models/player/cheddar/officer/officer_male02.mdl",
        "models/player/cheddar/officer/officer_male04.mdl",
        "models/player/cheddar/officer/officer_male05.mdl",
        "models/player/cheddar/officer/officer_male07.mdl",
    },
    description = [[Security Officers are mid-level members of security staff. They provide security for Level 1-2 areas of the site, and may access Level 3 areas when accompanied by a Level 3+ keycard holder. They also provide escorts to research and other site staff (who are accessing Level 3 areas or below).
	
	All members of security staff are expected to read the security manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your security credentials being revoked.
]],
    weapons = {"vkeycard_level_2", "vwar_scp_personnel_tablet", "dradio", "weaponchecker", "vguns_mp5a4", "vguns_usp", "weapon_cuff_elastic", "weapon_stunstick"},
    command = "ssecurity",
    max = 7,
    admin = 0,
    salary = 60,
    hasLicense = false,
    candemote = false,
    category = "Security Staff",
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    VWarTotalLevel = 20,
    VWarLevel = {
        type = "combat",
        level = 10,
    },
    VWarSCPZombieType = guardZombieType,
    VComputersDocument = "foundation/global_operations_database/manuals/security/7967450",
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 50 ) end,
    JobNickConfig = "Officer",
})

TEAM_SECURITY_LIEUTENANT = AddExtraTeam("Security Sergeant", {
    color = Color(0,51,102),
    model = {
        "models/player/cheddar/hierarchy/sgt_vance.mdl",
        "models/player/cheddar/hierarchy/sgt_mike.mdl",
        "models/player/cheddar/hierarchy/sgt_erdim.mdl",
        "models/player/cheddar/hierarchy/sgt_art.mdl",
        "models/player/cheddar/hierarchy/sgt_ted.mdl",
        "models/player/cheddar/hierarchy/sgt_van.mdl",
    },
    description = [[Security Sergeants are senior members of security staff. They provide security for Level 1-3 areas of the site, and may access Level 4 areas when accompanied by a Level 4 keycard holder. They also provide escorts to research and other site staff (who are accessing Level 4 areas or below).
	
	All members of security staff are expected to read the security manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your security credentials being revoked.
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "dradio", "weaponchecker", "vguns_f90", "vguns_usp", "weapon_cuff_elastic", "weapon_stunstick", "vclipboard", "vwar_scp_interrogate"},
    command = "lsecurity",
    max = 3,
    admin = 0,
    salary = 80,
    hasLicense = false,
    candemote = false,
    category = "Security Staff",
    VWarBodygroups = {
        [5] = 1, // shoulders
        [8] = 1, // headgear
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    VWarTotalLevel = 40,
    VWarLevel = {
        type = "combat",
        level = 20,
    },
    VComputersDocument = "foundation/global_operations_database/manuals/security/7967450",
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 50 ) end,
    JobNickConfig = "Sergeant",
})

TEAM_SECURITY_CAPTAIN = AddExtraTeam("Security Captain", {
    color = Color(0,51,102),
    model = {
        "models/player/cheddar/hierarchy/sgt_vance.mdl",
        "models/player/cheddar/hierarchy/sgt_mike.mdl",
        "models/player/cheddar/hierarchy/sgt_erdim.mdl",
        "models/player/cheddar/hierarchy/sgt_art.mdl",
        "models/player/cheddar/hierarchy/sgt_ted.mdl",
        "models/player/cheddar/hierarchy/sgt_van.mdl",
    },
    description = [[The Security Captain assists in overseeing the entirety of the security team and is personally appointed by the Chief of Security. They have the final say on what security operations take place, unless overruled by the Chief of Security or a Level 5 member of staff.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "weaponchecker", "vguns_f90", "vguns_deagle", "weapon_cuff_elastic", "weapon_stunstick", "vclipboard", "vwar_scp_interrogate", "riot_shield", "vguns_br9_tranq"},
    command = "seccap",
    max = 2,
    admin = 0,
    salary = 150,
    hasLicense = false,
    candemote = false,
    category = "Security Staff",
    VWarBodygroups = {
        [8] = 3, // headgear
    },
	VWarLicenses = {
        ["riot"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VComputersDocument = "foundation/global_operations_database/manuals/security/7967450",
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 50 ) end,
    JobNickConfig = "Captain",
})

TEAM_SECURITY_CHIEF = AddExtraTeam("Chief of Security", {
    color = Color(0,51,102),
    model = {
        "models/player/cheddar/hierarchy/sgt_vance.mdl",
        "models/player/cheddar/hierarchy/sgt_mike.mdl",
        "models/player/cheddar/hierarchy/sgt_erdim.mdl",
        "models/player/cheddar/hierarchy/sgt_art.mdl",
        "models/player/cheddar/hierarchy/sgt_ted.mdl",
        "models/player/cheddar/hierarchy/sgt_van.mdl",
    },
    description = [[The Chief of Security oversees the entirety of the security team, and is personally appointed by the O5 Council. They have the final say on what security operations take place, unless overruled by a Level 5 member of staff.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "weaponchecker", "vguns_f90", "vguns_deagle", "weapon_cuff_elastic", "weapon_stunstick", "vclipboard", "vwar_scp_interrogate", "riot_shield", "vguns_br9_tranq"},
    command = "chiefsec",
    max = 2,
    admin = 0,
    salary = 150,
    hasLicense = false,
    candemote = false,
    category = "Security Staff",
	VWarLicenses = {
        ["riot"] = true,
    },
    VWarBodygroups = {
        [8] = 4, // headgear
    }, 
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VComputersDocument = "foundation/global_operations_database/manuals/security/7967450",
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 50 ) end,
    JobNickConfig = "Dpt. Chief",
})

/////////////////////////
// Red Right Hand Jobs //
////////////////////////

TEAM_MTF_A1_RRH_OPERATIVE = AddExtraTeam("MTF A-1 Red Right Hand - Operative", {
    color = Color(255,0,0),
    model = {
        "models/player/cheddar/alpha1/mtf_a1_soldier_1.mdl",
    },
    description = [[As an Operative you are now a very trusted member of the Foundation and must listen to all orders from Alpha-1 CO's and O5 commands. Make sure no harm comes to any O5 Council members that are under your protection. Finally serve the Foundation with your life.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_arx160", "vguns_m9", "weapon_cuff_elastic", "vwar_scp_interrogate"},
    command = "rrhop",
    max = 0,
    admin = 0,
    salary = 80,
    hasLicense = false,
    candemote = false,
    category = "MTF Alpha-1 - Red Right Hand",
    VWarBodygroups = {
        [2] = 1, // gloves
        [14] = 1, // shells left arm
        [15] = 1, // shells right arm
        [16] = 1, // shells thigh
        [17] = 1, // gasmask
        [18] = 1, // glasses
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    ERTPriorityAdd = mtfERTPriority,
    PassiveXP = COMBAT,
    VWarBattalion = "MTF Alpha-1",
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_MTF_A1_RRH_SPECIALIST = AddExtraTeam("MTF A-1 Red Right Hand - Specialist", {
    color = Color(255,0,0),
    model = {
        "models/player/cheddar/alpha1/mtf_a1_soldier_2.mdl",
    },
    description = [[As a Specialist you are now a very trusted member of the Foundation and must listen to all orders from Alpha-1 CO's and O5 commands. Make sure no harm comes to any O5 Council members that are under your protection. Finally serve the Foundation with your life.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vclipboard", "vguns_arx160", "vguns_m9", "weapon_cuff_elastic", "swep_smokenade", "m9k_m61_frag", "vwar_id_card_spy_team", "weapon_lordi_flashnade", "vwar_scp_interrogate", "weaponchecker"},
    command = "rrhspecialist",
    max = 4,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "MTF Alpha-1 - Red Right Hand",
    VWarBodygroups = {
        [7] = 1, // shells left arm
        [8] = 1, // shells right arm
        [9] = 1, // shells thigh
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    VWarBattalion = "MTF Alpha-1",
    VWarRank = corporalRank,
    ERTPriorityAdd = mtfERTPriority,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,

	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_MTF_A1_RRH_ENFORCEMENT = AddExtraTeam("MTF A-1 Red Right Hand - Enforcement", {
    color = Color(255,0,0),
    model = {
        "models/player/cheddar/alpha1/mtf_a1_soldier_3.mdl",
    },
    description = [[As Enforcement you are now a very trusted member of the Foundation and must listen to all orders from Alpha-1 CO's and O5 commands. Make sure no harm comes to any O5 Council members that are under your protection. Finally serve the Foundation with your life.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_para", "vguns_nova", "vguns_m9", "weapon_cuff_elastic", "deployable_shield", "vwar_scp_interrogate"},
    command = "rrhenforcement",
    max = 2,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "MTF Alpha-1 - Red Right Hand",
    VWarBodygroups = {
        [10] = 2, // helmet
        [14] = 1, // gasmask
        [11] = 1, // shells left arm
        [12] = 1, // shells right arm
        [13] = 1, // shells thigh
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarLicenses = {
        ["heavy_weapons"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    VWarBattalion = "MTF Alpha-1",
    VWarRank = comsergeantRank,
    ERTPriorityAdd = mtfERTPriority,
    VWarSCPZombieType = mtfZombieType,
	VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,

	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_MTF_A1_RRH_CO = AddExtraTeam("MTF A-1 Red Right Hand - Officer", {
    color = Color(255,0,0),
    model = {
        "models/player/cheddar/alpha1/mtf_a1_soldier_1.mdl",
    },
    description = [[As an Alpha-1 CO it means you are extremely trusted and have proven your loyalty and that you are willing to give your life for the O5 and Foundation. Your tasks are to keep the E-11 in check and make sure they are doing their jobs correctly - taking reports from their commander at appropriate times (If you are asked to by a commander or O5 Council member). Protect the O5 with your lives and continue to serve the Foundation and O5 with upmost loyalty. 
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_arx160", "vguns_ksg", "vguns_m9", "weapon_cuff_elastic", "vclipboard", "vwar_scp_interrogate"},
    command = "rrhco",
    max = 4,
    admin = 0,
    salary = 150,
    hasLicense = false,
    candemote = false,
    category = "MTF Alpha-1 - Red Right Hand",
    VWarBodygroups = {
        [13] = 3, // beret
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    VWarBattalion = "MTF Alpha-1",
    VWarRank = officerRank,
    ERTPriorityAdd = mtfERTPriority,
    VWarSCPZombieType = mtfZombieType,
	VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,

	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_MTF_A1_RRH_COMMANDER = AddExtraTeam("MTF A-1 Red Right Hand - Commander", {
    color = Color(255,0,0),
    model = {
        "models/player/cheddar/alpha1/mtf_a1_soldier_4.mdl",
    },
    description = [[As Commander of the Alpha-1 "Red Right Hand" Mobile Task Force, you are now the most trusted MTF unit in the facility. You have the O5's upmost respect and trust and you should be able to prove that they are right. Your job is to listen to O5 orders. You must measure that no threat or harm whatsoever comes to any O5 council member (this also means laying down your own life if need be). You also have to be able to lead and control the Alpha-1 CO's and Agents correctly and make sure that they DO NOT break loyalty or defect. Finally continue to demonstrate your highest amount of trust and loyalty to the Foundation.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_arx160", "vguns_mk8", "vguns_m9", "deployable_shield", "weapon_cuff_elastic", "vclipboard", "vwar_scp_interrogate"},
    command = "rrhcommander",
    max = 2,
    admin = 0,
    salary = 200,
    hasLicense = false,
    candemote = false,
    category = "MTF Alpha-1 - Red Right Hand",
    VWarBodygroups = {
        [6] = 3, // beret
        [10] = 1, // gasmask
    }, 
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    VWarBattalion = "MTF Alpha-1",
    VWarRank = commanderRank,
    ERTPriorityAdd = mtfERTPriority,
    VWarSCPZombieType = mtfZombieType,
	VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,

	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

/////////////////////////
// Nine Tail Fox Jobs //
////////////////////////
 
TEAM_MTF_E11_NTF_OPERATIVE = AddExtraTeam("MTF E-11 Nine Tailed Fox - Operative", {
    color = Color(0,128,255),
    model = {
        "models/mtf/epsilon11_pm.mdl",
    },
    description = [[Epsilon-11 Operatives follow the commissioned officers of Epsilon-11 and follow the chain of command. MTF Epsilon-11 Operatives assist in the handling of the containment of SCPs as well with the restoration of critical sites within a facility. When not managing containment  MTF E-11 Operatives will assist in the handling of internal security for the Foundation.
 
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "dradio", "vguns_ebr14", "vguns_m9"},
    command = "ntfop",
    max = 0,
    admin = 0,
    salary = 80,
    hasLicense = false,
    candemote = false,
    category = "MTF Epsilon-11 - Nine Tailed Fox",
    VWarBodygroups = {
        [2] = 1, // Gasmask
        [4] = 0, // Helmet
        [8] = 1, // Shells
        [9] = 1, // Leftbellypouch
        [10] = 0, // Belt
        [11] = 1, // Frontbellypouch
		[12] = 1, // Rightsidepouch
		[13] = 1, // Leftsidepouch
		[14] = 0, // Radio
		[15] = 0, // Backpouch
		[16] = 0, // Smoke
		[17] = 0, // Holster
		[18] = 1, // Frontpouch
		[19] = 0, // Backarmor
		[20] = 1, // Plate
 
 
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Epsilon-11",
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
 
    PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})
 
TEAM_MTF_E11_NTF_SPECIALIST = AddExtraTeam("MTF E-11 Nine Tailed Fox - Containment Specialist", {
    color = Color(0,128,255),
    model = {
        "models/mtf/epsilon11_pm.mdl",
    },
    description = [[Epsilon-11 Containment Specialists excel in combat, containment, and security matters.  Specialists are equipped with more utility such as recontainment beams and SCP restraints.
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "dradio", "vguns_karma45", "vguns_m9", "vwar_scp_anomaly_containment_beam", "weapon_cuff_scp"},
    command = "ntfspecialist",
    max = 3,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "MTF Epsilon-11 - Nine Tailed Fox",
    VWarBodygroups = {
        [2] = 1, // Gasmask
        [4] = 0, // Helmet
        [8] = 1, // Shells
        [9] = 0, // Leftbellypouch
        [10] = 0, // Belt
        [11] = 0, // Frontbellypouch
		[12] = 1, // Rightsidepouch
		[13] = 0, // Leftsidepouch
		[14] = 0, // Radio
		[15] = 0, // Backpouch
		[16] = 0, // Smoke
		[17] = 0, // Holster
		[18] = 1, // Frontpouch
		[19] = 0, // Backarmor
		[20] = 0, // Plate
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Epsilon-11",
    VWarRank = lancecorporalRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
 
    PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})
 
TEAM_MTF_E11_NTF_BIOHAZARD_SPECIALIST = AddExtraTeam("MTF E-11 Nine Tailed Fox - Biohazard Specialist", {
    color = Color(0,128,255),
    model = "models/cod_aw_hazmat_player.mdl",
    description = [[Epsilon-11 Specialists excel in combat, containment, and security matters.
Biohazard Specialists are trained and equipped to engage with dangerous substances, toxins and viruses, such as SCP-008.
Their special equipment protects them from the effects of various airborn hazards.]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "dradio", "vguns_karma45", "vguns_m9"},
    command = "ntfbhspecialist",
    max = 2,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "MTF Epsilon-11 - Nine Tailed Fox",
    VWarBodygroups = {
        [1] = 1, // Helmet
        [2] = 0, // Shoulder
        [3] = 1, // Vest
        [6] = 0, // Grenade
        [11] = 1, // Radio
        [13] = 1, // Radiopack
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Epsilon-11",
    VWarRank = lancecorporalRank,
    VWarGasMask = 2,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
 
    PlayerLoadout = function( ply ) return ply:SetArmor( 50 ) end,
})
 
TEAM_MTF_E11_NTF_BREACHER = AddExtraTeam("MTF E-11 Nine Tailed Fox - Breacher", {
    color = Color(0,128,255),
    model = {
        "models/mtf/epsilon11_pm.mdl",
    },
    description = [[Epsilon-11 Breachers are the close quarters of MTF E-11, Breachers excel in raiding hostile bases, as well as assisting in recapturing foundation territory. When breachers are not in active raids, Breachers will assist in the handling of SCP containment, when not handling containment of raiding matters.
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "dradio", "vguns_para", "deployable_shield", "vguns_ksg", "vguns_m9"},
    command = "ntfbreacher",
    max = 2,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "MTF Epsilon-11 - Nine Tailed Fox",
    VWarBodygroups = {
        [2] = 0, // Gasmask
        [4] = 0, // Helmet
        [8] = 0, // Shells
        [9] = 0, // Leftbellypouch
        [10] = 0, // Belt
        [11] = 0, // Frontbellypouch
		[12] = 1, // Rightsidepouch
		[13] = 0, // Leftsidepouch
		[14] = 0, // Radio
		[15] = 0, // Backpouch
		[16] = 0, // Smoke
		[17] = 0, // Holster
		[18] = 0, // Frontpouch
		[19] = 0, // Backarmor
		[20] = 0, // Plate
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarLicenses = {
        ["heavy_weapons"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Epsilon-11",
    VWarRank = comsergeantRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
 
    PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})
 
TEAM_MTF_E11_NTF_CO = AddExtraTeam("MTF E-11 Nine Tailed Fox - Officer", {
    color = Color(0,128,255),
    model = {
        "models/mtf/epsilon11_pm.mdl",
    },
    description = [[Epsilon-11 Commissioned Officers are in charge of the management of NCOs as well as the overseeing of operations and tasks. Officers will assist in the field as well as manage internal security within the foundation. Officers hold the responsibility of recruitment to disciplinary actions. 
 
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_ebr14", "vguns_m9", "vclipboard", "vwar_scp_interrogate"},
    command = "ntfco",
    max = 4,
    admin = 0,
    salary = 150,
    hasLicense = false,
    candemote = false,
    category = "MTF Epsilon-11 - Nine Tailed Fox",
    VWarBodygroups = {
        [2] = 1, // Gasmask
        [4] = 1, // Helmet
        [8] = 1, // Shells
        [9] = 0, // Leftbellypouch
        [10] = 0, // Belt
        [11] = 0, // Frontbellypouch
		[12] = 1, // Rightsidepouch
		[13] = 0, // Leftsidepouch
		[14] = 0, // Radio
		[15] = 0, // Backpouch
		[16] = 0, // Smoke
		[17] = 0, // Holster
		[18] = 1, // Frontpouch
		[19] = 0, // Backarmor
		[20] = 0, // Plate
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    VWarBattalion = "MTF Epsilon-11",
    VWarRank = officerRank,
    ERTPriorityAdd = mtfERTPriority,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
 
    PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})
 
TEAM_MTF_E11_NTF_COMMANDER = AddExtraTeam("MTF E-11 Nine Tailed Fox - Commander", {
    color = Color(0,128,255),
    model = {
        "models/mtf/epsilon11_pm.mdl",
    },
    description = [[Commander of the MTF E-11, the top of the chain of command of the task force Epsilon-11. Epsilon-11’s commander will oversee operations and manage the task force, deal and manage recruitment matters, handle internal matters, and handle disciplinary actions, assign and give orders, and deal with matters that commissioned officers cannot accomplish.
 
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_ebr14", "vguns_mk8", "deployable_shield", "weapon_cuff_elastic", "vguns_m9", "vclipboard", "vwar_scp_interrogate"},
    command = "ntfcommander",
    max = 2,
    admin = 0,
    salary = 200,
    hasLicense = false,
    candemote = false,
    category = "MTF Epsilon-11 - Nine Tailed Fox",
     VWarBodygroups = {
        [2] = 0, // Gasmask
        [4] = 1, // Helmet
        [8] = 0, // Shells
        [9] = 0, // Leftbellypouch
        [10] = 0, // Belt
        [11] = 0, // Frontbellypouch
		[12] = 1, // Rightsidepouch
		[13] = 0, // Leftsidepouch
		[14] = 0, // Radio
		[15] = 0, // Backpouch
		[16] = 0, // Smoke
		[17] = 0, // Holster
		[18] = 1, // Frontpouch
		[19] = 0, // Backarmor
		[20] = 0, // Plate
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Epsilon-11",
    VWarRank = commanderRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
 
    PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

/////////////////////////
// Laws left hand Jobs //
////////////////////////
 
TEAM_MTF_O1_LLH_OPERATIVE = AddExtraTeam("MTF O-1 Law's Left Hand - Operative", {
    color = Color(127,0,255),
    model = {
        "models/cheddar/omega1/omega1_soldier1.mdl",
    },
    description = [[Omega-1 Operatives follow their commanding officers orders and answer to the Ethics Committee. When not doing work for the Ethics Committee, the operatives of Omega-1 have the same protocol as other MTF squadrons by upholding security protocols and defending the facility. Omega-1 operatives have a primary goal and that is to protect the Ethics Committee and do only as the Ethics Committee asks of them.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_g36c", "vguns_m9", "weapon_cuff_elastic", "vwar_scp_interrogate"},
    command = "llhoperative",
    max = 0,
    admin = 0,
    salary = 80,
    hasLicense = false,
    candemote = false,
    category = "MTF Omega-1 - Law's Left Hand",
    VWarBodygroups = {
        [1] = 1, // balaclava
        [2] = 1, // backpack
        [3] = 1, // radio
        [9] = 1, // front chest gear
        [10] = 1, // front belly pouches
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Omega-1",
    VWarSCPZombieType = mtfZombieType,
	VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
 
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})
 
 
TEAM_MTF_O1_LLH_SPECIALIST = AddExtraTeam("MTF O-1 Law's Left Hand - Specialist", {
    color = Color(127,0,255),
    model = {
        "models/cheddar/omega1/omega1_soldier2.mdl",
    },
    description = [[Omega-1 Specialists are built for utility and they normally would work alongside enforcers to maximize their performance. They carry standard issue Omega-1 weapons but are kitted out with more utility such as grenades.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vclipboard", "vguns_g36c", "vguns_m9", "weapon_cuff_elastic", "swep_smokenade", "m9k_m61_frag", "weapon_lordi_flashnade", "vwar_id_card_spy_team", "vwar_scp_interrogate", "weaponchecker"},
    command = "llhspecialist",
    max = 4,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "MTF Omega-1 - Law's Left Hand",
    VWarBodygroups = {
        [1] = 1, // balaclava
        [13] = 3, // headgear
        [14] = 2, // headgear2
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Omega-1",
    VWarRank = corporalRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
 
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})
 
TEAM_MTF_O1_LLH_ENFORCEMENT = AddExtraTeam("MTF O-1 Law's Left Hand - Enforcement", {
    color = Color(127,0,255),
    model = {
        "models/cheddar/omega1/omega1_soldier3.mdl",
    },
    description = [[Omega-1 Enforcement agents are the brunt of Omega-1’s specialist force used for defending priority targets against dangerous threats as well as helping in certain offence situations. Omega-1 enforcement agents carry more equipment than the standard operative to help them get the job done.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_para", "vguns_nova", "vguns_m9", "weapon_cuff_elastic", "deployable_shield", "vwar_scp_interrogate"},
    command = "llhenforcement",
    max = 2,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "MTF Omega-1 - Law's Left Hand",
    VWarBodygroups = {
        [1] = 1, // balaclava
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarLicenses = {
        ["heavy_weapons"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Omega-1",
    VWarRank = comsergeantRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
 
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})
 
TEAM_MTF_O1_LLH_CO = AddExtraTeam("MTF O-1 Law's Left Hand - Officer", {
    color = Color(127,0,255),
    model = {
        "models/cheddar/omega1/omega1_soldier4.mdl",
    },
    description = [[Omega-1 Commissioned Officers are in charge of overseeing all operations and leading the task force. They are highly trained and intelligent so that they can work logistics for the task force and pull off even the most difficult tasks with the best outcome. Commissioned officers have a lot of responsibility as they are in charge of sustaining all aspects of Omega-1 from recruitment to fieldwork and even disciplinary actions.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_sopmod", "vguns_cz75", "weapon_cuff_elastic", "swep_smokenade", "vclipboard", "vwar_scp_interrogate"},
    command = "llhco",
    max = 4,
    admin = 0,
    salary = 150,
    hasLicense = false,
    candemote = false,
    category = "MTF Omega-1 - Law's Left Hand",
    VWarBodygroups = {
        [1] = 1, // head
        [4] = 0, // headgear
        [5] = 1, // patches
        [6] = 0, // chestrig
        [7] = 0, // back right pouch
        [8] = 0, // chest gear left
        [9] = 0, // chest gear right
        [10] = 0, // left side gear
        [11] = 0, // front left pouch
        [12] = 0, // front pouches
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Omega-1",
    VWarRank = officerRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
 
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})
 
TEAM_MTF_O1_LLH_COMMANDER = AddExtraTeam("MTF O-1 Law's Left Hand - Commander", {
    color = Color(127,0,255),
    model = {
        "models/cheddar/omega1/omega1_soldier5.mdl",
    },
    description = [[Omega-1’s Commanding Officer is at the top of the chain of command in the task force. The commanding officer will oversee the day to day operations, implement new systems and tactics, deal with recruitment, mitigate tasks to commissioned officers and answer to the Ethics Committee. If the commissioned officers cannot deal with a problem then it's up to the commander to get the job done.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_sopmod", "vguns_nova", "vguns_cz75", "weapon_cuff_elastic", "swep_smokenade", "deployable_shield", "vclipboard", "vwar_scp_interrogate"},
    command = "llhcommander",
    max = 2,
    admin = 0,
    salary = 200,
    hasLicense = false,
    candemote = false,
    category = "MTF Omega-1 - Law's Left Hand",
    VWarBodygroups = {
        [1] = 1, // head
        [4] = 0, // headgear
        [5] = 1, // patches
        [6] = 0, // chestrig
        [7] = 0, // back right pouch
        [8] = 0, // chest gear left
        [9] = 0, // chest gear right
        [10] = 0, // left side gear
        [11] = 0, // front left pouch
        [12] = 0, // front pouches 
        [13] = 0, // aviator
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Omega-1",
    VWarRank = commanderRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
 
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

///////////////////////////
//   Hammer Down Jobs   //
//////////////////////////

TEAM_MTF_R21_IG_OPERATIVE = AddExtraTeam("MTF Nu-7 Hammer Down - Operative", {
    color = Color(64,64,64),
    model = {
        "models/ninja/mw3/delta/delta4_masked.mdl",
    },
    description = [[Nu-7 Hammerdown operatives are the most common units in the task force and act as basic frontline infantry. Operatives are equipped with standard military grade weapons and equipment to help them perform to the expected standard. Operatives follow orders given by their CO’s and carry out tasks that need to be done for the SCP foundation.
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "dradio", "vguns_gry_sbr", "vguns_mp443", "vwar_binoculars", "weapon_simrepair", "vwar_scp_repair_tool"},
    command = "igoperative",
    max = 0,
    admin = 0,
    salary = 80,
    hasLicense = false,
    candemote = false,
    category = "MTF Nu-7 - Hammer Down",
    VWarBodygroups = {
        [1] = 1, // Helmet
        [2] = 2, // Helmet NVG
        [3] = 3, // Sunglasses
        [4] = 0, // Gasmask
        [5] = 0, // Headset
        [6] = 4, // Gear
        [7] = 1, // Thigh L Gear
        [8] = 2, // Thigh R Gear
        [9] = 0, // Gloves
        [10] = 1, // Watch
        [11] = 0, // Arms
        [12] = 1, // Elbow pad
        [13] = 0, // UB aka Sleeves
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Nu-7",
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_MTF_R21_IG_MEDIC = AddExtraTeam("MTF Nu-7 Hammer Down - Medic", {
    color = Color(64,64,64),
    model = {
        "models/ninja/mw3/delta/delta4_masked.mdl",
    },
    description = [[Nu-7 Hammerdown specialists are equipped with standard issue operative weapons but carry significantly more offhand equipment such as smoke grenades, flashbangs and frag grenades. The specialists are made to be lightweight and maximise their performance as a supporting operative in Nu-7 Hammerdown.
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "dradio", "vguns_gry_sbr", "vguns_mp443", "vwar_first_aid_kit", "weapon_lordi_defib", "vwar_binoculars"},
    command = "igmedic",
    max = 4,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "MTF Nu-7 - Hammer Down",
    VWarBodygroups = {
        [1] = 1, // Helmet
        [2] = 2, // Helmet NVG
        [3] = 3, // Sunglasses
        [4] = 1, // Gasmask
        [5] = 0, // Headset
        [6] = 8, // Gear
        [7] = 4, // Thigh L Gear
        [8] = 0, // Thigh R Gear
        [9] = 0, // Gloves
        [10] = 0, // Watch
        [11] = 0, // Arms
        [12] = 0, // Elbow pad
        [13] = 1, // UB aka Sleeves
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarLicenses = {
        ["medical"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Nu-7",
    VWarRank = lancecorporalRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_MTF_R21_IG_SPECIALIST = AddExtraTeam("MTF Nu-7 Hammer Down - Specialist", {
    color = Color(64,64,64),
    model = {
        "models/ninja/mw3/delta/delta4_masked.mdl",
    },
    description = [[Nu-7 Hammerdown specialists are equipped with standard issue operative weapons but carry significantly more offhand equipment such as smoke grenades, flashbangs and frag grenades. The specialists are made to be lightweight and maximise their performance as a supporting operative in Nu-7 Hammerdown.
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "dradio", "vguns_lr300", "vguns_mp443", "swep_smokenade", "m9k_m61_frag", "weapon_lordi_flashnade", "vwar_binoculars", "weapon_simrepair", "vwar_scp_repair_tool", "vwar_scp_interrogate"},
    command = "igspecialst",
    max = 4,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "MTF Nu-7 - Hammer Down",
    VWarBodygroups = {
        [1] = 0, // Helmet
        [2] = 2, // Helmet NVG
        [3] = 2, // Sunglasses
        [4] = 1, // Gasmask
        [5] = 0, // Headset
        [6] = 3, // Gear
        [7] = 1, // Thigh L Gear
        [8] = 2, // Thigh R Gear
        [9] = 0, // Gloves
        [10] = 1, // Watch
        [11] = 0, // Arms
        [12] = 0, // Elbow pad
        [13] = 0, // UB aka Sleeves
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Nu-7",
    VWarRank = corporalRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_MTF_R21_IG_MARKSMAN = AddExtraTeam("MTF Nu-7 Hammer Down - Marksman", {
    color = Color(64,64,64),
    model = {
        "models/ninja/mw3/delta/delta4_masked.mdl",
    },
    description = [[Nu-7 Hammerdown marksmans are the first units to identify and have the ability to eliminate a threat from long distances. Hammerdown marksmans are equipped with military grade high caliber rifles to help them deal the damage needed over long distances.
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "dradio", "vguns_barret", "vguns_m4_9mm", "vguns_mp443", "vwar_binoculars"},
    command = "igmarksman",
    max = 2,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "MTF Nu-7 - Hammer Down",
    VWarBodygroups = {
        [1] = 0, // Helmet
        [2] = 2, // Helmet NVG
        [3] = 2, // Sunglasses
        [4] = 1, // Gasmask
        [5] = 0, // Headset
        [6] = 7, // Gear
        [7] = 1, // Thigh L Gear
        [8] = 1, // Thigh R Gear
        [9] = 0, // Gloves
        [10] = 0, // Watch
        [11] = 0, // Arms
        [12] = 1, // Elbow pad
        [13] = 1, // UB aka Sleeves
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarLicenses = {
        ["sniper"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Nu-7",
    VWarRank = comsergeantRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_MTF_R21_IG_AUTORIFLEMAN = AddExtraTeam("MTF Nu-7 Hammer Down - Autorifleman", {
    color = Color(64,64,64),
    model = {
        "models/ninja/mw3/delta/delta4_masked.mdl",
    },
    description = [[Nu-7 Hammerdown autoriflemen are the heavy hitting units of Hammerdown. They are equipped with a light machine gun for laying down suppressing fire and unleashing hundreds of rounds in a small space of time. Autoriflemen carry four times as much ammo than the standard operative and are tasked with making an impact on their target.
]],
    weapons = {"vkeycard_level_3", "vwar_scp_personnel_tablet", "dradio", "vguns_mk8", "vguns_spas", "vguns_mp443", "deployable_shield", "vwar_binoculars"},
    command = "igautorifleman",
    max = 2,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "MTF Nu-7 - Hammer Down",
    VWarBodygroups = {
        [1] = 0, // Helmet
        [2] = 2, // Helmet NVG
        [3] = 2, // Sunglasses
        [4] = 0, // Gasmask
        [5] = 0, // Headset
        [6] = 6, // Gear
        [7] = 3, // Thigh L Gear
        [8] = 2, // Thigh R Gear
        [9] = 0, // Gloves
        [10] = 1, // Watch
        [11] = 0, // Arms
        [12] = 0, // Elbow pad
        [13] = 0, // UB aka Sleeves
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarLicenses = {
        ["heavy_weapons"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Nu-7",
    VWarRank = comsergeantRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_MTF_R21_IG_CO = AddExtraTeam("MTF Nu-7 Hammer Down - Officer", {
    color = Color(64,64,64),
    model = {
        "models/ninja/mw3/delta/delta4_masked.mdl",
    },
    description = [[Nu-7 Hammerdown Commissioned Officers are in charge of overseeing all operations and leading the task force. They are highly trained and intelligent so that they can work logistics for the task force and pull off even the most difficult tasks with the best outcome. Commissioned officers have a lot of responsibility as they are in charge of sustaining all aspects of Nu-7 Hammerdown from recruitment to fieldwork and even disciplinary actions.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_sopmod", "vguns_m4_9mm", "vwar_binoculars", "vclipboard", "vwar_scp_interrogate", "weapon_simrepair", "vwar_scp_repair_tool", "weapon_cuff_elastic"},
    command = "igco",
    max = 4,
    admin = 0,
    salary = 150,
    hasLicense = false,
    candemote = false,
    category = "MTF Nu-7 - Hammer Down",
    VWarBodygroups = {
        [1] = 1, // Helmet
        [2] = 2, // Helmet NVG
        [3] = 3, // Sunglasses
        [4] = 1, // Gasmask
        [5] = 0, // Headset
        [6] = 0, // Gear
        [7] = 1, // Thigh L Gear
        [8] = 0, // Thigh R Gear
        [9] = 0, // Gloves
        [10] = 0, // Watch
        [11] = 0, // Arms
        [12] = 1, // Elbow pad
        [13] = 1, // UB aka Sleeves
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Nu-7",
    VWarRank = officerRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_MTF_R21_IG_COMMANDER = AddExtraTeam("MTF Nu-7 Hammer Down - Commander", {
    color = Color(64,64,64),
    model = {
        "models/ninja/mw3/delta/delta4_masked.mdl",
    },
    description = [[Nu-7's Commanding Officer is at the top of the chain of command in the task force. The commanding officer will oversee the day to day operations, implement new systems and tactics, deal with recruitment, mitigate tasks to commissioned officers and make sure the frontline of the SCP foundation is secure and well defended.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_sopmod", "vguns_mk8", "vguns_dsr", "weapon_cuff_elastic", "vguns_mp443", "vwar_binoculars", "vclipboard", "vwar_scp_interrogate", "deployable_shield", "weapon_simrepair", "vwar_scp_repair_tool"},
    command = "igcommander",
    max = 2,
    admin = 0,
    salary = 200,
    hasLicense = false,
    candemote = false,
    category = "MTF Nu-7 - Hammer Down",
    VWarBodygroups = {
        [1] = 0, // Helmet
        [2] = 2, // Helmet NVG
        [3] = 2, // Sunglasses
        [4] = 1, // Gasmask
        [5] = 0, // Headset
        [6] = 7, // Gear
        [7] = 1, // Thigh L Gear
        [8] = 2, // Thigh R Gear
        [9] = 0, // Gloves
        [10] = 1, // Watch
        [11] = 0, // Arms
        [12] = 1, // Elbow pad
        [13] = 0, // UB aka Sleeves
    },
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarTeam = "foundation",
    PassiveXP = COMBAT,
    ERTPriorityAdd = mtfERTPriority,
    VWarBattalion = "MTF Nu-7",
    VWarRank = commanderRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

////////////////////////
// Site Administrator //
///////////////////////

TEAM_DOEC = AddExtraTeam("Director of the Ethics Committee", {
    color = Color(0,0,0),
    model = {
        "models/player/Suits/male_07_open_waistcoat.mdl",
        "models/player/Suits/male_01_open_waistcoat.mdl",
        "models/player/Suits/male_02_open_waistcoat.mdl",
        "models/player/Suits/male_03_open_waistcoat.mdl",
        "models/player/Suits/male_04_open_waistcoat.mdl",
        "models/player/Suits/male_05_open_waistcoat.mdl",
        "models/player/Suits/male_06_open_waistcoat.mdl",
        "models/player/Suits/male_08_open_waistcoat.mdl",
        "models/player/Suits/male_09_open_waistcoat.mdl",
    },
    description = [[The Director of the Ethics Committee manages the secret decision-makers who work in the shadows of the Foundation. The Ethics Committee determine whether the actions of any staff member are necessary evils, or crimes against humanity; not even Overseers are immune from their watchful gaze.
]],
    weapons = {"vkeycard_level_5", "vwar_scp_personnel_tablet", "dradio", "vguns_m6s_ethics", "vclipboard", "vwar_id_card_spy_team"},
    command = "doec",
    max = 1,
    admin = 0,
    salary = 300,
    hasLicense = false,
    candemote = false,
    category = "Site Administration",
    VWarTeam = "foundation",
    PassiveXP = SUPPORT,
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarSkin = 4,
    VComputersPrinterCreditRefundTime = 60 * 5,
})

TEAM_ETHICS = AddExtraTeam("Ethics Committee Member", {
    color = Color(0,0,0),
    model = {
        "models/player/Suits/male_04_shirt_tie.mdl",
        "models/player/Suits/male_01_shirt_tie.mdl",
        "models/player/Suits/male_02_shirt_tie.mdl",
        "models/player/Suits/male_03_shirt_tie.mdl",
        "models/player/Suits/male_05_shirt_tie.mdl",
        "models/player/Suits/male_06_shirt_tie.mdl",
        "models/player/Suits/male_07_shirt_tie.mdl",
        "models/player/Suits/male_08_shirt_tie.mdl",
        "models/player/Suits/male_09_shirt_tie.mdl",
        "models/player/Suits/male_01_shirt.mdl",
        "models/player/Suits/male_02_shirt.mdl",
        "models/player/Suits/male_03_shirt.mdl",
        "models/player/Suits/male_04_shirt.mdl",
        "models/player/Suits/male_05_shirt.mdl",
        "models/player/Suits/male_06_shirt.mdl",
        "models/player/Suits/male_07_shirt.mdl",
        "models/player/Suits/male_08_shirt.mdl",
        "models/player/Suits/male_09_shirt.mdl",
    },
    description = [[Members of the Ethics Committee are the secret decision-makers who work in the shadows of the Foundation. The Ethics Committee determine whether the actions of any staff member are necessary evils, or crimes against humanity; not even Overseers are immune from their watchful gaze.
]],
    weapons = {"vkeycard_level_5", "vwar_scp_personnel_tablet", "vguns_m6s_ethics", "dradio", "vclipboard", "vwar_id_card_spy_team"},
    command = "ecm",
    max = 6,
    admin = 0,
    salary = 250,
    hasLicense = false,
    candemote = false,
    category = "Site Administration",
    VWarTeam = "foundation",
    PassiveXP = SUPPORT,
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VWarSkin = 8,
    VComputersPrinterCreditRefundTime = 60 * 5,
})

TEAM_SITE_DIRECTOR = AddExtraTeam("Site Director", {
    color = Color(128,0,0),
    model = {
        "models/player/Suits/male_09_open_tie.mdl",
        "models/player/Suits/male_01_open_tie.mdl",
        "models/player/Suits/male_02_open_tie.mdl",
        "models/player/Suits/male_03_open_tie.mdl",
        "models/player/Suits/male_04_open_tie.mdl",
        "models/player/Suits/male_05_open_tie.mdl",
        "models/player/Suits/male_06_open_tie.mdl",
        "models/player/Suits/male_07_open_tie.mdl",
        "models/player/Suits/male_08_open_tie.mdl",
    },
    description = [[The Site Director is responsible for the orderly functioning of all site operations, and is personally appointed by the O5 Council. The Site Director may issue orders (unless overriden by a Level 5 member of staff) to all departments and Mobile Task Forces, and receives regular reports from Directors and Commanders as to any issues that arise.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vclipboard"},
    command = "sitedirector",
    max = 1,
    admin = 0,
    salary = 200,
    hasLicense = false,
    candemote = false,
    category = "Site Administration",
    VWarTeam = "foundation",
    PassiveXP = SUPPORT,
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VComputersPrinterCreditRefundTime = 60 * 5,
    VWarSkin = 3,
    VWarCanApproveAll = true,
    JobNickConfig = "Site Director",
})

TEAM_SITE_ADVISOR = AddExtraTeam("Site Advisor", {
    color = Color(128,0,0),
    model = {
        "models/player/Suits/male_02_open_tie.mdl",
        "models/player/Suits/male_01_open_tie.mdl",
        "models/player/Suits/male_03_open_tie.mdl",
        "models/player/Suits/male_04_open_tie.mdl",
        "models/player/Suits/male_05_open_tie.mdl",
        "models/player/Suits/male_06_open_tie.mdl",
        "models/player/Suits/male_07_open_tie.mdl",
        "models/player/Suits/male_08_open_tie.mdl",
        "models/player/Suits/male_09_open_tie.mdl",
    },
    description = [[The Site Advisor assists the Site Director in ensuring the orderly functioning of all site operations, and is personally appointed by the O5 Council. The Site Advisor may issue orders (unless overriden by the Site Director or a Level 5 member of staff) to all departments and Mobile Task Forces, and receives regular reports from Directors and Commanders as to any issues that arise.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vclipboard"},
    command = "siteadvisor",
    max = 2,
    admin = 0,
    salary = 175,
    hasLicense = false,
    candemote = false,
    category = "Site Administration",
    VWarTeam = "foundation",
    PassiveXP = SUPPORT,
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VComputersPrinterCreditRefundTime = 60 * 10,
    VWarSkin = 13,
    VWarCanApproveAll = true,
    JobNickConfig = "Site Advisor",
})

TEAM_OVERSEER_ASSISTANT = AddExtraTeam("Overseer Assistant", {
    color = Color(176,176,176),
    model = {
        "models/player/Suits/male_02_open_tie.mdl",
        "models/player/Suits/male_01_open_tie.mdl",
        "models/player/Suits/male_03_open_tie.mdl",
        "models/player/Suits/male_04_open_tie.mdl",
        "models/player/Suits/male_05_open_tie.mdl",
        "models/player/Suits/male_06_open_tie.mdl",
        "models/player/Suits/male_07_open_tie.mdl",
        "models/player/Suits/male_08_open_tie.mdl",
        "models/player/Suits/male_09_open_tie.mdl",
    },
    description = [[The Overseer Assistants are the right-hand men of the O5 Council, who can enforce their orders around the site, even on Site Administration. In the absence of the O5 Council, the Overseer Assistants have equal authority to all other Level 4 members of staff, and can give orders to MTF A-1 when no Overseers are present.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vclipboard", "vguns_m1911", "weapon_r_handcuffs", "weapon_cuff_elastic", "vwar_id_card_spy_team"},
    command = "overseerassistant",
    max = 2,
    admin = 0,
    salary = 150,
    hasLicense = false,
    candemote = false,
    category = "Site Administration",
    VWarTeam = "foundation",
    PassiveXP = SUPPORT,
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VComputersPrinterCreditRefundTime = 60 * 10,
    VWarSkin = 5,
    JobNickConfig = "Assistant",
})

TEAM_ETHICS_ASSISTANT = AddExtraTeam("Ethics Committee Assistant", {
    color = Color(176,176,176),
    model = {
        "models/player/Suits/male_02_open_tie.mdl",
        "models/player/Suits/male_01_open_tie.mdl",
        "models/player/Suits/male_03_open_tie.mdl",
        "models/player/Suits/male_04_open_tie.mdl",
        "models/player/Suits/male_05_open_tie.mdl",
        "models/player/Suits/male_06_open_tie.mdl",
        "models/player/Suits/male_07_open_tie.mdl",
        "models/player/Suits/male_08_open_tie.mdl",
        "models/player/Suits/male_09_open_tie.mdl",
    },
    description = [[The Ethics Committee Assistants are the left-hand men of the Ethics Committee, who can enforce their orders around the site, even on Site Administration. In the absence of the Ethics Committee, the Ethics Committee Assistants have equal authority to all other Level 4 members of staff, and can give orders to MTF O-1 when no Ethics Committee members are present.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vclipboard", "vguns_m1911", "weapon_r_handcuffs", "weapon_cuff_elastic", "vwar_id_card_spy_team"},
    command = "ethicsassistant",
    max = 2,
    admin = 0,
    salary = 150,
    hasLicense = false,
    candemote = false,
    category = "Site Administration",
    VWarTeam = "foundation",
    PassiveXP = SUPPORT,
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VComputersPrinterCreditRefundTime = 60 * 10,
    VWarSkin = 6,
    JobNickConfig = "Assistant",
})

TEAM_DIRECTOR_OF_RESEARCH = AddExtraTeam("Director of Research", {
    color = Color(128,0,0),
    model = {
        "models/player/kerry/class_scientist_1.mdl",
        "models/player/kerry/class_scientist_2.mdl",
        "models/player/kerry/class_scientist_3.mdl",
        "models/player/kerry/class_scientist_4.mdl",
        "models/player/kerry/class_scientist_5.mdl",
        "models/player/kerry/class_scientist_6.mdl",
        "models/player/kerry/class_scientist_7.mdl",
    },
    description = [[The Director of Research oversees the entirety of the Department of Research, and is personally appointed by the O5 Council. They have the final say on what experiments may be run, unless overruled by a Level 5 member of staff.
]],
    weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "vclipboard", "dradio"},
    command = "dresearcher",
    max = 1,
    admin = 0,
    salary = 150,
    hasLicense = false,
    candemote = false,
    category = "Research Staff",
    VWarTeam = "foundation",
    PassiveXP = RESEARCH,
    VComputersPrinterCreditRefundTime = 60 * 5,
    VWarDeploymentSpots = {
        ["Facility Entrance"] = true,
    },
    VComputersPrinterCreditRefundTime = 60 * 5,
    JobNickConfig = "Dpt. Director",
})

////////////////////////////////////
// Department of Site Affairs    //
///////////////////////////////////

-- TEAM_IA_Director = AddExtraTeam("Director of Intelligence", {
    -- color = Color(128,0,0),
    -- model = {
        -- "models/player/Suits/male_03_open_tie.mdl",
        -- "models/player/Suits/male_01_open_tie.mdl",
        -- "models/player/Suits/male_02_open_tie.mdl",
        -- "models/player/Suits/male_04_open_tie.mdl",
        -- "models/player/Suits/male_05_open_tie.mdl",
        -- "models/player/Suits/male_06_open_tie.mdl",
        -- "models/player/Suits/male_07_open_tie.mdl",
        -- "models/player/Suits/male_08_open_tie.mdl",
        -- "models/player/Suits/male_09_open_tie.mdl",
    -- },
    -- description = [[The Director of Intelligence oversees the entirety of the Department of Intelligence, and is personally appointed by the Ethics Committee. They have the final say on what covert operations may be run, unless overruled by a Level 5 member of staff.
-- ]],
    -- weapons = {"vguns_sopmod", "vguns_p320", "dradio", "gmod_camera", "weapon_cuff_elastic", "weapon_r_handcuffs", "vkeycard_level_4", "vwar_scp_personnel_tablet", "vwar_binoculars", "vclipboard", "vwar_id_card_spy", "vwar_scp_interrogate", "weaponchecker"},
    -- command = "ia_director",
    -- max = 1,
    -- admin = 0,
    -- salary = 150,
    -- hasLicense = false,
    -- candemote = false,
    -- category = "Site Affairs",
    -- VWarTeam = "foundation",
    -- PassiveXP = SUPPORT,
    -- VWarDeploymentSpots = {
        -- ["Facility Entrance"] = true,
    -- },
    -- VWarSkin = 15,
    -- VComputersPrinterCreditRefundTime = 60 * 5,
    -- VComputersDocument = "foundation/global_operations_database/manuals/intelligence/7817487",
    -- JobNickConfig = "Dpt. Director",
-- })

-- TEAM_IA_Ambassador = AddExtraTeam("Intelligence Ambassador", {
    -- color = Color(128,0,0),
    -- model = {
        -- "models/player/cheddar/agent/agent_joe.mdl",
        -- "models/player/cheddar/agent/agent_vance.mdl",
        -- "models/player/cheddar/agent/agent_van.mdl",
        -- "models/player/cheddar/agent/agent_mike.mdl",
        -- "models/player/cheddar/agent/agent_sandro.mdl",
        -- "models/player/cheddar/agent/agent_eric.mdl",
        -- "models/player/cheddar/agent/agent_ted.mdl",
        -- "models/player/cheddar/agent/agent_art.mdl",
    -- },
    -- description = [[Intelligence Ambassadors are senior agents within the Department of Intelligence.
	
	-- The Department of Intelligence (DI) performs cover-up operations and misinformation campaigns in order to hide the presence of the SCP Foundation to unknowing civilians. The DI also performs covert operations on the surface to gather intel on groups of interest (GOIs), such as the Chaos Insurgency. They often work closely with MTF Nu-7 and Site Admin in order to execute these operations.
	
	-- All DI members are expected to read the DI manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to run operations being revoked.
-- ]],
    -- weapons = {"vguns_sopmod", "vguns_p320", "dradio", "gmod_camera", "weapon_cuff_elastic", "weapon_r_handcuffs", "vkeycard_level_4", "vwar_scp_personnel_tablet", "vclipboard", "vwar_binoculars", "vwar_id_card_spy", "vwar_scp_interrogate", "weaponchecker"},
    -- command = "ia_ambas",
    -- max = 3,
    -- admin = 0,
    -- salary = 100,
    -- hasLicense = false,
    -- candemote = false,
    -- category = "Site Affairs",
    -- VWarTeam = "foundation",
    -- PassiveXP = SUPPORT,
    -- VWarBodygroups = {
        -- [3] = 1, // Chest
        -- [4] = 1, // Hands
        -- [2] = 1, // Aviators
    -- },
    -- VWarDeploymentSpots = {
        -- ["Facility Entrance"] = true,
    -- },
    -- VWarSkin = 6,
    -- VComputersPrinterCreditRefundTime = 60 * 10,
    -- VComputersDocument = "foundation/global_operations_database/manuals/intelligence/7817487",
    -- JobNickConfig = "Ambassador",
-- })

-- TEAM_IA_Agent = AddExtraTeam("Intelligence Agent", {
    -- color = Color(128,0,0),
    -- model = {
        -- "models/player/cheddar/agent/agent_sandro.mdl",
        -- "models/player/cheddar/agent/agent_vance.mdl",
        -- "models/player/cheddar/agent/agent_van.mdl",
        -- "models/player/cheddar/agent/agent_mike.mdl",
        -- "models/player/cheddar/agent/agent_eric.mdl",
        -- "models/player/cheddar/agent/agent_ted.mdl",
        -- "models/player/cheddar/agent/agent_joe.mdl",
        -- "models/player/cheddar/agent/agent_art.mdl",
    -- },
    -- description = [[Intelligence Agents work within the Department of Intelligence.
	
	-- The Department of Intelligence (DI) performs cover-up operations and misinformation campaigns in order to hide the presence of the SCP Foundation to unknowing civilians. The DI also performs covert operations on the surface to gather intel on groups of interest (GOIs), such as the Chaos Insurgency. They often work closely with MTF Nu-7 and Site Admin in order to execute these operations.
	
	-- All DI members are expected to read the DI manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to run operations being revoked.
-- ]],
    -- weapons = {"vguns_gry_sbr", "vguns_p320", "dradio", "gmod_camera", "weapon_cuff_elastic", "weapon_r_handcuffs", "vkeycard_level_3", "vwar_scp_personnel_tablet", "vclipboard", "vwar_binoculars", "vwar_id_card_spy", "weaponchecker"},
    -- command = "ia_agent",
    -- max = 5,
    -- admin = 0,
    -- salary = 80,
    -- hasLicense = false,
    -- candemote = false,
    -- category = "Site Affairs",
    -- VWarTeam = "foundation",
    -- PassiveXP = SUPPORT,
    -- VWarDeploymentSpots = {
        -- ["Facility Entrance"] = true,
    -- },
	-- VWarAllLevel = 10,
	-- VWarAllLevelsExcept = {
		-- ["scp"] = true,
	-- },
    -- VWarSkin = 6,
    -- VComputersPrinterCreditRefundTime = 60 * 20,
    -- VComputersDocument = "foundation/global_operations_database/manuals/intelligence/7817487",
    -- JobNickConfig = "Agent",
-- })

-- TEAM_IA_Operative = AddExtraTeam("Intelligence Operative", {
    -- color = Color(128,0,0),
    -- model = {
        -- "models/player/cheddar/agent/agent_vance.mdl",
        -- "models/player/cheddar/agent/agent_van.mdl",
        -- "models/player/cheddar/agent/agent_mike.mdl",
        -- "models/player/cheddar/agent/agent_sandro.mdl",
        -- "models/player/cheddar/agent/agent_eric.mdl",
        -- "models/player/cheddar/agent/agent_ted.mdl",
        -- "models/player/cheddar/agent/agent_joe.mdl",
        -- "models/player/cheddar/agent/agent_art.mdl",
    -- },
    -- description = [[Intelligence Operatives are combat agents within the Department of Intelligence.
	
	-- The Department of Intelligence (DI) performs cover-up operations and misinformation campaigns in order to hide the presence of the SCP Foundation to unknowing civilians. The DI also performs covert operations on the surface to gather intel on groups of interest (GOIs), such as the Chaos Insurgency. They often work closely with MTF Nu-7 and Site Admin in order to execute these operations.
	
	-- All DI members are expected to read the DI manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to run operations being revoked.
-- ]],
    -- weapons = {"vguns_lr300", "vguns_p320", "dradio", "gmod_camera", "weapon_cuff_elastic", "weapon_r_handcuffs", "vkeycard_level_3", "vwar_scp_personnel_tablet", "vwar_binoculars", "vclipboard", "vwar_id_card_spy", "weaponchecker"},
    -- command = "ia_operative",
    -- max = 5,
    -- admin = 0,
    -- salary = 80,
    -- hasLicense = false,
    -- candemote = false,
    -- category = "Site Affairs",
    -- VWarTeam = "foundation",
    -- PassiveXP = SUPPORT,
    -- VWarBodygroups = {
        -- [5] = 0, // Ties
        -- [3] = 0, // Chest
        -- [4] = 1, // Hands
        -- [2] = 0, // Aviators
    -- },
    -- VWarDeploymentSpots = {
        -- ["Facility Entrance"] = true,
    -- },
	-- CustomCheckFailMsg = "You need to be at least Keter VIP to play this job!",
    -- customCheck = function(ply)
        -- return ply:AtLeastRanked("Keter VIP")
    -- end,
    -- VWarSkin = 6,
    -- VComputersPrinterCreditRefundTime = 60 * 20,
    -- VComputersDocument = "foundation/global_operations_database/manuals/intelligence/7817487",
    -- JobNickConfig = "Agent",
-- })

-- TEAM_DIA_Director = AddExtraTeam("Director of Internal Affairs", {
--     color = Color(128,0,0),
--     model = {
--         "models/player/Suits/male_05_open_tie.mdl",
--         "models/player/Suits/male_01_open_tie.mdl",
--         "models/player/Suits/male_02_open_tie.mdl",
--         "models/player/Suits/male_03_open_tie.mdl",
--         "models/player/Suits/male_04_open_tie.mdl",
--         "models/player/Suits/male_06_open_tie.mdl",
--         "models/player/Suits/male_07_open_tie.mdl",
--         "models/player/Suits/male_08_open_tie.mdl",
--         "models/player/Suits/male_09_open_tie.mdl",
--     },
--     description = [[The Director of Internal Affairs oversees the entirety of the Department of Internal Affairs, and is personally appointed by the Ethics Committee. They have the final say on what investigations may be run, unless overruled by a Level 5 member of staff.
-- ]],
--     weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_silverghost", "vguns_p90", "weapon_cuff_elastic", "weapon_r_handcuffs", "gmod_camera", "vclipboard", "vwar_id_card_spy_team", "vwar_scp_interrogate", "weaponchecker"},
--     command = "dia_director",
--     max = 1,
--     admin = 0,
--     salary = 150,
--     hasLicense = false,
--     candemote = false,
--     category = "Site Affairs",
--     VWarTeam = "foundation",
--     PassiveXP = SUPPORT,
--     VWarHelmetCam = true,
--     VWarHelmetCamClearance = 3,
--     VWarDeploymentSpots = {
--         ["Facility Entrance"] = true,
--     },
--     VWarSkin = 9,
--     VComputersPrinterCreditRefundTime = 60 * 5,
--     VComputersDocument = "foundation/global_operations_database/manuals/internal_affairs/7189927",
--     JobNickConfig = "Dpt. Director",
-- })

-- TEAM_DIA_AMBASS = AddExtraTeam("Internal Affairs Ambassador", {
--     color = Color(128,0,0),
--     model = {
--         "models/player/Suits/male_05_shirt_tie.mdl",
--         "models/player/Suits/male_01_shirt_tie.mdl",
--         "models/player/Suits/male_02_shirt_tie.mdl",
--         "models/player/Suits/male_03_shirt_tie.mdl",
--         "models/player/Suits/male_04_shirt_tie.mdl",
--         "models/player/Suits/male_06_shirt_tie.mdl",
--         "models/player/Suits/male_07_shirt_tie.mdl",
--         "models/player/Suits/male_08_shirt_tie.mdl",
--         "models/player/Suits/male_09_shirt_tie.mdl",
--     },
--     description = [[Internal Affairs Ambassadors are senior agents within the Department of Internal Affairs.

-- The Department of Internal Affairs (DIA) maintains the integrity of the Foundation. They perform internal investigations (either covert or public) in order to uncover corruption, breach of protocol, and other violations. They may perform investigations on behalf of the Overseer Council or the Ethics Committee.

-- All DIA members are expected to read the DIA manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to run operations being revoked.
-- ]],
--     weapons = {"vkeycard_level_4", "vwar_scp_personnel_tablet", "dradio", "vguns_silverghost", "vguns_p90", "weapon_cuff_elastic", "weapon_r_handcuffs", "gmod_camera", "vclipboard", "vwar_id_card_spy_team", "vwar_scp_interrogate", "weaponchecker"},
--     command = "dia_ambas",
--     max = 3,
--     admin = 0,
--     salary = 100,
--     hasLicense = false,
--     candemote = false,
--     category = "Site Affairs",
--     VWarTeam = "foundation",
--     PassiveXP = SUPPORT,
--     VWarHelmetCam = true,
--     VWarHelmetCamClearance = 3,
--     VWarDeploymentSpots = {
--         ["Facility Entrance"] = true,
--     },
--     VWarSkin = 1,
--     VComputersPrinterCreditRefundTime = 60 * 10,
--     VComputersDocument = "foundation/global_operations_database/manuals/internal_affairs/7189927",
--     JobNickConfig = "Ambassador",
-- })

-- TEAM_DIA_AGENT = AddExtraTeam("Internal Affairs Agent", {
--     color = Color(128,0,0),
--     model = {
--         "models/player/Suits/male_08_shirt_tie.mdl",
--         "models/player/Suits/male_01_shirt_tie.mdl",
--         "models/player/Suits/male_02_shirt_tie.mdl",
--         "models/player/Suits/male_03_shirt_tie.mdl",
--         "models/player/Suits/male_04_shirt_tie.mdl",
--         "models/player/Suits/male_05_shirt_tie.mdl",
--         "models/player/Suits/male_06_shirt_tie.mdl",
--         "models/player/Suits/male_07_shirt_tie.mdl",
--         "models/player/Suits/male_09_shirt_tie.mdl",
--     },
--     description = [[Internal Affairs Agents work within the Department of Internal Affairs.

-- The Department of Internal Affairs (DIA) maintains the integrity of the Foundation. They perform internal investigations (either covert or public) in order to uncover corruption, breach of protocol, and other violations. They may perform investigations on behalf of the Overseer Council or the Ethics Committee.

-- All DIA members are expected to read the DIA manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to run operations being revoked.
-- ]],
--     weapons = {"vguns_silverghost", "vguns_p90", "dradio", "gmod_camera", "weapon_cuff_elastic", "weapon_r_handcuffs", "vkeycard_level_3", "vwar_scp_personnel_tablet", "vclipboard", "vwar_id_card_spy_team", "weaponchecker"},
--     command = "dia_agent",
--     max = 5,
--     admin = 0,
--     salary = 80,
--     hasLicense = false,
--     candemote = false,
--     category = "Site Affairs",
--     VWarTeam = "foundation",
--     PassiveXP = SUPPORT,
--     VWarHelmetCam = true,
--     VWarHelmetCamClearance = 3,
--     VWarDeploymentSpots = {
--         ["Facility Entrance"] = true,
--     },
-- 	VWarAllLevel = 10,
-- 	VWarAllLevelsExcept = {
-- 		["scp"] = true,
-- 	},
--     VWarSkin = 1,
--     VComputersPrinterCreditRefundTime = 60 * 20,
--     VComputersDocument = "foundation/global_operations_database/manuals/internal_affairs/7189927",
--     JobNickConfig = "Agent",
-- })

-- TEAM_DIA_OPERATIVE = AddExtraTeam("Internal Affairs Operative", {
--     color = Color(128,0,0),
--     model = {
--         "models/player/Suits/male_08_shirt_tie.mdl",
--         "models/player/Suits/male_01_shirt_tie.mdl",
--         "models/player/Suits/male_02_shirt_tie.mdl",
--         "models/player/Suits/male_03_shirt_tie.mdl",
--         "models/player/Suits/male_04_shirt_tie.mdl",
--         "models/player/Suits/male_05_shirt_tie.mdl",
--         "models/player/Suits/male_06_shirt_tie.mdl",
--         "models/player/Suits/male_07_shirt_tie.mdl",
--         "models/player/Suits/male_09_shirt_tie.mdl",
--     },
--     description = [[Internal Affairs Agents are combat agents within the Department of Internal Affairs.

-- The Department of Internal Affairs (DIA) maintains the integrity of the Foundation. They perform internal investigations (either covert or public) in order to uncover corruption, breach of protocol, and other violations. They may perform investigations on behalf of the Overseer Council or the Ethics Committee.

-- All DIA members are expected to read the DIA manuals located in the SCiPNET computer system. Failure to follow these manuals may result in your ability to run operations being revoked.
-- ]],
--     weapons = {"vguns_mpx", "vguns_silverghost", "dradio", "gmod_camera", "weapon_cuff_elastic", "weapon_r_handcuffs", "vkeycard_level_3", "vwar_scp_personnel_tablet", "vclipboard", "vwar_id_card_spy_team", "weaponchecker"},
--     command = "dia_operative",
--     max = 5,
--     admin = 0,
--     salary = 80,
--     hasLicense = false,
--     candemote = false,
--     category = "Site Affairs",
--     VWarTeam = "foundation",
--     PassiveXP = SUPPORT,
--     VWarHelmetCam = true,
--     VWarHelmetCamClearance = 3,
--     VWarDeploymentSpots = {
--         ["Facility Entrance"] = true,
--     },
-- 	CustomCheckFailMsg = "You need to be at least Keter VIP to play this job!",
--     customCheck = function(ply)
--         return ply:AtLeastRanked("Keter VIP")
--     end,
--     VWarSkin = 1,
--     VComputersPrinterCreditRefundTime = 60 * 20,
--     VComputersDocument = "foundation/global_operations_database/manuals/internal_affairs/7189927",
--     JobNickConfig = "Agent",
-- })

///////////////////
// Surface Zone //
//////////////////

TEAM_CIVILIAN = AddExtraTeam("Citizen", {
    color = Color(0,255,0),
    model = {
        "models/drem/cch/male_01.mdl",
        "models/drem/cch/male_02.mdl",
        "models/drem/cch/male_03.mdl",
        "models/drem/cch/male_04.mdl",
        "models/drem/cch/male_05.mdl",
        "models/drem/cch/male_06.mdl",
        "models/drem/cch/male_07.mdl",
        "models/drem/cch/male_08.mdl",
        "models/drem/cch/male_09.mdl",
        "models/drem/cch/female_01.mdl",
        "models/drem/cch/female_02.mdl",
        "models/drem/cch/female_03.mdl",
        "models/drem/cch/female_04.mdl",
        "models/drem/cch/female_06.mdl",
        "models/drem/cch/female_07.mdl",
    },
    description = [[You are an average citizen, living blissfully unaware of the horrors taking place in the facility located below your feet.
]],
    weapons = {},
    command = "citizen",
    max = 0,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Surface Zone",
    VWarTeam = "civilians",
})

TEAM_CHEF = AddExtraTeam("Chef", {
    color = Color(255, 180, 100, 255),
    model = {
        "models/fearless/chef1.mdl",
        "models/fearless/chef2.mdl",
    },
    description = [[You cook and provide food for the people living on the surface.]],
    weapons = {},
    command = "chef",
    max = 0,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Surface Zone",
    VWarTeam = "civilians",
    VWarTotalLevel = 1,
    PassiveXP = SUPPORT,
    JobNickConfig = "Chef",
})

TEAM_MEDIC = AddExtraTeam("Medic", {
    color = Color(255, 180, 100, 255),
    model = {
        "models/player/kerry/medic/medic_01.mdl",
        "models/player/kerry/medic/medic_01_f.mdl",
        "models/player/kerry/medic/medic_02.mdl",
        "models/player/kerry/medic/medic_02_f.mdl",
        "models/player/kerry/medic/medic_03.mdl",
        "models/player/kerry/medic/medic_03_f.mdl",
        "models/player/kerry/medic/medic_04.mdl",
        "models/player/kerry/medic/medic_04_f.mdl",
        "models/player/kerry/medic/medic_05.mdl",
        "models/player/kerry/medic/medic_05_f.mdl",
        "models/player/kerry/medic/medic_06.mdl",
        "models/player/kerry/medic/medic_06_f.mdl",
        "models/player/kerry/medic/medic_07.mdl",
    },
    description = [[Tend to the medical needs of citizens.]],
    weapons = {"vwar_first_aid_kit", "vwar_field_kit", "weapon_lordi_defib"},
    command = "medic",
    max = 0,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Surface Zone",
    VWarTeam = "civilians",
    PassiveXP = SUPPORT,
	VWarTotalLevel = 1,
    VWarSCPZombieType = medicZombieType,
})

TEAM_GUN = AddExtraTeam("Gun Dealer", {
    color = Color(200,100,0),
    model = {
        "models/drem/cch/male_01.mdl",
        "models/drem/cch/male_02.mdl",
        "models/drem/cch/male_03.mdl",
        "models/drem/cch/male_04.mdl",
        "models/drem/cch/male_05.mdl",
        "models/drem/cch/male_06.mdl",
        "models/drem/cch/male_07.mdl",
        "models/drem/cch/male_08.mdl",
        "models/drem/cch/male_09.mdl",
        "models/drem/cch/female_01.mdl",
        "models/drem/cch/female_02.mdl",
        "models/drem/cch/female_03.mdl",
        "models/drem/cch/female_04.mdl",
        "models/drem/cch/female_06.mdl",
        "models/drem/cch/female_07.mdl",
    },
    description = [[Gun dealers supply weapons for the citizen population above surface.]],
    weapons = {},
    command = "gun",
    max = 1,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Surface Zone",
    VWarTeam = "civilians",
    PassiveXP = SUPPORT,
    VWarTotalLevel = 5,
})

TEAM_HVYGUN = AddExtraTeam("Heavy Gun Dealer", {
    color = Color(200,100,0),
    model = {
        "models/drem/cch/male_01.mdl",
        "models/drem/cch/male_02.mdl",
        "models/drem/cch/male_03.mdl",
        "models/drem/cch/male_04.mdl",
        "models/drem/cch/male_05.mdl",
        "models/drem/cch/male_06.mdl",
        "models/drem/cch/male_07.mdl",
        "models/drem/cch/male_08.mdl",
        "models/drem/cch/male_09.mdl",
        "models/drem/cch/female_01.mdl",
        "models/drem/cch/female_02.mdl",
        "models/drem/cch/female_03.mdl",
        "models/drem/cch/female_04.mdl",
        "models/drem/cch/female_06.mdl",
        "models/drem/cch/female_07.mdl",
    },
    description = [[Heavy Gun dealers supply weapons for the citizen population above surface.]],
    weapons = {},
    command = "hvygun",
    max = 2,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Surface Zone",
    VWarTeam = "civilians",
    PassiveXP = SUPPORT,
    VWarTotalLevel = 10,
    customCheck = function(ply)
        return ply:AtLeastRanked("Keter VIP")
    end,
})

TEAM_CGITV = AddExtraTeam("CGITV", {
    color = Color(0,255,0),
    model = {
        "models/player/Group03/male_01.mdl",
        "models/player/Group03/male_02.mdl",
        "models/player/Group03/male_03.mdl",
        "models/player/Group03/male_04.mdl",
        "models/player/Group03/male_05.mdl",
        "models/player/Group03/male_06.mdl",
        "models/player/Group03/male_07.mdl",
        "models/player/Group03/male_08.mdl",
        "models/player/Group03/male_09.mdl",
    },
    description = [[Uncover the hidden truth that they don't want you to know, and expose it to the world!
]],
    weapons = {"gmod_camera", "vclipboard"},
    command = "cgitv",
    max = 2,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Surface Zone",
    VWarTeam = "civilians",
    PassiveXP = SUPPORT,
	VWarTotalLevel = 1,
})

TEAM_RANGER = AddExtraTeam("Ranger", {
    color = Color(204,204,0),
    model = {
        "models/player/icpd/cops/male_01_shortsleeved.mdl",
        "models/player/icpd/cops/male_02_shortsleeved.mdl",
        "models/player/icpd/cops/male_03_shortsleeved.mdl",
        "models/player/icpd/cops/male_04_shortsleeved.mdl",
        "models/player/icpd/cops/male_05_shortsleeved.mdl",
        "models/player/icpd/cops/male_06_shortsleeved.mdl",
        "models/player/icpd/cops/male_07_shortsleeved.mdl",
        "models/player/icpd/cops/male_08_shortsleeved.mdl",
        "models/player/icpd/cops/male_09_shortsleeved.mdl",
    },
    description = [[Your job is to ensure the saftey of all citizens who live on the surface. You live unaware of the existence of the SCP Foundation and its multiple Groups of Interest.
]],
    weapons = {"vguns_gepard", "dradio", "vguns_sw659", "weapon_r_handcuffs", "vclipboard"},
    command = "ranger",
    max = 5,
    admin = 0,
    salary = 40,
    hasLicense = false,
    candemote = false,
    category = "Surface Zone",
    VWarTeam = "civilians",
    PassiveXP = COMBAT,
	
	CustomCheckFailMsg = "You need to be at least Euclid VIP to play this job!",
    customCheck = function(ply)
        return ply:AtLeastRanked("Euclid VIP")
    end,
})

TEAM_MCD = AddExtraTeam("Marshall, Carter & Dark Salesman", {
    color = Color(25,25,25),
    model = "models/bala/chaosmerchant.mdl",
    description = [[Marshall, Carter & Dark Ltd. (MC&D) is a secretive and incredibly wealthy organization, consisting of roughly 100 individuals
The organization specialize in collecting rare and valuable anomalous objects, selling them off to the highest bidder for a profit.
MC&D claim one of their largest clients is the Chaos Insurgency, who often purchase anomalous objects for the purpose of weaponizing them.

While MC&D do not have good relations with the SCP Foundation, it is not unheard of for them to hand over certain anomalous objects if they are determined to be too unsafe.]],
    weapons = {"vguns_hailstorm", "vclipboard", "dradio"},
    command = "mcd",
    max = 3,
    admin = 0,
    salary = 250,
    hasLicense = false,
    candemote = false,
    category = "Surface Zone",
    VWarTeam = "civilians",
    PassiveXP = SUPPORT,
    PlayerLoadout = function(ply) return ply:SetArmor(250) end,

    CustomCheckFailMsg = "You need to be at least XK-Class VIP to play this job!",
    customCheck = function(ply)
        return ply:AtLeastRanked("XK-Class VIP")
    end,
})

//////////////////////
// Chaos Insurgency//
////////////////////

TEAM_CI_COMMANDER = AddExtraTeam("CI - Commander", {
    color = Color(0,102,0),
    model = {
        "models/player/chaos/insurgency/commander.mdl",
    },
    description = [[The ultimate commander of Chaos Insurgency Command. Oversee the Chaos Insurgency, obey The Engineer, and bring about the destruction of the SCP Foundation.
]],
    weapons = {"vguns_sopmod", "dradio", "vkeycard_level_5_chaos", "vwar_scp_personnel_tablet", "vguns_cz75b", "vguns_ksg", "vguns_para", "vwar_hacker", "vwar_id_card_spy_team", "vwar_first_aid_kit", "m9k_m61_frag", "swep_smokenade", "vclipboard", "vwar_scp_technician_tool", "vwar_scp_repair_tool", "vwar_scp_interrogate", "weapon_simrepair", "weaponchecker", "weapon_cuff_elastic"},
    command = "cideltacommander",
    max = 2,
    admin = 0,
    salary = 200,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = cicomRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	VComputersPrinterCreditRefundTime = 60 * 5,
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_CI_CO = AddExtraTeam("CI - Commanding Officer", {
    color = Color(0,102,0),
    model = {
        "models/player/chaos/insurgency/officer.mdl",
    },
    description = [[An experienced commanding officer within Chaos Insurgency Command, commanding units to bring about the destruction of the SCP Foundation.
]],
    weapons = {"vguns_sopmod", "dradio", "vkeycard_level_4_chaos", "vwar_scp_personnel_tablet", "vguns_cz75b", "vguns_stac_aggressor", "vwar_hacker", "vwar_id_card_spy_team", "vwar_first_aid_kit", "vclipboard", "vwar_scp_technician_tool", "vwar_scp_repair_tool", "vwar_scp_interrogate", "weapon_simrepair", "weaponchecker", "weapon_cuff_elastic"},
    command = "cico",
    max = 3,
    admin = 0,
    salary = 175,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = brigcomRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	VComputersPrinterCreditRefundTime = 60 * 20,
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_CI_DELCOM = AddExtraTeam("CI - Officer", {
    color = Color(0,102,0),
    model = {
        "models/player/chaos/insurgency/officer.mdl",
    },
    description = [[A member of Delta Command, who assists in commanding units to bring about the destruction of the SCP Foundation.
]],
    weapons = {"vguns_sopmod", "dradio", "vkeycard_level_4_chaos", "vwar_scp_personnel_tablet", "vguns_cz75b", "vguns_scarh", "vwar_hacker", "vwar_id_card_spy_team", "vwar_first_aid_kit", "vclipboard", "vwar_scp_technician_tool", "vwar_scp_repair_tool", "vwar_scp_interrogate", "weapon_simrepair", "vwar_scp_repair_tool", "weaponchecker", "weapon_cuff_elastic"},
    command = "cidelcom",
    max = 3,
    admin = 0,
    salary = 150,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = delcomRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	VComputersPrinterCreditRefundTime = 60 * 40,
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_CI_DELOP = AddExtraTeam("CI - Delta Operative", {
    color = Color(0,102,0),
    model = {
        "models/player/chaos/insurgency/delta.mdl",
    },
    description = [[The most elite units within the Chaos Insurgency, these Delta Operatives will ensure smooth operations for the Insurgency and bring swift destruction SCP Foundation.
]],
    weapons = {"vguns_pkm", "dradio", "vkeycard_level_4_chaos", "vwar_scp_personnel_tablet", "vclipboard", "vguns_m1911", "deployable_shield", "weapon_lordi_flashnade", "swep_smokenade", "vwar_hacker", "weapon_cuff_elastic", "vwar_scp_interrogate"},
    command = "cideltaop",
    max = 2,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = deltaRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_CI_DEEP_COVER = AddExtraTeam("CI - Deep Cover", {
    color = Color(0,102,0),
    model = {
        "models/player/chaos/insurgency/deep_cover.mdl",
    },
    description = [[A covert operative within the Chaos Insurgency, who uses their specialized equipment to hide in plain sight and uncover the secrets of the SCP Foundation.
]],
    weapons = {"vguns_spectre", "dradio", "vkeycard_level_3_chaos", "vwar_scp_personnel_tablet", "vguns_m1911", "vwar_hacker", "vwar_id_card_spy", "vwar_scp_technician_tool"},
    command = "cicover",
    max = 2,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = alphaRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,

    CustomCheckFailMsg = "You need to be at least Thaumiel VIP to play this job!",
    customCheck = function(ply)
        return ply:AtLeastRanked("Thaumiel VIP")
    end,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_CI_JUGGERNAUT = AddExtraTeam("CI - Juggernaut", {
    color = Color(0,102,0),
    model = {
        "models/player/chaos/insurgency/ci_juggernaut.mdl",
    },
    description = [[A trained juggernaut within the Chaos Insurgency. They are heavily armored and dangerous, ready to spray down Foundation agents and take bullets for their cause.
]],
    weapons = {"vguns_rpk74m", "dradio", "vkeycard_level_3_chaos", "vwar_scp_personnel_tablet", "vguns_m1911", "m9k_m61_frag", "vwar_hacker"},
    command = "cideltajuggernaut",
    max = 1,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = alphaRank,
    PlayerLoadout = function(ply)
        ply:SetArmor(500)
        ply:SetHealth(500)
		ply:SetMaxHealth(500)
        ply:SetRunSpeed(140)
        ply:SetWalkSpeed(80)
    end,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,

    CustomCheckFailMsg = "You need to be at least XK-Class VIP to play this job!",
    customCheck = function(ply)
        return ply:AtLeastRanked("XK-Class VIP")
    end,
})

TEAM_CI_MARKSMAN = AddExtraTeam("CI - Marksman", {
    color = Color(0,102,0),
    model = {
        "models/player/chaos/insurgency/ci_marksman.mdl",
    },
    description = [[A trained sniper agent within the Chaos Insurgency, with keen eyes to pick off hostiles and scout out locations.
]],
    weapons = {"vguns_spectre", "dradio", "vkeycard_level_3_chaos", "vwar_scp_personnel_tablet", "vguns_orsis", "vguns_m1911", "swep_smokenade", "vwar_hacker", "vwar_binoculars"},
    command = "cideltamarksman",
    max = 2,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = gammaRank,
    VWarSCPZombieType = mtfZombieType,
    VWarLicenses = {
        ["sniper"] = true,
    },
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_CI_RND = AddExtraTeam("CI - Chemist", {
    color = Color(0,102,0),
    model = "models/player/chaos/insurgency/ci_rnd.mdl",
    description = [[A trained Biohazard Specialist within the Chaos Insurgency.
Biohazard Specialists are trained and equipped to engage with dangerous substances, toxins and viruses, such as SCP-008.
Their special equipment protects them from the effects of various airborn hazards.
]],
    weapons = {"vguns_spectre", "dradio", "vkeycard_level_3_chaos", "vwar_scp_personnel_tablet", "vguns_m1911", "vclipboard"},
    command = "cideltabiohazard",
    max = 2,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = alphaRank,
    VWarGasMask = 2, // 1 = Regular gas mask, 2 = complete protection
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,

    CustomCheckFailMsg = "You need to be at least Thaumiel VIP to play this job!",
    customCheck = function(ply)
        return ply:AtLeastRanked("Thaumiel VIP")
    end,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_CI_RESEARCH = AddExtraTeam("CI - R&D", {
    color = Color(0,102,0),
    model = "models/player/chaos/insurgency/ci_rnd.mdl",
    description = [[A trained researcher within the Chaos Insurgency.
Researchers are trained to handle various SCP's contained by CI Operatives.
]],
    weapons = {"dradio", "vkeycard_level_3_chaos", "vwar_scp_personnel_tablet", "vguns_m1911", "vclipboard", "vwar_scp_anomaly_containment_beam", "weapon_cuff_scp"},
    command = "ciresearch",
    max = 4,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = alphaRank,
    VWarGasMask = 2, // 1 = Regular gas mask, 2 = complete protection
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	VComputersPrinterCreditRefundTime = 60 * 20,

	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_CI_STRIKE = AddExtraTeam("CI - Strike Team", {
    color = Color(0,102,0),
    model = {
        "models/player/chaos/insurgency/strike_team.mdl",
    },
    description = [[A member of the elite strike team within the Chaos Insurgency, strike hard and fast to ensure the destruction of the SCP Foundation.
]],
    weapons = {"vguns_ak12", "dradio", "vkeycard_level_3_chaos", "vwar_scp_personnel_tablet", "swep_smokenade", "vguns_m1911", "vguns_ksg", "weapon_lordi_flashnade", "deployable_shield", "vwar_hacker"},
    command = "cideltastrike",
    max = 4,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = betaRank,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_CI_TECHNICAL_EXPERT = AddExtraTeam("CI - Technical Expert", {
    color = Color(0,102,0),
    model = {
		"models/player/chaos/insurgency/operative.mdl",
    },
    description = [[Technical Experts are experienced members of the Chaos Insurgency technical teams, with the ability to resolve both mechanical and IT issues.
]],
    weapons = {"vkeycard_level_2_chaos", "vwar_scp_personnel_tablet", "vwar_scp_technician_tool", "vwar_scp_repair_tool"},
    command = "citechnicalexpert",
    max = 5,
    admin = 0,
    salary = 60,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = SUPPORT,
	VWarRank = betaRank,
	VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	VWarBodygroups = {
        [2] = 1,
        [3] = 1,
        [4] = 1,
    },

	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_CI_MEDIC = AddExtraTeam("CI - Medic", {
    color = Color(0,102,0),
    model = {
        "models/player/chaos/insurgency/medic.mdl",
    },
    description = [[A medical operative of the Chaos Insurgency, who operates on wounded operatives and helps to ensure minimal casualties after engaging the Foundation.
]],
    weapons = {"vguns_r5", "dradio", "vkeycard_level_3_chaos", "vwar_scp_personnel_tablet", "vguns_m1911", "vwar_first_aid_kit", "weapon_lordi_defib", "vwar_hacker"},
    command = "cimedic",
    max = 3,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = betaRank,
    VWarSCPZombieType = mtfZombieType,
    VWarLicenses = {
        ["medical"] = true,
    },
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
    JobNickConfig = "Tech Expert",
})

TEAM_CI_OPERATIVE = AddExtraTeam("CI - Operative", {
    color = Color(0,102,0),
    model = {
        "models/player/chaos/insurgency/operative.mdl",
    },
    description = [[A newly accepted operative of the Chaos Insurgency, who wish to use SCPs as their tools in order to take down the SCP Foundation and exert their control over reality. They serve The Engineer, and their mortal enemy are The Thirteen Foundation Overseers.
]],
    weapons = {"vguns_r5", "dradio", "vkeycard_level_2_chaos", "vwar_scp_personnel_tablet", "vguns_m1911", "vwar_hacker", "weapon_simrepair", "vwar_scp_repair_tool"},
    command = "cioperative",
    max = 5,
    admin = 0,
    salary = 100,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarRank = alphaRank,
    VWarSCPZombieType = medicZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

TEAM_CI_RECRUIT = AddExtraTeam("CI - Recruit", {
    color = Color(0,102,0),
    model = {
        "models/player/chaos/insurgency/operative.mdl",
    },
    description = [[A recruit of the Chaos Insurgency, who wish to use SCPs as their tools in order to take down the SCP Foundation and exert their control over reality. They serve The Engineer, and their mortal enemy are The Thirteen Foundation Overseers.
]],
    weapons = {"dradio", "vguns_akm_trainee", "vkeycard_level_1_chaos", "vwar_scp_personnel_tablet", "vwar_hacker"},
    command = "cirecruit",
    max = 0,
    admin = 0,
    salary = 50,
    hasLicense = false,
    candemote = false,
    category = "The Chaos Insurgency",
    VWarTeam = "chaos",
    PassiveXP = COMBAT,
    VWarSCPZombieType = mtfZombieType,
    VWarHelmetCam = true,
    VWarHelmetCamClearance = 3,
	
	PlayerLoadout = function( ply ) return ply:SetArmor( 100 ) end,
})

-- AOD

/*TEAM_ADMINONDUTY = AddExtraTeam("Admin On Duty", {
	color = Color(0, 68, 156),
    model = {"models/player/combine_super_soldier.mdl"},
	description = [[Administrates the server.
		You do NOT have to cloak while noclipping but you can if you want.
		Do not interact with roleplay as admin on duty (speaking to people who are roleplaying)

		0 tolerance for swearing. Never swear on duty ever please!

		Don't interrupt another admin while they are on duty!

		Try not to physgun players too much when you are speaking to them, they dont like it.

		\\==//Don't ever get angry at players no matter what, always remain calm and professional and act as an affective Role Model for players.\\==//

		Always remember to make a good first impression for new players joining the server, look professional and be a role model!]],
	weapons = {"lockpick", "arrest_stick", "keypad_cracker", "unarrest_stick", "weaponchecker", "laserpointer", "weapon_keypadchecker", "vc_wrench", "vwar_first_aid_kit", "fire_stopper_grenade", "police_tablet"},
	command = "aod",
	max = 0,
	salary = 300,
	admin = 1,
	vote = false,
	hasLicense = false,
	candemote = true,
	category = "Admin",
    VWarSCPIgnore = true,
    
	customCheck = function(ply)
		return ply:AtLeastRanked("Developer")
	end
})*/
--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CIVILIAN


--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
    [TEAM_RANGER] = true,
}

hook.Add("playerBuyDoor", "PDDoors", function(ply, ent)
    local whitelist = {
        [(TEAM_MAYOR or -1)] = true,
        [(TEAM_MAYORW or -1)] = true,
        [(TEAM_MAYORD or -1)] = true,
        [(TEAM_MGUARD or -1)] = true,
        [(TEAM_FBI or -1)] = true,
    }

    if(not whitelist[ply:Team()] and GAMEMODE.CivilProtection[ply:Team()])then
        return false, "Police cannot buy doors"
    end
end)


--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_HITMAN)