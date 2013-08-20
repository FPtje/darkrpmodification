/*---------------------------------------------------------------------------
/*---------------------------------------------------------------------------
Group chats
---------------------------------------------------------------------------
Team chat for when you have a certain job.
e.g. with the default police group chat, police officers, chiefs and mayors can
talk to one another through /g or team chat.

HOW TO MAKE A GROUP CHAT:
Simple method:
GM:AddGroupChat(List of team variables separated by comma)

Advanced method:
GM:AddGroupChat(a function with ply as argument that returns whether a random player is in one chat group)
This is for people who know how to script Lua.

---------------------------------------------------------------------------*/
-- Example: GM:AddGroupChat(TEAM_MOB, TEAM_GANG)
-- Example: GM:AddGroupChat(function(ply) return ply:isCP() end)
