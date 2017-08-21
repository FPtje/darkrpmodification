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
Super Admin = DarkRP.createJob("Super Admin", {
color = Color(255, 0, 8, 255),
model = {"models/player/b4p/b4p_vader.mdl"},
description = [[Super Admin]],
weapons = {"m9k_dragunov", "laserpointer", "weapon_medkit", "weapon_fists", "grapplehook"},
command = "/SuperAdmin",
max = 3,
salary = 9999999,
admin = 1,
vote = false,
hasLicense = true,
candemote = false,
category = "Super Admin",
customCheck = function(ply) return
table.HasValue({"TEAM ADMIN"}, ply:Team())
})
Thief = DarkRP.createJob("Thief", {
color = Color(255, 0, 8, 120),
model = {" models/player/phoenix.mdl"},
description = [[Can Base Can Raid]],
weapons = {"lockpick"},
command = "",
max = 6,
salary = 75,
admin = 0,
vote = false,
hasLicense = false,
candemote = false,
category = "Gangsters",
})
Guard = DarkRP.createJob("Guard", {
color = Color(255, 0, 8, 170),
model = {"models/wrex/wrex.mdl"},
description = [[Can base]],
weapons = {"weapon_vj_glock17"
command = "",
max = 4,
salary = 100,
admin = 0,
vote = false,
hasLicense = true,
candemote = false,
category = "Citizen",
})     
Doctor = DarkRP.createJob("Doctor", {
color = Color(100, 0, 8, 255),
model = {"Models/mw2guy/BZ/tfbzca02.mdl"},
description = [[Can base]],
weapons = {"weapon_medkit"
command = "",
max = 2,
salary = 100,
admin = 0,
vote = false,
hasLicense = false,
candemote = false,
category = "Citizen",





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
