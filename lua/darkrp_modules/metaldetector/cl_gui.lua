local Entity
local hGUI = hGUI

local Panel = hGUI.CreateMenu(false)
local Panel2 = hGUI.CreateMenu(false)

net.Receive("MetalDetectorNet78376",
	function(Length)
		Entity = net.ReadEntity()
        Panel:SetVisible(true)
	end
)

Panel:CreateLabel("Metal detector")
Panel:CreateButton("Remove",
	function()
		Panel:SetVisible(false)
		Panel2:SetVisible(true)
	end
, "delete")

Panel:CreateButton("Close panel",
	function()
		Panel:SetVisible(false)
	end
, "cross")

Panel2:CreateLabel("Are you sure?")

Panel2:CreateButton("Accept",
	function()
		Panel2:SetVisible(false)

		net.Start("MetalDetectorNet78376")
			net.WriteEntity(Entity)
		net.SendToServer()
	end
,"accept")

Panel2:CreateButton("Cancel",
	function()
		Panel2:SetVisible(false)
		Panel:SetVisible(true)
	end
, "cancel")