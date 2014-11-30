AddCSLuaFile()

DEFINE_BASECLASS( "base_anim" )

ENT.PrintName		= "PedoHunt Prop"
ENT.Author			= "Szymekk"

ENT.Editable			= true
ENT.Spawnable			= false
ENT.AdminOnly			= false
ENT.RenderGroup 		= RENDERGROUP_BOTH

function ENT:Initialize()
	if SERVER then
		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_NONE )
	end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end

function ENT:Think()
	if IsValid(self.owner) then
		if self.owner:Team() != 2 then
			self:Remove()
		end
		self:SetPos(self.owner:GetPos())
		self:SetAngles(Angle(0,self.owner:GetAngles().yaw,0))
	end
	self:NextThink(CurTime() + 0.05)
	return true
end