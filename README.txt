The DarkRP modification addon
==================
for DarkRP 2.5.0 and above.

## Download ##
Are you looking at this addon from the github web page? There's a "Download zip" button on the right.
Just download and put in a folder in addons!

## Description ##
You should **not edit any of the DarkRP core files** (anything in gamemodes/darkrp/*). That is why this addon exists.
This addon is made for you to whack in your addons folder and edit until you drop. Have a look around!

## Contents of this addon ##
Everything is in the Lua folder, because that is where the fun happens.


lua/darkrp_config/        -- Configuration files for DarkRP. Simple config settings, anyone can edit these.
	disabled_defaults.lua -- Not satisfied with something DarkRP ships with? Want to replace something? Disable it here!
	licenseweapons.lua    -- Weapons that require a license to carry (only when the license config option is enabled.)
	mysql.lua             -- Enable MySQL for your server!
	settings.lua          -- DarkRP settings. This is probably the most important file.

lua/darkrp_customthings/  -- Custom shipments, jobs, entities and many other things. Take a look to see examples!
	agendas.lua           -- Agendas and who manages them.
	ammo.lua              -- Ammo that can be bought in F4.
	doorgroups.lua        -- Doors that belong to groups of jobs (e.g. police force doors).
	entities.lua          -- Custom entities (e.g. money printer, gunlab) and replacement of default entities.
	groupchats.lua        -- Group chats for groups of jobs.
	jobs.lua              -- Custom jobs and replacements of the default jobs.
	shipments.lua         -- Custom shipments and replacements of the default ones.
	vehicles.lua          -- Custom vehicles

lua/darkrp_language/      -- Vous êtes Français? Sind Sie Deutsch? Translate DarkRP here!

lua/darkrp_modules/       -- Replace a DarkRP module with your own version or script your own mod for DarkRP!


#### Check out the DarkRP wiki for guides, tutorials and documentation! ####
[DarkRP Wiki](http://wiki.darkrp.com/index.php/Main_Page)
