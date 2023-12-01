DarkRP.registerDarkRPVar("team_color", function(val) net.WriteTable(val) end,function() return net.ReadTable() end)
DarkRP.registerDarkRPVar("disguised", function(val) net.WriteBool(val) end,function() return net.ReadBool() end)

hook.Add("InitPostEntity", "disableDefaultPlayerInfo", function()
	GAMEMODE.Config.showname = false
end)