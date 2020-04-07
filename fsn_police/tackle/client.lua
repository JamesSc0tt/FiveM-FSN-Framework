local TackleTime = 1500 -- In milliseconds

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlPressed(0, 21) and IsControlJustReleased(0, 73) and fsn_PDDuty() then
			if IsPedInAnyVehicle(PlayerPedId()) then
				--TriggerEvent('chatMessage', 'Tackle', {255, 255, 255}, 'You cannot tackle someone in a vehicle')
			else
				local ForwardVector = GetEntityForwardVector(PlayerPedId())
				local Tackled = {}

				SetPedToRagdollWithFall(PlayerPedId(), 1500, 2000, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)

				while IsPedRagdoll(PlayerPedId()) do
					Citizen.Wait(0)
					for Key, Value in ipairs(GetTouchedPlayers()) do
						if not Tackled[Value] then
							Tackled[Value] = true
							TriggerServerEvent('Tackle:Server:TacklePlayer', GetPlayerServerId(Value), ForwardVector.x, ForwardVector.y, ForwardVector.z, GetPlayerName(PlayerId()))
						end
					end
				end
			end
		end
	end
end)

RegisterNetEvent('Tackle:Client:TacklePlayer')
AddEventHandler('Tackle:Client:TacklePlayer', function(ForwardVectorX, ForwardVectorY, ForwardVectorZ, Tackler)
	--TriggerEvent('chatMessage', 'Tackle', {255, 0, 0}, Tackler .. ' tackled you!')
	SetPedToRagdollWithFall(PlayerPedId(), TackleTime, TackleTime, 0, ForwardVectorX, ForwardVectorY, ForwardVectorZ, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
end)

function GetPlayers()
    local Players = {}
	
	for _, i in ipairs(GetActivePlayers()) do
        if NetworkIsPlayerActive(i) then
            table.insert(Players, i)
        end
    end

    return Players
end

function GetTouchedPlayers()
    local TouchedPlayer = {}
    for Key, Value in ipairs(GetPlayers()) do
		if IsEntityTouchingEntity(PlayerPedId(), GetPlayerPed(Value)) then
			table.insert(TouchedPlayer, Value)
		end
    end
    return TouchedPlayer
end
