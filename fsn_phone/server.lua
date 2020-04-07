local Adverts = {}
RegisterServerEvent('fsn_phone:adverts:request')
AddEventHandler('fsn_phone:adverts:request', function()
	TriggerClientEvent('fsn_phone:adverts:update', source, Adverts)
end)
RegisterServerEvent('fsn_phone:adverts:add')
AddEventHandler('fsn_phone:adverts:add', function(name, num, txt)
	for k, ad in pairs(Adverts) do
		if ad.writerid == source then
			table.remove(Adverts, k)
		end
	end
	table.insert(Adverts, #Adverts+1, {
		writerid = source,
		writer = name,
		number = num,
		text = txt
	})
	TriggerClientEvent('fsn_phone:adverts:update', -1, Adverts)
end)
RegisterServerEvent('fsn_phone:adverts:remove')
AddEventHandler('fsn_phone:adverts:remove', function(number)
	for k, ad in pairs(Adverts) do
		if ad.number == number then
			table.remove(Adverts, k)
		end
	end
	TriggerClientEvent('fsn_phone:adverts:update', -1, Adverts)
end)
AddEventHandler('playerDropped', function (source, reason)
	for k, ad in pairs(Adverts) do
		if ad.writerid == source then
			table.remove(Adverts, k)
		end
	end
	TriggerClientEvent('fsn_phone:adverts:update', -1, Adverts)
end)


RegisterServerEvent('fsn_phone:purchased')
AddEventHandler('fsn_phone:purchased', function(charid)
  local src = source
  local numbers = {1,2,3,4,5,6,7,8,9}
  local tbl = {}
  for id = 1, 6 do
    table.insert(tbl,#tbl+1,numbers[math.random(1, #numbers)])
  end
  local number = table.concat( tbl, '', 1, #tbl )
  MySQL.Async.execute('UPDATE `fsn_characters` SET `char_phone` = @number WHERE `fsn_characters`.`char_id` = @charid;', {['@charid'] = charid, ['@number'] = number}, function(rowsChanged)
    TriggerClientEvent('fsn_notify:displayNotification', src, 'Your new number is: <b>'..number, 'centerLeft', 10000, 'info')
    TriggerClientEvent('fsn_phone:updateNumber', src, tonumber(number))
    TriggerClientEvent('fsn_phone:recieveMessage', src, {
      sender = 'Lifeinvader',
      from_number = 696969,
      to_number = number,
      message = 'Welcome to Lifeinvader! Your new mobile phone number is '..number..'. ~Lifeinvader Team'
    })
  end)
end)

RegisterServerEvent('fsn_phone:db:updateContacts')
AddEventHandler('fsn_phone:db:updateContacts', function(charid, contactjson)
  MySQL.Async.execute('UPDATE `fsn_characters` SET `char_contacts` = @contacts WHERE `fsn_characters`.`char_id` = @charid;', {['@charid'] = charid, ['@contacts'] = contactjson}, function(rowsChanged) end)
end)

RegisterServerEvent('fsn_phone:sendMessage')
AddEventHandler('fsn_phone:sendMessage', function(tonum, fromnum, msg)
  --local from = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(tonumber(tonum))
  local client = exports.fsn_main:fsn_GetPlayerFromPhoneNumber(tonumber(tonum))
  --local fromid = from.char_id
  --local clientid = client.char_id
  if client ~= 0 then
    TriggerClientEvent('fsn_phone:recieveMessage', client, {
      sender = false,
      from_number = fromnum,
      to_number = tonum,
      message = msg
    })
    TriggerClientEvent('fsn_notify:displayNotification', source, 'Message delivered', 'centerRight', 8000, 'success')
    --MySQL.Async.execute('INSERT INTO `fsn_textmessages` (`txt_id`, `txt_sender`, `txt_reciever`, `txt_message`, `txt_date`) VALUES (NULL, @sender, @reciever, @message, CURRENT_TIMESTAMP)', {['@sender'] = fromid,['@reciever'] = clientid,['@message'] = msg,}, function(rowsChanged) end)
  else
    TriggerClientEvent('fsn_notify:displayNotification', source, 'No player found with number <b>'..tonumber(tonum), 'centerRight', 8000, 'error')
  end
end)

RegisterServerEvent('fsn_phone:chat')
AddEventHandler('fsn_phone:chat', function(str, players)
  for k, v in pairs(players) do
    TriggerClientEvent('chatMessage', v, '', {255,255,255}, str)
  end
end)

RegisterServerEvent('fsn_garage:phone:requestAll')
AddEventHandler('fsn_garage:phone:requestAll', function()
	local char_id = exports["fsn_main"]:fsn_CharID(source)
	local src = source
	MySQL.Async.fetchAll("SELECT * FROM fsn_vehicles where char_id = @charid", {['@charid'] = char_id }, function(tbl)
		TriggerClientEvent('fsn_garage:phone:recieveAll', src, tbl)
    end)
end)
