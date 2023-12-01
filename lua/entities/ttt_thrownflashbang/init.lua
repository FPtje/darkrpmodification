local FLASH_INTENSITY = 2250; --the higher the number, the longer the flash will be whitening your screen

AddCSLuaFile("shared.lua")
include("shared.lua")

local function simplifyangle(angle)
	while(angle>=180) do
		angle = angle - 360;
	end
	while(angle <= -180) do
		angle = angle + 360;
	end
	return angle;
end

function ENT:Explode()
	self.Entity:EmitSound(Sound("weapons/flashbang/flashbang_explode"..math.random(1,2)..".wav"));
	for _,pl in pairs(player.GetAll()) do
		local ang = (self.Entity:GetPos() - pl:GetShootPos()):GetNormalized():Angle()
		local tracedata = {};
		tracedata.start = pl:GetShootPos();
		tracedata.endpos = self.Entity:GetPos();
		tracedata.filter = pl;
		local traceRes = pl:GetEyeTrace()
		local tr = util.TraceLine(tracedata);

		local pitch = simplifyangle(ang.p - pl:EyeAngles().p);
		local yaw = simplifyangle(ang.y - pl:EyeAngles().y);
		local dist = pl:GetShootPos():Distance( self.Entity:GetPos() )
		local endtime = FLASH_INTENSITY/dist;

		if traceRes.HitWorld and !tr.HitWorld then
			local endtime = FLASH_INTENSITY/dist;
			if (endtime > 6) then
				endtime = 6;
			elseif(endtime < 0.4) then
				endtime = 0.4;
			end
			simpendtime = math.floor(endtime);
			tenthendtime = math.floor((endtime-simpendtime)*10);
			if (  pitch > -45 && pitch < 45 && yaw > -45 && yaw < 45 ) || (pl:GetEyeTrace().Entity && pl:GetEyeTrace().Entity == self.Entity )then --in FOV
				//pl:PrintMessage(HUD_PRINTTALK, "In FOV");
			else
				//pl:PrintMessage(HUD_PRINTTALK, "Not in FOV");
				endtime = endtime/2;
			end
			if (pl:GetNetworkedFloat("RCS_flashed_time") > CurTime()) then --if you're already flashed
				pl:SetNetworkedFloat("RCS_flashed_time", endtime+pl:GetNetworkedFloat("RCS_flashed_time")+CurTime()-pl:GetNetworkedFloat("RCS_flashed_time_start")); --add more to it
			else --not flashed
				pl:SetNetworkedFloat("RCS_flashed_time", endtime+CurTime());
			end
			pl:SetNetworkedFloat("RCS_flashed_time_start", CurTime());
		end
	end
	self.Entity:Remove();
end

function ENT:Initialize()
	self.Entity:SetModel("models/weapons/w_eq_flashbang_thrown.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )

	local phys = self.Entity:GetPhysicsObject()
	
	if (phys:IsValid()) then
		phys:Wake()
	end
	
	timer.Simple(2,
	function()
		if self.Entity then self:Explode() end
	end )
end


function ENT:Think()
end

function ENT:SetDetonateTimer(length)
   self:SetDetonateExact( CurTime() + length )
end

function ENT:SetDetonateExact()
end

function ENT:OnTakeDamage()
	self:Explode()
end

function ENT:SetThrower()
end

function ENT:Use()
end

function ENT:StartTouch()
end

function ENT:EndTouch()
end

function ENT:Touch()
end