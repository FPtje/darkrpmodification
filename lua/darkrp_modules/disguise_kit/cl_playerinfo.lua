if(true)then return end

local meta = FindMetaTable("Player")

local colors = {}
colors.black = Color(0, 0, 0, 255)
colors.blue = Color(0, 0, 255, 255)
colors.brightred = Color(200, 30, 30, 255)
colors.darkred = Color(0, 0, 70, 100)
colors.darkblack = Color(0, 0, 0, 200)
colors.gray1 = Color(0, 0, 0, 155)
colors.gray2 = Color(51, 58, 51,100)
colors.red = Color(255, 0, 0, 255)
colors.white = Color(255, 255, 255, 255)
colors.white1 = Color(255, 255, 255, 200)

--[[hook.Add("HUDPaint", "DrawPlayerName", function()
	local shouldDraw, players = hook.Call("HUDShouldDraw", GAMEMODE, "DarkRP_EntityDisplay")
	if shouldDraw == false then return end
	local localplayer = LocalPlayer()
	local shootPos = localplayer:GetShootPos()
	local aimVec = localplayer:GetAimVector()

	for k, ply in pairs(players or player.GetAll()) do
		if ply == localplayer or not ply:Alive() or ply:GetNoDraw() then continue end
		local hisPos = ply:GetShootPos()

		if GAMEMODE.Config.globalshow then
			ply:drawPlayerName()
		elseif hisPos:DistToSqr(shootPos) < 160000 then
			local pos = hisPos - shootPos
			local unitPos = pos:GetNormalized()
			if unitPos:Dot(aimVec) > 0.95 then
				local trace = util.QuickTrace(shootPos, pos, localplayer)
				if trace.Hit and trace.Entity ~= ply then return end
				ply:drawPlayerName()
			end
		end
	end
end)--]]

meta.drawPlayerName = meta.drawPlayerName or function(self)
	if GAMEMODE.Config.showname then
		local pos = self:EyePos()

		pos.z = pos.z + 10
		pos = pos:ToScreen()
		if not self:getDarkRPVar("wanted") then
			pos.y = pos.y - 50
		end
		
		local teamname = self:getDarkRPVar("job") or team.GetName(self:Team())
		local plyTeam = self:Team()
		local teamcolor = self:getDarkRPVar("disguised") == true and self:getDarkRPVar("team_color") and self:getDarkRPVar("team_color").teamcolor or RPExtraTeams[plyTeam] and RPExtraTeams[plyTeam].color or team.GetColor(plyTeam)
		

		local nick = self:Nick()
		draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x + 1, pos.y + 1, colors.black, 1)
		draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x, pos.y, teamcolor, 1)
	end
end