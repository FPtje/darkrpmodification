--[[-------------------------------------------------------------------------
DarkRP config settings.
-----------------------------------------------------------------------------

This is the settings file of DarkRP. Every DarkRP setting is listed here.

Warning:
If this file is missing settings (because of e.g. an update), DarkRP will assume default values for these settings.
You need not worry about updating this file. If a new setting is added you can manually add them to this file.
---------------------------------------------------------------------------]]


--[[
Toggle settings.
Set to true or false.
]]

-- voice3D - Enable/disable 3DVoice is enabled.
GM.Config.voice3D                       = true
-- AdminsCopWeapons - Enable/disable admins spawning with cop weapons.
GM.Config.AdminsCopWeapons              = false
-- adminBypassJobCustomCheck - Enable/disable whether an admin can force set a job with whenever customCheck returns false.
GM.Config.adminBypassJobRestrictions    = false
-- Acts/Taunts - Enable/disable Taunts (e.g. act salute)
GM.Config.allowActs                     = false
-- allow people getting their own custom jobs.
GM.Config.allowjobswitch                = true
-- allowrpnames - Allow Players to Set their RP names using the /rpname command.
GM.Config.allowrpnames                  = true
-- allowsprays - Enable/disable the use of sprays on the server.
GM.Config.allowsprays                   = false
-- allowvehicleowning - Enable/disable whether people can own vehicles.
GM.Config.allowvehicleowning            = true
-- allowvnocollide - Enable/disable the ability to no-collide a vehicle (for security).
GM.Config.allowvnocollide               = false
-- alltalk - Enable for global chat, disable for local chat.
GM.Config.alltalk                       = false
-- antimultirun - Disallow people joining your server(s) twice on the same account.
GM.Config.antimultirun                  = true
-- autovehiclelock - Enable/Disable automatic locking of a vehicle when a player exits it.
GM.Config.autovehiclelock               = true
-- babygod - people spawn godded (prevent spawn killing).
GM.Config.babygod                       = true
-- canforcedooropen - whether players can force an unownable door open with lockpick or battering ram or w/e.
GM.Config.canforcedooropen              = true
-- chatsounds - sounds are played when some things are said in chat.
GM.Config.chatsounds                    = false
-- chiefjailpos - Allow the Chief to set the jail positions.
GM.Config.chiefjailpos                  = false
-- cit_propertytax - Enable/disable property tax that is exclusive only for citizens.
GM.Config.cit_propertytax               = false
-- copscanunfreeze - Enable/disable the ability of cops to unfreeze other people's props.
GM.Config.copscanunfreeze               = true
-- copscanunweld - Enable/disable the ability of cops to unweld other people's props.
GM.Config.copscanunweld                 = false
-- cpcanarrestcp - Allow/Disallow CPs to arrest other CPs.
GM.Config.cpcanarrestcp                 = false
-- currencyLeft - The position of the currency symbol. true for left, false for right.
GM.Config.currencyLeft                  = true
-- customjobs - Enable/disable the /job command (personalized job names).
GM.Config.customjobs                    = false
-- customspawns - Enable/disable whether custom spawns should be used.
GM.Config.customspawns                  = true
-- deathblack - Whether or not a player sees black on death.
GM.Config.deathblack                    = false
-- showdeaths - Display kill information in the upper right corner of everyone's screen.
GM.Config.showdeaths                    = true
-- deadtalk - Enable/disable whether people talk and use commands while dead.
GM.Config.deadtalk                      = false
-- deadvoice - Enable/disable whether people talk through the microphone while dead.
GM.Config.deadvoice                     = false
-- deathpov - Enable/disable whether people see their death in first person view.
GM.Config.deathpov                      = false
-- decalcleaner - Enable/Disable clearing every player's decals.
GM.Config.decalcleaner                  = false
-- disallowClientsideScripts - Clientside scripts can be very useful for customizing the HUD or to aid in building. This option bans those scripts.
GM.Config.disallowClientsideScripts     = true
-- doorwarrants - Enable/disable Warrant requirement to enter property.
GM.Config.doorwarrants                  = false
-- dropmoneyondeath - Enable/disable whether people drop money on death.
GM.Config.dropmoneyondeath              = false
-- droppocketarrest - Enable/disable whether people drop the stuff in their pockets when they get arrested.
GM.Config.droppocketarrest              = false
-- droppocketdeath - Enable/disable whether people drop the stuff in their pockets when they die.
GM.Config.droppocketdeath               = false
-- dropweapondeath - Enable/disable whether people drop their current weapon when they die.
GM.Config.dropweapondeath               = false
-- Whether players can drop the weapons they spawn with.
GM.Config.dropspawnedweapons            = false
-- dynamicvoice - Enable/disable whether only people in the same room as you can hear your mic.
GM.Config.dynamicvoice                  = true
-- earthquakes - Enable/disable earthquakes.
GM.Config.earthquakes                   = false
-- enablebuypistol - Turn /buy on of off.
GM.Config.enablebuypistol               = true
-- enforceplayermodel - Whether or not to force players to use their role-defined character models.
GM.Config.enforceplayermodel            = true
-- globalshow - Whether or not to display player info above players' heads in-game.
GM.Config.globalshow                    = false
-- ironshoot - Enable/disable whether people need iron sights to shoot.
GM.Config.ironshoot                     = false
-- showjob - Whether or not to display a player's job above their head in-game.
GM.Config.showjob                       = false
-- letters - Enable/disable letter writing / typing.
GM.Config.letters                       = true
-- license - Enable/disable People need a license to be able to pick up guns.
GM.Config.license                       = false
-- lockdown - Enable/Disable initiating lockdowns for mayors.
GM.Config.lockdown                      = true
-- lockpickfading - Enable/disable the lockpicking of fading doors.
GM.Config.lockpickfading                = true
-- logging - Enable/disable logging everything that happens.
GM.Config.logging                       = true
-- lottery - Enable/disable creating lotteries for mayors.
GM.Config.lottery                       = true
-- showname - Whether or not to display a player's name above their head in-game.
GM.Config.showname                      = false
-- showhealth - Whether or not to display a player's health above their head in-game.
GM.Config.showhealth                    = false
-- needwantedforarrest - Enable/disable Cops can only arrest wanted people.
GM.Config.needwantedforarrest           = false
-- noguns - Enabling this feature bans Guns and Gun Dealers.
GM.Config.noguns                        = false
-- norespawn - Enable/Disable that people don't have to respawn when they change job.
GM.Config.norespawn                     = false
-- keepPickedUp - Enable/Disable keeping picked up weapons when switching jobs.
GM.Config.keepPickedUp                  = false
-- instantjob - Enable/Disable instantly respawning when norespawn is false
GM.Config.instantjob                    = false
-- npcarrest - Enable/disable arresting npc's.
GM.Config.npcarrest                     = false
-- ooc - Whether or not OOC tags are enabled.
GM.Config.ooc                           = true
-- propertytax - Enable/disable property tax.
GM.Config.propertytax                   = false
-- proppaying - Whether or not players should pay for spawning props.
GM.Config.proppaying                    = false
-- propspawning - Enable/disable props spawning. Applies to admins too.
GM.Config.propspawning                  = true
-- removeclassitems - Enable/disable shipments/microwaves/etc. removal when someone changes team.
GM.Config.removeclassitems              = true
-- removeondisconnect - Enable/disable shipments/microwaves/etc. removal when someone disconnects.
GM.Config.removeondisconnect            = true
-- respawninjail - Enable/disable whether people can respawn in jail when they die.
GM.Config.respawninjail                 = true
-- restrictallteams - Enable/disable Players can only be citizen until an admin allows them.
GM.Config.restrictallteams              = false
-- restrictbuypistol - Enabling this feature makes /buy available only to Gun Dealers.
GM.Config.restrictbuypistol             = true
-- restrictdrop - Enable/disable restricting the weapons players can drop. Setting this to true disallows weapons from shipments from being dropped.
GM.Config.restrictdrop                  = false
-- revokeLicenseOnJobChange - Whether licenses are revoked when a player changes jobs.
GM.Config.revokeLicenseOnJobChange      = true
-- shouldResetLaws - Enable/Disable resetting the laws back to the default law set when the mayor changes.
GM.Config.shouldResetLaws               = false
-- strictsuicide - Whether or not players should spawn where they suicided.
GM.Config.strictsuicide                 = false
-- telefromjail - Enable/disable teleporting from jail.
GM.Config.telefromjail                  = true
-- teletojail - Enable/disable teleporting to jail.
GM.Config.teletojail                    = true
-- unlockdoorsonstart - Enable/Disable unlocking all doors on map start.
GM.Config.unlockdoorsonstart            = false
-- voiceradius - Enable/disable local voice chat.
GM.Config.voiceradius                   = true
-- tax - Whether players pay taxes on their wallets.
GM.Config.wallettax                     = false
-- wantedrespawn - Whether players remain wanted on respawn.
GM.Config.wantedrespawn                 = false
-- wantedsuicide - Enable/Disable suiciding while you are wanted by the police.
GM.Config.wantedsuicide                 = false
-- realisticfalldamage - Enable/Disable dynamic fall damage. Setting mp_falldamage to 1 will over-ride this.
GM.Config.realisticfalldamage           = true
-- printeroverheat - Whether the default money printer can overheat on its own.
GM.Config.printeroverheat               = true
-- weaponCheckerHideDefault - Hide default weapons when checking weapons.
GM.Config.weaponCheckerHideDefault      = false
-- weaponCheckerHideNoLicense - Hide weapons that do not require a license.
GM.Config.weaponCheckerHideNoLicense    = false

