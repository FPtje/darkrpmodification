--[[---------------------------------------------------------------------------
DarkRP custom shipments and guns
---------------------------------------------------------------------------

This file contains your custom shipments and guns.
This file should also contain shipments and guns from DarkRP that you edited.

Note: If you want to edit a default DarkRP shipment, first disable it in darkrp_config/disabled_defaults.lua
    Once you've done that, copy and paste the shipment to this file and edit it.

The default shipments and guns can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:CustomShipmentFields


Add shipments and guns under the following line:
---------------------------------------------------------------------------]]

DarkRP.createShipment("BR9", "models/weapons/tfa_cod/mwr/w_br9.mdl", "vguns_br9", 800, 10, true, 100, false, {TEAM_GUN, TEAM_HVYGUN})
DarkRP.createShipment("CZ-75", "models/weapons/w_pist_cz75bsp01.mdl", "vguns_cz75", 2000, 10, true, 250, false, {TEAM_GUN, TEAM_HVYGUN})
DarkRP.createShipment("M1911", "models/weapons/tfa_cod/mwr/w_m1911.mdl", "vguns_m1911", 1800, 10, true, 220, false, {TEAM_GUN, TEAM_HVYGUN})
DarkRP.createShipment("M9", "models/weapons/tfa_cod/mwr/w_m9.mdl", "vguns_m9", 1600, 10, true, 220, false, {TEAM_GUN, TEAM_HVYGUN})
DarkRP.createShipment("Deagle", "models/weapons/tfa_cod/mwr/w_de50.mdl", "vguns_deagle", 3000, 10, true, 330, false, {TEAM_GUN, TEAM_HVYGUN})
DarkRP.createShipment("MP7", "models/weapons/w_smg_mp5.mdl", "vguns_mp7", 6500, 10, true, 700, false, {TEAM_HVYGUN})
AddCustomShipment("Glock p80", "models/weapons/tfa_ins2/w_glock_p80.mdl", "vguns_glockp80", 690, 10, true, 70, false, {TEAM_GUN, TEAM_HVYGUN})
AddCustomShipment("UZI", "models/weapons/w_uzi_imi.mdl", "vguns_uzi", 2000, 10, true, 200, false, {TEAM_GUN, TEAM_HVYGUN})

--Assault Rifles
AddCustomShipment("CZ-805", "models/weapons/tfa_ins2/w_cz805.mdl", "vguns_cz805", 16000, 10, true, 1500, false, {TEAM_HVYGUN})
AddCustomShipment("AR-15", "models/weapons/tfa_ins2/w_cw_ar15.mdl", "vguns_ar15", 14000, 10, true, 1300, false, {TEAM_HVYGUN})
AddCustomShipment("AK-74U", "models/weapons/tfa_cod/mwr/w_ak74u.mdl", "vguns_ak74u", 11000, 10, true, 1300, false, {TEAM_HVYGUN})
AddCustomShipment("MP-443", "models/weapons/tfa_ins2/mp443/w_mp443.mdl", "vguns_mp443", 2000, 10, true, 1300, false, {TEAM_GUN, TEAM_HVYGUN})
AddCustomShipment("RPK 16", "models/weapons/w_rpk12.mdl", "vguns_rpk16", 40000, 10, true, 3500, false, {TEAM_HVYGUN})
AddCustomShipment("MK-18 Mod", "models/weapons/w_mk12.mdl", "vguns_mk18mod", 40000, 10, true, 3500, false, {TEAM_HVYGUN})
AddCustomShipment("UMP 45", "models/weapons/tfa_ins2/w_ump45.mdl", "vguns_ump", 40000, 10, true, 3500, false, {TEAM_HVYGUN})

-- Rare items
AddCustomShipment("Hailstorm Energy Pistol", "models/weapons/hailstorm_rev/w_iw_hailstorm.mdl", "vguns_hailstorm", 40000, 10, true, 5000, false, {TEAM_MCD})
AddCustomShipment("Freedom-SR", "models/weapons/tfa_ins2/w_codol_freedom.mdl", "vguns_freedomsr", 220000, 10, true, 25000, false, {TEAM_MCD})
AddCustomShipment("Sanctum-SR", "models/weapons/w_halo_sanctum2_sr.mdl", "vguns_sanctumsr", 170000, 10, true, 20000, false, {TEAM_MCD})
AddCustomShipment("Volk Energy Rifle", "models/weapons/eak47/w_volk_iw.mdl", "vguns_volk", 130000, 10, true, 15000, false, {TEAM_MCD})
AddCustomShipment("X-Eon Energy Rifle", "models/weapons/xeon/w_iw_xeon.mdl", "vguns_xeon", 140000, 10, true, 15000, false, {TEAM_MCD})
AddCustomShipment("SCP-500 Pill", "models/scp500model/scp500model.mdl", "vwar_scp_500", 150000, 10, true, 1500, true, {TEAM_MCD})
AddCustomShipment("Scientific Sample Syringe", "models/weapons/darky_m/w_imsyringe.mdl", "vwar_scp_syringe", 20, 10, true, 20, true, {TEAM_MCD})