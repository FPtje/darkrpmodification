--[[---------------------------------------------------------------------------
Here's an example weapon that you can edit
---------------------------------------------------------------------------]]
AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "AK47" -- The name that shows in the scroll menu and when you hover over the gun in the q-menu.
    SWEP.Author = "DarkRP Developers and <Name here>" -- Author Name.
    SWEP.Slot = 3 -- In which tab in the scroll menu the weapon shows up in. 1 being the far left and 9 being the farthest right.
    SWEP.SlotPos = 0 -- If you have 300 weapons all in the same slot you could organize each of them with a uniqe number all the way up to 300. Would keep it organized...I guess.
    SWEP.IconLetter = "b"

    killicon.AddFont("weapon_ak47custom", "CSKillIcons", SWEP.IconLetter, Color(255, 80, 0, 255))
    -- If you were to change the above folder name you would change the kill icon as well.
end

SWEP.Base = "weapon_cs_base2" -- If you dont plan to use weapons from the workshop this wont matter much.

SWEP.Spawnable = true -- If the weapon can be spawned.
SWEP.AdminSpawnable = true -- If Admins can spawn this.
SWEP.Category = "DarkRP (Weapon)" -- Defines where the weapon will be grouped in the q-menu->weapons tab. Can be anything you like. (Case sensitive!)
SWEP.SpawnMenuIcon = "vgui/entities/weapon_ak472"
-- For custom weapons you can create new icons by going to the materials folder of the addon and creating an entities folder
-- and creating a png inside with the dimensions of 128x128 and have the name of the file match the name of the weapons folder name.
-- The above icon uses an older style of achieving the same goal.

SWEP.UseHands = true -- Use the hands of your playermodel if the playermodel supports it.
SWEP.ViewModel = "models/weapons/cstrike/c_rif_ak47.mdl" -- The players point of view.
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl" -- The point of view others have when looking at the player holding the gun.

SWEP.Weight = 5
SWEP.AutoSwitchTo = false -- When you pick it up should you auto switch to the gun?
SWEP.AutoSwitchFrom = false -- When you pick something else up should you switch away from what you are holding?

SWEP.HoldType = "ar2" -- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.Primary.Sound = Sound("Weapon_AK47.Single") -- The sound that is played while shooting. You can setup a sound file externally or you can paste the path to any type of sound file on your server.
SWEP.Primary.Recoil = 1.5 -- How much the gun will jump while shooting.
SWEP.Primary.Damage = 40 -- How much it will hurt every time a bullet hits its target.
SWEP.Primary.NumShots = 1 -- How many bullets come out every time you shoot. Anything higer than 1 would probably be a shotgun.
SWEP.Primary.Cone = 0.002 -- How accurate the gun will be. Think "CSGO" when it comes to the weapon spread, thats this.
SWEP.Primary.ClipSize = 30 -- How much ammo can you hold in the clip at one time.
SWEP.Primary.Delay = 0.08 -- A delay between shots. Effects fire speed.
SWEP.Primary.DefaultClip = 30 -- How much ammo you spawn with.
SWEP.Primary.Automatic = true -- Is the gun Semi-Automatic or Fully Automatic? True for Full; False for Semi.
SWEP.Primary.Ammo = "smg1" -- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.
--Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.ClipSize = -1 -- How much ammo you have for your secondary fire. Since this weapon doesnt have a secondary fire its set to -1
SWEP.Secondary.DefaultClip = -1 -- How much ammo you would spawn with for your secondary fire.
SWEP.Secondary.Automatic = false -- If your secondary fire is automatic or semi-automatic.
SWEP.Secondary.Ammo = "none" -- What type of ammo your secondary fire takes. If you dont have a secondary fire make sure to set this to none.

SWEP.IronSightsPos = Vector(-6.6, -15, 2.6) -- Where the gun locks into place when aiming.
SWEP.IronSightsAng = Vector(2.6, 0.02, 0) -- Where the gun locks into place when aiming.

SWEP.MultiMode = true