--[[
Value settings
]]
-- adminnpcs - Whether or not NPCs should be admin only. 0 = everyone, 1 = admin or higher, 2 = superadmin or higher, 3 = rcon only
GM.Config.adminnpcs                     = 3
-- adminsents - Whether or not SENTs should be admin only. 0 = everyone, 1 = admin or higher, 2 = superadmin or higher, 3 = rcon only
GM.Config.adminsents                    = 0
-- adminvehicles - Whether or not vehicles should be admin only. 0 = everyone, 1 = admin or higher, 2 = superadmin or higher, 3 = rcon only
GM.Config.adminvehicles                 = 2
-- adminweapons - Who can spawn weapons: 0: admins only, 1: supadmins only, 2: no one
GM.Config.adminweapons                  = 1
-- arrestspeed - Sets the max arrest speed.
GM.Config.arrestspeed                   = 325
-- babygodtime - How long the babygod lasts.
GM.Config.babygodtime                   = 0
-- chatsoundsdelay - How long to wait before letting a player emit a sound from their chat again.
-- Leave this on at least a few seconds to prevent people from spamming sounds. Set to 0 to disable.
GM.Config.chatsoundsdelay               = 3
-- deathfee - the amount of money someone drops when dead.
GM.Config.deathfee                      = 30
-- decaltimer - Sets the time to clear clientside decals (in seconds).
GM.Config.decaltimer                    = 120
-- demotetime - Number of seconds before a player can rejoin a team after demotion from that team.
GM.Config.demotetime                    = 120
-- doorcost - Sets the cost of a door.
GM.Config.doorcost                      = 30
-- entremovedelay - how long to wait before removing a bought entity after disconnect.
GM.Config.entremovedelay                = 0
-- gunlabweapon - The weapon that the gunlab spawns.
GM.Config.gunlabweapon                  = "weapon_p2282"
-- jailtimer - Sets the jailtimer (in seconds).
GM.Config.jailtimer                     = 120
-- lockdowndelay - The amount of time a mayor must wait before starting the next lockdown.
GM.Config.lockdowndelay                 = 120
-- maxadvertbillboards - The maximum number of /advert billboards a player can place.
GM.Config.maxadvertbillboards           = 0
-- maxCheques - The maximum number of cheques someone can write
GM.Config.maxCheques                    = 5
-- maxdoors - Sets the max amount of doors one can own.
GM.Config.maxdoors                      = 14
-- maxdrugs - Sets max drugs.
GM.Config.maxdrugs                      = 2
-- maxfoods - Sets the max food cartons per Microwave owner.
GM.Config.maxfoods                      = 2
-- maxfooditems - Sets the max amount of food items a player can buy from the F4 menu.
GM.Config.maxfooditems                  = 20
-- maxlawboards - The maximum number of law boards the mayor can place.
GM.Config.maxlawboards                  = 2
-- maxletters - Sets max letters.
GM.Config.maxletters                    = 3
-- maxlotterycost - Maximum payment the mayor can set to join a lottery.
GM.Config.maxlotterycost                = 1000
-- maxvehicles - Sets how many vehicles one can buy.
GM.Config.maxvehicles                   = 1
-- microwavefoodcost - Sets the sale price of Microwave Food.
GM.Config.microwavefoodcost             = 30
-- minlotterycost - Minimum payment the mayor can set to join a lottery.
GM.Config.minlotterycost                = 30
-- Money packets will get removed if they don't get picked up after a while. Set to 0 to disable.
GM.Config.moneyRemoveTime               = 600
-- mprintamount - Value of the money printed by the money printer.
GM.Config.mprintamount                  = 250
-- normalsalary - Sets the starting salary for newly joined players.
GM.Config.normalsalary                  = 45
-- npckillpay - Sets the money given for each NPC kill.
GM.Config.npckillpay                    = 10
-- paydelay - Sets how long it takes before people get salary.
GM.Config.paydelay                      = 60 * 10
-- pocketitems - Sets the amount of objects the pocket can carry.
GM.Config.pocketitems                   = 10
-- pricecap - The maximum price of items (using /price).
GM.Config.pricecap                      = 500
-- pricemin - The minimum price of items (using /price).
GM.Config.pricemin                      = 50
-- propcost - How much prop spawning should cost (prop paying must be enabled for this to have an effect).
GM.Config.propcost                      = 10
-- quakechance - Chance of an earthquake happening.
GM.Config.quakechance                   = 4000
-- respawntime - Minimum amount of seconds a player has to wait before respawning.
GM.Config.respawntime                   = 1
-- changejobtime - Minimum amount of seconds a player has to wait before changing job.
GM.Config.changejobtime                 = 5
-- runspeed - Sets the max running speed.
GM.Config.runspeed                      = 240
-- runspeed - Sets the max running speed for CP teams.
GM.Config.runspeedcp                    = 255
-- searchtime - Number of seconds for which a search warrant is valid.
GM.Config.searchtime                    = 900
-- ShipmentSpawnTime - Antispam time between spawning shipments.
GM.Config.ShipmentSpamTime              = 3
-- shipmenttime - The number of seconds it takes for a shipment to spawn.
GM.Config.shipmentspawntime             = 10
-- startinghealth - the health when you spawn.
GM.Config.startinghealth                = 100
-- startingmoney - your wallet when you join for the first time.
GM.Config.startingmoney                 = 1000
-- vehiclecost - Sets the cost of a vehicle (To own it).
GM.Config.vehiclecost                   = 40
-- wallettaxmax - Maximum percentage of tax to be paid.
GM.Config.wallettaxmax                  = 5.5
-- wallettaxmin - Minimum percentage of tax to be paid.
GM.Config.wallettaxmin                  = 0
-- wallettaxtime - Time in seconds between taxing players. Requires server restart.
GM.Config.wallettaxtime                 = 900
-- wantedtime - Number of seconds for which a player is wanted for.
GM.Config.wantedtime                    = 600
-- walkspeed - Sets the max walking speed.
GM.Config.walkspeed                     = 120
-- falldamagedamper - The damper on realistic fall damage. Default is 15. Decrease this for more damage.
GM.Config.falldamagedamper              = 15
-- falldamageamount - The base damage taken from falling for static fall damage. Default is 10.
GM.Config.falldamageamount              = 10
-- printeroverheatchance - The likelyhood of a printer overheating. The higher this number, the less likely (minimum 3, default 22).
GM.Config.printeroverheatchance         = 22
-- printerreward - Reward for destroying a money printer.
GM.Config.printerreward                 = 950

