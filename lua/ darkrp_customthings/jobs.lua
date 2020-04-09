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
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields

Add your custom jobs under the following line:
---------------------------------------------------------------------------]]

TEAM_ZENGIN = DarkRP.createJob("Zengin", {
        color = Color(0, 255, 255, 255),
        model = {
                "models/player/breen.mdl",
                "models/player/Group03/Female_02.mdl"
                },
        description = [[raid yapamaz.Mug yapar.]],
        weapons = {"weapon_p2282" , "weapon_shotgun"},
        command = "zengin",
        max = 3,
        salary = 250,
        admin = 0,
        vote = false,
        hasLicense = true,
        customCheck = function(ply) return ply:getDarkRPVar("money") > 500000 end,
        CustomCheckFailMsg = "Yeterli paran yok!",
        modelScale = 1.5,
        maxpocket = 20,
    PlayerSpawn =  function(ply) ply:SetArmor(100) end,
        RequiresVote = function(ply, job) for k,v in pairs(player.GetAll()) do if IsValid(v) and v:IsAdmin() then return false end end return true end, -- Oyunda admin yokken vote yapmak zorunda olmak
        label = "Super job",
            

--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CITIZEN
--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
    [TEAM_POLICE] = true,
    [TEAM_CHIEF] = true,
    [TEAM_MAYOR] = true,
}
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_MOB)
