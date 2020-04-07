local last_health = 0

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) then
			local cur_health = GetVehicleBodyHealth(GetVehiclePedIsIn(GetPlayerPed(-1)))
			if cur_health < last_health then
				local difference = last_health - cur_health
				if difference > 40 and IsPointOnRoad(GetEntityCoords(GetPlayerPed(-1)), GetVehiclePedIsIn(GetPlayerPed(-1))) then
					local pos = GetEntityCoords(GetPlayerPed(-1))
					local coords = {
					 x = pos.x,
					 y = pos.y,
					 z = pos.z
				   }
				   TriggerServerEvent('fsn_police:dispatch', coords, 16)
				end
			end
			last_health = GetVehicleBodyHealth(GetVehiclePedIsIn(GetPlayerPed(-1)))
		end
	end
end)
