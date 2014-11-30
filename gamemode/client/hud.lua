
/***************************************************************************************************************\
|> LOCAL VARIABLES
\***************************************************************************************************************/

local ResX, ResY = ScrW(), ScrH()
local PosX, PosY = ResX - 260, ResY - 90

/***************************************************************************************************************\
|> LOCAL FUNCTIONS
\***************************************************************************************************************/

local function ShouldDraw(element)
	
	if element == "CHudHealth"
	or element == "CHudSecondaryAmmo"
	or element == "CHudAmmo"
	then return false end
	
end


local function DrawElements()
	
	local Ply = LocalPlayer()
	
	local Weapon   = Ply:GetActiveWeapon() 
	
	local Health   = Ply:Health()
	local Clip     = (Weapon:IsValid() and Weapon:Clip1() or 0)
	/*local ClipSize = Weapon.Primary.ClipSize or 0
	local Ammo     = Weapon:Ammo1()          or 0*/
	
	draw.NoTexture()
	
	draw.RoundedBox(0, PosX, PosY, 230, 80,  Color(0, 0, 0, 180))
	
	draw.RoundedBox(0, PosX + 50, PosY + 10 , 170, 25,  Color(130, 130, 130, 70))
	draw.RoundedBox(0, PosX + 50, PosY + 45,  170, 25,  Color(130, 130, 130, 70))
	
	draw.RoundedBox(0, PosX + 50, PosY + 10, Health / 100 * 170, 25,  Color(20, 255, 100, 230))
	draw.RoundedBox(0, PosX + 50, PosY + 45, Clip  / 100 * 170, 25,  Color(255, 100, 20, 230))
	
	//draw.DrawText(Clip .. " " .. ClipMax .. " " .. Ammo, "TargetID", PosX + 50, PosY + 45, Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT )
	
end


/***************************************************************************************************************\
|> HOOKS
\***************************************************************************************************************/

hook.Add("HUDShouldDraw", "ShouldDraw",   ShouldDraw)
hook.Add("HUDPaint",      "DrawElements", DrawElements)
