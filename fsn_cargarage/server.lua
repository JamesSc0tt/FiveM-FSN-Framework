--TriggerServerEvent("fsn_cargarage:updateVehicle", plate, table.tostring(vehiclecol), table.tostring(extracol), table.tostring(neoncolor), plateindex, table.tostring(mods), GetVehicleNumberPlateTextIndex(veh), wheeltype);
RegisterServerEvent('fsn_cargarage:updateVehicle')
AddEventHandler('fsn_cargarage:updateVehicle', function(tbl)
  
  local details = json.encode(tbl)
  print('updating Vehicle('..tbl.plate..') to Details('..details..')')
  MySQL.Sync.execute("UPDATE `fsn_vehicles` SET `veh_details` = @details WHERE `veh_plate` = @plate", {
    ['@plate'] = tbl.plate,
    ['@details'] = details,
  })
end)

RegisterServerEvent('fsn_cargarage:reset')
AddEventHandler('fsn_cargarage:reset', function(charid)
  MySQL.Sync.execute('UPDATE `fsn_vehicles` SET `veh_status` = 0 WHERE `veh_status` = 1 AND `char_id` = @charid', {['@charid'] = charid})
end)

--------------------------------------------------------------------------------
RegisterServerEvent('fsn_cargarage:requestVehicles')
AddEventHandler('fsn_cargarage:requestVehicles', function(type, charid, grg)
  local player = source
  if type == 'cars' then
    MySQL.Async.fetchAll('SELECT * FROM `fsn_vehicles` WHERE `char_id` = @char_id AND `veh_type` = "c"', {['@char_id'] = charid}, function(vehicles)
      local vehtbl = {}
        for k, v in pairs(vehicles) do
			if v.veh_garage == grg or v.veh_garage == '0' then
				print(v.veh_garage..' is '..grg)
				table.insert(vehtbl,#vehtbl+1,v)
			else
				print(v.veh_garage..' is not '..grg)
			end
        end

        TriggerClientEvent('fsn_cargarage:receiveVehicles', player, 'cars', vehtbl)
    end)
  elseif type == 'aircrafts' then
    MySQL.Async.fetchAll('SELECT * FROM `fsn_vehicles` WHERE `char_id` = @char_id AND `veh_type` = "a"', {['@char_id'] = charid}, function(vehicles)
      vehtbl = {}
      for k, v in pairs(vehicles) do
        if v.veh_garage == grg or v.veh_garage == '0' then
          print(v.veh_garage..' is '..grg)
          table.insert(vehtbl,#vehtbl+1,v)
        else
          print(v.veh_garage..' is not '..grg)
        end
          end
  
          TriggerClientEvent('fsn_cargarage:receiveVehicles', player, 'aircrafts', vehtbl)
    end)
  elseif type == 'boats' then
    MySQL.Async.fetchAll('SELECT * FROM `fsn_vehicles` WHERE `char_id` = @char_id AND `veh_type` = "b"', {['@char_id'] = charid}, function(vehicles)
      vehtbl = {}
      for k, v in pairs(vehicles) do
        if v.veh_garage == grg or v.veh_garage == '0' then
          print(v.veh_garage..' is '..grg)
          table.insert(vehtbl,#vehtbl+1,v)
        else
          print(v.veh_garage..' is not '..grg)
        end
          end
  
          TriggerClientEvent('fsn_cargarage:receiveVehicles', player, 'boats', vehtbl)
    end)
  else
    TriggerClientEvent('fsn_notify:displayNotification', source, 'Something is wrong with this garage!', 'centerLeft', 3000, 'error')
  end
end)

--TriggerServerEvent('fsn_cargarage:impound', GetVehicleNumberPlateText(car))
RegisterServerEvent('fsn_cargarage:impound')
AddEventHandler('fsn_cargarage:impound', function(plate)
  local status = 2
  MySQL.Async.execute('UPDATE `fsn_vehicles` SET `veh_status` = @status WHERE `veh_plate` = @plate', {['@plate'] = plate, ['@status'] = status}, function() end)
end)

RegisterServerEvent('fsn_cargarage:vehicle:toggleStatus')
AddEventHandler('fsn_cargarage:vehicle:toggleStatus', function(plate, status, grg)
  TriggerClientEvent('fsn_cargarage:vehicleStatus', source, plate, status, grg)
  MySQL.Async.execute('UPDATE `fsn_vehicles` SET `veh_status` = @status, `veh_garage` = @garage WHERE `veh_plate` = @plate', {['@plate'] = plate, ['@status'] = status, ['@garage'] = grg}, function() end)
end)

RegisterServerEvent('fsn_garages:vehicle:update')
AddEventHandler('fsn_garages:vehicle:update', function(details)
	TriggerEvent('fsn_cargarage:updateVehicle', details)
end)
