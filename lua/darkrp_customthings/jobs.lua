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
GAMEMODE.Special = {
      [TEAM_ASSASSIN] = DarkRP.createJob("ASSASSIN",{
color = Color(255, 255, 255, 255), --Let's put Falco white no?
model = "models/player/phoenix.mdl," 
description = [[I AM THE ♥♥♥♥ING DEVELOPER, RESPECT ME ]],
weapons = {"unarrest_stick", "flipoff_swep"},
command = "falco",
max = 1,
salary = 9999,
admin = 2,   -- Determines whether only admins/superadmins can access this.
vote = true,   -- Whether you need to be voted into the job
hasLicense = true,   -- Determines if the job spawns with Gun License
})  
