local onduty_police = {}
local rnd_names = {
  "Anita Knack",
  "Shila Dube",
   "Jean Kies",
   "Sabine Trudell",
   "Mica Behr",
   "Arianna Dunleavy",
   "Santina Mandelbaum",
   "Joana Proto",
   "Neville Beattie",
   "Kenny Brouillard",
   "Berenice Vanbuskirk",
   "Madelyn Toews",
   "Thao Sustaita",
   "Jackelyn Rausch",
   "Ira Gravel",
   "Earnest Karl",
   "Shauna Belknap",
   "Belen Hayne",
   "Paulita Gershman",
   "Hildegarde Mcgahan",
   "Lasandra Kerbs",
   "Alexis Whitworth",
   "Ciara Guillet",
   "Shoshana Youngberg",
   "Thalia Nuss",
   "Mozella North",
   "Mirta Northrop",
   "Casandra Eurich",
   "Christin Maus",
   "Kiara Netzer",
   "Kandy Armentrout",
   "Marquis Nakashima",
   "Marceline Huff",
   "Yer Messing",
   "Masako Sutliff",
   "Taren Kadel",
   "Emilie Conway",
   "Elanor Jessee",
   "Neomi Bethel",
   "Ione Campbell",
   "Mireille Horton",
   "Avril Winkle",
   "Lois Vossler",
   "Carmine Ostrowski",
   "Kiesha Feltz",
   "Livia Kime",
   "Keven Starrett",
   "Chas Penwell",
   "Ilona Wakefield",
   "Abigail Liberty",
}

RegisterServerEvent('fsn_police:dispatch')
AddEventHandler('fsn_police:dispatch', function(coords, id, chatPrint)
  TriggerClientEvent('fsn_police:dispatchcall', -1, coords, id, chatPrint)
end)

RegisterServerEvent('fsn_police:runplate::target')
AddEventHandler('fsn_police:runplate::target', function(plate)
  TriggerEvent('fsn_police:runplate', source, plate)
end)

