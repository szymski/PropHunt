print("Initializing server")

--[[
	Player spawning
]]--

function GM:PlayerInitialSpawn(player)
    player:SetTeam(1)
end
 
function GM:PlayerLoadout(player)
    if player:Team() == 1 then
        player:Give( "weapon_crowbar" )
    end
end 

--[[
	Changing to prop
]]--

function GM:KeyPress(player, key)
	if player:Team() == 2 && key == IN_ATTACK then
		local trace = player:GetEyeTrace()
		if trace.Entity && trace.Entity:GetClass() == "prop_physics" then
			player:SetModel(trace.Entity:GetModel())
			player:ChatPrint("You have changed!")
		end
	end
end

--[[
	Attacking props
]]--

function GM:EntityTakeDamage( target, dmginfo)
	if dmginfo:GetAttacker( ):IsPlayer() and target:GetClass()=="prop_physics" then 
		for k, ply in pairs( player.GetAll() ) do
			dmginfo:GetAttacker( ):TakeDamage( dmginfo:GetDamage( )/3, target, target) 
		end
	end
end