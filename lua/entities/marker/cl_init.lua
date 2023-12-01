include('shared.lua')

function ENT:Initialize()

	self.timer = CurTime() + 3

end

function ENT:Think()

	self.SmokeTimer = self.SmokeTimer or 0

	if ( self.SmokeTimer > CurTime() ) then  return end
	
	self.SmokeTimer = CurTime() + 0.15

	local vPos = Vector( math.Rand( -100, 100 ), math.Rand( -100, 100 ), 0 )

	local vOffset = self.Entity:LocalToWorld( Vector(0, 0, self.Entity:OBBMins().z) )

	local emitter = ParticleEmitter( vOffset )
	
	if self.timer < CurTime() then
		
		local smoke = emitter:Add( "particle/particle_smokegrenade", vOffset + vPos )
		smoke:SetVelocity( VectorRand() * math.Rand( 100, 350 ) )
		smoke:SetGravity( Vector( ( math.Rand( -100, 100 ) ),( math.Rand( -100, 100 ) ),( math.Rand(0, 100 ) ) ) )
		smoke:SetDieTime( 5 )
		smoke:SetStartAlpha( math.Rand( 245, 255 ) )
		smoke:SetEndAlpha( 0 ) 
		smoke:SetStartSize( math.Rand(50, 100 ) )
		smoke:SetEndSize( 400 )
		smoke:SetRoll( math.Rand( -180, 180 ) )
		smoke:SetRollDelta( math.Rand(- 0.2, 0.2 ) )
		smoke:SetColor( 255, 1, 1 )
		smoke:SetAirResistance( 550 )
	end

	emitter:Finish()
	
end

/*---------------------------------------------------------
Draw
---------------------------------------------------------*/
function ENT:Draw()
	
	self.Entity:DrawModel()

end

/*---------------------------------------------------------
IsTransluent
---------------------------------------------------------*/
function ENT:IsTranslucent()
	
	return true

end

