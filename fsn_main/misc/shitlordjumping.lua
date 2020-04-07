-- TODO: Merge "threads"
local canJump = true

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsPedJumping(GetPlayerPed(-1)) then
			if canJump then
				Citizen.Wait(1000)
				canJump = false
				Citizen.Wait(3000)
				canJump = true
			end 			
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		NetworkSessionVoiceLeave()
		if IsPedJumping(GetPlayerPed(-1)) then
			if not canJump then
				SetPedToRagdoll(GetPlayerPed(-1), 1, 1000, 0, 0, 0, 0)
			end 			
		end
	end
end)