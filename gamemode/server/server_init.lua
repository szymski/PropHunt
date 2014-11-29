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