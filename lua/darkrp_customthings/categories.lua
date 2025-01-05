--[[-----------------------------------------------------------------------
Categories
---------------------------------------------------------------------------
The categories of the default F4 menu.

Please read this page for more information:
https://darkrp.miraheze.org/wiki/DarkRP:Categories

In case that page can't be reached, here's an example with explanation:

DarkRP.createCategory{
    name = "Citizens", -- The name of the category.
    categorises = "jobs", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
    startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
    color = Color(0, 107, 0, 255), -- The color of the category header.
    canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
    sortOrder = 100, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}


Add new categories under the next line!
---------------------------------------------------------------------------]]

serviceColor =    Color(100,80,50)
researchColor =   Color(80,150,200)
medicalColor =    Color(100,160,220)
securityColor =   Color(80,80,80)
mtfa1Color =      Color(200,50,50)
mtfe11Color =     Color(200,50,50)
mtfo1Color =      Color(200,50,50)
mtfd21Color =     Color(200,50,50)
o5Color =         Color(20,20,20)
siteadminColor =  Color(100,100,100)
surfaceColor =    Color(50,200,50)

DarkRP.createCategory {
    name = "Class D Personnel",
    categorises = "jobs",
    startExpanded = false,
    color = Color(35, 35, 35),
    canSee = function(ply) return true end,
    sortOrder = 1,
}

DarkRP.createCategory {
    name = "Site Staff",
    categorises = "jobs",
    startExpanded = false,
    color = serviceColor,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory {
    name = "Research Staff",
    categorises = "jobs",
    startExpanded = false,
    color = researchColor,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory {
    name = "Medical Staff",
    categorises = "jobs",
    startExpanded = false,
    color = medicalColor,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory {
    name = "Security Staff",
    categorises = "jobs",
    startExpanded = false,
    color = securityColor,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory {
    name = "MTF Alpha-1 - Red Right Hand",
    categorises = "jobs",
    startExpanded = false,
    color = mtfa1Color,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory {
    name = "MTF Epsilon-11 - Nine Tailed Fox",
    categorises = "jobs",
    startExpanded = false,
    color = mtfe11Color,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory {
    name = "MTF Omega-1 - Law's Left Hand",
    categorises = "jobs",
    startExpanded = false,
    color = mtfo1Color,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory {
    name = "MTF Nu-7 - Hammer Down",
    categorises = "jobs",
    startExpanded = false,
    color = mtfd21Color,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory {
    name = "MTF Beta-1 - Cauterizers",
    categorises = "jobs",
    startExpanded = false,
    color = mtfd21Color,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory{
    name = "Overseer Council",
    categorises = "jobs",
    startExpanded = false,
    color = o5Color,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory{
    name = "Site Administration",
    categorises = "jobs",
    startExpanded = false,
    color = siteadminColor,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory{
    name = "Internal Security Department",
    categorises = "jobs",
    startExpanded = false,
    color = siteadminColor,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory{
    name = "External Affairs",
    categorises = "jobs",
    startExpanded = false,
    color = siteadminColor,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory{
    name = "Surface Zone",
    categorises = "jobs",
    startExpanded = false,
    color = surfaceColor,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory{
    name = "The Chaos Insurgency",
    categorises = "jobs",
    startExpanded = false,
    color = surfaceColor,
    canSee = function(ply) return true end,
    sortOrder = 1,
}
DarkRP.createCategory{
    name = "Global Occult Coalition",
    categorises = "jobs",
    startExpanded = false,
    color = surfaceColor,
    canSee = function(ply) return true end,
    sortOrder = 1,
}

DarkRP.createCategory{
    name = "Event Jobs",
    categorises = "jobs",
    startExpanded = false,
    color = surfaceColor,
    canSee = function(ply) return true end,
    sortOrder = 100,
}

DarkRP.createCategory{
    name = "Admin",
    categorises = "jobs",
    startExpanded = true,
    color = Color(255, 140, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 10000,
}

-- Entities
DarkRP.createCategory{
    name = "Printers", -- The name of the category.
    categorises = "entities", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
    startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
    color = Color(200, 200, 200, 240), -- The color of the category header.
    canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
    sortOrder = 50, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}
DarkRP.createCategory{
    name = "Anomalous Objects", -- The name of the category.
    categorises = "entities", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
    startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
    color = Color(25, 25, 25, 240), -- The color of the category header.
    canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
    sortOrder = 200, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}
DarkRP.createCategory{
    name = "Food", -- The name of the category.
    categorises = "entities", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
    startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
    color = Color(200, 200, 200, 240), -- The color of the category header.
    canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
    sortOrder = 129, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}
DarkRP.createCategory{
    name = "Chemistry", -- The name of the category.
    categorises = "entities", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
    startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
    color = Color(200, 200, 200, 240), -- The color of the category header.
    canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
    sortOrder = 129, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}
DarkRP.createCategory{
    name = "Simple Meth", -- The name of the category.
    categorises = "entities", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
    startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
    color = Color(200, 200, 200, 240), -- The color of the category header.
    canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
    sortOrder = 130, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}
DarkRP.createCategory{
    name = "Maxnet", -- The name of the category.
    categorises = "entities", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
    startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
    color = Color(200, 200, 200, 240), -- The color of the category header.
    canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
    sortOrder = 110, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}
DarkRP.createCategory{
    name = "Consumables",
    categorises = "entities",
    startExpanded = true,
    color = Color(200, 200, 200, 240),
    canSee = function(ply) return true end,
    sortOrder = 129,
}