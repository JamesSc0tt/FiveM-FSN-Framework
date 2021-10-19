RegisterNetEvent('fsn_inventory:veh:glovebox')
AddEventHandler('fsn_inventory:veh:glovebox', function()
	if IsPedInAnyVehicle(PlayerPedId()) then
		TriggerServerEvent('fsn_inventory:veh:request', GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)), 'glovebox')
	else
		exports['mythic_notify']:DoHudText('error', 'You have to be inside a vehicle.', 3000)
	end
end)