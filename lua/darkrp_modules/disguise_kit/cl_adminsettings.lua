net.Receive("OpenDisguiseSettings", function()
	local disguises = net.ReadTable()
	
	local frame = vgui.Create("DFrame")
	frame:SetSize(600, 410)
	frame:Center()
	frame:SetTitle("Disguise Kit Config")
	frame:SetDeleteOnClose(true)
	frame:MakePopup()
	frame.Paint = function()
		draw.RoundedBox(0, 0, 0, frame:GetWide(), frame:GetTall(), Color( 0, 0, 0, 200 ))
	end
	
	drawDisguiseSettings(frame, disguises)
end)

function drawDisguiseSettings(frame, disguises)
	local itemspanel = vgui.Create("DScrollPanel", frame)
	itemspanel:SetPos(10, 30)
	itemspanel:SetSize(580, 370)
	itemspanel.Paint = function()
		draw.RoundedBox(0, 0, 0, itemspanel:GetWide(), itemspanel:GetTall(), Color(0, 0, 0, 255))
	end

	local i = 0
	local offset = 0
	
	if #disguises < 4 then offset = 10 end
	
	for k, v in pairs(RPExtraTeams) do
		local itempanel = vgui.Create("DPanel", itemspanel)
		itempanel:SetPos(10, i * 90 + 10)
		itempanel:SetSize(560 - offset, 80)
		itempanel.Paint = function()
			draw.RoundedBox(0, 0, 0, itempanel:GetWide(), itempanel:GetTall(), Color(255, 255, 255, 255))
		end
		
		local itempaneloverlay = vgui.Create("DPanel", itempanel)
		itempaneloverlay:SetPos(2.5, 2.5)
		itempaneloverlay:SetSize(556 - offset, 76)
		itempaneloverlay.Paint = function()
			draw.RoundedBox(0, 0, 0, itempaneloverlay:GetWide(), itempaneloverlay:GetTall(), Color(0, 0, 0, 255))
		end
		
		local itempaneloverlay2 = vgui.Create("DPanel", itempanel)
		itempaneloverlay2:SetPos(77.5, 5)
		itempaneloverlay2:SetSize(478.5 - offset, 70)
		itempaneloverlay2.Paint = function()
			draw.RoundedBox(0, 0, 0, itempaneloverlay2:GetWide(), itempaneloverlay2:GetTall(), Color(255, 255, 255, 255))
		end
		
		local iconpanel = vgui.Create("DPanel", itempanel)
		iconpanel:SetPos(5, 5)
		iconpanel:SetSize(70, 70)
		iconpanel.Paint = function()
			draw.RoundedBox(0, 0, 0, iconpanel:GetWide(), iconpanel:GetTall(), Color(72, 72, 72, 255))
		end
		
		local jobmodel
		
		if istable(RPExtraTeams[k].model) then
			jobmodel = RPExtraTeams[k].model[0] or RPExtraTeams[k].model[1]
		else
			jobmodel = RPExtraTeams[k].model
		end
		
		local jobicon = vgui.Create("SpawnIcon", itempanel)
		jobicon:SetPos(5, 5)
		jobicon:SetSize(70, 70)
		jobicon:SetModel(jobmodel)
		jobicon:SetToolTip(v.name)

		local name = vgui.Create("DLabel", itempanel)
		name:SetPos(85, 7.5)
		name:SetSize(450, 30)
		name:SetFont("HUDNumber5")
		name:SetText(RPExtraTeams[k].name)
		name:SetTextColor(Color(0,0,0,255))
		
		local buttontext
		local buttoncolor
		local keys = table.GetKeys(disguises)
		PrintTable(keys)
		if table.HasValue(keys, v.command) then
			buttontext = "Remove"
			buttoncolor = Color(255,0,0,255)
		else
			buttontext = "Add"
			buttoncolor = Color(29, 0, 255, 255)
		end
		
		local addbutton = vgui.Create("DButton", itempanel)
		addbutton:SetPos(392.5 - offset, 37.5)
		addbutton:SetFont("HUDNumber5")
		addbutton:SetText(buttontext)
		addbutton:SetTextColor(Color(255,255,255,255))
		addbutton:SetSize(160, 35)
		addbutton.Paint = function()
			draw.RoundedBox(0, 0, 0, addbutton:GetWide(), addbutton:GetTall(), buttoncolor) 
			end
		addbutton.OnCursorEntered = function() addbutton:SetTextColor(Color(0,0,0,255)) end
		addbutton.OnCursorExited = function() addbutton:SetTextColor(Color(255,255,255,255)) end
		addbutton.DoClick = function()
			if buttontext == "Add" then
				disguises[v.command] = {
					icon = jobmodel,
					team = k,
					name = v.name,
				}
				net.Start("SaveDisguiseSettings")
					net.WriteTable(disguises)
				net.SendToServer()
				itempanel:Remove()
				drawDisguiseSettings(frame, disguises)
			elseif buttontext == "Remove" then
				disguises[v.command] = nil
				net.Start("SaveDisguiseSettings")
					net.WriteTable(disguises)
				net.SendToServer()
				itempanel:Remove()
				drawDisguiseSettings(frame, disguises)
			end
		end
		
		i = i + 1
	end
end