AddCSLuaFile()

SWEP.PrintName = "Disguise Kit"
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.Base = "weapon_base"

SWEP.Author = "legitdood"
SWEP.Instructions = ""
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IconLetter = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"
SWEP.WorldModel	= ""

SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModel			= "models/weapons/v_c4.mdl"
SWEP.WorldModel			= "models/weapons/w_c4.mdl"

SWEP.Category = "Ultimate Disguise Kit"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""
SWEP.IdleStance = "slam"

function SWEP:Initialize()
	self:SetHoldType(self.IdleStance)
end

function SWEP:Deploy()
	return true
end

function SWEP:Holster()
	if not SERVER then return true end
	
	self.Owner:DrawViewModel(true)
	self.Owner:DrawWorldModel(true)

	return true
end

function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire(0.6)
	if (!SERVER) then return end
	local ply = self.Owner
	ply.LastDisguise = ply.LastDisguise or (CurTime() - DISGUISE_KIT_COOLDOWN)
	net.Start("DisguiseKitOpen")
		net.WriteTable({disguises = util.JSONToTable(file.Read("disguise_teams.txt")), timeleft = math.floor((CurTime() - ply.LastDisguise)),})
	net.Send(ply)
end

function SWEP:SecondaryAttack()
	return true
end

function SWEP:ShouldDropOnDie()
	return false
end -- dwhjkdnaw
