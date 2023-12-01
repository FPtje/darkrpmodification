AddCSLuaFile()

ENT.Base      = "base_gmodentity"
ENT.Type      = "anim"
ENT.Spawnable = false
ENT.AdminOnly = false
ENT.PrintName = "Base container"
ENT.Author    = "husho"

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "OwningEntity")
	
	self:NetworkVar("Int", 0, "Amount")
	self:NetworkVar("Int", 1, "Price")
	self:NetworkVar("Int", 2, "AmountToGive")

	self:NetworkVar("String", 0, "Type")
end

function ENT:Setowning_ent(Entity)
	self:SetOwningEntity(Entity)
end
	
function ENT:Getowning_ent()
	return self:GetOwningEntity()
end

function GetWeaponNameFromType(Type)
	if type(Type) == "string" then
		if weapons.Get(Type) then
			return weapons.Get(Type).PrintName
		end
	end
end

function GetAmmoNameFromType(Type)
	for _, v in pairs(GAMEMODE.AmmoTypes) do
		if v.ammoType ~= Type then continue end
		return v.name
	end
	return Type
end

if SERVER then
	local function CreateShipment(Entity, Player)
		local shipID

		for k, v in pairs(CustomShipments) do
			if Entity:GetType() == v.entity then shipID = k end
		end

		local crate = ents.Create("spawned_shipment")
		crate.SID = Player.SID
		crate:SetPos(Entity:GetPos())
		crate.nodupe = true
		crate:Setcontents(shipID)
		crate:Setcount(Entity:GetAmount())
		crate:Spawn()
		crate:SetPlayer(Player)
		crate.clip1 = Entity.WeaponData.clip1
		crate.clip2 = Entity.WeaponData.clip2
		crate.ammoadd = Entity.WeaponData.ammoadd or 0

		local phys = crate:GetPhysicsObject()
		phys:Wake()
	end

	util.AddNetworkString("ContainerNet76561197994496430")
	
	net.Receive("ContainerNet76561197994496430",
		function (Length, Player)
			local Entity = net.ReadEntity()
			local Action = net.ReadBit()
			if Action == 1 then
				local Price = net.ReadDouble()
				if Entity:GetOwningEntity() == Player and Price >= 0 then
					Entity:SetPrice(Price)
				end
			elseif Action == 0 then
				if Entity:GetOwningEntity() == Player then
					Entity:Remove()

					if Entity.WeaponContainer and Entity:GetAmount() > 0 and Entity:GetType() ~= "None" then
						CreateShipment(Entity, Player)
					end
				end
			end
		end
	)

	function ENT:Initialize()
		if self.AmmoContainer then
			self:SetModel("models/props_junk/wood_crate001a.mdl")
		end

		if self.WeaponContainer then
			self:SetModel("models/props_junk/wood_crate002a.mdl")
		end

		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:GetPhysicsObject():Wake()
		self:SetType("None")
		self:SetAmount(0)
		self:SetPrice(0)

		if self.AmmoContainer then
			self:SetAmountToGive(0)
		end

		self.EntityTouched = nil
		self.ContainerHealth = 25
	end

	function ENT:StartTouch(Entity)
		if not Entity.Touched then Entity.Touched = 0 end
		Entity.Touched = Entity.Touched + 1
	end
	
	function ENT:Touch(Entity)
		if self.AmmoContainer then
			if (Entity.PrintName == "Spawned Ammo" or Entity.Category == "M9K Ammunition" or Entity.Category == "FA:S 2.0 Ammo") and self.EntityTouched ~= Entity and Entity.Touched <= 1 then
				self.EntityTouched = Entity
				local Amount = self:GetAmount()
				local Type = self:GetType()

				if Type == "None" then
					Entity:Remove()
					self:SetType(Entity.ammoType or Entity.PrintName)
					self:SetAmount(Amount + 1)
					self:SetAmountToGive(Entity.amountGiven or Entity.Amount or 100)
				elseif Type == Entity.ammoType then
					Entity:Remove()
					self:SetAmount(Amount + 1)
				elseif Type == Entity.PrintName then
					Entity:Remove()
					self:SetAmount(Amount + 1) 
				end
			end
		end

		if self.WeaponContainer then
			if self.EntityTouched ~= Entity and Entity.Touched <= 1 then
				self.EntityTouched = Entity
				
				local Amount = self:GetAmount()
				local Type = self:GetType()
				self.WeaponData = {}

				if Entity.PrintName == "Spawned Weapon" then
					if Type == "None" then
						self.WeaponData.clip1 = Entity.clip1
						self.WeaponData.clip2 = Entity.clip2
						self.WeaponData.ammoadd = Entity.ammoadd or 0

						Entity:Remove()

						self:SetType(Entity:GetWeaponClass())
						self:SetAmount(Amount + Entity:Getamount())
					elseif Type == Entity:GetWeaponClass() then
						Entity:Remove()
						self:SetAmount(Amount + Entity:Getamount())
					end
				end
				if Entity.PrintName == "Shipment" and Entity.locked ~= true then
					local Contents = Entity:Getcontents()
					if Type == "None" then
						self.WeaponData.clip1 = Entity.clip1
						self.WeaponData.clip2 = Entity.clip2
						self.WeaponData.ammoadd = Entity.ammoadd or 0

						Entity:Remove()

						self:SetType(CustomShipments[Contents].entity)
						self:SetAmount(Amount + Entity:Getcount())
					elseif Type == CustomShipments[Contents].entity then
						Entity:Remove()
						self:SetAmount(Amount + Entity:Getcount())
					end
				end
			end
		end
	end

	function ENT:EndTouch(Entity)
		if not Entity.Touched then Entity.Touched = 0 return end
		Entity.Touched = Entity.Touched - 1
	end

	function ENT:Think()
		if not IsValid(self:GetOwningEntity()) then self:Remove() end
	
		if self:GetAmount() <= 0 then
			if self.AmmoContainer then
				self:SetAmountToGive(0)
			end

			self:SetType("None")
			self:SetAmount(0)
		end
	end

	function ENT:Use(Activator)
		if Activator ~= self:GetOwningEntity() then
			local Amount = self:GetAmount()
			local Price = self:GetPrice()
			local Type = self:GetType()
			if Amount > 0 and Price > 0 and Activator:canAfford(Price) then
				self:SetAmount(Amount - 1)
				Activator:addMoney(-Price)
				self:GetOwningEntity():addMoney(Price)

				if self.WeaponContainer then
					Activator:Give(Type)
					DarkRP.notify(self:GetOwningEntity(), 0, 4, Activator:GetName() .. " bought a weapon for " .. (Price or 0) .. "$")
					DarkRP.notify(Activator, 0, 4, "You bought a weapon for " .. (Price or 0) .. "$")
				end

				if self.AmmoContainer then
					Activator:GiveAmmo(self:GetAmountToGive(), Type)
					DarkRP.notify(self:GetOwningEntity(), 0, 4, Activator:GetName() .. " bought " .. (GetAmmoNameFromType(Type) or "") .. " for " .. (Price or 0) .. "$")
					DarkRP.notify(Activator, 0, 4, "You bought " .. (GetAmmoNameFromType(Type) or "") .. " for " .. (Price or 0) .. "$")
				end
			end
		else			
			net.Start("ContainerNet76561197994496430")
				net.WriteEntity(self)
			net.Send(Activator)
		end
	end


