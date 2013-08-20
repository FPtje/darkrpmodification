/*---------------------------------------------------------------------------
The list of modules that are disabled. Set to true to disable, false to enable.
Modules that are not in this list are enabled by default.
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["modules"] = {
	["afk"]              = true,
	["chatsounds"]       = false,
	["events"]           = false,
	["fpp"]              = false,
	["hitmenu"]          = false,
	["hud"]              = false,
	["hungermod"]        = true,
	["playerscale"]      = false,
	["sleep"]            = false,
	["voterestrictions"] = true,
}



/*---------------------------------------------------------------------------
The disabled default jobs. true to disable, false to enable.
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["jobs"] = {
	["chief"]     = false,
	["citizen"]   = false,
	["cp"]        = false,
	["gangster"]  = false,
	["gundealer"] = false,
	["hobo"]      = false,
	["mayor"]     = false,
	["medic"]     = false,
	["mobboss"]   = false,
}

/*---------------------------------------------------------------------------
Shipments and pistols
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["shipments"] = {
	["AK47"]         = false,
	["Desert eagle"] = false,
	["Fiveseven"]    = false,
	["Glock"]        = false,
	["M4"]           = false,
	["Mac 10"]       = false,
	["MP5"]          = false,
	["P228"]         = false,
	["Pump shotgun"] = false,
	["Sniper rifle"] = false,
}

/*---------------------------------------------------------------------------
Entities
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["entities"] = {
	["Drug lab"]      = false,
	["Gun lab"]       = false,
	["Money printer"] = false,
}

/*---------------------------------------------------------------------------
Vehicles
(at the moment there are no default vehicles)
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["vehicles"] = {

}

/*---------------------------------------------------------------------------
Door groups
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["doorgroups"] = {
	["Cops and Mayor only"] = false,
	["Gundealer only"]      = false,
}


/*---------------------------------------------------------------------------
Ammo packets
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["ammo"] = {
	["Pistol ammo"]  = false,
	["Rifle ammo"]   = false,
	["Shotgun ammo"] = false,
}

/*---------------------------------------------------------------------------
Agendas
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["agendas"] = {
	["Gangster's agenda"] = false,
	["Police agenda"] = false,
}

/*---------------------------------------------------------------------------
Chat groups (chat with /g)
Chat groups do not have names, so their index is used instead.
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["groupchat"] = {
	[1] = true, -- Police group chat (mayor, cp, chief and/or your custom CP teams)
	[2] = false, -- Group chat between gangsters and the mobboss
}

/*---------------------------------------------------------------------------
Jobs that are hitmen
set to true to disable
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["hitmen"] = {
	["mobboss"] = false,
}
