AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

util.PrecacheSound( "BaseSmokeEffect.Sound" )
function ENT:Initialize()

	self.Entity:SetModel( "models/weapons/w_eq_smokegrenade.mdl" ) 
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	
	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self.Entity:SetNetworkedString( "Owner", "World" )
	
	local phys = self.Entity:GetPhysicsObject()
	
	if ( phys:IsValid() ) then
		
		phys:Wake()
	
	end
	
	self.timer = CurTime() + 3
end

function ENT:Think()
	
	if self.timer < CurTime() then
	
	local count = 0 
	
	for pl, id in pairs( CustomShipments ) do
	count = count + 1
	end
	
	local key = math.random( 1, count ) 
	local shipment = CustomShipments[ key ]
	local pos = self.Entity:GetPos()
	local crate = ents.Create( shipment.shipmentClass or "spawned_shipment" )
	crate.SID = self.Owner.SID
	crate:Setowning_ent( self.GrenadeOwner )
	crate:SetContents( key, shipment.amount )
	local box = ents.Create( "prop_physics" )
	box:SetModel( "models/props_junk/wood_crate001a.mdl" )
	box:SetPos( Vector( pos.x, pos.y, 4000 ) )
	box:SetCollisionGroup( COLLISION_GROUP_WORLD )
	crate:SetPos( box:GetPos() )
	crate.nodupe = true
	crate.ammoadd = shipment.spareammo
	crate.clip1 = shipment.clip1
	crate.clip2 = shipment.clip2
	
	timer.Simple( 5, function()
	box:Spawn()
	crate:Spawn()
	crate:SetPlayer(self.GrenadeOwner)
	timer.Simple( 5, function() 
	hook.Add( "Think", "Explode Crate", function() 
		if( box:GetVelocity().z > 0 ) then
			box:SetHealth( 0 )
			local explode = ents.Create("env_explosion")
			explode:SetKeyValue( "spawnflags", 64)
			explode:SetPos(box:GetPos())
			explode:Spawn() 
			explode:SetKeyValue( "iMagnitude", "40" )
			explode:Fire( "Explode", 0, 0 )
			
			hook.Remove( "Think", "Explode Crate" )
			
		end
	end )
	end )
	if shipment.shipmodel then
		
		crate:SetModel( shipment.shipmodel )
		crate:PhysicsInit( SOLID_VPHYSICS)
		crate:SetMoveType( MOVETYPE_VPHYSICS )
		crate:SetSolid( SOLID_VPHYSICS )
	end
	
	local phys = crate:GetPhysicsObject()
	local physi = box:GetPhysicsObject()
	phys:Wake()
	physi:Wake()
	physi:SetMass( phys:GetMass() + 8 )
	
	if shipment.weight then
		
		phys:SetMass( shipment.weight )
		physi:SetMass( shipment.weight  )
	end
	end )
	
	
	self.Entity:EmitSound( "BaseSmokeEffect.Sound" )

	local pos = self.Entity:GetPos()

	self.Entity:Fire("kill", "", 15)
	self.timer = CurTime() + 20


	end

end