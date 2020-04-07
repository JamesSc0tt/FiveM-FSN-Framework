RegisterServerEvent('fsn_fuel:update')
AddEventHandler('fsn_fuel:update', function(veh, fuel)
  TriggerClientEvent('fsn_fuel:update', -1, veh, fuel)
end)
