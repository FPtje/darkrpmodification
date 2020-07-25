The DarkRP modification addon
==================
for DarkRP 2.5.0 and above.

## Download ##
Are you looking at this addon from the github web page? There's a "Download zip" button on the right.
Just download and put the contents into a folder in the garrysmod/addons folder!
If you have come this far and still have yet to find the download for the actual DarkRP gamemode (which this download **can not** function without) you can find it at either one of these locations:
* [On the Workshop](http://steamcommunity.com/sharedfiles/filedetails/?id=248302805)


  or


* [On GitHub](https://github.com/FPtje/DarkRP)



## Description ##
You should **not edit _any_ of the DarkRP core files** (anything in gamemodes/darkrp/*). That is why this addon exists.
This addon was created for anyone meaning even if you dont know lua this make it possible to customize DarkRP without worrying about updates or having to know how to read/write in lua. Have a look around and feel free to use any one of the many resources available to you at the bottom of this text!

## Contents of this addon ##
Everything you will need is in the Lua folder, because that is where the fun happens. *(if you have anything else other than text based files in this folder you have done something wrong!)*



- **lua/darkrp_config/**         -- *Configuration files for DarkRP. Simple config settings, anyone can edit these.*
    - disabled_defaults.lua -- *Not satisfied with something DarkRP ships with? Want to replace something? Disable it here!*
    - licenseweapons.lua    -- *Weapons that require a license to carry (only when the license config option is enabled.)*
    - mysql.lua             -- *Enable MySQL for your server!*
    - settings.lua          -- *DarkRP settings. This is probably the most important file.*



- **lua/darkrp_customthings/**  -- *Custom shipments, jobs, entities and many other things. Take a look to see examples!*
    - agendas.lua           -- *Agendas and who manages them.*
    - ammo.lua              -- *Ammo that can be bought in F4.*
    - doorgroups.lua        -- *Doors that belong to groups of jobs (e.g. police force doors).*
    - entities.lua          -- *Custom entities (e.g. money printer, gunlab) and replacement of default entities.*
    - groupchats.lua        -- *Group chats for groups of jobs.*
    - jobs.lua              -- *Custom jobs and replacements of the default jobs.*
    - shipments.lua         -- *Custom shipments and replacements of the default ones.*
    - vehicles.lua          -- *Custom vehicles*



- **lua/darkrp_language/**      -- *Vous êtes Français? Sind Sie Deutsch? Translate DarkRP here!*



- **lua/darkrp_modules/**       -- *Replace a DarkRP module with your own version or script your own mod for DarkRP!*



#### Check out the DarkRP wiki for guides, tutorials and documentation! ####
[DarkRP Wiki](https://darkrp.miraheze.org/wiki/Main_Page)
