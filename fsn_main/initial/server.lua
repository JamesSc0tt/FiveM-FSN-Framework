AddEventHandler('fsn_main:validatePlayer', function()

end)
---------------------------- Character Shit
cur_chars = {}
AddEventHandler('playerDropped', function()
	for k, v in pairs(cur_chars) do
		if v.ply_id == source then
			cur_chars[k] = nil
		end
	end
end)
RegisterServerEvent('fsn_main:updateCharacters')
RegisterServerEvent('fsn_main:createCharacter')
AddEventHandler('fsn_main:createCharacter', function(data)
  local source = source
  print(':fsn_main: got character information')
  for k, v in pairs(data) do
    print('> '..k..' = '..v)
  end
  local steamid = GetPlayerIdentifiers(source)
  steamid = steamid[1]
  MySQL.Sync.execute("INSERT INTO `fsn_characters` (`char_id`, `steamid`, `char_fname`, `char_lname`, `char_dob`, `char_desc`, `char_licenses`, `char_contacts`, `char_money`, `char_bank`, `char_model`, `mdl_extras`, `char_inventory`, `char_weapons`, `char_police`, `char_ems`) VALUES (NULL, @steamid, @char_fname, @char_lname, @char_dob, @char_desc, '{}', '{}', '500', '5000', '{}', '[]', '[]', '[]', '0', '0')", {['@steamid'] = steamid, ['@char_fname'] = data.char_fname, ['@char_lname'] = data.char_lname, ['@char_dob'] = data.char_dob, ['@char_desc'] = data.char_desc })
  local characters = MySQL.Sync.fetchAll("SELECT * FROM `fsn_characters` WHERE `steamid` = '"..steamid.."'")
  TriggerClientEvent('fsn_main:sendCharacters', source, characters)
end)
--[[
AddEventHandler('playerDropped', function()
  for k, v in pairs(cur_chars) do
    if v.ply_id == source then
      print('REMOVING '..v.char_fname..v.char_lname..' FROM CHARACTERS TABLE')
      table.remove(cur_chars, k)
      table.concat(cur_chars,", ",1,#cur_chars)
    end
  end
  TriggerEvent('fsn_main:updateCharacters', cur_chars)
end)
]]
RegisterServerEvent('fsn_main:requestCharacters')
AddEventHandler('fsn_main:requestCharacters', function()
  local source = source
  local steamid = GetPlayerIdentifiers(source)
  steamid = steamid[1]
  local characters = MySQL.Sync.fetchAll("SELECT * FROM `fsn_characters` WHERE `steamid` = '"..steamid.."'")
  for k, v in pairs(players) do
  	if v.steamid == steamid then
  		if v.banned then
  			 print(':FSN: '..v.name..' is BANNED for: '..v.banned_r)
  			 DropPlayer(source, ':FSN: You are BANNED: '..v.banned_r)
  			 CancelEvent()
  		end
  	end
  end
  TriggerClientEvent('fsn_main:sendCharacters', source, characters)
  updateIdentifiers(source)
end)

RegisterServerEvent('fsn_main:update:myCharacter')
AddEventHandler('fsn_main:update:myCharacter', function(index, char)
  for k, v in pairs(cur_chars) do
    if v.ply_id == source then
      v = char
    end
  end
  --cur_chars[index] = char
end)

RegisterServerEvent('fsn_main:getCharacter')
AddEventHandler('fsn_main:getCharacter', function(char_id)
  local source = source
  local steamid = GetPlayerIdentifiers(source)
  steamid = steamid[1]
  -- TODO: Investigate if the steamid check can be put into the MySQL query
  local char = MySQL.Sync.fetchAll("SELECT * FROM `fsn_characters` WHERE `char_id` = '"..char_id.."'")
  if char[1].steamid == steamid then
    TriggerClientEvent('fsn_main:initiateCharacter', source, char)
    --[[
    for k, v in pairs(cur_chars) do
      if v.ply_id == source then
        table.remove(cur_chars, k)
      end
    end
    for k, v in pairs(cur_chars) do
      if v.ply_id == source then
        table.remove(cur_chars,k)
      end
    end
    ]]
    cur_chars[#cur_chars+1] = {
      ply_id         = source,
      ply_name       = GetPlayerName(source),
      char_id        = char[1].char_id,
      char_fname     = char[1].char_fname,
      char_lname     = char[1].char_lname,
      char_dob       = char[1].char_dob,
      char_phone     = char[1].char_phone,
      char_contacts  = char[1].char_contacts,
      char_police    = char[1].char_police,
      char_ems       = char[1].char_ems,
      char_twituname = char[1].char_twituname
    }
	
    TriggerEvent('fsn_main:money:initChar', source, char[1].char_id, char[1].char_money, char[1].char_bank)
	
    TriggerClientEvent('fsn_main:updateCharacters', -1, cur_chars)
    TriggerEvent('fsn_main:updateCharacters', cur_chars)
  else
    DropPlayer(source, ':FSN: You tried to load a character you do not own.')
  end
end)

AddEventHandler('fsn_main:updateCharacters', function(char)
  print(':DEBUG: Character Update')
  for k, c in pairs(char) do
    print(c.ply_id..'> F: '..c.char_fname..', L: '..c.char_lname)
  end
end)

function fsn_GetPlayerFromCharacterId(id)
  local idee = 0
  for k, v in pairs(cur_chars) do
    if v.char_id == tonumber(id) then
      idee = v.ply_id
    end
  end
  return idee
end

function fsn_GetCharacterInfo(id)
	local idee = false
	for k, v in pairs(cur_chars) do
		if v.char_id == tonumber(id) then
		  idee = v
		end
	end
	return idee
end

function fsn_CharID(src)
  local charid = 0
  for k, v in pairs(cur_chars) do
    if v.ply_id == tonumber(src) then
      charid = v.char_id
    end
  end
  return charid
end

function fsn_GetPlayerFromPhoneNumber(num)
  local idee = 0
  for k, v in pairs(cur_chars) do
    if v.char_phone == num then
      idee = v.ply_id
    end
  end
  return idee
end

function fsn_GetPlayerPhoneNumber(ply)
  local idee = 0
  for k, v in pairs(cur_chars) do
    if v.ply_id == tonumber(ply) then
      idee = v.char_phone
    end
  end
  return idee
end

RegisterServerEvent('fsn_main:updateCharNumber')
AddEventHandler('fsn_main:updateCharNumber', function(charid, number)
  for k, v in pairs(cur_chars) do
    if v.char_id == tonumber(charid) then
      v.char_phone = number
      print(v.char_id..' updated phone number to: '..v.char_phone)
    end
  end
end)

-------------------------------------------- inventory saving
RegisterServerEvent('fsn_inventory:database:update')
AddEventHandler('fsn_inventory:database:update', function(inv)
  local charid = 0
  for k, v in pairs(cur_chars) do
    if v.ply_id == source then
      charid = v.char_id
    end
  end
  inv = json.encode(inv)
  MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_inventory` = @inventory WHERE `fsn_characters`.`char_id` = @id", {['@id'] = charid, ['@inventory'] = inv})
end)
-------------------------------------------- vehicle shit
RegisterServerEvent('fsn_cargarage:buyVehicle')
AddEventHandler('fsn_cargarage:buyVehicle', function(charid, displayname, spawnname, plate, details, finance, vehtype, status)
  details = json.encode(details)
  finance = json.encode(finance)
  plate = string.upper(plate)
  MySQL.Async.execute("INSERT INTO `fsn_vehicles` (`veh_id`, `char_id`, `veh_displayname`, `veh_spawnname`, `veh_plate`, `veh_inventory`, `veh_details`, `veh_finance`, `veh_type`, `veh_status`, `veh_garage`) VALUES (NULL, @charid, @displayname, @spawnname, @plate, '{}', @details, @finance, @vehtype, @status, 0);", {
	--@charid, @displayname, @spawnname, @plate, @details, @finance, @status
	['@charid'] = charid,
	['@displayname'] = displayname,
	['@spawnname'] = spawnname,
	['@plate'] = plate,
	['@details'] = details,
	['@finance'] = finance,
	['@vehtype'] = vehtype,
	['@status'] = status,
  }, function(rowsChanged) end)
end)
-------------------------------------------- Character Saving
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(300000)
    local plys = GetPlayers()
    print(':fsn_main: Saving '..#plys..' player(s) data')
    for k, player in pairs(plys) do
      TriggerClientEvent('fsn_main:characterSaving', player)
    end
  end
end)
RegisterServerEvent('fsn_main:saveCharacter')
AddEventHandler('fsn_main:saveCharacter', function(charid, model, vars, weapons)
  local source = source
  MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_model` = @model, `mdl_extras` = '"..vars.."', `char_weapons` = @weapons WHERE `fsn_characters`.`char_id` = @id", {['@id'] = charid, ['@model'] = model, ['@weapons'] = weapons})
  print(':FSN: Character information for '..GetPlayerName(source)..' updated!')
  checkBan(source, false)
end)
------------------------------------------------------ POLICE
RegisterServerEvent('fsn_police:chat:ticket')
AddEventHandler('fsn_police:chat:ticket', function(suspectID, jailFine, jailTime, charges)
  for k, v in pairs(cur_chars) do
    if v.ply_id then
      --print(v.ply_id..' != '..suspectID)
      if v.ply_id == tonumber(suspectID) then
        if tonumber(jailTime) > 0 then
          TriggerClientEvent('chatMessage', -1, '', {255,255,255}, v.char_fname..' '..v.char_lname.. ' has been JAILED for ^3'..jailTime..'^0 months for ^1'..charges)
        end
        if tonumber(jailFine) > 0 then
          TriggerClientEvent('chatMessage', -1, '', {255,255,255}, v.char_fname..' '..v.char_lname.. ' has been FINED ^3$'..jailFine..'^0 for ^1'..charges)
        end
      end
    end
  end
end)
------------------------------------------------------------- version control stuff
-------------------------------------------------------------
SetGameType(':FSN: Framework')
