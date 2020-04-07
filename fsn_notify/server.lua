RegisterNetEvent('fsn_notify:displayNotification')
AddEventHandler('fsn_notify:displayNotification', function(ply, msg, place, time, type)
  TriggerClientEvent('pNotify:SendNotification', ply, {text = msg, layout = place, timeout = time, type = type})
end)