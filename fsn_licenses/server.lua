RegisterServerEvent('fsn_licenses:chat')
AddEventHandler('fsn_licenses:chat', function(name, license, players)
  for k, v in pairs(players) do
    if license.type == 'id' then
      TriggerClientEvent('chatMessage', v, '', {255,255,255}, '^1ID^0 | '..name..' | '..license.job..' | Ticket# '..source..' | ID# '..license.charid)
    else
      TriggerClientEvent('chatMessage', v, '', {255,255,255}, '^1LICENSE^0 | '..name..' | T:'..license.type..' | I:'..license.infractions..' | S:'..license.status)
    end
  end
end)

RegisterServerEvent('fsn_licenses:check')
AddEventHandler('fsn_licenses:check', function(type, infractions, date, time)
  local date = date + 2592000
  if date < time then
    TriggerClientEvent('fsn_licenses:update', source, type, 'ACTIVE')
  end
  if infractions > 15 then
    TriggerClientEvent('fsn_licenses:update', source, type, 'SUSPENDED')
  end
end)

RegisterServerEvent('fsn_licenses:update')
AddEventHandler('fsn_licenses:update', function(charid, licenses_json)
  MySQL.Async.execute('UPDATE `fsn_characters` SET `char_licenses` = @licenses WHERE `char_id` = @charid', {
    ['@charid'] = charid,
    ['@licenses'] = licenses_json
  }, function() end)
end)