--[[---------------------------------------------------------------------------
Chat distance settings
Distance is in source units (similar to inches)
---------------------------------------------------------------------------]]
GM.Config.talkDistance    = 250
GM.Config.whisperDistance = 90
GM.Config.yellDistance    = 550
GM.Config.meDistance      = 250
GM.Config.voiceDistance   = 550

--[[---------------------------------------------------------------------------
Other settings
---------------------------------------------------------------------------]]

-- The classname of money packets. Use this to create your own money entity!
-- Note: the money packet must support the "Setamount" method (or the amount DTVar).
GM.Config.MoneyClass = "spawned_money"
-- In case you do wish to keep the default money, but change the model, this option is the way to go:
GM.Config.moneyModel = "models/props/cs_assault/money.mdl"
-- You can set your own, custom sound to be played for all players whenever a lockdown is initiated.
-- Note: Remember to include the folder where the sound file is located.
GM.Config.lockdownsound = "npc/overwatch/cityvoice/f_confirmcivilstatus_1_spkr.wav"

-- The skin DarkRP uses. Set to "default" to use the GMod default derma theme.
GM.Config.DarkRPSkin = "DarkRP"
GM.Config.currency = "£"
GM.Config.currencyThousandSeparator = ","
GM.Config.chatCommandPrefix = "/"
GM.Config.F1MenuHelpPage = "http://wiki.darkrp.com/index.php/Main_Page"
GM.Config.F1MenuHelpPageTitle = "Wiki page"

