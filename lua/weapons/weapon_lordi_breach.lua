SWEP.ViewModelFOV = 53
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/c_slam.mdl" 
SWEP.WorldModel = "models/weapons/w_slam.mdl" 
SWEP.UseHands = true
SWEP.AutoSwitchTo = true 
SWEP.Slot = 4 
SWEP.HoldType = "slam" 
SWEP.PrintName = "Door Charge"  
SWEP.Author = "LordiAnders" 
SWEP.Spawnable = true  
SWEP.AutoSwitchFrom = false 
SWEP.FiresUnderwater = true 
SWEP.Weight = 5 
SWEP.DrawCrosshair = true 
SWEP.SlotPos = 0 
SWEP.DrawAmmo = false  
SWEP.Instructions = ""   
SWEP.Contact = ""  
SWEP.Purpose = "" 
SWEP.base = "weapon_base"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

SWEP.Primary.Ammo = "none"
SWEP.Primary.Automatic = false
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.Ammo = "none"

function SWEP:Deploy()
	self:SendWeaponAnim(ACT_SLAM_TRIPMINE_DRAW)
end

hook.Add("canKeysUnlock","door_charge_disallow_keys",function(ply,ent)
	if ent.IsAboutToBlow then
		return false
	end
end)

hook.Add("canKeysLock","door_charge_disallow_keys",function(ply,ent)
	if ent.IsAboutToBlow then
		return false
	end
end)

function SWEP:PrimaryAttack()
	local trace = self.Owner:GetEyeTrace()
	if trace.Entity:IsValid() and trace.Entity:GetClass() and trace.Entity:GetClass() == "prop_door_rotating" and not trace.Entity.IsAboutToBlow and trace.HitPos:Distance(self.Owner:GetPos()) < 75 then
	self:SendWeaponAnim(ACT_SLAM_TRIPMINE_ATTACH)
	if SERVER then
	timer.Simple(0.5,function()
		if not IsValid(self) or not IsValid(self.Owner) then return end
		self.Owner:StripWeapon(self:GetClass())
		local door_charge = ents.Create("prop_physics")
		door_charge:SetModel("models/weapons/w_slam.mdl")
		door_charge:SetPos(trace.HitPos + (trace.HitNormal * 2))
		door_charge:SetAngles(trace.HitNormal:Angle() - Angle(270,180,180))
		door_charge:Spawn()
		door_charge:GetPhysicsObject():EnableMotion(false)
		
		door_charge:EmitSound("npc/roller/blade_cut.wav")
		door_charge:EmitSound("weapons/slam/mine_mode.wav")
		door_charge:EmitSound("weapons/c4/c4_plant.wav")
		
		trace.Entity:Fire("lock")

		trace.Entity.IsAboutToBlow = true

		timer.Simple(2.5,function()
		if not IsValid(door_charge) then return end
		door_charge:EmitSound("buttons/blip2.wav",60,125)
		local beep_pitch = 100
		timer.Create("beep_beep_beep"..door_charge:EntIndex(),0.25,20,function()
			if not IsValid(door_charge) then return end
			door_charge:EmitSound("buttons/button16.wav",60,beep_pitch)
			beep_pitch = beep_pitch + 2.5
		end)
		
		timer.Simple(5,function()
		if not IsValid(door_charge) then return end
		
		local effectdata = EffectData()
		effectdata:SetOrigin(door_charge:GetPos())
		effectdata:SetScale(1)
		util.Effect("Explosion",effectdata)	
		
		door_charge:Remove()
		trace.Entity.IsAboutToBlow = false
		trace.Entity:Fire("unlock")
		trace.Entity:Fire("open")
		
		trace.Entity:SetNotSolid(true)
		trace.Entity:SetNoDraw(true)
		
		--Bit of madcow stuff here... :L
		
		local ent = ents.Create("prop_physics")
		
		trace.Entity:EmitSound("ambient/explosions/explode_4.wav",80)

		ent:SetPos(trace.Entity:GetPos())
		ent:SetAngles(trace.Entity:GetAngles())
		ent:SetModel(trace.Entity:GetModel())
		
		if trace.Entity:GetSkin() then
			ent:SetSkin(trace.Entity:GetSkin())
		end

		ent:Spawn()
		
		ent:GetPhysicsObject():ApplyForceCenter( door_charge:GetAngles():Up() * -10000 )
		
		timer.Simple(25,function()
			if ent:IsValid() then
				ent:Remove()
			end
			trace.Entity:SetNotSolid(false)
			trace.Entity:SetNoDraw(false)
		end)
		end)
		end)
	end)
	end
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:DrawWeaponSelection(x, y, wide, tall, alpha)
	draw.DrawText("o","WeaponIcons",x + wide/2,y + tall*0.2,Color(255, 210, 0, alpha),TEXT_ALIGN_CENTER)
end