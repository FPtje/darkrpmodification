local coolsounds_down = {
	[1] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "npc/overwatch/radiovoice/attention.wav",
		[1.3] = "npc/overwatch/radiovoice/unitdownat.wav",
		[2] = "npc/overwatch/radiovoice/transitblock.wav",
		[3] = "npc/overwatch/radiovoice/off2.wav"
	},
	[2] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "npc/overwatch/radiovoice/attention.wav",
		[1.3] = "npc/overwatch/radiovoice/unitdownat.wav",
		[2] = "npc/overwatch/radiovoice/canalblock.wav",
		[3] = "npc/overwatch/radiovoice/off2.wav"
	},
	[3] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "npc/overwatch/radiovoice/attention.wav",
		[1.3] = "npc/overwatch/radiovoice/unitdeserviced.wav",
		[2.6] = "npc/overwatch/radiovoice/remainingunitscontain.wav",
		[4] = "npc/overwatch/radiovoice/off2.wav"
	},
	[4] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "npc/overwatch/radiovoice/attention.wav",
		[1.3] = "npc/overwatch/radiovoice/lostbiosignalforunit.wav",
		[3.4] = "npc/overwatch/radiovoice/investigateandreport.wav",
		[4.7] = "npc/overwatch/radiovoice/off2.wav"
	},
	[5] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer down.mp3",
		[1.6] = "npc/overwatch/radiovoice/off2.wav"
	},
	[6] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer down 2.mp3",
		[2.7] = "npc/overwatch/radiovoice/off2.wav"
	},
	[7] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer down 3.mp3",
		[2.7] = "npc/overwatch/radiovoice/off2.wav"
	},
	[7] = {
		[0] = "npc/overwatch/radiovoice/on3.wav",
		[0.5] = "backup/officer down 4.mp3",
		[2.8] = "npc/overwatch/radiovoice/off2.wav"
	}
}

local lastwaypoint = 30

net.Receive("polis_waypoint_add",function()
	local requesti = net.ReadEntity()
	local posi = net.ReadVector()
	local texti = net.ReadString()
	local typi = net.ReadInt(32)
	
	local youslidenicebby = CurTime()
	
	local niceindex = "0"
	if IsValid(requesti) then niceindex = requesti:EntIndex() end
	local typitxt = "OFFICER DOWN"
	local cursoundtable = table.Random(coolsounds_down)
	if Police_Waypoint_RequestTypes[typi] then
		cursoundtable = table.Random(Police_Waypoint_RequestTypes[typi][2])
	end
	for k,v in pairs(cursoundtable) do
		timer.Simple(k,function()
			surface.PlaySound(v)
		end)
	end
	
	local triangleMaterial = Material("vgui/civilgamers/policenotifications/triangle.png")
	local slidetimerstarted = 0
	local hudfade = 0
	hook.Add("HUDPaint","polis_waypoints_slide_hud",function()
		if slidetimerstarted < 1 then
			hudfade = (CurTime() - youslidenicebby) * 400
		elseif slidetimerstarted == 2 then
			hudfade = 255 - ((CurTime() - youslidenicebby) * 300)
		end
		draw.DrawText(texti != "" and texti or typitxt,"Default",ScrW() / 2,math.Clamp((slidetimerstarted < 1 and (CurTime() - youslidenicebby) * 300 or ScrH() / 5) - 30,0,ScrH() / 5 - 30),Color(218,218,218,hudfade),TEXT_ALIGN_CENTER)
		draw.DrawText("WAYPOINT HAS BEEN PLACED AT LOCATION","Default",ScrW() / 2,math.Clamp((slidetimerstarted < 1 and (CurTime() - youslidenicebby) * 300 or ScrH() / 5) + 20,0,ScrH() / 5 + 20),Color(218,218,218,hudfade),TEXT_ALIGN_CENTER)
		surface.SetDrawColor(255,255,255,hudfade)
		surface.SetMaterial(triangleMaterial)
		surface.DrawTexturedRect(ScrW() / 2 - 16,math.Clamp((slidetimerstarted < 1 and (CurTime() - youslidenicebby) * 300 or ScrH() / 5),0,ScrH() / 5) - 16,32,32)
		
		if (CurTime() - youslidenicebby) * 300 >= ScrH() / 4 and slidetimerstarted < 1 then
			slidetimerstarted = 1
			timer.Simple(2,function()
				slidetimerstarted = 2
				youslidenicebby = CurTime()
			end)
		end
		
		if hudfade < 0 then
			hook.Remove("HUDPaint","polis_waypoints_slide_hud")
		end
	end)
	
	hook.Add("HUDPaint","polis_waypoints_hud"..niceindex,function()
		local scrrpos = posi:ToScreen()
		
		draw.DrawText(texti != "" and texti or typitxt,"Default",scrrpos.x,scrrpos.y - 30,Color(218,218,218),TEXT_ALIGN_CENTER)
		surface.SetDrawColor(255,255,255)
		surface.SetMaterial(triangleMaterial)
		surface.DrawTexturedRect(scrrpos.x - 16,scrrpos.y - 16,32,32)
	end)
	
	timer.Create("polis_waypoint_remove"..niceindex,60,1,function()
		hook.Remove("HUDPaint","polis_waypoints_hud"..niceindex)
	end)
	
	lastwaypoint = CurTime() + 30
end)

net.Receive("polis_waypoint_req_menu",function()
	local txt_frame = vgui.Create("DFrame")
	txt_frame:SetSize(320,180)
	txt_frame:SetTitle("Request Backup")
	txt_frame:SetVisible(true)
	txt_frame:SetDraggable(true)
	txt_frame:ShowCloseButton(false)
	txt_frame:MakePopup()
	txt_frame:Center()
	
	local txt_label = vgui.Create("DLabel",txt_frame)
	txt_label:SetPos(25,22)
	txt_label:SetText("Code")

	local txt_choice = vgui.Create("DComboBox",txt_frame)
	txt_choice:SetPos(25,40)
	txt_choice:SetSize(270,20)
	for k,v in pairs(Police_Waypoint_RequestTypes) do
		txt_choice:AddChoice(v[1])
	end
	txt_choice:ChooseOptionID(1)
	
	local txt_button = vgui.Create("DButton",txt_frame)
	txt_button:SetPos(25,150)
	txt_button:SetText("Confirm")
	txt_button:SetSize(80,20)
	txt_button.DoClick = function()
		print(txt_choice:GetSelectedID())
		txt_frame:Close()
		net.Start("polis_waypoint_req_income")
			net.WriteInt(txt_choice:GetSelectedID(),32)
		net.SendToServer()
	end
	txt_button.Think = function()
		local playa = LocalPlayer()
		if not playa:Alive() or not playa:isCP() and not Police_Waypoint_ExtraJobs[playa:getJobTable().command] or lastwaypoint > CurTime() then
			txt_button:SetDisabled(true)
			if lastwaypoint > CurTime() then
				txt_button:SetText("Confirm ("..math.Round(lastwaypoint - CurTime())..")")
			end
		else
			txt_button:SetDisabled(false)
			txt_button:SetText("Confirm")
		end
	end
	
	local txt_button = vgui.Create("DButton",txt_frame)
	txt_button:SetPos(215,150)
	txt_button:SetText("Cancel")
	txt_button:SetSize(80,20)
	txt_button.DoClick = function()
		txt_frame:Close()
	end
end)