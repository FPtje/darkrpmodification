net.Receive("DisguiseKitOpen", function()
	local data = net.ReadTable()
	local disguiseOptions = data.disguises
	local sidecount = table.Count(disguiseOptions)
	local upcount = math.ceil(sidecount / 8)
	local ply = LocalPlayer()
	
	if sidecount > 8 then
		sidecount = 8
	end
	
	local frame = vgui.Create("DFrame")
	frame:SetSize(79 * 8 + 35, upcount * 79 + 95)
	frame:Center()
	frame:SetTitle("Disguise Kit")
	frame:SetDeleteOnClose(true)
	frame:MakePopup()
	frame.Paint = function()
		draw.RoundedBox(0, 0, 0, frame:GetWide(), frame:GetTall(), Color( 0, 0, 0, 200 ))
	end
	
	local itemspanel = vgui.Create("DPanel", frame)
	itemspanel:SetPos(10, 30)
	itemspanel:SetSize(79 * 8 + 15, upcount * 79 + 55)
	itemspanel.Paint = function()
		draw.RoundedBox(0, 0, 0, itemspanel:GetWide(), itemspanel:GetTall(), Color(0, 0, 0, 255))
	end
	
	local itemspanel2 = vgui.Create("DPanel", itemspanel)
	itemspanel2:SetPos(5, 5)
	itemspanel2:SetSize(79 * 8 + 5, upcount * 79 + 45)
	itemspanel2.Paint = function()
		draw.RoundedBox(0, 0, 0, itemspanel2:GetWide(), itemspanel2:GetTall(), Color(255, 255, 255, 255))
	end
	
	local chargepanel = vgui.Create("DPanel", itemspanel2) 
	chargepanel:SetPos(400, 5)
	chargepanel:SetSize(232, 35) 
	chargepanel.Paint = function()
		draw.RoundedBox(0, 0, 0, chargepanel:GetWide(), chargepanel:GetTall(), Color(72, 72, 72, 255))
	end
	
	local progress = data.timeleft / DISGUISE_KIT_COOLDOWN
	local status = "Charging"
	
	if progress >= 1 then
		progress = 1
		status = "Charged"
	end
	
	local chargeprogress = vgui.Create("DPanel", chargepanel)
	chargeprogress:SetPos(3, 3)
	chargeprogress:SetSize(progress * 226, 29) 
	chargeprogress.Paint = function()
		draw.RoundedBox(0, 0, 0, chargeprogress:GetWide(), chargeprogress:GetTall(), Color(29, 0, 255, 255))
	end
	
	local chargestatus = vgui.Create("DLabel", chargepanel)
	chargestatus:SetPos(80, 3)
	chargestatus:SetSize(100, 30)
	chargestatus:SetFont("Trebuchet24")
	chargestatus:SetText(status)
	chargestatus:SetTextColor(Color(0,0,0,255))
	
	local title = vgui.Create("DLabel", itemspanel2)
	title:SetPos(5, 5)
	title:SetSize(150, 30)
	title:SetFont("HUDNumber5")
	title:SetText("Disguise Kit")
	title:SetTextColor(Color(0,0,0,255))

	local resetButton = vgui.Create("DButton", itemspanel2)
	resetButton:SetPos(205, 5)
	resetButton:SetSize(150, 30)
	resetButton:SetFont("Trebuchet24")
	resetButton:SetText("Remove Disguise")
	resetButton:SetTextColor(Color(0, 0, 0, 255))
	function resetButton:DoClick()
		net.Start("disguise_remove")
		net.SendToServer()
	end
	
	local i = 0
	local rows = upcount
	local row = upcount - rows

	for k, disguiseOption in pairs(disguiseOptions) do
		local panel = vgui.Create("DPanel", itemspanel2)
		panel:SetPos(i * 79 + 5, row * 79 + 45)
		panel:SetSize(74, 74) 
		panel.Paint = function()
			draw.RoundedBox(0, 0, 0, panel:GetWide(), panel:GetTall(), Color(72, 72, 72, 255))
		end
		
		local icon = vgui.Create("SpawnIcon", panel)
		icon:SetPos(5, 5)
		icon:SetSize(64, 64)
		icon:SetModel(disguiseOption.icon)
		icon:SetToolTip(disguiseOption.name)
		icon.DoClick = function()
			net.Start("disguise")
				net.WriteInt(disguiseOption.team, 32)
				net.WriteBool(disguiseOption.team == -1) -- should remove
			net.SendToServer()
			frame:Close()
		end
		
		i = i + 1
		
		if i >= 8 then
			i = 0
			row = row + 1
		end
	end
end)