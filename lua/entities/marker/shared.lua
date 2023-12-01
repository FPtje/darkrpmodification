ENT.Type = "anim"

ENT.PrintName		= "marker"
ENT.Author			= "TheBerryBeast"

util.PrecacheSound( "SmokeGrenade.Bounce" )
function ENT:OnRemove()
end

function ENT:PhysicsUpdate()
end

function ENT:PhysicsCollide(data,phys)
	if data.Speed > 50 then
		self.Entity:EmitSound(Sound("SmokeGrenade.Bounce"))
	end
	
	local impulse = -data.Speed * data.HitNormal * .4 + (data.OurOldVelocity * -.6)
	phys:ApplyForceCenter(impulse)
end

