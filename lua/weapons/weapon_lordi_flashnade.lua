--Holy shit, a flashbang weapon with just one script!
game.AddAmmoType({
	name = "flashnade_ammo",
	dmgtype = DMG_BLAST
})
if CLIENT then language.Add("flashnade_ammo_ammo","Flashbangs") end
SWEP.ViewModelFOV = 53
SWEP.ViewModel = "models/weapons/cstrike/c_eq_flashbang.mdl"
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_eq_flashbang.mdl"
SWEP.Slot = 4
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.DrawCrosshair = false
SWEP.DrawAmmo = true
SWEP.PrintName = "Flashbang"
SWEP.Author = "LordiAnders"
SWEP.Category = "LordiAnders's Weapons"
 
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Ammo = "flashnade_ammo"
SWEP.Primary.Automatic = false
SWEP.ThrowMult = 3750
SWEP.ThrowVect = Vector(0,0,0)
 
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1

function SWEP:Initialize()
	self:SetHoldType("grenade")
end

function SWEP:Deploy()
	self:SendWeaponAnim(ACT_VM_DRAW)
	self:SetDeploySpeed(self.Owner:GetViewModel():SequenceDuration())
end

function SWEP:IsCurEquipped()
	if IsValid(self) and IsValid(self.Owner) then
		local wep = self.Owner:GetActiveWeapon()
		if IsValid(wep) and wep == self then
			return true
		end
	end
	return false
end

--[[if CLIENT then
	local wirframe = Material("models/wireframe")
	hook.Add("PostDrawOpaqueRenderables","flashnade_debug",function()
		for k,v in pairs(ents.FindByClass("prop_physics")) do
			if v:GetModel() == "models/weapons/w_eq_flashbang_thrown.mdl" then
				for c,p in pairs(player.GetAll()) do
					render.DrawLine(LocalPlayer() == p and p:EyePos() + Vector(0,0,-10) or p:EyePos(),v:GetPos(),color_white)
				end
				render.SetMaterial(wirframe)
				render.DrawSphere(v:GetPos(),850,20,20,color_white)
				local trace = util.TraceHull( {
					start = LocalPlayer():EyePos(),
					endpos = LocalPlayer():EyePos() + LocalPlayer():GetAimVector() * 500,
					ignoreworld = true,
					filter = function(ent) if v:GetModel() == "models/weapons/w_eq_flashbang_thrown.mdl" then return true end end,
					mins = Vector( -100, -100, -100 ),
					maxs = Vector( 100, 100, 100 )
				} )
				render.DrawWireframeBox(trace.HitPos,Angle(0,0,0),Vector( -180, -180, -180 ),Vector( 180, 180, 180 ),(trace.Hit and Color(255,0,0) or color_white),true)
			end
		end
	end)
	--hook.Remove("PostDrawOpaqueRenderables","flashnade_debug")
end]] --Debugging