end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()

		if LocalPlayer():GetPos():Distance(self:GetPos()) >= ACS.GUIFadeDistance then return end
		
		local Angles = self:GetAngles()
		Angles:RotateAroundAxis(Angles:Up(), 90)
		Angles:RotateAroundAxis(Angles:Forward(), 90)
		
		local Owner = self:GetOwningEntity()

		cam.Start3D2D(self:GetPos() + (self:GetForward() * 20.5), Angles, 0.1)
			if self.WeaponContainer then
				draw.RoundedBox(0, -295, -158, 600, 315, ((self:GetAmount() > 0 and self:GetPrice() > 0) and Color(0, 140, 0, 200) or Color(140, 0, 0, 200)))
				
				draw.SimpleText(self.PrintName or "", "hBigCrates", 0, -153, Color(255, 255, 255, 255), 1, 0)
				draw.SimpleText((IsValid(Owner) and Owner:Nick()) or DarkRP.getPhrase("unknown") or "", "hSmallCrates", 0, -113, Color(255, 255, 255, 255), 1, 0)
					
				draw.SimpleText("Weapon: " .. (GetWeaponNameFromType(self:GetType() or "") or "None"), "hBigCrates", -280, -50, Color(255, 255, 255, 255), 0, 0)
				draw.SimpleText("Amount: " .. (self:GetAmount() or 0) .. " left", "hBigCrates", -280, 0, Color(255, 255, 255, 255), 0, 0)
				draw.SimpleText("Price: " .. (self:GetPrice() or 0) .. "$", "hBigCrates", -280, 50, Color(255, 255, 255, 255), 0, 0)
			end

			if self.AmmoContainer then
				draw.RoundedBox(0, -160, -158, 327, 315, ((self:GetAmount() > 0 and self:GetPrice() > 0) and Color(0, 140, 0, 200) or Color(140, 0, 0, 200)))
				
				draw.SimpleText(self.PrintName or "", "hBigCrates", 0, -153, Color(255, 255, 255, 255), 1, 0)
				draw.SimpleText((IsValid(Owner) and Owner:Nick()) or DarkRP.getPhrase("unknown") or "", "hSmallCrates", 0, -113, Color(255, 255, 255, 255), 1, 0)
				
				local Text = ""

				if GetAmmoNameFromType(self:GetType()) == "None" then
					Text = "Empty"
				else
					Text = GetAmmoNameFromType(self:GetType()) .. " (" .. self:GetAmountToGive() .. ")"
				end

				draw.SimpleText(Text, "hSmallCrates", -150, -50, Color(255, 255, 255, 255), 0, 0)
				draw.SimpleText("Amount: " .. self:GetAmount() .. " left", "hBigCrates", -150, 0, Color(255, 255, 255, 255), 0, 0)
				draw.SimpleText("Price: " .. self:GetPrice() .. "$", "hBigCrates", -150, 50, Color(255, 255, 255, 255), 0, 0)
			end
		cam.End3D2D()
	end
end