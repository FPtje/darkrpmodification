--[[---------------------------------------------------------------------------
This is an example of a custom entity.
---------------------------------------------------------------------------]]
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Money Printer"
ENT.Author = "DarkRP Developers and <enter name here>"
ENT.Spawnable = false
ENT.AdminSpawnable = false

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "price")
    self:NetworkVar("Entity", 0, "owning_ent")
end
