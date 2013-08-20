/*
---------------------------------------------------------------------------
HOW TO MAKE A GROUP CHAT
---------------------------------------------------------------------------
Pick one!
GAMEMODE:AddGroupChat(List of team variables separated by comma)

or

GAMEMODE:AddGroupChat(a function with ply as argument that returns whether a random player is in one chat group)
This one is for people who know how to script Lua.

*/
-- Example: GM:AddGroupChat(TEAM_MOB, TEAM_GANG)
-- Example: GM:AddGroupChat(function(ply) return ply:isCP() end)
