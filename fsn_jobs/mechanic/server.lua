local mechanic = -1

RegisterServerEvent('fsn_jobs:mechanic:toggle')
AddEventHandler('fsn_jobs:mechanic:toggle', function()
  if mechanic == -1 then
    TriggerClientEvent('fsn_jobs:mechanic:toggleduty', source)
    mechanic = source
  else
    if mechanic == source then
      TriggerClientEvent('fsn_jobs:mechanic:toggleduty', source)
      mechanic = -1
    else
      TriggerClientEvent('fsn_notify:displayNotification', source, 'There is already a mechanic on duty!<br>Current mechanic: <b>'..mechanic, 'centerRight', 4000, 'error')
    end
  end
end)