-- Put Steam ID's and ranks in this list, and the players will have that rank when they join.
GM.Config.DefaultPlayerGroups = {
    ["STEAM_0:0:00000000"] = "superadmin",
    ["STEAM_0:0:11111111"] = "admin",
}

-- Custom modules in this addon that are disabled.
GM.Config.DisabledCustomModules = {
       ["hudreplacement"] = false,
       ["extraf4tab"] = false,
}

-- The list of weapons that players are not allowed to drop. Items set to true are not allowed to be dropped.
GM.Config.DisallowDrop = {
	["vwar_reality_bending_swep"] = true,
	["snowball_thrower_nodamage"] = true,
	["csgo_flip_black_laminate"] = true,
	["unclen8_deagold"] = true,
	["weapon_vorgs_marker"] = true,
    ["m9k_remington870"] = true,
	["steel_lockpick"] = true,
	["weapon_medkit"] = true,
	["laserpointer"] = true,
	["arrest_stick"] = true,
	["keypad_cracker"] = true,
	["door_ram"] = true,
	["gmod_camera"] = true,
	["gmod_tool"] = true,
	["keys"] = true,
	["m9k_m16a4_acog"] = true,
	["lockpick"] = true,
	["med_kit"] = true,
	["pocket"] = true,
	["stunstick"] = true,
	["unarrest_stick"] = true,
	["weapon_keypadchecker"] = true,
	["weapon_physcannon"] = true,
	["weapon_physgun"] = true,
	["weaponchecker"] = true,
	["climb_swep2"] = true,
	["weapon_profiler"] = true,
	["heavy_shield"] = true,
	["deployable_shield"] = true,
	["riot_shield"] = true,
	["m9k_aw502"] = true,
	["weapon_arc_atmcard"] = true,	
	["weapon_medkit"] = true,	
	["m9k_mp5sd"] = true,
	["m9k_usp"] = true,	
	["m9k_g36"] = true,
	["m9k_aw50"] = true,
	["weapon_arc_atmhack"] = true,	
	["weapon_hack_phone"] = true,	
	["weapon_checker"] = true,
    ["weapon_shovel"] = true,
	["m9k_tar21"] = true,
	["m9k_striker12"] = true,
	["orbital_friendship_cannon"] = true,
	["stungun"] = true,
	["pass_dea"] = true,
	["pass_detectiv"] = true,
	["pass_england"] = true,
	["pass_fbi"] = true,
	["pass_marshel"] = true,
	["pass_rus"] = true,
	["pass_usa"] = true,
	["hydro_ephone_swep"] = true,
	["m9k_swatminigun"] = true,
	//["weapon_vape"] = true,
	["snowball_thrower_nodamage"] = true,
	["duckgun"] = true,
	["weapon_popcorn"] = true,
	["weapon_popcorn_spam"] = true,
	["wowozela"] = true,
	["weapon_spraymhs"] = true,
	["mgs_pickaxe"] = true,
	["weapon_cs_flash"] = true,
	["weapon_cs_smoke"] = true,
	["csgo_gut_damascus"] = true,
	["csgo_flip_boreal"] = true,
	["csgo_butterfly_rustcoat"] = true,
	["csgo_gut"] = true,
	["csgo_huntsman_bluesteel"] = true,
	["csgo_falchion_tiger"] = true,
	["csgo_gut_case"] = true,
	["csgo_bayonet_ultraviolet"] = true,
	["csgo_m9_marblefade"] = true,
	["csgo_karambit"] = true,
	["csgo_butterfly_ddpat"] = true,
	["csgo_falchion_fade"] = true,
	["csgo_gut_night"] = true,
	["csgo_butterfly_night"] = true,
	["csgo_flip_crimsonwebs"] = true,
	["csgo_bayonet_fade"] = true,
	["csgo_bayonet_ddpat"] = true,
	["csgo_huntsman_case"] = true,
	["csgo_daggers_damascus"] = true,
	["csgo_huntsman_damascus"] = true,
	["csgo_butterfly"] = true,
	["csgo_m9_ultraviolet"] = true,
	["csgo_bayonet_crimsonwebs"] = true,
	["csgo_flip_damascus"] = true,
	["csgo_flip_case"] = true,
	["csgo_bowie_ultraviolet"] = true,
	["csgo_bayonet_slaughter"] = true,
	["csgo_bayonet_black_laminate"] = true,
	["csgo_flip_fade"] = true,
	["csgo_karambit_night"] = true,
	["csgo_bowie_damascus"] = true,
	["csgo_falchion_marblefade"] = true,
	["csgo_falchion_bluesteel"] = true,
	["csgo_daggers_case"] = true,
	["csgo_bowie_night"] = true,
	["csgo_daggers_marblefade"] = true,
	["csgo_bowie_marblefade"] = true,
	["csgo_bowie_crimsonwebs"] = true,
	["csgo_huntsman_rustcoat"] = true,
	["csgo_m9"] = true,
	["csgo_bayonet_bluesteel"] = true,
	["csgo_m9_crimsonwebs"] = true,
	["csgo_falchion_case"] = true,
	["csgo_falchion_night"] = true,
	["csgo_butterfly_fade"] = true,
	["csgo_bayonet_night"] = true,
	["csgo_daggers_ultraviolet"] = true,
	["csgo_bayonet_damascus"] = true,
	["csgo_bowie_case"] = true,
	["csgo_bayonet_marblefade"] = true,
	["csgo_default_golden"] = true,
	["csgo_gut_tiger"] = true,
	["csgo_huntsman_marblefade"] = true,
	["csgo_bayonet_tiger"] = true,
	["csgo_karambit_crimsonwebs"] = true,
	["csgo_karambit_ddpat"] = true,
	["csgo_m9_rustcoat"] = true,
	["csgo_daggers_boreal"] = true,
	["csgo_bowie_slaughter"] = true,
	["csgo_bayonet_rustcoat"] = true,
	["csgo_gut_rustcoat"] = true,
	["csgo_butterfly_damascus"] = true,
	["csgo_gut_marblefade"] = true,
	["csgo_daggers_greyscaled"] = true,
	["csgo_daggers_fade"] = true,
	["csgo_flip_tiger"] = true,
	["csgo_huntsman_slaughter"] = true,
	["csgo_butterfly_tiger"] = true,
	["csgo_bowie_tiger"] = true,
	["csgo_m9_slaughter"] = true,
	["csgo_gut_boreal"] = true,
	["csgo_cssource"] = true,
	["csgo_falchion_slaughter"] = true,
	["csgo_default_knife"] = true,
	["csgo_gut_slaughter"] = true,
	["csgo_flip_night"] = true,
	["csgo_daggers_night"] = true,
	["csgo_falchion_crimsonwebs"] = true,
	["csgo_falchion_boreal"] = true,
	["csgo_default_t"] = true,
	["csgo_butterfly_boreal"] = true,
	["csgo_falchion_ultraviolet"] = true,
	["csgo_gut_bluesteel"] = true,
	["csgo_m9_bluesteel"] = true,
	["csgo_huntsman_fade"] = true,
	["csgo_m9_tiger"] = true,
	["csgo_default_t_golden"] = true,
	["csgo_flip_ultraviolet"] = true,
	["csgo_karambit_damascus"] = true,
	["csgo_flip_slaughter"] = true,
	["csgo_bayonet_case"] = true,
	["csgo_gut_crimsonwebs"] = true,
	["csgo_bowie_bluesteel"] = true,
	["csgo_karambit_case"] = true,
	["csgo_huntsman_boreal"] = true,
	["csgo_karambit_slaughter"] = true,
	["csgo_bowie"] = true,
	["csgo_daggers_slaughter"] = true,
	["csgo_bowie_boreal"] = true,
	["csgo_karambit_rustcoat"] = true,
	["csgo_falchion_rustcoat"] = true,
	["csgo_flip_rustcoat"] = true,
	["csgo_butterfly_crimsonwebs"] = true,
	["csgo_gut_fade"] = true,
	["csgo_huntsman_crimsonwebs"] = true,
	["csgo_butterfly_slaughter"] = true,
	["csgo_falchion_damascus"] = true,
	["csgo_daggers_tiger"] = true,
	["csgo_daggers_ddpat"] = true,
	["csgo_flip_ddpat"] = true,
	["csgo_falchion_ddpat"] = true,
	["csgo_flip"] = true,
	["csgo_m9_damascus"] = true,
	["csgo_karambit_marblefade"] = true,
	["csgo_m9_fade"] = true,
	["csgo_karambit_boreal"] = true,
	["csgo_huntsman_tiger"] = true,
	["csgo_huntsman_ddpat"] = true,
	["csgo_daggers_rustcoat"] = true,
	["csgo_bowie_rustcoat"] = true,
	["csgo_flip_marblefade"] = true,
	["csgo_huntsman"] = true,
	["csgo_gut_ddpat"] = true,
	["csgo_m9_case"] = true,
	["csgo_bayonet_boreal"] = true,
	["csgo_gut_ultraviolet"] = true,
	["csgo_karambit_fade"] = true,
	["csgo_daggers_webs"] = true,
	["csgo_huntsman_ultraviolet"] = true,
	["csgo_bowie_fade"] = true,
	["csgo_huntsman_night"] = true,
	["csgo_bowie_ddpat"] = true,
	["csgo_m9_ddpat"] = true,
	["csgo_butterfly_marblefade"] = true,
	["csgo_flip_bluesteel"] = true,
	["csgo_karambit_ultraviolet"] = true,
	["csgo_m9_night"] = true,
	["csgo_karambit_bluesteel"] = true,
	["csgo_bayonet"] = true,
	["csgo_butterfly_case"] = true,
	["csgo_butterfly_bluesteel"] = true,
	["csgo_m9_boreal"] = true,
	["csgo_daggers"] = true,
	["csgo_karambit_tiger"] = true,
	["csgo_daggers_bluesteel"] = true,
	["csgo_falchion"] = true,
	["csgo_butterfly_ultraviolet"] = true,
	
	// Custom knife skins
	["csgo_karambit_creamy"] = true,
	["csgo_karambit_sticker"] = true,
	["csgo_karambit_space"] = true,
	["csgo_karambit_modern"] = true,
	["csgo_karambit_lava"] = true,
	["csgo_karambit_doppler"] = true,
	["csgo_karambit_burning"] = true,
	["csgo_karambit_bluetiger"] = true,
	["csgo_karambit_rainbow"] = true,
	["csgo_karambit_aurora"] = true,
	["csgo_karambit_wankish"] = true,
	["csgo_karambit_theorem"] = true,
	["csgo_karambit_template"] = true,
	["csgo_bayonet_autotronic"] = true,
	["csgo_bayonet_bright_water"] = true,
	["csgo_bayonet_freehand"] = true,
	["csgo_bayonet_lore"] = true,
	["csgo_bowie_bright_water"] = true,
	["csgo_bowie_freehand"] = true,
	["csgo_butterfly_bright_water"] = true,
	["csgo_butterfly_freehand"] = true,
	["csgo_falchion_bright_water"] = true,
	["csgo_falchion_freehand"] = true,
	["csgo_flip_autotronic"] = true,
	["csgo_flip_bright_water"] = true,
	["csgo_flip_freehand"] = true,
	["csgo_flip_lore"] = true,
	["csgo_gut_autotronic"] = true,
	["csgo_gut_bright_water"] = true,
	["csgo_gut_freehand"] = true,
	["csgo_gut_lore"] = true,
	["csgo_huntsman_bright_water"] = true,
	["csgo_huntsman_freehand"] = true,
	["csgo_karambit_autotronic"] = true,
	["csgo_karambit_bright_water"] = true,
	["csgo_karambit_freehand"] = true,
	["csgo_karambit_lore"] = true,
	["csgo_m9_autotronic"] = true,
	["csgo_m9_bright_water"] = true,
	["csgo_m9_freehand"] = true,
	["csgo_m9_lore"] = true,
	["csgo_daggers_bright_water"] = true,
}

