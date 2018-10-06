--[[---------------------------------------------------------------------------
English (example) Chat command translation file
---------------------------------------------------------------------------

This file contains translations for chat command descriptions.
On the left side you see the chat command, on the right side you see the description.
When translating these descriptions, make sure to leave the quotation marks (" ") and commas intact!

= Warning =
Sometimes when DarkRP is updated, new chat commands are added, changed and/or removed.
By default, chat commands that aren't translated will use the English description.
Chat command translations that don't exist are ignored.


= How to translate missing chat commands =
1. Start the server
2. Join it
3. In your console, enter the following command:
    darkrp_translateChatCommands
4. Come back to this file
5. Paste where it says "-- Add new chat command translations under this line:"

= Note =
Make sure the language code is right at the bottom of this file

= Using a language =
Make sure the convar gmod_language is set to your language code. You can do that in a server CFG file.
---------------------------------------------------------------------------]]

local descriptions = {
    ["/"]                     = "Global server chat.",
    ["a"]                     = "Global server chat.",
    ["addjailpos"]            = "Add a jail position where you're standing.",
    ["addlaw"]                = "Add a law to the laws board.",
    ["addowner"]              = "Invite someone to co-own the door you're looking at.",
    ["addspawn"]              = "Add a spawn position for some job (use the command name of the job as argument)",
    ["addzombie"]             = "Add a zombie spawn pos.",
    ["advert"]                = "Advertise something to everyone in the server.",
    ["agenda"]                = "Set the agenda.",
    ["ao"]                    = "Invite someone to co-own the door you're looking at.",
    ["broadcast"]             = "Broadcast something as a mayor.",
    ["buy"]                   = "Buy a pistol",
    ["buyammo"]               = "Purchase ammo",
    ["buydruglab"]            = "Purchase a Drug lab",
    ["buygunlab"]             = "Purchase a Gun lab",
    ["buymoneyprinter"]       = "Purchase a Money printer",
    ["buyshipment"]           = "Buy a shipment",
    ["buyvehicle"]            = "Buy a vehicle",
    ["channel"]               = "Tune into a radio channel.",
    ["check"]                 = "Write a cheque for a specific person.",
    ["cheque"]                = "Write a cheque for a specific person.",
    ["chief"]                 = "Become Civil Protection Chief.",
    ["citizen"]               = "Become Citizen.",
    ["cp"]                    = "Become Civil Protection and skip the vote.",
    ["cr"]                    = "Cry for help, the police will come (hopefully)!",
    ["credits"]               = "Send the DarkRP credits to someone.",
    ["demote"]                = "Demote a player from their job",
    ["demotelicense"]         = "Start a vote to get someone's license revoked.",
    ["disablestorm"]          = "Disable meteor storms.",
    ["disablezombie"]         = "Disable zombie mod.",
    ["dropmoney"]             = "Drop money on the floor.",
    ["enablestorm"]           = "Enable meteor storms.",
    ["enablezombie"]          = "Enable zombie mod.",
    ["g"]                     = "Group chat.",
    ["gangster"]              = "Become Gangster.",
    ["give"]                  = "Give money to the player you're looking at.",
    ["givelicense"]           = "Give someone a gun license",
    ["gundealer"]             = "Become Gun Dealer.",
    ["hitprice"]              = "Set the price of your hits",
    ["hobo"]                  = "Become Hobo.",
    ["jailpos"]               = "Reset jail positions and create a new one at your position.",
    ["job"]                   = "Change your job name",
    ["jobswitch"]             = "Switch jobs with the player you're looking at",
    ["lockdown"]              = "Start a lockdown. Everyone will have to stay inside",
    ["lottery"]               = "Start a lottery",
    ["makeshipment"]          = "Create a shipment from a dropped weapon.",
    ["maxzombie"]             = "Set the maximum amount of zombies that can be in a level.",
    ["maxzombies"]            = "Set the maximum amount of zombies that can be in a level.",
    ["mayor"]                 = "Become Mayor and skip the vote.",
    ["me"]                    = "Chat roleplay to say you're doing things that you can't show otherwise.",
    ["medic"]                 = "Become Medic.",
    ["mobboss"]               = "Become Mob boss.",
    ["moneydrop"]             = "Drop money on the floor.",
    ["name"]                  = "Set your RP name",
    ["nick"]                  = "Set your RP name",
    ["ooc"]                   = "Global server chat.",
    ["placelaws"]             = "Place a laws board.",
    ["pm"]                    = "Send a private message to someone.",
    ["price"]                 = "Set the price of the microwave or gunlab you're looking at",
    ["radio"]                 = "Say something through the radio.",
    ["removelaw"]             = "Remove a law from the laws board.",
    ["removeletters"]         = "Remove all of your letters.",
    ["removeowner"]           = "Remove an owner from the door you're looking at.",
    ["removespawn"]           = "Remove a spawn position for some job (use the command name of the job as argument)",
    ["removezombie"]          = "Remove a zombie spawn pos by id (get id with /showzombie).",
    ["requesthit"]            = "Request a hit from the player you're looking at",
    ["requestlicense"]        = "Request a gun license.",
    ["ro"]                    = "Remove an owner from the door you're looking at.",
    ["rpname"]                = "Set your RP name",
    ["setprice"]              = "Set the price of the microwave or gunlab you're looking at",
    ["setspawn"]              = "Reset the spawn position for some job and place a new one at your position (use the command name of the job as argument)",
    ["showzombie"]            = "Show zombie spawn positions.",
    ["sleep"]                 = "Go to sleep or wake up",
    ["splitshipment"]         = "Split the shipment you're looking at.",
    ["switchjob"]             = "Switch jobs with the player you're looking at",
    ["switchjobs"]            = "Switch jobs with the player you're looking at",
    ["teamban"]               = "Ban someone from getting a certain job",
    ["teamunban"]             = "Undo a teamban",
    ["title"]                 = "Set the title of the door you're looking at.",
    ["togglegroupownable"]    = "Set this door group ownable.",
    ["toggleown"]             = "Own or unown the door you're looking at.",
    ["toggleownable"]         = "Toggle ownability status on this door.",
    ["toggleteamownable"]     = "Toggle this door ownable by a given team.",
    ["type"]                  = "Type a letter.",
    ["unlockdown"]            = "Stop a lockdown",
    ["unownalldoors"]         = "Sell all of your doors.",
    ["unwanted"]              = "Remove a player's wanted status.",
    ["votecp"]                = "Vote to become Civil Protection.",
    ["votemayor"]             = "Vote to become Mayor.",
    ["w"]                     = "Say something in whisper voice.",
    ["wake"]                  = "Go to sleep or wake up",
    ["wakeup"]                = "Go to sleep or wake up",
    ["wanted"]                = "Make a player wanted. This is needed to get them arrested.",
    ["warrant"]               = "Get a search warrant for a certain player. With this warrant you can search their house",
    ["write"]                 = "Write a letter.",
    ["y"]                     = "Yell something out loud.",
    ["zombiemax"]             = "Set the maximum amount of zombies that can be in a level.",

    -- Add new chat command translations under this line:

}

--
DarkRP.addChatCommandsLanguage("en", descriptions)
