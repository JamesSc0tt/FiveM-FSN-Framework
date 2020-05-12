local Whitelists = {
	[1] = {
		title = 'Premium Deluxe Motorsports',
		id = 1,
		owner = 1299,
		access = {{charid = 1, level = 5}},
		bank = 0,
		onduty = {},
	},
	[2] = {
		title = 'Mechanics',
		id = 2,
		owner = 1,
		access = {},
		bank = 0,
		onduty = {},
	},
	[3] = {
		title = 'La Fuente Blanca',
		id = 3,
		owner = 1,
		access = {},
		bank = 0,
		onduty = {},
	},
	[4] = {
		title = 'Los Santos Marina',
		id = 4,
		owner = 1,
		access = {},
		bank = 0,
		onduty = {},
	},
}

function isPlayerClockedInWhitelist(ply, id)
	if Whitelists[id] then
		for k, v in pairs(Whitelists[id].onduty) do
			if v.ply_id == ply then
				return true
			end
		end
	end
	return false
end

RegisterServerEvent('fsn_jobs:whitelist:request')
AddEventHandler('fsn_jobs:whitelist:request', function()
	TriggerClientEvent('fsn_jobs:whitelist:update', source, Whitelists)
end)

RegisterServerEvent('fsn_jobs:whitelist:add')
AddEventHandler('fsn_jobs:whitelist:add', function(wlid, charid, level)
	local whitelisted = false
	if Whitelists[wlid] then
		for k,v in pairs(Whitelists[wlid].access) do
			if v.charid == charid then
				Whitelists[wlid].access[k].level = level
				whitelisted = true
				TriggerClientEvent('fsn_notify:displayNotification', source, 'Updated '..charid..' to level: '..level, 'centerLeft', 5000, 'success')
			end
		end
	end
	if not whitelisted then
		TriggerClientEvent('fsn_notify:displayNotification', source, 'Added '..charid..' to '..Whitelists[wlid].title..' at level: '..level, 'centerLeft', 5000, 'success')
		table.insert(Whitelists[wlid].access, #Whitelists[wlid].access+1, {charid = charid, level = level})
	end
	TriggerClientEvent('fsn_jobs:whitelist:update', -1, Whitelists)
	save()
end)

RegisterServerEvent('fsn_jobs:whitelist:remove')
AddEventHandler('fsn_jobs:whitelist:remove', function(wlid, charid)
	if Whitelists[wlid] then
		for k,v in pairs(Whitelists[wlid].access) do
			if v.charid == charid then
				TriggerClientEvent('fsn_notify:displayNotification', source, 'Removed '..charid..' from: '..Whitelists[wlid].title, 'centerLeft', 5000, 'success')
				local charid = k
				print(charid)
				table.remove(Whitelists[wlid].access, charid)
			end
		end
	end
	TriggerClientEvent('fsn_jobs:whitelist:update', -1, Whitelists)
	save()
end)

RegisterServerEvent('fsn_jobs:whitelist:clock:in')
AddEventHandler('fsn_jobs:whitelist:clock:in', function(charid, whitelist)
	print(source..' is trying to clock into whitelist '..whitelist..' with charid '..charid)
	if Whitelists[whitelist] then
		local clocked = false
		if Whitelists[whitelist].owner == charid then
			clocked = true
		else
			for k,v in pairs(Whitelists[whitelist].access) do
				if v.charid == charid then
					clocked = true
				end
			end
		end
		if clocked then
			TriggerClientEvent('fsn_jobs:whitelist:clock:in', source, whitelist)
			table.insert(Whitelists[whitelist].onduty, #Whitelists[whitelist].onduty+1, {
				ply_id = source,
				char_id = charid
			})
			TriggerClientEvent('fsn_notify:displayNotification', source, 'ONDUTY: '..Whitelists[whitelist].title, 'centerLeft', 5000, 'success')
		else
			TriggerClientEvent('fsn_notify:displayNotification', source, 'You cannot clock in to this whitelist.', 'centerLeft', 5000, 'error')
		end
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, 'This whitelist does not exist', 'centerLeft', 5000, 'error')
	end
	TriggerClientEvent('fsn_jobs:whitelist:update', -1, Whitelists)
end)

RegisterServerEvent('fsn_jobs:whitelist:clock:out')
AddEventHandler('fsn_jobs:whitelist:clock:out', function(charid, whitelist)
	if Whitelists[whitelist] then
		for k, v in pairs(Whitelists[whitelist].onduty) do
			if v.char_id == charid and v.ply_id == source then
				-- is player, clockout
				TriggerClientEvent('fsn_notify:displayNotification', source, 'OFFUTY: '..Whitelists[whitelist].title, 'centerLeft', 5000, 'error')
				TriggerClientEvent('fsn_jobs:whitelist:clock:out', source, whitelist)
				Whitelists[whitelist]['onduty'][k] = nil
			end
		end
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, 'This whitelist does not exist', 'centerLeft', 5000, 'error')
	end
	TriggerClientEvent('fsn_jobs:whitelist:update', -1, Whitelists)
end)

RegisterServerEvent('fsn_jobs:whitelist:access:add')
AddEventHandler('fsn_jobs:whitelist:access:add', function(wlid, ply)
	local recv = exports['fsn_main']:fsn_CharID(ply)
	local wl = Whitelists[wlid]
	if not table.contains(wl.access, recv) then
		table.insert(wl.access, #wl.access+1, recv)
		TriggerClientEvent('fsn_notify:displayNotification', source, 'You granted '..ply..' (#'..recv..') access to: <b>'..wl.title, 'centerLeft', 5000, 'success')
		TriggerClientEvent('fsn_notify:displayNotification', ply, 'You were given access to: <b>'..wl.title, 'centerLeft', 5000, 'success')
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, 'This player already has access to the business!', 'centerLeft', 5000, 'error')
	end
	TriggerClientEvent('fsn_jobs:whitelist:update', -1, Whitelists)
end)

function save()
	for k, wl in pairs(Whitelists) do
		MySQL.Async.execute('UPDATE `fsn_whitelists` SET `wl_owner` = @owner, `wl_access` = @access WHERE `wl_id` = @id;', {['@id'] = k, ['@owner'] = wl.owner, ['@access'] = json.encode(wl.access)}, function(rowsChanged) end)
	end
end

function init()
  MySQL.Async.fetchAll('SELECT * FROM `fsn_whitelists`', {}, function(res)
    for k, wl in pairs(res) do
	  local _wl = Whitelists[wl.wl_id]
	  _wl.owner = wl.wl_owner
	  _wl.access = json.decode(wl.wl_access)
	  _wl.bank = wl.wl_bank
	  print(':fsn_jobs: Updated WL '.._wl.title..' owner to '.._wl.owner)
    end
	TriggerClientEvent('fsn_jobs:whitelist:update', -1, Whitelists)
  end)
end

MySQL.ready(function()
    init()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(900000)
		save()
	end
end)