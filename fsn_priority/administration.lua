-- stuff to administrate prio

local prio_moderators = {}

function fsn_isModerator(src)
  local devid = {
    'steam:11000010e0828a9', 'steam:11000011098d978', 'steam:110000106f35cce'
  }
  local steamid = GetPlayerIdentifiers(src)[1]
  return table.contains(devid, steamid)
end

function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

function fsn_SplitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

AddEventHandler('chatMessage', function(source, auth, msg)
	local split = fsn_SplitString(msg, ' ')
	if split[1] == '/priority' then
		if split[2] == 'admin' then
			if fsn_isModerator(source) then
				if split[3] == 'check' then
					local steamid = GetPlayerIdentifiers(tonumber(split[4]))[1]
					local src = source
					MySQL.Async.fetchAll('SELECT * FROM `fsn_users` WHERE `steamid` = @steamid', {['@steamid'] = steamid}, function(res)
						for k, usr in pairs(res) do
							if usr.priority ~= 0 then
								TriggerClientEvent('chatMessage', src, '', {255,255,255}, '^1^*:fsn_priority:^0^r '..usr.name..' priority level: '..usr.priority)
							else
								TriggerClientEvent('chatMessage', src, '', {255,255,255}, '^1^*:fsn_priority:^0^r '..usr.name..' does not have priority.')
							end
						end
					end)
				end
				if split[3] == 'set' then
					split[5] = tonumber(split[5])
					if split[5] > 90 then
						TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:fsn_priority:^0^r Admin priority levels need to be set in the database!')
					else
						local steamid = GetPlayerIdentifiers(tonumber(split[4]))[1]
						local src = source
						Queue.AddPriority(steamid, split[5])
						MySQL.Sync.execute("UPDATE `fsn_users` SET `priority` = @prio WHERE `steamid` = @steamid", {['@prio'] = split[5], ['@steamid'] = steamid})
						TriggerClientEvent('chatMessage', split[4], '', {255,255,255}, '^1^*:fsn_priority:^0^r A moderator updated your priority. Use: /priority check')
						TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:fsn_priority:^0^r You set '..steamid..' priority to: '..split[5])
					end
				end
				if split[3] == 'remove' then
					local steamid = GetPlayerIdentifiers(tonumber(split[4]))[1]
					Queue.RemovePriority(steamid)
					MySQL.Sync.execute("UPDATE `fsn_users` SET `priority` = 0 WHERE `steamid` = @steamid", {['@steamid'] = steamid})
					TriggerClientEvent('chatMessage', split[4], '', {255,255,255}, '^1^*:fsn_priority:^0^r A moderator removed your priority')
					TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:fsn_priority:^0^r You removed '..steamid..' priority')
				end
				if split[3] == 'tempset' then
					split[5] = tonumber(split[5])
					if split[5] > 90 then
						TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:fsn_priority:^0^r Admin priority levels need to be set in the database!')
					else
						local steamid = GetPlayerIdentifiers(tonumber(split[4]))[1]
						Queue.AddPriority(steamid, split[5])
						TriggerClientEvent('chatMessage', split[4], '', {255,255,255}, '^1^*:fsn_priority:^0^r A moderator temporarily set your priority to: '..split[5])
						TriggerClientEvent('chatMessage', split[4], '', {255,255,255}, '^1^*:fsn_priority:^0^r This is in place until the next server restart')
						TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:fsn_priority:^0^r You set temporarily '..steamid..' priority to: '..split[5])
						TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:fsn_priority:^0^r This is in place until the next server restart')
					end
				end
			else
				TriggerClientEvent('chatMessage', src, '', {255,255,255}, '^1^*:fsn_priority:^0^r You do not have permission to modify priority.')
			end
		end
		if split[2] == 'check' then
			local steamid = GetPlayerIdentifiers(source)[1]
			local src = source
			local prio = 0
			MySQL.Async.fetchAll('SELECT * FROM `fsn_users` WHERE `steamid` = @steamid', {['@steamid'] = steamid}, function(res)
				for k, usr in pairs(res) do
					if usr.priority ~= 0 then
						TriggerClientEvent('chatMessage', src, '', {255,255,255}, '^1^*:fsn_priority:^0^r Your current priority level is: '..usr.priority)
					else
						TriggerClientEvent('chatMessage', src, '', {255,255,255}, '^1^*:fsn_priority:^0^r You do not have priority.')
					end
				end
			end)
		end 
	end
end)