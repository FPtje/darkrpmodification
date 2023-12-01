Police_Waypoint_ExtraJobs = {
	["cp"] = true,
	["swat"] = true,
	["mayor"] = true,
	["chief"] = true,
	["cgsfcommander"] = true,
	["juggerman"] = true,
	["cgsfsniper"] = true,
	["operative"] = true,
	["operator"] = true,
	["NCA"] = true,
	["fbi"] = true
} --Add additional chatcommands here, as needed (jobs that are not part of GAMEMODE.CivilProtection)

--[[
187 Homicide
207 Kidnapping
211 Robbery
245 Assault with a deadly weapon
417 Person with a gun
459 Burglary
10-71 Shooting
Code 2 Urgent assistance
--]]

Police_Waypoint_RequestTypes = {
		{"187 Homicide",
	{
	
	[1] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance.mp3",
		[1.6] = "npc/overwatch/radiovoice/off2.wav"
	},
	[2] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 2.mp3",
		[1.4] = "npc/overwatch/radiovoice/off2.wav"
	},
	[3] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 3.mp3",
		[2.2] = "npc/overwatch/radiovoice/off2.wav"
	}
	
	}},
		{"207 Kidnapping",
	{
	
	[1] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance.mp3",
		[1.6] = "npc/overwatch/radiovoice/off2.wav"
	},
	[2] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 2.mp3",
		[1.4] = "npc/overwatch/radiovoice/off2.wav"
	},
	[3] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 3.mp3",
		[2.2] = "npc/overwatch/radiovoice/off2.wav"
	}
	
	}},
		{"211 Robbery",
	{
	
	[1] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance.mp3",
		[1.6] = "npc/overwatch/radiovoice/off2.wav"
	},
	[2] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 2.mp3",
		[1.4] = "npc/overwatch/radiovoice/off2.wav"
	},
	[3] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 3.mp3",
		[2.2] = "npc/overwatch/radiovoice/off2.wav"
	}
	
	}},
		{"245 Assault With A Deadly Weapon",
	{
	
	[1] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance.mp3",
		[1.6] = "npc/overwatch/radiovoice/off2.wav"
	},
	[2] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 2.mp3",
		[1.4] = "npc/overwatch/radiovoice/off2.wav"
	},
	[3] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 3.mp3",
		[2.2] = "npc/overwatch/radiovoice/off2.wav"
	}
	
	}},
		{"417 Person With A Gun",
	{
	
	[1] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance.mp3",
		[1.6] = "npc/overwatch/radiovoice/off2.wav"
	},
	[2] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 2.mp3",
		[1.4] = "npc/overwatch/radiovoice/off2.wav"
	},
	[3] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 3.mp3",
		[2.2] = "npc/overwatch/radiovoice/off2.wav"
	}
	
	}},
		{"10-10 Fight In Progress",
	{
	
	[1] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance.mp3",
		[1.6] = "npc/overwatch/radiovoice/off2.wav"
	},
	[2] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 2.mp3",
		[1.4] = "npc/overwatch/radiovoice/off2.wav"
	},
	[3] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 3.mp3",
		[2.2] = "npc/overwatch/radiovoice/off2.wav"
	}
	
	}},
		{"459 Burglary",
	{
	
	[1] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance.mp3",
		[1.6] = "npc/overwatch/radiovoice/off2.wav"
	},
	[2] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 2.mp3",
		[1.4] = "npc/overwatch/radiovoice/off2.wav"
	},
	[3] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 3.mp3",
		[2.2] = "npc/overwatch/radiovoice/off2.wav"
	}
	
	}},
		{"10-71 Shooting",
	{
	
	[1] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance.mp3",
		[1.6] = "npc/overwatch/radiovoice/off2.wav"
	},
	[2] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 2.mp3",
		[1.4] = "npc/overwatch/radiovoice/off2.wav"
	},
	[3] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 3.mp3",
		[2.2] = "npc/overwatch/radiovoice/off2.wav"
	}
	
	}},
		{"Backup required. Respond Code 2 Urgent",
	{
	
	[1] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance.mp3",
		[1.6] = "npc/overwatch/radiovoice/off2.wav"
	},
	[2] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 2.mp3",
		[1.4] = "npc/overwatch/radiovoice/off2.wav"
	},
	[3] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 3.mp3",
		[2.2] = "npc/overwatch/radiovoice/off2.wav"
	}
	
	}},
		{"Backup required. Respond Code 3 Combat Ready",
	{
	
	[1] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance.mp3",
		[1.6] = "npc/overwatch/radiovoice/off2.wav"
	},
	[2] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 2.mp3",
		[1.4] = "npc/overwatch/radiovoice/off2.wav"
	},
	[3] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer assistance 3.mp3",
		[2.2] = "npc/overwatch/radiovoice/off2.wav"
	}
	
	}}
}
--^^ Format:
--[[
{"Text to be displayed in requestmenu and waypoint",
table that can contain multiple other tables that plays a sequence of sounds when picked at random
[indexnumber (can be 1-100)] = {
	[delay until sound is triggered] = "soundfilename"
}
}
]]

DarkRP.declareChatCommand{
	command = "backup",
	description = "Places a 60 sec waypoint that other cops can see.",
	delay = 1.5,
	condition = function(ply) if ply:isCP() then return true end end
}