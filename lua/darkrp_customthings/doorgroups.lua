/*---------------------------------------------------------------------------
Door groups
---------------------------------------------------------------------------
The server owner can set certain doors as owned by a group of people, identified by their jobs.


HOW TO MAKE A DOOR GROUP:
AddDoorGroup("NAME OF THE GROUP HERE, you will see this when looking at a door", Team1, Team2, team3, team4, etc.)
---------------------------------------------------------------------------*/
/* Merchant groups */
AddDoorGroup("Blacksmith", TEAM_BLACKSMITH)
AddDoorGroup("Apothecary", TEAM_APOTHECARY)
AddDoorGroup("Tavern", TEAM_TAVERNOWNER, TEAM_BARTENDER)

/* Enforcement groups */
AddDoorGroup("King's Property", TEAM_KING)
AddDoorGroup("Knight's HQ", TEAM_KING, TEAM_KNIGHT)
/*
  finish this later
  AddDoorGroup("tax"
  "soldioers"
  "jail"
*/
-- Example: AddDoorGroup("Cops and Mayor only", TEAM_CHIEF, TEAM_POLICE, TEAM_MAYOR)
-- Example: AddDoorGroup("Gundealer only", TEAM_GUN)
