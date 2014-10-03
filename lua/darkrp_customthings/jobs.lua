/*---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------

This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields


Add jobs under the following line:
---------------------------------------------------------------------------*/
Peasant = DarkRP.createJob("TEAM_PEASANT", {
        color = Color(255, 255, 255, 255),
        model = {
                "models/player/Group03/Female_01.mdl",
                "models/player/Group03/Female_02.mdl"
                },
        description = "You are common peasant, the very backbone of the economy. Now get to work, peon!",
        weapons = {""},
        command = "Peasant",
        max = 15,
        salary = 45,
        admin = 0,
        vote = false,
        hasLicense = false,
        modelScale = 1.2,
        maxpocket = 5,
        maps = {"rp_medievalrp_v2"},
        candemote = false,
        mayor = false,
        chief = false,
        medic = false,
        cook = false,
        hobo = false,

        CanPlayerSuicide = function(ply) return true end, -- allows players to commit suicide, set to true
        PlayerCanPickupWeapon = function(ply, weapon) return true end, -- allows the player to pick up weapons
        PlayerDeath = function(ply, weapon, killer) end, -- Determines what shows when the player dies. shows player, the weapon and who killed them
        PlayerLoadout = function(ply) return true end, -- prevents player from getting default weapons when set to true
        PlayerSelectSpawn = function(ply, spawn) end, -- determines where player will spawn
        PlayerSpawn = function(ply) end, -- not needed, nothing special should happen when this job spawns
        RequiresVote = false,
        -- keeping this function for later --RequiresVote = function(ply, job) for k,v in pairs(player.GetAll()) do if IsValid(v) and v:IsAdmin() then return false end end return true end, -- People need to make a vote when there is no admin around
        ShowSpare1 = function(ply) end,
        ShowSpare2 = function(ply) end,
        canStartVote = function(ply) return ply:Distance(SomeNPC) < 200 end,
        canStartVoteReason = "Must be close to some NPC",
        buttonColor = Color(255, 255, 255, 255), -- The color of the button in the F4 menu
        label = "I'm not sure where this will appear, or how it will look.", -- Optional: the text on the button in the F4 menu
        ammo = {
                ["pistol"] = 60,
        },
})







/*---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------*/
GAMEMODE.DefaultTeam = TEAM_PEASANT


/*---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------*/
GAMEMODE.CivilProtection = {
	[TEAM_POLICE] = true,
	[TEAM_CHIEF] = true,
	[TEAM_MAYOR] = true,
}

/*---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------*/
DarkRP.addHitmanTeam(TEAM_MOB)
