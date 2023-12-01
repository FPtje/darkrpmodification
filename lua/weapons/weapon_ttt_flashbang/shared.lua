if (SERVER) then --the init.lua stuff goes in here
   AddCSLuaFile ("shared.lua")
end

if (CLIENT) then --the init.lua stuff goes in here


	SWEP.PrintName = "Flashbang"
	SWEP.SlotPos = 2
	SWEP.IconLetter			= "g"
	SWEP.NameOfSWEP			= "weapon_ttt_flashbang" --always make this the name of the folder the SWEP is in.
	
	SWEP.EquipMenuData = {
	   type = "item_weapon",
	   desc = "Best Flash you've/ll ever see/n - NOT FOR ISA!"
   };

end

SWEP.Primary.NumNades = 3 --number of throwable grenades at your disposal
SWEP.Grenade = "ttt_thrownflashbang" --self explanitory

local here = true
SWEP.Author = "Converted by Porter"

SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.Base = "weapon_tttbasegrenade"

SWEP.ViewModel			= "models/weapons/v_eq_flashbang.mdl"
SWEP.WorldModel			= "models/weapons/w_eq_flashbang.mdl"
SWEP.ViewModelFlip		= true
SWEP.AutoSwitchFrom		= true

SWEP.DrawCrosshair		= false

SWEP.IsGrenade = true
SWEP.NoSights = true

SWEP.was_thrown = false

SWEP.Kind = WEAPON_EQUIP2
SWEP.CanBuy = {ROLE_TRAITOR} -- only traitors can buy
SWEP.LimitedStock = false
SWEP.Icon = "VGUI/ttt/icon_nades"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

function SWEP:GetGrenadeName()
   return "ttt_thrownflashbang"
end