--Worst code of the year 2014
--Whatever... Its working, and thats all that matters, am i rite?

local black = Color(0, 0, 0, 255)
local white = Color(255, 255, 255, 200)
local red = Color(128, 30, 30, 255)

surface.CreateFont("door_info_font", {
	font = "Tahoma",
	size = 75
})

local function DrawDarkRPDoorInfo(door,ex,why)
	local blocked = door:getKeysNonOwnable()
	local superadmin = LocalPlayer():IsSuperAdmin()
	local doorTeams = door:getKeysDoorTeams()
	local doorGroup = door:getKeysDoorGroup()
	local owned = door:isKeysOwned() or doorGroup or doorTeams

	local doorInfo = {}

	local title = door:getKeysTitle()
	if title then table.insert(doorInfo, title) end

	if owned then
		table.insert(doorInfo, DarkRP.getPhrase("keys_owned_by"))
	end

	if door:isKeysOwned() then
		table.insert(doorInfo, door:getDoorOwner():Nick())
		for k,v in pairs(door:getKeysCoOwners() or {}) do
			local ent = Player(k)
			if not IsValid(ent) or not ent:IsPlayer() then continue end
			table.insert(doorInfo, ent:Nick())
		end

		local allowedCoOwn = door:getKeysAllowedToOwn()
		if allowedCoOwn and not fn.Null(allowedCoOwn) then
			table.insert(doorInfo, DarkRP.getPhrase("keys_other_allowed"))

			for k,v in pairs(allowedCoOwn) do
				local ent = Player(k)
				if not IsValid(ent) or not ent:IsPlayer() then continue end
				table.insert(doorInfo, ent:Nick())
			end
		end
	elseif doorGroup then
		table.insert(doorInfo, doorGroup)
	elseif doorTeams then
		for k, v in pairs(doorTeams) do
			if not v or not RPExtraTeams[k] then continue end

			table.insert(doorInfo, RPExtraTeams[k].name)
		end
	elseif blocked and superadmin then
		table.insert(doorInfo, DarkRP.getPhrase("keys_allow_ownership"))
	elseif not blocked then
		table.insert(doorInfo, DarkRP.getPhrase("keys_unowned"))
		if superadmin then
			table.insert(doorInfo, DarkRP.getPhrase("keys_disallow_ownership"))
		end
	end

	if door:IsVehicle() then
		for k,v in pairs(player.GetAll()) do
			if v:GetVehicle() ~= door then continue end

			table.insert(doorInfo, DarkRP.getPhrase("driver", v:Nick()))
			break
		end
	end

	local x, y = ex, why
	
	draw.DrawNonParsedText(table.concat(doorInfo, "\n"), "door_info_font", x , y + 1 , black, 1)
	draw.DrawNonParsedText(table.concat(doorInfo, "\n"), "door_info_font", x, y, (blocked or owned) and white or red, 1)
end

local function Draw3DDoor2(door)
	if door:GetClass() and door:GetClass() != "prop_door_rotating" then return end
	
	local ang = door:GetAngles()
	
	cam.Start3D()
	
		ang:RotateAroundAxis(ang:Right(), 90)
		ang:RotateAroundAxis(ang:Up(), -90)		
		
		cam.Start3D2D( door:GetPos() + ang:Forward() * -49.1 + ang:Up() + ang:Right() * -20, ang, 0.03 )
			DrawDarkRPDoorInfo(door,875,450)
		cam.End3D2D()
		
		ang:RotateAroundAxis(ang:Right(), 180)
		
		cam.Start3D2D( door:GetPos() + ang:Forward() * -3.2 + ang:Up() + ang:Right() * -20, ang, 0.03 )
			DrawDarkRPDoorInfo(door,875,450)
		cam.End3D2D()
		
	cam.End3D()
	
	return true
end
hook.Add("HUDDrawDoorData","Door_Draw_3D_Data",Draw3DDoor2)