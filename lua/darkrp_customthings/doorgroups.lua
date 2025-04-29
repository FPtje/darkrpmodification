--[[---------------------------------------------------------------------------
Door groups
---------------------------------------------------------------------------
The server owner can set certain doors as owned by a group of people, identified by their jobs.


HOW TO MAKE A DOOR GROUP:
AddDoorGroup("NAME OF THE GROUP HERE, you will see this when looking at a door", Team1, Team2, team3, team4, etc.)
---------------------------------------------------------------------------]]


-- Example: AddDoorGroup("Cops and Mayor only", TEAM_CHIEF, TEAM_POLICE, TEAM_MAYOR)
-- Example: AddDoorGroup("Gundealer only", TEAM_GUN)

local function AddDoorGroups()
    AddDoorGroup("Chaos Insurgency",
        TEAM_CI_COMMANDER,
        TEAM_CI_COMMANDING_OFFICER,
        TEAM_CI_OFFICER,
        TEAM_CI_DEEP_COVER,
        TEAM_CI_JUGGERNAUT,
        TEAM_CI_MARKSMAN,
        TEAM_CI_MEDIC,
        TEAM_CI_OPERATIVE,
        TEAM_CI_RECRUIT,
        TEAM_CI_DELTA_OPERATIVE,
        TEAM_CI_RD,
        TEAM_CI_TYPEBLUE,
        TEAM_CI_CHEMIST,
        TEAM_CI_STRIKE_TEAM,
        TEAM_CI_TECHNICAL_EXPERT
    )

    AddDoorGroup("MTF Alpha-1",
        TEAM_MTF_A1_RRH_OPERATIVE,
        TEAM_MTF_A1_RRH_MEDIC,
        TEAM_MTF_A1_RRH_SPECIALIST,
        TEAM_MTF_A1_RRH_ENFORCEMENT,
        TEAM_MTF_A1_RRH_CO,
        TEAM_MTF_A1_RRH_COMMANDER
    )

    AddDoorGroup("MTF Epsilon-11",
        TEAM_MTF_E11_NTF_OPERATIVE,
        TEAM_MTF_E11_NTF_SPECIALIST,
        TEAM_MTF_E11_NTF_BIOHAZARD_SPECIALIST,
        TEAM_MTF_E11_NTF_BREACHER,
        TEAM_MTF_E11_NTF_INFILTRATOR,
        TEAM_MTF_E11_NTF_CO,
        TEAM_MTF_E11_NTF_COMMANDER
    )

    AddDoorGroup("MTF Omega-1",
        TEAM_MTF_O1_LLH_OPERATIVE,
        TEAM_MTF_O1_LLH_MEDIC,
        TEAM_MTF_O1_LLH_SPECIALIST,
        TEAM_MTF_O1_LLH_ENFORCEMENT,
        TEAM_MTF_O1_LLH_CO,
        TEAM_MTF_O1_LLH_COMMANDER
    )

    AddDoorGroup("MTF Nu-7",
        TEAM_MTF_R21_IG_OPERATIVE,
        TEAM_MTF_R21_IG_MEDIC,
        TEAM_MTF_R21_IG_SPECIALIST,
        TEAM_MTF_R21_IG_MARKSMAN,
        TEAM_MTF_R21_IG_AUTORIFLEMAN,
        TEAM_MTF_R21_IG_CO,
        TEAM_MTF_R21_IG_COMMANDER
    )

    AddDoorGroup("Department of External Affairs",
        TEAM_DIRECTOR_OF_EXTERNAL_AFFAIRS,
        TEAM_EXTERNAL_AFFAIRS_AGENT,
        TEAM_DEPUTY_DIRECTOR_OF_EXTERNAL_AFFAIRS,
        TEAM_EXTERNAL_AFFAIRS_AGENCY_MANAGER,
        TEAM_EXTERNAL_AFFAIRS_OPERATIVE,
        TEAM_EXTERNAL_AFFAIRS_SENIOR_AGENT,
        TEAM_EXTERNAL_AFFAIRS_SPECIAL_AGENT
    )

    AddDoorGroup("Global Occult Coalition Command",
        TEAM_UNGOC_COMMANDER,
        TEAM_UNGOC_AMBASSADOR,
        TEAM_UNGOC_OFFICER
    )

    AddDoorGroup("Global Occult Coalition",
        TEAM_UNGOC_ASSESSMENT_TEAM,
        TEAM_UNGOC_COMMANDER,
        TEAM_UNGOC_ENGINEER,
        TEAM_UNGOC_FIELD_OPERATIVE,
        TEAM_UNGOC_JUGGERNAUT,
        TEAM_UNGOC_MARKSMAN,
        TEAM_UNGOC_RD,
        TEAM_UNGOC_SOLDIER,
        TEAM_UNGOC_STRIKE_TEAM,
        TEAM_UNGOCPRIVATE,
        TEAM_UNGOC_AMBASSADOR,
        TEAM_UNGOC_OFFICER,
        TEAM_UNGOC_MEDIC,
        TEAM_UNGOC_CHEMIST,
        TEAM_UNGOC_THAUMATOLOGIST,
        TEAM_UNGOC_RECRUIT
    )
end

hook.Add("VJobEditorRegisterJobs", "vjobeditor", function()
    AddDoorGroups()
end)

AddDoorGroups()