-- The list of weapons people spawn with.
GM.Config.DefaultWeapons = {
    "keys",
    "weapon_physcannon",
}

-- Override categories.
-- NOTE: categories are to be set in the "category" field of the custom jobs/shipments/entities/ammo/pistols/vehicles.
-- Use this only to override the categories of _default_ things.
-- This will NOT work for your own custom stuff.
-- Make sure the category is created in the darkrp_customthings/categories.lua, otherwise it won't work!
GM.Config.CategoryOverride = {
    jobs = {
        ["Citizen"]                             = "Citizens",
        ["Hobo"]                                = "Citizens",
        ["Gun Dealer"]                          = "Citizens",
        ["Medic"]                               = "Citizens",
        ["Civil Protection"]                    = "Civil Protection",
        ["Gangster"]                            = "Gangsters",
        ["Mob boss"]                            = "Gangsters",
        ["Civil Protection Chief"]              = "Civil Protection",
        ["Mayor"]                               = "Civil Protection",
    },
    entities = {
        ["Drug lab"]                            = "Other",
        ["Money printer"]                       = "Other",
        ["Gun lab"]                             = "Other",

    },
    shipments = {
        ["AK47"]                                = "Rifles",
        ["MP5"]                                 = "Rifles",
        ["M4"]                                  = "Rifles",
        ["Mac 10"]                              = "Other",
        ["Pump shotgun"]                        = "Shotguns",
        ["Sniper rifle"]                        = "Snipers",

    },
    weapons = {
        ["Desert eagle"]                        = "Pistols",
        ["Fiveseven"]                           = "Pistols",
        ["Glock"]                               = "Pistols",
        ["P228"]                                = "Pistols",
    },
    vehicles = {}, -- There are no default vehicles.
    ammo = {
        ["Pistol ammo"]                         = "Other",
        ["Shotgun ammo"]                        = "Other",
        ["Rifle ammo"]                          = "Other",
    },
}

