local last_health = 0

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if IsPedInAnyVehicle(PlayerPedId()) then
			local cur_health = GetVehicleBodyHealth(GetVehiclePedIsIn(PlayerPedId()))
			if cur_health < last_health then
				local difference = last_health - cur_health
				if difference > 40 and IsPointOnRoad(GetEntityCoords(PlayerPedId()), GetVehiclePedIsIn(PlayerPedId())) then
					local pos = GetEntityCoords(PlayerPedId())
					local coords = {
					 x = pos.x,
					 y = pos.y,
					 z = pos.z
				   }
				   TriggerServerEvent('fsn_police:dispatch', coords, 16)
				end
			end
			last_health = GetVehicleBodyHealth(GetVehiclePedIsIn(PlayerPedId()))
		end
	end
end)
