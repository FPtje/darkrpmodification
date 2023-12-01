util.AddNetworkString("OpenDisguiseSettings")
util.AddNetworkString("SaveDisguiseSettings")

DarkRP.defineChatCommand("disguise_settings", function(ply)
	if not ply:IsSuperAdmin() then return end
	
	local disguises = util.JSONToTable(file.Read("disguise_teams.txt"))
	
	net.Start("OpenDisguiseSettings")
		net.WriteTable(disguises)
	net.Send(ply)
end)

local saved = {}

net.Receive("SaveDisguiseSettings", function(len, ply)
	if !IsValid(ply) or not ply:IsSuperAdmin() then return end
    
	if(saved[ply] and CurTime() - saved[ply] < 5)then return end
	saved[ply] = CurTime()
	
	local disguises = net.ReadTable()
	
	file.Write("disguise_teams.txt", util.TableToJSON(disguises))
end)