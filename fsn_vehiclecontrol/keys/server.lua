RegisterServerEvent('fsn_vehiclecontrol:givekeys')
AddEventHandler('fsn_vehiclecontrol:givekeys', function(veh, ply)
  TriggerClientEvent('fsn_vehiclecontrol:getKeys', ply, veh)
end)