-- The list of weapons admins spawn with, in addition to the default weapons, a job's weapons and GM.Config.AdminsCopWeapons.
GM.Config.AdminWeapons = {
    "weapon_keypadchecker",
}

-- These are the default laws, they're unchangeable in-game.
GM.Config.DefaultLaws = {
    "Do not attack other citizens except in self-defence.",
	"Do not steal or break in to peoples homes.",
	"Money printers/drugs are illegal.",
	"Selling & owning weapons without gun licence is illegal",
	"Open carry with a license is illegal",
	"Public indecency is arrestable (wear clothes in public)"
}

GM.Config.PocketBlacklist = {
	["snowball_thrower_nodamage"] = true,
    ["fadmin_jail"] = true,
    ["meteor"] = true,
    ["door"] = true,
    ["func_"] = true,
    ["player"] = true,
    ["beam"] = true,
    ["worldspawn"] = true,
    ["env_"] = true,
    ["path_"] = true,
    ["prop_physics"] = true,
    ["money_printer"] = true,
    ["gunlab"] = true,
    ["prop_dynamic"] = true,
    ["prop_vehicle_prisoner_pod"] = true,
    ["keypad_wire"] = true,
    ["gmod_button"] = true,
    ["gmod_rtcameraprop"] = true,
    ["gmod_cameraprop"] = true,
    ["gmod_dynamite"] = true,
    ["gmod_thruster"] = true,
    ["gmod_light"] = true,
    ["gmod_lamp"] = true,
    ["gmod_emitter"] = true,
	["rprint_silverprinter"] = false,
	["weapon_keypadchecker"] = true,
	["keys"] = true,
	["pocket"] = true,
	["spiderman's_swep"] = true,
	["weapon_fists"] = true,
	["keypad_cracker"] = true,
	["arrest_stick"] = true,
	["unarrest_stick"] = true,
	["stunstick"] = true, 
	["itemstore_pickup"] = true,
	["weapon_arc_atmcard"] = true,
	["lockpick"] = true,
	["weapon_arc_atmhack"] = true,
	["weapon_crowbar"] = true,
	["snowball_thrower_nodamage"] = true,
	["climb_swep2"] = true,
	["stungun"] = true,
	["m9k_swatminigun"] = true,
	["snowball_thrower_nodamage"] = true,
	["duckgun"] = true,
	["weapon_popcorn"] = true,
	["weapon_popcorn_spam"] = true,
	["wowozela"] = true,
	["weapon_spraymhs"] = true,
}

