--[[hook.Add("OnPlayerChat", "disguiseKitChatFix", function(ply, text, teamOnly, alive, prefixText, color1, color2)
	if DISGUISE_DEFAULT_CHAT == false then return end
	if ply:IsPlayer() == false then return false end
	local plyTeam = ply:Team()
	local teamcolor = ply:getDarkRPVar("disguised") == true and ply:getDarkRPVar("team_color") and ply:getDarkRPVar("team_color").teamcolor or RPExtraTeams[plyTeam] and RPExtraTeams[plyTeam].color or team.GetColor(plyTeam)
	PrintMessage(HUD_PRINTTALK,tostring(teamcolor))
	chat.AddText(Color(255, 0, 0, 255), "", teamcolor, prefixText, color2, ": "..text) 
	return true
end)]]--