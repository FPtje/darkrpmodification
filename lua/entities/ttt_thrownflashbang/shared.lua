local DIETIMER = 1.5; --time in seconds, for the grenade to transition from full white to clear
local EFFECT_DELAY = 0.5; --time, in seconds when the effects still are going on, even when the whiteness of the flash is gone (set to -1 for no effects at all =]).
local pos, endflash, endflash2;

if (CLIENT) then
	function ENT:Initialize()
		pos = self:GetPos()
		timer.Simple(2, function()
			local beeplight = DynamicLight( self:EntIndex() )
			if ( beeplight ) then
				beeplight.Pos = pos
				beeplight.r = 255
				beeplight.g = 255
				beeplight.b = 255
				beeplight.Brightness = 6
				beeplight.Size = 1000
				beeplight.Decay = 1000
				beeplight.DieTime = CurTime() + 0.15
			end 
		end)
	end

	function ENT:Think()
		pos = self:GetPos()
	end

	function ENT:Draw()
		self.Entity:DrawModel()
	end

	function ENT:IsTranslucent()
		return true
	end
	
	function SimulateFlash_REALCS_NOT_ANYTHINGELSE() 
		if LocalPlayer():GetNetworkedFloat("RCS_flashed_time") > CurTime() then
			local pl = LocalPlayer();
			local e = pl:GetNetworkedFloat("RCS_flashed_time"); --when it dies away
			local s = pl:GetNetworkedFloat("RCS_flashed_time_start"); --when it started
			
			local alpha;
			if(e-CurTime()>DIETIMER)then
				alpha = 255;
			else
				local pf = 1-(CurTime() - (e-DIETIMER))/(e - (e-DIETIMER));
				alpha = pf*255;
			end
			
			surface.SetDrawColor(255,255,255,math.Round(alpha));
			surface.DrawRect(0,0,surface.ScreenWidth(),surface.ScreenHeight());
		end 
	end
	hook.Add("HUDPaint", "SimulateFlash_REALCS_NOT_ANYTHINGELSE", SimulateFlash_REALCS_NOT_ANYTHINGELSE);
	
	--motion blur and other junk
	local function SimulateBlur_REALCS_NOT_ANYTHINGELSE()
		local pl = LocalPlayer();
		local e = pl:GetNetworkedFloat("RCS_flashed_time") + EFFECT_DELAY; --when it dies away
		local s = pl:GetNetworkedFloat("RCS_flashed_time_start"); --when it started
		if (e > CurTime()  &&  e-EFFECT_DELAY-CurTime()<=DIETIMER ) then
			local pf = 1-(CurTime() - (e-DIETIMER))/(DIETIMER);
			DrawMotionBlur(0, pf/((DIETIMER+EFFECT_DELAY)/DIETIMER), 0);
			//DrawBloom( 3, pf*5, 6, 6, 12, 0, 255, 255, 255 );
		elseif(e > CurTime())then
			DrawMotionBlur( 0, 0.01, 0);
		else
			DrawMotionBlur( 0, 0, 0);
		end
	end
	hook.Add( "RenderScreenspaceEffects", "SimulateBlur_REALCS_NOT_ANYTHINGELSE", SimulateBlur_REALCS_NOT_ANYTHINGELSE )
	
end

ENT.Type = "anim"

function ENT:OnRemove()
end

function ENT:PhysicsUpdate()
end

function ENT:PhysicsCollide(data,phys)
	if data.Speed > 50 then
		self.Entity:EmitSound(Sound("weapons/flashbang/grenade_hit1.wav"))
	end
	
	local lollol = -data.Speed * data.HitNormal * .1 + (data.OurOldVelocity * -0.6)
	phys:ApplyForceCenter(lollol)
end