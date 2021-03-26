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
	local split = fsn_SplitString(string.lower(msg), ' ')
	local origSplit = fsn_SplitString(msg, ' ')
	--if split[1] == '/getinv' then
	--	TriggerClientEvent('fsn_inventory:ply:request', tonumber(split[2]), source)
	--end
	if split[1] == '/inv' then
		TriggerClientEvent('fsn_inventory:gui:display', source)
	end
end)


RegisterServerEvent('fsn_inventory:sys:request')
AddEventHandler('fsn_inventory:sys:request', function(to, from)
	TriggerClientEvent('fsn_inventory:ply:request', to, from)
end)

RegisterServerEvent('fsn_inventory:sys:send')
AddEventHandler('fsn_inventory:sys:send', function(to, tbl)
	print('got inventory from '..source..' for '..to)
	TriggerClientEvent('fsn_inventory:ply:recieve', to, source, tbl)
end)

RegisterServerEvent('fsn_inventory:ply:update')
AddEventHandler('fsn_inventory:ply:update', function(to, tbl)
	TriggerClientEvent('fsn_inventory:me:update', to, tbl)
end)

RegisterServerEvent('fsn_inventory:ply:finished')
AddEventHandler('fsn_inventory:ply:finished', function(ply)
	TriggerClientEvent('fsn_inventory:ply:done', ply)
end)

RegisterServerEvent('fsn_licenses:id:display')
AddEventHandler('fsn_licenses:id:display', function(plytbl, name, job, dob, issue, id)
	for _, ply in pairs(plytbl) do
		TriggerClientEvent('chatMessage', ply, '', {0,0,0}, '^6*-----------------------------------------------------------')
		TriggerClientEvent('chatMessage', ply, '', {0,0,0}, '^6| ID |^0 '..name..' | '..job..' | '..dob..'/dob | '..issue..'/issue')
		if id then
			TriggerClientEvent('chatMessage', ply, '', {0,0,0}, '^6| ID |^0 CharID: '..id..' | ServerID: '..source)
		else
			TriggerClientEvent('chatMessage', ply, '', {0,0,0}, '^6| ID |^0 ServerID: '..source)
			TriggerClientEvent('chatMessage', ply, '', {0,0,0}, '^6| ID |^0 This ID is invalid, get a new one from City Hall!')
		end
		TriggerClientEvent('chatMessage', ply, '', {0,0,0}, '^6*-----------------------------------------------------------')
	end
end)

local function fsn_setDevWeapon(user, item)
	--print(item)
	local name = ''
	local charID = exports['fsn_main']:fsn_CharID(user)
	local character = exports['fsn_main']:fsn_GetCharacterInfo(charID)
	if item.customData ~= nil then
		if item.index == 'weapon_stungun' or item.customData.ammotype ~= 'none' then
			name = character.char_fname .. ' ' ..character.char_lname
			item.customData.Serial = 'DEV GUN'
			item.customData.Owner = 'DEV: ' .. name
		end
	end
end

RegisterServerEvent('fsn_inventory:item:add')
AddEventHandler('fsn_inventory:item:add', function(source, item, amt)
	local player = source
	--print(player.. ' ' .. item .. ' ' .. amt)
	if presetItems[item] then
		local insert = presetItems[item]
		insert.amt = amt
		if insert.customData ~= nil then
			if insert.customData.weapon == 'true' then
				fsn_setDevWeapon(player, insert)
				TriggerClientEvent('fsn_inventory:items:add', player, insert)
			end
		else
			TriggerClientEvent('fsn_inventory:items:add', player, insert)
		end
	else
		TriggerClientEvent('mythic_notify:SendAlert', player, { type = 'error', text = 'Item preset '..item..' seems to be missing' })
	end
end)