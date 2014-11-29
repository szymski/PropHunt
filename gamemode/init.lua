AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
 
include("shared.lua")

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