local mat_white = {
	[MAT_GLASS] = true,
	[MAT_GRATE] = true
}
local ent_black = {
	["prop_door_rotating"] = true,
	["func_door"] = true
}
function SWEP:Think()
	if IsValid(self.Owner) then
		if self.ThrowTime and self.ThrowTime <= CurTime() and (not self.Owner:KeyDown(IN_ATTACK) and not self.Owner:KeyDown(IN_ATTACK2) or (self.ThrowTime - CurTime()) <= -4) then
			local flashtime = 4 + (self.ThrowTime - CurTime())
			self.ThrowTime = nil
			self:SendWeaponAnim(ACT_VM_THROW)
			self.Owner:SetAnimation(PLAYER_ATTACK1)
			if SERVER then
				timer.Simple(0.3,function()
					if not IsValid(self) or not IsValid(self.Owner) then return end
					if self:Ammo1() <= 0 then return end
					self.Owner:EmitSound("weapons/slam/throw.wav",65,235)
					self:TakePrimaryAmmo(1)
					local flashprop = ents.Create("prop_physics")
					flashprop:SetModel("models/weapons/w_eq_flashbang_thrown.mdl")
					flashprop:SetPos(self.Owner:EyePos() + self.Owner:GetAimVector() * 20 + self.ThrowVect)
					flashprop:SetAngles(self.Owner:EyeAngles())
					flashprop:SetCollisionGroup(COLLISION_GROUP_WEAPON)
					flashprop:Spawn()
					flashprop:GetPhysicsObject():ApplyForceCenter(self.Owner:GetAimVector() * self.ThrowMult - (self.ThrowVect * 60))
					flashprop.IsFlashNade = true
					flashprop:AddCallback("PhysicsCollide",function(ent,dat)
						if dat.Speed > 70 then ent:EmitSound("weapons/flashbang/grenade_hit1.wav") end 
						ent:GetPhysicsObject():ApplyForceCenter(-dat.OurOldVelocity * 1.9)
					end)
					timer.Simple(flashtime,function()
						if not IsValid(flashprop) then return end
						for k,v in pairs(player.GetAll()) do
							local dist = v:EyePos():DistToSqr(flashprop:GetPos())
							if dist <= 722980 then
								local tr = util.TraceLine({
									start = v:EyePos(),
									endpos = flashprop:GetPos(),
									filter = v
								})
								if mat_white[tr.MatType] or IsValid(tr.Entity) and not ent_black[tr.Entity:GetClass()] then
									local trace = util.TraceHull( {
										start = v:EyePos(),
										endpos = v:EyePos() + v:GetAimVector() * 500,
										mins = Vector( -100, -100, -100 ),
										maxs = Vector( 100, 100, 100 ),
										ignoreworld = true,
										filter = function(ent) if ent.IsFlashNade then return true end end
									} )
									local backturned = (not IsValid(trace.Entity)) --There are probably better ways to do this, but I can't be bothered with it.
									v:ScreenFade(SCREENFADE.IN,backturned and Color(255,255,255,125) or nil,backturned and 0.65 or 1.25,math.Clamp(backturned and 0 or 5 - (dist * 0.000014),0,5))
									timer.Simple(0.1,function() if IsValid(v) then v:SetDSP(35,true) end end)
								end
							end
						end
						
						local effectData = EffectData()
						effectData:SetOrigin(flashprop:GetPos())
						util.Effect("camera_flash", effectData)
						
						flashprop:EmitSound("Flashbang.Explode")
						flashprop:Remove()
					end)
				end)
			end
			timer.Simple(0.7,function()
				if not IsValid(self) then return end
				if SERVER and self:Ammo1() <= 0 then
					self:Remove()
				else
					local CT = CurTime()
					self:SetNextPrimaryFire(CT + 0.8)
					self:SetNextSecondaryFire(CT + 0.8)
					if self:IsCurEquipped() then
						self:SendWeaponAnim(ACT_VM_DRAW)
					end
				end
			end)
		end
	end
end

function SWEP:PrimaryAttack()
	local CT = CurTime()
	self:SendWeaponAnim(ACT_VM_PULLPIN)
	self:SetNextPrimaryFire(CT + 9000)
	self:SetNextSecondaryFire(CT + 9000)
	self.ThrowTime = CurTime() + 0.95
	self.ThrowMult = 3750
	self.ThrowVect = Vector(0,0,0)
end

function SWEP:SecondaryAttack()
	local CT = CurTime()
	self:SendWeaponAnim(ACT_VM_PULLPIN)
	self:SetNextPrimaryFire(CT + 9000)
	self:SetNextSecondaryFire(CT + 9000)
	self.ThrowTime = CT + 0.95
	self.ThrowMult = 1200
	self.ThrowVect = Vector(0,0,-14)
end

-- function SWEP:Holster()
-- 	if self:GetNextPrimaryFire() > CurTime() then return false end
-- 	return true
-- end

function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}
	self.AmmoDisplay.PrimaryClip = self:Ammo1()
	return self.AmmoDisplay
end

function SWEP:DrawWeaponSelection(x, y, wide, tall, alpha)
	draw.DrawText("P","CSSelectIcons",x + wide/2,y + tall*0.2,Color(255, 210, 0, alpha),TEXT_ALIGN_CENTER)
end