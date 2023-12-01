/*resource.AddFile("materials/vgui/civilgamers/policenotifications/triangle.png")
resource.AddFile("sound/backup/officer assistance.mp3")
resource.AddFile("sound/backup/officer assistance 2.mp3")
resource.AddFile("sound/backup/officer assistance 3.mp3")
resource.AddFile("sound/backup/officer down.mp3")
resource.AddFile("sound/backup/officer down 2.mp3")
resource.AddFile("sound/backup/officer down 3.mp3")
resource.AddFile("sound/backup/officer down 4.mp3")*/

local current_waypointdelay = 16--I know this looks like a configurable setting, but it really isnt, dont touch it


util.AddNetworkString("polis_waypoint_add")
util.AddNetworkString("polis_waypoint_req_menu")
util.AddNetworkString("polis_waypoint_req_income")

hook.Add("PlayerDeath","police_waypoints_ondeath",function(ply,inf,ply2)
	if not ply:isCP() and not Police_Waypoint_ExtraJobs[ply:getJobTable().command] then return end
	if ply == ply2 then return end
	if not IsValid(ply2) or not ply2:IsPlayer() then return end
	if (ply:isCP() or Police_Waypoint_ExtraJobs[ply:getJobTable().command]) and (ply2:isCP() or Police_Waypoint_ExtraJobs[ply2:getJobTable().command]) then return end
	if current_waypointdelay > CurTime() then return end

	local tableofplayers = {}
	for k,v in pairs(player.GetAll()) do
		if(Police_Waypoint_ExtraJobs and IsValid(v) and v:getJobTable())then
			if (v:isCP() or Police_Waypoint_ExtraJobs[v:getJobTable().command]) then
				table.insert(tableofplayers,v)
			end
		elseif v:isCP() then
			table.insert(tableofplayers,v)
		end
	end

	net.Start("polis_waypoint_add")
		net.WriteEntity(ply)
		net.WriteVector(ply:GetPos() + Vector(0,0,40))
		net.WriteString("")
	net.Send(tableofplayers)

	current_waypointdelay = CurTime() + 10
end)

DarkRP.defineChatCommand("backup",function(ply) if not ply:isCP() and not Police_Waypoint_ExtraJobs[ply:getJobTable().command] then DarkRP.notify(ply,1,5,"You need to be part of the goverment jobs to use this!") return end net.Start("polis_waypoint_req_menu") net.Send(ply) end)

net.Receive("polis_waypoint_req_income",function(length,ply)
	if not ply:isCP() and not Police_Waypoint_ExtraJobs[ply:getJobTable().command] then return end
	if current_waypointdelay > CurTime() then return end
	if not ply:Alive() then return end
	local indexx = net.ReadInt(32) or 1
	local request_type = Police_Waypoint_RequestTypes[indexx]
	if not request_type then return end

	local tableofplayers = {}
	for k,v in pairs(player.GetAll()) do
		if v:isCP() or Police_Waypoint_ExtraJobs[v:getJobTable().command] then
			table.insert(tableofplayers,v)
		end
	end

	net.Start("polis_waypoint_add")
		net.WriteEntity(ply)
		net.WriteVector(ply:GetPos() + Vector(0,0,40))
		net.WriteString(request_type[1])
		net.WriteInt(indexx,32)
	net.Send(tableofplayers)

	current_waypointdelay = CurTime() + 10
end)
