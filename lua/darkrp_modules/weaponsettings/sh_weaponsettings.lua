-- Ignore these two lines:
local weapon = weapons.GetStored
local function edit()
--[[
---------------------------------------------------------------------------
Weapon setting changer module
---------------------------------------------------------------------------

This module allows you to change the settings of weapons. Here's how it works.
Per weapon and setting a line is added in this format:
weapon "WEAPON CLASS NAME HERE".SETTING_HERE = VALUE_HERE



IMPORTANT:
    - Note the quotation marks around the weapon class name!
    - Note the '.' between the class name and the setting!
    - Casing MATTERS. PrintName IS NOT THE SAME AS printname!
    - CHANGING THE SETTINGS IS NOT RECODING THE WEAPON. PLEASE LEAVE THE AUTHORS FIELD INTACT. THANK YOU.
    - Technically you can set any field of the weapon. Advanced users can even override e.g. PrimaryAttack with this.
	- This system is not limited to weapons that come with the DarkRP gamemode. 

Examples:

-- This essentially works by replacing "SWEP" at the start of each setting like "SWEP.Primary.Ammo = "pistol""
with your customization in this file being "weapon_deagle2".Primary.Ammo = "ar2"

-- Set the printname of the stunstick to "bash baton". Note: the quotation marks are important!
weapon "stunstick".PrintName = "Bash baton"

-- Set the instructions of the arrest baton. Note the quotation marks! Also, the '\n' is an enter.
weapon "arrest_stick".Instructions = "Left click to arrest\nRight click to switch batons"

-- Set the damage of the p228 to 20 per shot. Note: NO quotes around 20 because it's just a number.
weapon "weapon_p2282".Primary.Damage = 20


LIST OF DEFAULT DARKRP WEAPONS:
The class names of the default DarkRP weapons are listed on this page:
https://github.com/FPtje/DarkRP/tree/master/entities/weapons 

You can find extra documentation for weapon functions here on this page: 
https://github.com/FPtje/darkrpmodification/blob/master/lua/weapons/weapon_ak47custom/shared.lua

Note that it's the folder names that matter here(the folders that contain the shared.lua for the weapons), e.g. keys, med_kit, door_ram, weapon_m42 etc.

SOME EXAMPLE SETTINGS THAT CAN BE CHANGED USING THIS METHOD:
    - PrintName
    - Instructions
    - Contact
    - Purpose
    - Category
    - Recoil
    - Damage
    - NumShots
    - Cone
    - ClipSize
    - Delay
    - DefaultClip

This list is not complete.

-- ADD WEAPON SETTINGS BELOW THIS LINE
]] -----------------------------------------


--------------------------------------------
-- ADD WEAPON SETTINGS ABOVE THIS LINE
-- Also ignore the lines below. They are needed to make this work.
end
hook.Add("OnGamemodeLoaded", "weaponsettings", edit)
hook.Add("OnReloaded", "weaponsettings", edit)
