hGUI = hGUI or {}

function hGUI.CreateMenu(Visible)
	local Menu = vgui.Create("DFrame")

	Menu.ElementId = Menu.ElementId or 0
	Menu.Extra = 0
	Menu:SetSize(300, 160)
	Menu:SetTitle("")
	Menu:SetDraggable(false)
	Menu:Center()

	function Menu:Paint(W, H)
		draw.RoundedBox(8, 0, 0, W, H, Color(60, 60, 60, 170))
	end

	function Menu:UpdatePosSize(Extra)
		if Extra then Menu.Extra = Menu.Extra + Extra end

		Menu:SetSize(300, 14 + Menu.ElementId * 60 + Menu.ElementId * 14 + Menu.Extra)
		Menu:Center()
	end
	
	function Menu:CreateButton(Text, Action, Icon)
		local Button = vgui.Create("DButton")
		Button:SetParent(Menu)
		Button:SetText("")
		Button:SetPos(10, 14 + Menu.ElementId * 60 + Menu.ElementId * 14 + Menu.Extra)
		Button:SetSize(280, 60)
		Button.DoClick = Action
		Button.CustomColor = Color(255, 255, 255, 255)
		Button.Text = Text

		local Icon = Material("icon16/" .. Icon .. ".png")
		   
		function Button:Paint(W, H)
			if not self:IsHovered() then
				draw.RoundedBox(8, 0, 0, W, H, Color(20, 20, 20, 255))
				draw.SimpleText(Button.Text, "Trebuchet24", W / 2, H / 2, self.CustomColor, 1, 1)
				
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetMaterial(Icon)
				surface.DrawTexturedRect(11, H / 2 - 8, 16, 16)
				surface.DrawTexturedRect(W - 11 - 16, H / 2 - 8, 16, 16)
			else
				draw.RoundedBox(8, 0, 0, W, H, Color(100, 100, 100, 255))
				draw.SimpleText(Button.Text, "Trebuchet24", W / 2, H / 2, self.CustomColor, 1, 1)
				
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetMaterial(Icon)
				surface.DrawTexturedRect(11, H / 2 - 8, 16, 16)
				surface.DrawTexturedRect(W - 11 - 16, H / 2 - 8, 16, 16)
			end
		end
		
		Menu.ElementId = Menu.ElementId + 1
		Menu:UpdatePosSize()
		
		return Button
	end
	
	function Menu:Remove(Element)
		Element:Remove()

		Menu.ElementId = Menu.ElementId - 1
		Menu:UpdatePosSize()
	end

	function Menu:CreateTextEntry()
		local TextEntry = vgui.Create("DTextEntry")
		TextEntry:SetParent(Menu)
		TextEntry:SetPos(30, 28 + Menu.ElementId * 60 + Menu.ElementId * 14 + Menu.Extra)
		TextEntry:SetSize(240, 30)
		TextEntry:SetText("")
		
		Menu.ElementId = Menu.ElementId + 1
		Menu:UpdatePosSize()

		return TextEntry
	end
	
	function Menu:CreateLabel(Text)
		local Label = vgui.Create("DLabel")
		Label:SetParent(Menu)
		Label:SetPos(20, 33 + Menu.ElementId * 60 + Menu.ElementId * 14 + Menu.Extra)
		Label:SetSize(260, 30)
		Label:SetText(Text)
		Label:SetFont("Trebuchet24")
		Label:SetTextColor(Color(255, 255, 255, 255))
		Label:SetContentAlignment(5)

		Menu.ElementId = Menu.ElementId + 1
		Menu:UpdatePosSize()
		
		return Label
	end
	
	function Menu:CreateColorPicker()
		local ColorPicker = vgui.Create("DColorMixer")
		ColorPicker:SetParent(Menu)
		ColorPicker:SetPos(20, 33 + Menu.ElementId * 60 + Menu.ElementId * 14 + Menu.Extra)
		ColorPicker:SetSize(260, 200)

		Menu.ElementId = Menu.ElementId + 1
		Menu:UpdatePosSize(170)

		return ColorPicker
	end

	Menu:ShowCloseButton(false)
	Menu:SetVisible(Visible)
	Menu:MakePopup()
	
	return Menu
end