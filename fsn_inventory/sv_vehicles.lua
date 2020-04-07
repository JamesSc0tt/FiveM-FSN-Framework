local vehicles = {

}

RegisterServerEvent('fsn_inventory:veh:request')
AddEventHandler('fsn_inventory:veh:request', function(plate, type)
	print(source..' is requesting veh inventory for '..plate..' '..type)
	if vehicles[plate] then
		if not vehicles[plate].inuse then
			vehicles[plate].inuse = true
			TriggerClientEvent('fsn_inventory:veh:'..type..':recieve', source, plate, vehicles[plate][type])
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This vehicle is already in use!' })
		end 
	else
		vehicles[plate] = {
			inuse = true,
			trunk = {{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},},
			glovebox = {{index=false},{index=false},{index=false},{index=false},{index=false},},
		}
		TriggerClientEvent('fsn_inventory:veh:'..type..':recieve', source, plate, vehicles[plate][type])
	end	
end)

RegisterServerEvent('fsn_inventory:veh:finished')
AddEventHandler('fsn_inventory:veh:finished', function(plate)
	if vehicles[plate] then
		vehicles[plate].inuse = false
	end
end)

RegisterServerEvent('fsn_inventory:veh:update')
AddEventHandler('fsn_inventory:veh:update', function(type,plate,tbl)
	if vehicles[plate] then
		vehicles[plate][type] = tbl
	end
end)