-- These weapons are classed as 'legal' in the weapon checker and are not stripped when confiscating weapons.
-- This setting is used IN ADDITION to GM.Config.weaponCheckerHideDefault and GM.Config.weaponCheckerHideNoLicense.
-- You should use the former if you want to class the default weapons (GM.Config.DefaultWeapons and, if admin, GM.Config.AdminWeapons) and a player's job weapons as legal.
-- The latter takes GM.NoLicense weapons as legal (see licenseweapons.lua).
-- The format of this config is similar to GM.Config.DisallowDrop.
GM.Config.noStripWeapons = {
	["weaponchecker_v2"] = true,
	["vwar_animations"] = true,
	["vwar_reality_bending_swep"] = true,
	["vwar_scp_personnel_tablet"] = true,
	["vwar_scp_interrogate"] = true,
	["salute"] = true,
	["dradio"] = true,
	["vclipboard"] = true,
	["weapon_hexshield"] = true,
	["mgs_pickaxe"] = true,
	["swm_chopping_axe"] = true,
	["weapon_lordi_defib"] = true,
	["weapon_vape"] = true,
	["weapon_vape_bigsmoke"] = true,
	["weapon_vape_mlp"] = true,
	["weapon_vape_butterfly"] = true,
	["weapon_vape_juicy"] = true,
	["weapon_vape_mega"] = true,
	["snowball_thrower_nodamage"] = true,
	["vwar_scp_breach"] = true,
	["blink"] = true,
	["keys"] = true,
	["pocket"] = true,
	["spiderman's_swep"] = true,
	["weapon_fists"] = true,
	["itemstore_pickup"] = true,
	["weapon_arc_atmcard"] = true,
	["snowball_thrower_nodamage"] = true,
	["climb_swep2"] = true,
	["stungun"] = true,
	["duckgun"] = true,
	["weapon_popcorn"] = true,
	["weapon_popcorn_spam"] = true,
	["wowozela"] = true,
	["snowball_thrower_nodamage"] = true,
	["weapon_vorgs_marker"] = true,
	["steel_lockpick"] = true,
	["weapon_medkit"] = true,
	["laserpointer"] = true,
	["arrest_stick"] = true,
	["keypad_cracker"] = true,
	["door_ram"] = true,
	["gmod_camera"] = true,
	["gmod_tool"] = true,
	["keys"] = true,
	["weapon_medkit"] = true,
	["lockpick"] = true,
	["med_kit"] = true,
	["pocket"] = true,
	["stunstick"] = true,
	["unarrest_stick"] = true,
	["weapon_keypadchecker"] = true,
	["weapon_physcannon"] = true,
	["weapon_physgun"] = true,
	["weaponchecker"] = true,
	["weapon_maxnet_delivery_marker"] = true,
	["velkon_guitar"] = true,
	["hydro_ephone_swep"] = true,
	["duckgun"] = true,
	["weapon_popcorn"] = true,
	["weapon_popcorn_spam"] = true,
	["wowozela"] = true,
	["weapon_spraymhs"] = true,
	["weapon_flashlight"] = true,
	["vwar_scp_anomaly_containment_beam"] = true,
	["vwar_scp096_bucketswep"] = true,
	["vwar_scp_repair_tool"] = true,
	["vwar_scp_technician_tool"] = true,
	["vwar_scp_kant_counter"] = true,
	["vwar_scp_syringe_contraband"] = true,
	["vwar_scp_syringe"] = true,
	["vwar_field_kit"] = true,
	["vwar_first_aid_kit"] = true,
	["vwar_id_card"] = true,
	["vwar_id_card_spy"] = true,
	["vwar_id_card_spy_team"] = true,
	["vwar_weapon_stripper"] = true,
	["vwar_tactical_tablet"] = true,
	["vwar_voice_amplifier"] = true,
	-- cuffs
	["weapon_cuff_elastic"] = true,
	["weapon_cuff_plastic"] = true,
	["weapon_cuff_police"] = true,
	["weapon_cuff_rope"] = true,
	["weapon_cuff_shackles"] = true,
	["weapon_cuff_standard"] = true,
	["weapon_cuff_tactical"] = true,
	["weapon_handcuffed"] = true,
	["weapon_leash_elastic"] = true,
	["weapon_leash_rope"] = true,
}

