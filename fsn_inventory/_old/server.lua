local newestid = 0
local items = {}
local locktable = false

RegisterServerEvent('fsn_inventory:item:dropped')
AddEventHandler('fsn_inventory:item:dropped', function(item, hash, xyz, amount, pickupid)
	while locktable do
		Citizen.Wait(1)
	end
	if not locktable then
		locktable = true
		newestid = newestid+1
		table.insert(items,#items+1, {
		item = item,
		hash = hash,
		xyz = xyz,
		amount = amount,
		pickupid = newestid
	  })
	  TriggerEvent('fsn_main:logging:addLog', source, 'inventory', 'Player('..source..') dropped '..amount..' '..item)
	  TriggerClientEvent('fsn_inventory:floor:update', -1, items)
	  locktable = false
		--TriggerClientEvent('fsn_inventory:itemhasdropped', -1, item, hash, xyz, amount, ids)
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, '<b>ITEM DROPPING IS BROKENED', 'centerLeft', 6000, 'error')
	end
end)

RegisterServerEvent('fsn_inventory:itempickup')
AddEventHandler('fsn_inventory:itempickup', function(pickupid)
  --TriggerClientEvent('fsn_inventory:removedropped', -1, pickupid)
	while locktable do
		Citizen.Wait(1)
	end
	if not locktable then
		locktable = true
		local pickup = false
		for k, v in pairs(items) do
			if v.pickupid == pickupid then
				pickup = true
				TriggerClientEvent('fsn_inventory:item:add', source, v.item, v.amount)
				TriggerEvent('fsn_main:logging:addLog', source, 'inventory', 'Player('..source..') picked up '..v.amount..' '..v.item)
				table.remove(items, k)
				TriggerClientEvent('fsn_inventory:floor:update', -1, items)
			end
		end
		if not pickup then
			print(':fsn_inventory: '..GetPlayerName(source)..' tried to pick up id: '..pickupid..' but it does not exist')
			TriggerClientEvent('fsn_inventory:floor:update', -1, items)
			--DropPlayer(source, ':FSN: Attempted product dupe')
			TriggerClientEvent('fsn_notify:displayNotification', source, 'This item doesn\'t seem to exist!', 'centerLeft', 3000, 'error')
		end
		locktable = false
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, '<b>ITEM DROPPING IS BROKENED', 'centerLeft', 6000, 'error')
	end
end)

