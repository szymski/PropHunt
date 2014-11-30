print("Initializing server")

--[[
	Teams 
]]--
SendChatMessageToAll(Color(255,255,0),"hi")
concommand.Add( "ph_team", function(player, command, args)
	 player:SetTeam(tonumber(args[1] or 1))
end)

--[[
	Player spawning
]]--

function GM:PlayerInitialSpawn(player)
    player:SetTeam(1)
	
end
 

function GM:DoPlayerDeath(ply, attacker, dmg )
	if ply:Team()==2 then -- When you die as the child then you're respawning as pedobear
		ply:SetTeam(3)
		SendChatMessage(ply,Color(255,0,0), "You died, your little body has been eaten by pedobear, now you'll return from the hell as a pedobear!" )
		timer.Create( "Respawn_Player_"..ply:GetName( ), 5, 1, function() SpawnAsPedo(ply) end )		
	end 
	if ply:Team()==1 then -- When you die as the child then you're respawning as pedobear
		ply:SetTeam(3)
		SendChatMessage(ply,Color(255,0,0),  "You died as a pedobear, there is no return!" )
	end 	
end
	
function GM:PlayerSpawn( ply ) 
	if ply:Team()==3 then --When you're spectator or pedobear already you can't respawn normally.
		GAMEMODE:PlayerSpawnAsSpectator( ply ) 
		return
	end 

	hook.Call( "PlayerLoadout", GAMEMODE, ply )  -- PlayerSpawn in base already calls PlayerLoadout!

end

function SpawnAsPedo(ply)

	ply:SetTeam(1)
	ply:Spawn()
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
	if target:IsPlayer() and dmginfo:GetAttacker( ):IsPlayer() then
		if dmginfo:GetAttacker( ):Team()==target:Team() then
			dmginfo:SetDamage(0)
		end
	
	elseif dmginfo:GetAttacker( ):IsPlayer() and target:GetClass()=="prop_physics" then 
		for k, ply in pairs( player.GetAll() ) do
			dmginfo:GetAttacker( ):TakeDamage( dmginfo:GetDamage( )/3, target, target) 
		end
	end
end