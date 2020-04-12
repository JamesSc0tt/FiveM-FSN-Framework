local last_jump
Util.Tick(function()
	if IsPedJumping(GetPlayerPed(-1)) then
		if GetGameTimer()-last_jump < 4000 then
			SetPedToRagdoll(GetPlayerPed(-1), 1, 1000, 0, 0, 0, 0)
		else
			last_jump = GetGameTimer()
			Citizen.Wait(1000)
		end
	end
end)