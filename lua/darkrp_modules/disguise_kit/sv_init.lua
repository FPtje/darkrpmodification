AddCSLuaFile("cl_init.lua")

-- Interface and handler for disguise kit is in modules folder because im too retarded to figure out how to do it with the weapons folder

util.AddNetworkString("disguise")
util.AddNetworkString("disguise_remove")
util.AddNetworkString("DisguiseKitOpen")

hook.Add("InitPostEntity", "LoadDisguises", function()
	if not file.Exists("disguise_teams.txt", "DATA") then
		file.Write("disguise_teams.txt", util.TableToJSON({
			cp = {
				icon = "models/player/police.mdl",
				team = TEAM_POLICE,
				name = "Civil Protection"
			},
			gangster = {
				icon = "models/player/group03/male_01.mdl",
				team = TEAM_GANG,
				name = "Gangster"
			},
			citizen = {
				icon = "models/player/Group01/Male_09.mdl",
				team = TEAM_CITIZEN,
				name = "Citizen"
			},
		}))
	end
	
	local disguise_teams = util.JSONToTable(file.Read("disguise_teams.txt"))
	local disguise_keys = {}
	local jobs_keys = {}
	local i = 0
	
	for k, v in pairs(disguise_teams) do
		disguise_keys[i] = k
		i = i + 1
	end
	
	i = 0
	
	for k, v in pairs(RPExtraTeams) do
		jobs_keys[i] = v.command
		i = i + 1
	end
		
	
	for k, v in pairs(disguise_teams) do
		if table.HasValue(jobs_keys, k) == false then
			disguise_teams[k] = nil
			print("Ultimate Disguise Kit ERROR:")
			print("Disguise Kit tried to load in a team that no longer exists!")
			print("Auto-Deleting team " .. k .. " from the Disguise Kit selection.")
			print("If you see this error there is no need to worry, the script did its job.")
		end
	end
	
	file.Write("disguise_teams.txt", util.TableToJSON(disguise_teams))
end)

local function clearDisguise(ply, msg)
	if msg == nil then
		msg = "Your disguise has worn off!"
	end
	local model = RPExtraTeams[ply:Team()].model
	if isstring(model) == false then
		model = RPExtraTeams[ply:Team()].model[1]
	end
	ply:SetModel(model)
	ply:updateJob(team.GetName(ply:Team()))
	ply:setDarkRPVar("team_color", {teamcolor = RPExtraTeams[ply:Team()] and RPExtraTeams[ply:Team()].color or team.GetColor(ply:Team())})
	ply:setDarkRPVar("disguised", false)
	DarkRP.notify(ply, 1, 4, msg)
	ply:SetNW2Int("disguise_team", -1)
end

net.Receive("disguise", function(len, ply)
	if ply.LastDisguise and DISGUISE_KIT_COOLDOWN - (CurTime() - ply.LastDisguise) >= 0 then
		DarkRP.notify(ply, 1, 4, "You need to wait " .. math.floor(DISGUISE_KIT_COOLDOWN - (CurTime() - ply.LastDisguise)) .. " seconds before using your disguise kit again!")
		return false
	end
	
	local disguise_team = net.ReadInt(32)
	ply:SetNW2Int("disguise_team", disguise_team)

	local model = RPExtraTeams[disguise_team].model
	
	if isstring(model) == false then
		model = RPExtraTeams[disguise_team].model[1]
	end
	
	ply:SetModel(model)
	ply:updateJob(team.GetName(disguise_team))
	ply:setDarkRPVar("team_color", {teamcolor = RPExtraTeams[disguise_team] and RPExtraTeams[disguise_team].color or team.GetColor(disguise_team)})
	ply:setDarkRPVar("disguised", true)
	
	DarkRP.notify(ply, 0, 4, "You are now disguised as a " .. team.GetName(disguise_team) .. ".")
	DarkRP.notify(ply, 0, 4, "Your disguise will last " .. DISGUISE_KIT_TIME .. " seconds.")
	
	ply.LastDisguise = CurTime()

	local number = math.random(1, 9999999)
	ply.disguiseNumber = number

	timer.Simple(DISGUISE_KIT_TIME, function()
		if not IsValid(ply) then return end
		if ply.disguiseNumber != number then return end
		clearDisguise(ply)
	end)
end)

net.Receive("disguise_remove", function(len, ply)
	clearDisguise(ply, "Your disguise has been removed!")
end)

hook.Add("PostPlayerDeath", "resetDisguise", function(ply)
	if ply:getDarkRPVar("disguised") == true then
		if not IsValid(ply) then return end
		clearDisguise(ply)
	end
end)