RegisterServerEvent('fsn_police:k9:search:person:end')
AddEventHandler('fsn_police:k9:search:person:end', function(Found, OfficerId)
    TriggerClientEvent('fsn_police:k9:search:person:finish', OfficerId, Found)
end)