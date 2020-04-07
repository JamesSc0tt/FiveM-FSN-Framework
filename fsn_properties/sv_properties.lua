local sv_properties = {}
local sv_properties_xyz = {}

function tblCount(tbl)
	local cnt = 0
	for k,v in pairs(tbl) do
		cnt = cnt+1
	end	
	return cnt
end

function init()
	MySQL.Async.fetchAll('SELECT * FROM `fsn_properties`', {}, function(res)
		for k, p in pairs(res) do
			print(':fsn_properties: INIT '..p.property_name)
			if p.property_inventory and p.property_inventory ~= '' then
				-- convert inventory
				p.property_inventory = json.decode(p.property_inventory)
				if tblCount(p.property_inventory) > 0 and #p.property_inventory == 0 then -- using string keys instead of numbers :thinking:
					local newinv = {{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false}}
					for key, val in pairs(p.property_inventory) do
						if not val.index then 
							-- this item is from the old inv
							print('>> :fsn_properties: '..p.property_name..' has old item: '..key..' ('..val.amount..')')
							local placed = false
							for k,v in ipairs(newinv) do
								if not placed and newinv[k].index == false then
									if itemConversions[key] then
										print('>>>> :fsn_properties: putting item ('..key..'/'..val.amount..') in new inv slot '..k)
										newinv[k] = {}
										newinv[k] = itemConversions[key]
										newinv[k]['amt'] = val.amount
									else
										print('>>>> :fsn_properties: item ('..key..') does not have a conversions table')
									end
									placed = true 
								end
							end
							if not placed then
								print('>>>> :fsn_properties: could not find inv slot spare for item ('..key..')')
							end
						end
					end
					p.property_inventory = newinv
				else
					if p.property_inventory == {} or tblCount(p.property_inventory) == 0 then
						print('>> :fsn_properties: '..p.property_name..' has an empty table as inv, resetting')
						p.property_inventory = {{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false}}
					end
				end
			else
				print('>> :fsn_properties: '..p.property_name..' has no inventory')
				p.property_inventory = {{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false}}
			end
			
			sv_properties[p.property_id] = {
				inuse = false,
				name = p.property_name,
				owner = p.property_owner,
				keys = json.decode(p.property_coowners),
				weapons = json.decode(p.property_weapons),
				inventory = p.property_inventory,
				rent = p.property_expiry,
				money = p.property_money,
				sale = false,
			}
			
			-- rent expiry xx
			local cur_date = os.time()
			local rent_date = sv_properties[p.property_id].rent
			local maff = rent_date - cur_date
			maff = maff / 86400
			maff = math.ceil(maff)
			if maff < 0 then
				sv_properties[p.property_id].sale = true
				print(':fsn_properties: '..sv_properties[p.property_id].name..' - RENT RAN OUT, AVAILABLE')
			end
			
			local name = p.property_name
			if sv_properties[p.property_id].sale == true then
				name = '(A) '..p.property_name
			end
			sv_properties_xyz[p.property_id] = {
				name = name,
				xyz = json.decode(p.property_xyz)
			}
			print(':fsn_properties: FINISHED '..p.property_name)
			print('')
			saveProperty(p.property_id)
		end
		TriggerClientEvent('fsn_properties:updateXYZ', -1, sv_properties_xyz)
	end)
end

MySQL.ready(function()
    mysql = true
    init()
end)

RegisterServerEvent('fsn_properties:request')
AddEventHandler('fsn_properties:request', function()
	TriggerClientEvent('fsn_properties:updateXYZ', source, sv_properties_xyz)
end)

RegisterServerEvent('fsn_properties:access')
AddEventHandler('fsn_properties:access', function(id)
	local p = sv_properties[id] 
	if p then
		if p.inuse then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This property is already in use. Please wait.' })
		else
			TriggerClientEvent('fsn_properties:access', source, id, sv_properties[id])
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Accessing property: '..p.name })
			sv_properties[id].inuse = true
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This property does not exist???' })
	end
end)

RegisterServerEvent('fsn_properties:leave')
AddEventHandler('fsn_properties:leave', function(id, tbl)
	local p = sv_properties[id]
	if p then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Leaving property: '..id })
		sv_properties[id].inuse = false
		
		sv_properties[id].keys = tbl.keys
		for k, v in pairs(sv_properties[id].keys) do
			if v.id and not v.name then
				local character = exports["fsn_main"]:fsn_GetCharacterInfo(v.id)
				if character then
					v.name = character.char_fname .. ' ' .. character.char_lname
				end
			end
		end
		
		sv_properties[id].inventory = tbl.inventory
		sv_properties[id].weapons = tbl.weapons
		sv_properties[id].money = tbl.money
		
		saveProperty(id)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This property does not exist???' })
	end
end)



RegisterServerEvent('fsn_properties:rent:check')
AddEventHandler('fsn_properties:rent:check', function(id)
	local cur_date = os.time()
	local rent_date = sv_properties[id].rent
	
	local maff = rent_date - cur_date
	maff = maff / 86400 
	TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^*^4:fsn_properties:^0^r Rent expires in: '..math.ceil(maff)..' days')
	TriggerClientEvent('chatMessage', source, '', {255,255,255}, '(You can pay your rent the day before expiry. Property becomes available at server restart.)')
end)

RegisterServerEvent('fsn_properties:rent:pay')
AddEventHandler('fsn_properties:rent:pay', function(id)
	local cur_date = os.time()
	local rent_date = sv_properties[id].rent
	
	local maff = rent_date - cur_date
	maff = maff / 86400 
	maff = math.ceil(maff)
	if maff < 2 then
		sv_properties[id].rent = os.time()+604800
		TriggerClientEvent('fsn_bank:change:walletMinus', source, 25000)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Success. Rent will be due in 7 days time.' })
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'The rent is not due on this property.' })
	end
end)

RegisterServerEvent('fsn_properties:buy')
AddEventHandler('fsn_properties:buy', function(id)
	local p = sv_properties[id]
	if p then
		sv_properties[id].owner = exports["fsn_main"]:fsn_CharID(source)
		sv_properties[id].keys = {}
		sv_properties[id].sale = false
		sv_properties[id].rent = os.time()+604800
		
		sv_properties_xyz[id].name = sv_properties[id].name
	TriggerClientEvent('fsn_properties:updateXYZ', -1, sv_properties_xyz)
		
		TriggerClientEvent('fsn_bank:change:walletMinus', source, 50000)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Success. Rent will be due in 7 days time.' })
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This property is not found????' })
	end
end)

function saveProperty(id)
	local p = sv_properties[id]
	
	local inv = json.encode(p.inventory)
	local keys = json.encode(p.keys)
	local weps = json.encode(p.weapons)
	local money = p.money
	local owner = p.owner
	local rent = p.rent
	
	MySQL.Sync.execute("UPDATE `fsn_properties` SET `property_owner` = @owner, `property_coowners` = @keys, `property_inventory` = @inv, `property_weapons` = @weps, `property_money` = @money, `property_expiry` = @rent WHERE `property_id` = @id;",  {
		['@id'] = id,
		['@owner'] = owner,
		['@keys'] = keys,
		['@inv'] = inv,
		['@weps'] = weps,
		['@money'] = money,
		['@rent'] = rent,
	})
end
--[[
	commands
]]--
local realators = {1}
RegisterServerEvent('fsn_properties:realator:clock')
AddEventHandler('fsn_properties:realator:clock', function()
	
end)
function fsn_isRealator(id)
	for k,v in pairs(realators) do
		if v == id then
			return true
		end
	end
	return false
end