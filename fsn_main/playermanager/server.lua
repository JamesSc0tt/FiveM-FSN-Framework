local mysql = false

players = {}
AddEventHandler('playerConnecting', function(playername, setKickReason)
  local admin_lvl = 0
  local source = source
  local playername = playername
  local setKickReason = setKickReason
  local identity = {}
  if mysql then
    identity = GetPlayerIdentifiers(source)
    print(':FSN: '..playername..' is connecting with steamid '..identity[1])
	if not string.find(identity[1], "steam") then
		DropPlayer(source, 'Restart FiveM with Steam running to join.')
		setKickReason('Restart FiveM with Steam running to join.')
		CancelEvent()
	end
	if string.find(identity[1], "license") then
		DropPlayer(source, 'Restart FiveM with Steam running to join.')
		setKickReason('Restart FiveM with Steam running to join.')
		CancelEvent()
	end
    MySQL.Async.fetchAll("SELECT * FROM fsn_users WHERE steamid = '"..identity[1].."'", {}, function(user)
      if not user[1] then
	playername = playername:gsub('%W','')
        MySQL.Sync.execute("INSERT INTO `fsn_users` (`name`, `steamid`, `connections`, `banned`, `banned_r`) VALUES ('"..playername.."', '"..identity[1].."', '1', '0', '')")
        table.insert(players, {id=#players+1, name=playername, steamid=identity[1], adminlvl=0, banned=false})
      else
        if user[1].banned > os.time() or user[1].banned == -1 then
		  kickplayer = false
		  table.insert(players, {id=#players+1, name=playername, steamid=identity[1], adminlvl=user[1].admin_lvl, banned=true, banned_r = user[1].banned_r})
        else
          kickplayer = false
          local connections = user[1].connections + 1
          MySQL.Sync.execute("UPDATE `fsn_users` SET `connections` = '"..connections.."' WHERE `fsn_users`.`steamid` = '"..identity[1].."';")
		  admin_lvl = user[1].admin_lvl
          table.insert(players, {id=#players+1, name=playername, steamid=identity[1], adminlvl=admin_lvl, banned=false})
        end
      end
    end)
    MySQL.Async.fetchAll("SELECT * FROM fsn_users WHERE steamid = '"..identity[1].."'", {}, function(user)
      if not user[1] then
	DropPlayer(source, 'Your user was not entered into the database properly, please try again.')
	setKickReason('Your user was not entered into the database properly, please try again.')
	CancelEvent()
      end
    end)
  else
    kickplayer = true
  end
  checkBan(source, setKickReason)
end)

AddEventHandler('playerDropped', function()
  TriggerClientEvent('fsn_main:characterSaving', source)
  print(':FSN: '..GetPlayerName(source)..' has disconnected.')
  local steamid = GetPlayerIdentifiers(source)
  steamid = steamid[1]
  for k, v in pairs(players) do
    if v.steamid == steamid then
      table.remove(players, k)
      print('REMOVING '..v.name..' FROM PLAYERS TABLE')
      for k, v in pairs(players) do
        print("{id = "..v.id..", name = "..v.name..", steamid = "..v.steamid..", adminlvl = "..v.adminlvl..", banned = "..tostring(v.banned).."}")
      end
    end
  end
end)

RegisterServerEvent('fsn_main:validatePlayer')
AddEventHandler('fsn_main:validatePlayer', function()
  local steamid = GetPlayerIdentifiers(source)
  steamid = steamid[1]
  for k, v in pairs(players) do
    print("{id = "..v.id..", name = "..v.name..", steamid = "..v.steamid..", adminlvl = "..v.adminlvl..", banned = "..tostring(v.banned).."}")
    if v.steamid == steamid then
      if v.banned == false then
        print('validated')
        return
      end
    else
      print('not validated')
    end
  end
  DropPlayer(source, ':FSN: The server failed to authenticate you, you may have been banned.')
  CancelEvent()
end)

MySQL.ready(function()
    mysql = true
    MySQL.Async.execute('UPDATE `fsn_vehicles` SET `veh_status` = 0 WHERE `veh_status` = 1', {}, function() end)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(600000)
    local players = GetPlayers()
    for k, v in pairs(players) do
      if GetPlayerPing(v) <= 0 then
        TriggerClientEvent('chatMessage', -1, ':FSN:', {255,0,0}, GetPlayerName(v)..' was instanced and removed from the session.')
        DropPlayer(v, ':FSN: You were instanced, please rejoin. Sorry :(')
      end
    end
  end
end)
