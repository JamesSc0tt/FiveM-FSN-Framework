RegisterNetEvent('fsn_inventory:veh:glovebox')
AddEventHandler('fsn_inventory:veh:glovebox', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TriggerServerEvent('fsn_inventory:veh:request', GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false)), 'glovebox')
	else
		exports['mythic_notify']:DoHudText('error', 'You have to be inside a vehicle.', 3000)
	end
end)