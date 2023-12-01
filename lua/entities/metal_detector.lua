AddCSLuaFile()

ENT.Base      = "base_gmodentity"
ENT.Type      = "anim"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.PrintName = "Metal detector"
ENT.Author    = "husho"

local BaseClass
if (WireLib) then
    BaseClass = "base_wire_entity"
else
    BaseClass = "base_gmodentity"
end
DEFINE_BASECLASS(BaseClass)

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "OwningEntity")
	self:NetworkVar("Int", 0, "State")
end

function ENT:Setowning_ent(Entity)
	self:SetOwningEntity(Entity)
end
	
function ENT:Getowning_ent()
	return self:GetOwningEntity()
end

if SERVER then
	util.AddNetworkString("MetalDetectorNet78376")

	net.Receive("MetalDetectorNet78376",
		function(Len, Player)
			local Entity = net.ReadEntity()
			if Player == Entity:GetOwningEntity() then
				Entity:Remove()
			end
		end
	)
	
	function HasRestrictedWeapons(Entity)

		local Weapons = Entity:GetWeapons()

		local MetalDetector = MetalDetector

		if MetalDetector.WhiteListEnabled then
			for _, w in pairs(Weapons) do
				if(GAMEMODE.Config.noStripWeapons and GAMEMODE.Config.noStripWeapons[w:GetClass()])then continue end
				if not MetalDetector.WhiteList[w:GetClass()] then return true end
			end
		else
			for _, w in pairs(Weapons) do
				if(GAMEMODE.Config.noStripWeapons and GAMEMODE.Config.noStripWeapons[w:GetClass()])then continue end
				for _, v in pairs(MetalDetector.BlackList) do
					if w:GetClass() == v then return true end
				end
			end
		end

		return false
	end

	function ENT:Initialize()
		self:SetModel("models/props_wasteland/interior_fence002e.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:GetPhysicsObject():EnableMotion(false)
		self:SetState(0)
		self.LastEntity = nil
		self.Ticks = 0
		self.Found = false
		if (WireLib) then
	        WireLib.CreateSpecialOutputs(self, {
	            "OnClear",
	            "OnDetect",
	            "OnAuthorized",
	            "OnAuthClear"
	        })
	    end
	end

	function ENT:UpdateWireOutputs( state )
	    if (not Wire_TriggerOutput) then return end
	    if state == 1 then
	    	Wire_TriggerOutput(self, "OnDetect", 1)
	    elseif state == 2 then
	    	Wire_TriggerOutput(self, "OnClear", 1)
	    	Wire_TriggerOutput(self, "OnAuthClear", 1)
		elseif state == 3 then
	   		Wire_TriggerOutput(self, "OnAuthorized", 1)
	   		Wire_TriggerOutput(self, "OnAuthClear", 1)
		elseif state == 4 then
	   		Wire_TriggerOutput(self, "OnClear", 1)
		else
			Wire_TriggerOutput(self, "OnDetect", 0)
			Wire_TriggerOutput(self, "OnClear", 0)
			Wire_TriggerOutput(self, "OnAuthorized", 0)
			Wire_TriggerOutput(self, "OnAuthClear", 0)
		end
	end

	function ENT:setState( state )
		self:SetState( state )
		self:UpdateWireOutputs( state )
	end
	
	function ENT:Use(Activator)
		if Activator == self:GetOwningEntity() then
			net.Start("MetalDetectorNet78376")
				net.WriteEntity(self)
			net.Send(Activator)
		end
	end
	
	function ENT:Think()
		self:NextThink(CurTime() + 0.32)
		BaseClass.Think( self )
		local OwnerEntity = self:GetOwningEntity()
		local FPPOwnerEntity, _ = self:CPPIGetOwner()

		if not IsValid(OwnerEntity) and not IsValid(FPPOwnerEntity) then
			self:Remove()
		elseif not IsValid(OwnerEntity) and IsValid(FPPOwnerEntity) then
			self:SetOwningEntity(FPPOwnerEntity)
		elseif IsValid(OwnerEntity) and not IsValid(FPPOwnerEntity) then
			self:CPPISetOwner(OwnerEntity)
		end

		local Position = self:GetPos()
	
		self.Ticks = self.Ticks + 1
	
		self.Found = false

		local entTable = ents.FindInSphere(Position, 16)
		
		for _, Entity in pairs( entTable ) do
			if self.LastEntity == Entity then self.Found = true end
		end
		
		if self.Ticks >= 5 and self.Found ~= true then
			self.Ticks = 0
			self.LastEntity = nil
			self:setState(0)
		end

		for _, Entity in pairs( entTable ) do
			if self.LastEntity ~= Entity and self ~= Entity then
				local MetalDetector = MetalDetector

				if Entity:IsPlayer() then
					self.LastEntity = Entity
					self.Ticks = 0
					if MetalDetector.GovTeams[team.GetName(Entity:Team())] != nil then 
						self:EmitSound("buttons/button3.wav", MetalDetector.DingSoundLevel, MetalDetector.DingPitchPercent)
						self:setState(3)
					else
						if Entity:getDarkRPVar("HasGunlicense") then
							self:EmitSound("buttons/button3.wav", MetalDetector.DingSoundLevel, MetalDetector.DingPitchPercent)
							self:setState(4)
							return
						end
						if HasRestrictedWeapons(Entity) then
							self:EmitSound("buttons/button8.wav", MetalDetector.BuzzSoundLevel, MetalDetector.BuzzPitchPercent)
							self:setState(1)
						else
							self:EmitSound("buttons/button3.wav", MetalDetector.DingSoundLevel, MetalDetector.DingPitchPercent)
							self:setState(2)
						end
					end
				elseif Entity.PrintName == "Spawned Weapon" or Entity.PrintName == "Shipment" or Entity.PrintName == "Spawned Ammo" or Entity.PrintName == "Ammo_6319" then
					self.LastEntity = Entity
					self.Ticks = 0
					self:EmitSound("buttons/button8.wav", MetalDetector.BuzzSoundLevel, MetalDetector.BuzzPitchPercent)
					self:setState(1)
				end
			end
			--return
		end
	end

	function ENT:OnRemove()
	    BaseClass.OnRemove( self )
	end
end

if CLIENT then
	surface.CreateFont( "metal_detector",
	{
		font		= "Default",
		size		= 70,
		weight		= 400
	})

	function ENT:Draw()
		self:DrawModel()

		if LocalPlayer():GetPos():Distance(self:GetPos()) >= MetalDetector.GUIFadeDistance then return end
		
		local Angles = self:GetAngles()

		Angles:RotateAroundAxis(Angles:Up(), 90)
		Angles:RotateAroundAxis(Angles:Forward(), 90)
		--Angles:RotateAroundAxis(Angles:Right(), 180)
		
		local State = self:GetState()
    
		cam.Start3D2D(self:GetPos() + (self:GetUp() * 11), Angles, 0.1)
			draw.RoundedBox(0, -230, -490, 450, 130, (((State == 0) and Color(0, 0, 0, 255)) or ((State == 1) and Color(255, 0, 0, 255)) or ((State == 2) and Color(0, 255, 0, 255)) or ((State == 3) and Color(0, 0, 255, 255)) or ((State == 4) and Color(255, 255, 0, 255)) ))
			--draw.SimpleTextOutlined( (State == 0 and "" ) or (State == 1 and "DETECTED" ) or (State == 2 and "CLEAR" ) or (State == 3 and "AUTHORIZED" ), "metal_detector", 0, -425, Color( 255, 255, 255 ), 1, 1, 2, Color( 0, 0, 0 ) )
		cam.End3D2D()
		
		cam.Start3D2D(self:GetPos() + (self:GetUp() * 11) + (self:GetForward() * 0.2), Angles, 0.1)
			draw.RoundedBox(0, -230, -490, 450, 130, (((State == 0) and Color(0, 0, 0, 255)) or ((State == 1) and Color(255, 0, 0, 255)) or ((State == 2) and Color(0, 255, 0, 255))  or ((State == 3) and Color(0, 0, 255, 255)) or ((State == 4) and Color(255, 255, 0, 255)) ))
			--draw.SimpleTextOutlined( (State == 0 and "" ) or (State == 1 and "DETECTED" ) or (State == 2 and "CLEAR" ) or (State == 3 and "AUTHORIZED" ), "metal_detector", 0, -425, Color( 255, 255, 255 ), 1, 1, 2, Color( 0, 0, 0 ) )
		cam.End3D2D()
		
		cam.Start3D2D(self:GetPos() + (self:GetUp() * 11) + (self:GetForward() * 1.7), Angles, 0.1)
			local Owner = self:GetOwningEntity()
			Owner = (IsValid(Owner) and Owner:Nick()) or DarkRP.getPhrase("unknown")
			surface.SetFont("HUDNumber5")
			local TextWidth = surface.GetTextSize(Owner)
			draw.WordBox(2, -TextWidth * 0.5 + 275, -30, Owner, "HUDNumber5", Color(140, 0, 0, 100), Color(255, 255, 255, 255))
		cam.End3D2D()
	end
end