roundStarted=false; 
roundTime=GetConVarNumber("ph_roundTime");
roundRemainedTime=roundTime; 

timer.Create( "RoundTimer", 1, 0, function()

	if roundStarted then
		roundRemainedTime=roundRemainedTime-1;
	end 

 end )
