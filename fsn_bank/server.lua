RegisterServerEvent('fsn_bank:database:update')
AddEventHandler('fsn_bank:database:update', function(charid, wallet, bank)
  if bank ~= false then
    MySQL.Sync.execute("UPDATE fsn_characters SET char_bank=@bank WHERE char_id=@char_id", {['@char_id'] = charid, ['@bank'] = bank})
  end
  if wallet ~= false then
    MySQL.Sync.execute("UPDATE fsn_characters SET char_money=@wallet WHERE char_id=@char_id", {['@char_id'] = charid, ['@wallet'] = wallet})
  end
  --else
  --  MySQL.Sync.execute("UPDATE fsn_characters SET char_money=@wallet, char_bank=@bank WHERE char_id=@char_id", {['@char_id'] = charid, ['@wallet'] = wallet, ['@bank'] = bank})
  --end
end)

RegisterServerEvent('fsn_bank:transfer')
AddEventHandler('fsn_bank:transfer', function(receive, amount)
  if GetPlayerName(receive) then
    TriggerClientEvent('fsn_bank:change:bankAdd', receive, amount)
    TriggerClientEvent('fsn_bank:change:bankMinus', source, amount)
  else
    TriggerClientEvent('fsn_notify:displayNotification', source, 'We cannot find this account!', 'centerRight', 4000, 'error')
  end
end)