-- The entities listed here will not be removed when a player changes their job.
-- This only applies when removeclassitems is set to true.
-- Note: entities will only be removed when the player changes to a job that is not allowed to have the entity.
GM.Config.preventClassItemRemoval = {
    ["gunlab"] = false,
    ["microwave"] = false,
    ["spawned_shipment"] = false,
}

-- Properties set to true are allowed to be used. Values set to false or are missing from this list are blocked.
GM.Config.allowedProperties = {
    remover = true,
    ignite = false,
    extinguish = true,
    keepupright = true,
    gravity = true,
    collision = true,
    skin = true,
    bodygroups = true,
}

--[[---------------------------------------------------------------------------
F4 menu
---------------------------------------------------------------------------]]
-- hide the items that you can't buy and the jobs you can't get (instead of graying them out).
-- this option hides items when you don't have enough money, when the maximum is reached for a job or any other reason.
GM.Config.hideNonBuyable = false

-- Hide only the items that you have the wrong job for (or for which the customCheck says no).
-- When you set this option to true and hideNonBuyable to false, you WILL see e.g. items that are too expensive for you to buy.
-- but you won't see gundealer shipments when you have the citizen job.
GM.Config.hideTeamUnbuyable = true

--[[---------------------------------------------------------------------------
AFK module
---------------------------------------------------------------------------]]
-- The time of inactivity before being demoted.
GM.Config.afkdemotetime = 600
-- Prevent people from spamming AFK.
GM.Config.AFKDelay = 300

--[[---------------------------------------------------------------------------
Hitmenu module
---------------------------------------------------------------------------]]
-- The minimum price for a hit.
GM.Config.minHitPrice = 200
-- The maximum price for a hit.
GM.Config.maxHitPrice = 50000
-- The minimum distance between a hitman and his customer when they make the deal.
GM.Config.minHitDistance = 150
-- The text that tells the player he can press use on the hitman to request a hit.
GM.Config.hudText = "I am a hitman.\nPress E on me to request a hit!"
-- The text above a hitman when he's got a hit.
GM.Config.hitmanText = ""
-- The cooldown time for a hit target (so they aren't spam killed).
GM.Config.hitTargetCooldown = 120
-- How long a customer has to wait to be able to buy another hit (from the moment the hit is accepted).
GM.Config.hitCustomerCooldown = 240

--[[---------------------------------------------------------------------------
Hungermod module
---------------------------------------------------------------------------]]
-- hungerspeed <Amount> - Set the rate at which players will become hungry (2 is the default).
GM.Config.hungerspeed = 2
-- starverate <Amount> - How much health that is taken away every second the player is starving  (3 is the default).
GM.Config.starverate = 3