RegisterServerEvent('fsn_police:runplate')
AddEventHandler('fsn_police:runplate', function(src, plate)
  MySQL.Async.fetchAll('SELECT * FROM `fsn_vehicles` WHERE `veh_plate` = @plate', {['@plate'] = plate}, function(vehicle)
    if not vehicle[1] then
      TriggerClientEvent('fsn_police:MDT:vehicledetails', src, rnd_names[math.random(1,#rnd_names)], false, false)
    else
      MySQL.Async.fetchAll('SELECT * FROM `fsn_characters` WHERE `char_id` = @charid', {['@charid'] = vehicle[1].char_id}, function(char)
        MySQL.Async.fetchAll('SELECT * FROM `fsn_warrants` WHERE `suspect_name` LIKE @name AND `war_status` = "active"', {['@name'] = char[1].char_fname..' '..char[1].char_lname}, function(warrants)
          if warrants[1] then
            TriggerClientEvent('fsn_police:MDT:vehicledetails', src, char[1].char_fname..' '..char[1].char_lname, true, vehicle[1])
          else
            TriggerClientEvent('fsn_police:MDT:vehicledetails', src, char[1].char_fname..' '..char[1].char_lname, false, vehicle[1])
          end
        end)
      end)
    end
  end)
end)

RegisterServerEvent('fsn_police:toggleHandcuffs')
AddEventHandler('fsn_police:toggleHandcuffs', function(ply)
  TriggerClientEvent('fsn_police:handcuffs:toggle', -1, ply)
end)

RegisterServerEvent('fsn_police:ticket')
AddEventHandler('fsn_police:ticket', function(ply, ticket)
  TriggerClientEvent('fsn_bank:change:bankMinus', ply, ticket)
  TriggerClientEvent('fsn_notify:displayNotification', ply, 'You have been fined $'..ticket..' by the state.', 'centerLeft', 10000, 'alert')
  TriggerClientEvent('fsn_notify:displayNotification', source, 'You fined '..ply..' $'..ticket, 'centerLeft', 6000, 'info')
end)

RegisterServerEvent('fsn_police:update')
RegisterServerEvent('fsn_police:onDuty')
AddEventHandler('fsn_police:onDuty', function(policelevel)
  if policelevel > 2 then
    table.insert(onduty_police, {ply_id = source, ply_lvl = policelevel})
    TriggerClientEvent('fsn_police:update', -1, onduty_police)
    TriggerEvent('fsn_police:update', onduty_police)
    print(source..' has clocked on duty at level '..policelevel)
  else
    print(':fsn_police: '..source..' has clocked in as police, but is not high enough level to contribute.')
  end
end)

RegisterServerEvent('fsn_police:offDuty')
AddEventHandler('fsn_police:offDuty', function()
  for k, v in pairs(onduty_police) do
    if v.ply_id == source then
      table.remove(onduty_police, k)
      print(':fsn_police: '..source..' has clocked out.')
    end
  end
  TriggerClientEvent('fsn_police:update', -1, onduty_police)
  TriggerEvent('fsn_police:update', onduty_police)
end)

AddEventHandler('playerDropped', function()
  for k, v in pairs(onduty_police) do
    if v.ply_id == source then
      table.remove(onduty_police, k)
    end
  end
  TriggerClientEvent('fsn_police:update', -1, onduty_police)
end)

RegisterServerEvent('fsn_police:requestUpdate')
AddEventHandler('fsn_police:requestUpdate', function()
  TriggerClientEvent('fsn_police:update', source, onduty_police)
end)

RegisterServerEvent('fsn_police:search:end:inventory')
AddEventHandler('fsn_police:search:end:inventory', function(inv_tbl, officerid)
  local str = ''
  for k, v in pairs(inv_tbl) do
    str = str..'['..v.amount..'X] '..v.display_name..', '
  end
  TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*SEARCH |^0^r '..str)
  TriggerClientEvent('chatMessage', officerid, '', {255,255,255}, '^1^*SEARCH |^0^r '..str)
end)

RegisterServerEvent('fsn_police:search:end:weapons')
AddEventHandler('fsn_police:search:end:weapons', function(wep_tbl, officerid)
	if #wep_tbl < 1 then
		TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*SEARCH |^0^r No weapons found.')
		TriggerClientEvent('chatMessage', officerid, '', {255,255,255}, '^1^*SEARCH |^0^r No weapons found.')
	else
		for k, v in pairs(wep_tbl) do
			TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*SEARCH (weapon) |^0^r '..v.name..' | Registered to: '..v.owner.name..' | Serial: '..v.owner.serial)
			TriggerClientEvent('chatMessage', officerid, '', {255,255,255}, '^1^*SEARCH (weapon) |^0^r '..v.name..' | Registered to: '..v.owner.name..' | Serial: '..v.owner.serial)
		end
	end
	--TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*SEARCH |^0^r '..str)
	--TriggerClientEvent('chatMessage', officerid, '', {255,255,255}, '^1^*SEARCH |^0^r '..str)
end)

RegisterServerEvent('fsn_police:search:end:money')
AddEventHandler('fsn_police:search:end:money', function(officerid, money_tbl)
  TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*SEARCH |^0^r Wallet: ^6$'..money_tbl.wallet..'^0, Bank: ^6$'..money_tbl.bank)
  TriggerClientEvent('chatMessage', officerid, '', {255,255,255}, '^1^*SEARCH |^0^r Wallet: ^6$'..money_tbl.wallet..'^0, Bank: ^6$'..money_tbl.bank)
end)


----------- escorting
RegisterServerEvent('fsn_police:cuffs:toggleEscort')
AddEventHandler('fsn_police:cuffs:toggleEscort', function(ply)
	TriggerClientEvent('fsn_police:ply:toggleDrag', ply, source)
	TriggerClientEvent('fsn_police:pd:toggleDrag', source, ply)
end)

------------ cuffing
RegisterServerEvent('fsn_police:cuffs:requestCuff')
AddEventHandler('fsn_police:cuffs:requestCuff', function(ply)
	TriggerClientEvent('fsn_police:cuffs:startCuffing', source)
	TriggerClientEvent('fsn_police:cuffs:startCuffed', ply, source)
end)
RegisterServerEvent('fsn_police:cuffs:requestunCuff')
AddEventHandler('fsn_police:cuffs:requestunCuff', function(ply)
	TriggerClientEvent('fsn_police:cuffs:startunCuffing', source)
	TriggerClientEvent('fsn_police:cuffs:startunCuffed', ply, source)
end)
RegisterServerEvent('fsn_police:cuffs:toggleHard')
AddEventHandler('fsn_police:cuffs:toggleHard', function(ply)
	TriggerClientEvent('fsn_police:cuffs:toggleHard', ply)
end)