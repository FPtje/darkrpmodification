if SERVER then
	AddCSLuaFile("shared.lua")
end

if CLIENT then
	SWEP.PrintName = "Steel Lockpick"
	SWEP.Slot = 5
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

-- Variables that are used on both client and server

SWEP.Author = "Rickster"
SWEP.Instructions = "Left click to pick a lock"
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.ViewModel = Model("models/weapons/v_crowbar.mdl")
SWEP.WorldModel = Model("models/weapons/w_crowbar.mdl")

SWEP.Spawnable = false
SWEP.AdminSpawnable = true

SWEP.Sound = Sound("physics/wood/wood_box_impact_hard3.wav")

SWEP.Primary.ClipSize = -1      -- Size of a clip
SWEP.Primary.DefaultClip = 0        -- Default number of bullets in a clip
SWEP.Primary.Automatic = false      -- Automatic/Semi Auto
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1        -- Size of a clip
SWEP.Secondary.DefaultClip = -1     -- Default number of bullets in a clip
SWEP.Secondary.Automatic = false        -- Automatic/Semi Auto
SWEP.Secondary.Ammo = ""
SWEP.LockPickTime = 15

/*---------------------------------------------------------
Name: SWEP:Initialize()
Desc: Called when the weapon is first loaded
---------------------------------------------------------*/
function SWEP:Initialize()
	self:SetHoldType("normal")
end

/*---------------------------------------------------------
Name: SWEP:PrimaryAttack()
Desc: +attack1 has been pressed
---------------------------------------------------------*/
function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire(CurTime() + 2)
	if self.IsLockPicking then return end

	local trace = self.Owner:GetEyeTrace()
	local e = trace.Entity
	hook.Call("lockpickStarted", nil, self:GetOwner(), e, trace)
	if(e:GetClass() == "func_movelinear")then return end
	if SERVER and e.isFadingDoor then
		net.Start("IsFadingDoor")
		net.WriteEntity(e)
		net.Send(self.Owner)
	end -- The fading door tool only sets isFadingDoor serverside, for the lockpick to work we need this to be set clientside too.
	if not IsValid(e) or trace.HitPos:Distance(self.Owner:GetShootPos()) > 100 or
		(not e:isDoor() and not e:IsVehicle() and not string.find(string.lower(e:GetClass()), "vehicle") and not e.isFadingDoor) then
		return
	end

	if not GAMEMODE.Config.canforcedooropen and e.DoorData.NonOwnable then
		return
	end

	self.IsLockPicking = true
	self.StartPick = CurTime()
	if SERVER then
		self.LockPickTime = math.Rand(15, 20)

		if(HSkills)then
			local treeName = HSkills:GetCurrentTree(self.Owner)
			local pickSpeed, pickBonus = self.Owner:GetTreeSkill(treeName, "lockpicking")

			self.LockPickTime = self.LockPickTime - pickBonus
		end

		net.Start("lockpick_time")
		net.WriteEntity(self)
		net.WriteUInt(self.LockPickTime, 32)
		net.Send(self.Owner)
	end

	self.EndPick = CurTime() + self.LockPickTime

	self:SetHoldType("pistol")

	if SERVER then
		timer.Create("LockPickSounds", 1, self.LockPickTime, function()
			if not IsValid(self) then return end
			local snd = {1,3,4}
			self:EmitSound("weapons/357/357_reload".. tostring(snd[math.random(1, #snd)]) ..".wav", 50, 100)
		end)
	elseif CLIENT then
		self.Dots = self.Dots or ""
		timer.Create("LockPickDots", 0.5, 0, function()
			if not self:IsValid() then timer.Destroy("LockPickDots") return end
			local len = string.len(self.Dots)
			local dots = {[0]=".", [1]="..", [2]="...", [3]=""}
			self.Dots = dots[len]
		end)
	end
end

function SWEP:Holster()
	self.IsLockPicking = false
	if SERVER then timer.Destroy("LockPickSounds") end
	if CLIENT then timer.Destroy("LockPickDots") end
	return true
end

function SWEP:Succeed()
	self.IsLockPicking = false
	self:SetHoldType("normal")
	local trace = self.Owner:GetEyeTrace()
	if trace.Entity.isFadingDoor and trace.Entity.fadeActivate then
		if not trace.Entity.fadeActive then
			trace.Entity:fadeActivate()
			timer.Simple(5, function() if trace.Entity.fadeActive then trace.Entity:fadeDeactivate() end end)
		end
	elseif IsValid(trace.Entity) and trace.Entity.Fire then
		trace.Entity:Fire("unlock", "", .5)
		trace.Entity:Fire("open", "", .6)
		trace.Entity:Fire("setanimation","open",.6)
	end
	hook.Call("onLockpickCompleted", nil, self.Owner, true, trace.Entity)
	if SERVER then timer.Destroy("LockPickSounds") end
	if CLIENT then timer.Destroy("LockPickDots") end
end

function SWEP:Fail()
	self.IsLockPicking = false
	self:SetHoldType("normal")
	if SERVER then timer.Destroy("LockPickSounds") end
	if CLIENT then timer.Destroy("LockPickDots") end
end

function SWEP:Think()
	if self.IsLockPicking then
		local trace = self.Owner:GetEyeTrace()
		if not IsValid(trace.Entity) then
			self:Fail()
		end
		if trace.HitPos:Distance(self.Owner:GetShootPos()) > 100 or (not trace.Entity:isDoor() and not trace.Entity:IsVehicle() and not string.find(string.lower(trace.Entity:GetClass()), "vehicle") and not trace.Entity.isFadingDoor) then
			self:Fail()
		end
		if self.EndPick <= CurTime() then
			self:Succeed()
		end
	end
end

function SWEP:DrawHUD()
	if self.IsLockPicking then
		self.Dots = self.Dots or ""
		local w = ScrW()
		local h = ScrH()
		local x,y,width,height = w/2-w/10, h/ 2, w/5, h/15
		draw.RoundedBox(8, x, y, width, height, Color(10,10,10,120))

		local time = self.EndPick - self.StartPick
		local curtime = CurTime() - self.StartPick
		local status = curtime/time
		local BarWidth = status * (width - 16) + 8
		draw.RoundedBox(8, x+8, y+8, BarWidth, height - 16, Color(255-(status*255), 0+(status*255), 0, 255))

		draw.SimpleText("Picking lock"..self.Dots, "Trebuchet24", w/2, h/2 + height/2, Color(255,255,255,255), 1, 1)
	end
end

function SWEP:SecondaryAttack()
	self:PrimaryAttack()
end