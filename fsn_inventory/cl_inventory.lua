function invLog(str)
	SendNUIMessage({
		action = 'log',
		string = str
	})
end

--[[
	New inventory shit
]]--
-- THIS IS HOW A WEAPON WILL LOOK
local weapon = {
	index = "WEAPON_ASSAULTRIFLE",
	name = "ASSAULT RIFLE",
	amt = 1,
	customData = {
		weapon = true,
		ammo = 200,
		ammotype = 'rifle_ammo',
		quality = 'perfect',
	}
}

local beingused = false
local firstInventory = {{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},}
local secondInventory_type = 'ply'
local secondInventory_id = 0
local secondInventory = {}
function updateGUI()
	SendNUIMessage({
		action = 'update',
		inuse = beingused,
		first = firstInventory,
		second = secondInventory
	})
end

--[[
	Exports
]]--
local max_weight = 40
local secondInventory_limits = {
	["ply"] = 40,
	["trunk"] = 40,
	["glovebox"] = 20,
	--["glovebox"] = 20,
}

function fsn_CanCarry(item, amt)
	if exports["fsn_police"]:fsn_PDDuty() then return true end -- no weight limit for cops, only slot limit
	if presetItems[item] and presetItems[item].data and presetItems[item].data.weight then
		local maff = presetItems[item].data.weight * amt
		if fsn_CurrentWeight() + maff <= max_weight then
			return true
		else
			return false
		end
	else
		if item.data and item.data.weight then
			local maff = item.data.weight * amt
			if fsn_CurrentWeight() + maff <= max_weight then
				return true
			else
				return false
			end
		else
			print('no weight data for '..item)
			return true
		end
	end
end
function fsn_CurrentWeight()
	local weight = 0
	for k,v in pairs(firstInventory) do 
		if v.index then
			if v.data and v.data.weight then
				 weight = weight + v.data.weight * v.amt
			end
		end
	end
	print('currently carrying '..weight)
	return weight
end
function fsn_HasItem(item)	
	for k,v in pairs(firstInventory) do
		if v.index == item then
			return true
		end
	end
	return false
end
function fsn_HasPhone()
	return fsn_HasItem('phone')
end
function fsn_GetItemAmount(item)
	local amt = 0
	for k,v in pairs(firstInventory) do
		if v.index == item then
			amt = amt + v.amt
		end
	end
	return amt
end
function fsn_GetItemDetails(item)
	return presetItems[item]
end
--[[
	Manage item data
]]--
RegisterNUICallback( "viewData", function(data, cb)
	data.slot = data.slot +1
	local strang = ''
	local index = 'default'
	local name = 'default'
	if data.inv == 'playerInventory' then
		local item = firstInventory[data.slot]
		if item then
			index = item.index
			name = item.name
			if item.data then
				strang = strang..'<h2>Item Data</h2>'
				for k, d in pairs(item.data) do
					strang = strang..'<p><span>'..k..':</span> '..d..'</p>'
				end
			end
			if item.customData then
				strang = strang..'<h2>Custom Data</h2>'
				for k, d in pairs(item.customData) do
					d = tostring(d)
					strang = strang..'<p><span>'..k..':</span> '..d..'</p>'
				end
			end
			
		end
	else
		local item = secondInventory[data.slot]
		if item then
			index = item.index
			name = item.name
			if item.data then
				strang = strang..'<h2>Item Data</h2>'
				for k, d in pairs(item.data) do
					strang = strang..'<p><span>'..k..':</span> '..d..'</p>'
				end
			end
			if item.customData then
				strang = strang..'<h2>Custom Data</h2>'
				for k, d in pairs(item.customData) do
					strang = strang..'<p><span>'..k..':</span> '..d..'</p>'
				end
			end
		end
	end
	SendNUIMessage({
		action = 'data',
		index = index,
		name = name,
		html = strang
	})
end)

--[[
	Manage slots
]]--
RegisterNUICallback( "dragToSlot", function(data, cb)
	-- store charging & stock handling.
	local using_store = false
	if secondInventory_type == 'store' or secondInventory_type == 'store_gun' then
		using_store = true
	end
	if using_store and data.fromInv == 'playerInventory' then
		if data.toInv == 'otherInventory' then
			invLog('<span style="color:red">You cannot put something into a store!</span>')
			return
		end
	elseif using_store and data.fromInv == 'otherInventory' then
		if data.toInv == 'otherInventory' then
			invLog('<span style="color:red">You cannot rearrange the shelves</span>')
			return
		end
		if secondInventory_type == 'store' then
			if secondInventory[data.fromSlot].data.price then
				if syn_CanCarry(secondInventory[data.fromSlot].index, data.amt) then
					if exports['syn_main']:syn_GetWallet() >= secondInventory[data.fromSlot].data.price then
						TriggerEvent('syn_bank:change:walletMinus', tonumber(secondInventory[data.fromSlot].data.price * data.amt))
						-- remove item from store stock
						TriggerServerEvent('syn_store:boughtOne', secondInventory_id, secondInventory[data.fromSlot].index)
					else
						exports['mythic_notify']:DoHudText('error', 'You cannot afford this!')
						invLog('<span style="color:red">You cannot afford this item</span>')
						return
					end
				else
					invLog('<span style="color:blue">To much weight reduce the amount or your inventory weight</span>')
				end
			else
				invLog('<span style="color:red">No price associated, returning</span>')
				return
			end
		end
		if secondInventory_type == 'store_gun' then
			data.amt = 1 -- only buy 1 at a time!
			if secondInventory[data.fromSlot].data.price then
				if syn_CanCarry(secondInventory[data.fromSlot].index, data.amt) then
					if exports['syn_main']:syn_GetWallet() >= secondInventory[data.fromSlot].data.price then
						TriggerEvent('syn_bank:change:walletMinus', tonumber(secondInventory[data.fromSlot].data.price * data.amt))
						-- remove item from store stock
						TriggerServerEvent('syn_store:boughtOne', secondInventory_id, secondInventory[data.fromSlot].index)
					else
						exports['mythic_notify']:DoHudText('error', 'You cannot afford this!')
						invLog('<span style="color:red">You cannot afford this item</span>')
						return
					end
				else
					invLog('<span style="color:blue">To much weight, reduce the amount or your inventory weight</span>'
				end
			else
				invLog('<span style="color:red">No price associated, returning</span>')
				return
			end
		end
	end
	if data.toSlot == data.fromSlot and data.fromInv == data.toInv then
		invLog('<span style="color:red">You cannot move this into itself</span>')
		return
	end
	if data.fromInv == 'playerInventory' then
		local oldSlot = firstInventory[data.fromSlot]
		if data.amt > oldSlot.amt or data.amt == -99 then
			data.amt = oldSlot.amt
		end
		if data.toInv == 'playerInventory' then	
			if firstInventory[data.toSlot].index then
				if firstInventory[data.toSlot].index ~= oldSlot.index then
					invLog('<span style="color:red">This slot is occupied</span>')
					return
				end
				if firstInventory[data.toSlot].customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
				if oldSlot.customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
			end
		else
			if secondInventory_limits[secondInventory_type] then
				-- check if it can carry
				local cur_weight = 0
				for k, v in ipairs(secondInventory) do
					if v.index ~= false and v.data and v.data.weight then
						local maff = v.data.weight * v.amt
						cur_weight = cur_weight + maff
					end
				end
				if oldSlot.data and oldSlot.data.weight then
					local new_maff = oldSlot.data.weight * data.amt
					local newer_maff = cur_weight + new_maff
					if newer_maff > secondInventory_limits[secondInventory_type] then
						invLog('<span style="color:red">This inventory cannot hold more than: '..secondInventory_limits[secondInventory_type]..'</span>')
						return
					else
						invLog('Old weight: '..cur_weight..' | New weight: '..newer_maff..' | Added: '..new_maff..' ('..oldSlot.data.weight..' * '..data.amt..')')
					end
				end
			end
			if secondInventory[data.toSlot].index then
				if secondInventory[data.toSlot].index ~= oldSlot.index then
					invLog('<span style="color:red">This slot is occupied</span>')
					return
				end
				if secondInventory[data.toSlot].customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
				if oldSlot.customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
			end
		end
		if data.amt == oldSlot.amt or data.amt == -99 then -- if moving all of item
			if data.toInv == 'playerInventory' then	
				-- moving all of the stack around in my inv
				if firstInventory[data.toSlot].index == oldSlot.index then
					firstInventory[data.toSlot].amt = firstInventory[data.toSlot].amt + oldSlot.amt
				else
					firstInventory[data.toSlot] = firstInventory[data.fromSlot]
				end
			else
				-- moving all of the stack to their inv
				if secondInventory[data.toSlot].index == oldSlot.index then
					secondInventory[data.toSlot].amt = secondInventory[data.toSlot].amt + oldSlot.amt
				else
					secondInventory[data.toSlot] = firstInventory[data.fromSlot]
				end
			end
			firstInventory[data.fromSlot] = {}
		else -- if moving part of the stack
			if data.toInv == 'playerInventory' then
				-- moving part of the stack around in my inv
				if firstInventory[data.toSlot].index == firstInventory[data.fromSlot].index then
					firstInventory[data.toSlot].amt = firstInventory[data.toSlot].amt + data.amt
				else
					firstInventory[data.toSlot] = {
						index = firstInventory[data.fromSlot].index,
						name = firstInventory[data.fromSlot].name,
						amt = data.amt,
						data = firstInventory[data.fromSlot].data,
						customData = firstInventory[data.fromSlot].customData,
					}
				end
				firstInventory[data.fromSlot].amt = firstInventory[data.fromSlot].amt - data.amt
			else
				-- moving part of the stack to their inv
				if secondInventory[data.toSlot].index == firstInventory[data.fromSlot].index then
					secondInventory[data.toSlot].amt = secondInventory[data.toSlot].amt + data.amt
				else
					secondInventory[data.toSlot] = {
						index = firstInventory[data.fromSlot].index,
						name = firstInventory[data.fromSlot].name,
						amt = data.amt,
						data = firstInventory[data.fromSlot].data,
					}
				end
				firstInventory[data.fromSlot].amt = firstInventory[data.fromSlot].amt - data.amt
			end
		end
	elseif data.fromInv == 'otherInventory' then
		-- moving something from their inv
		local oldSlot = secondInventory[data.fromSlot]
		if data.amt > oldSlot.amt then
			data.amt = oldSlot.amt
		end
		if data.toInv == 'playerInventory' then
			if data.amt == oldSlot.amt or data.amt == -99 then -- moving entire stack
				if not fsn_CanCarry(oldSlot.index, oldSlot.amt) then
					invLog('<span style="color:red">You cannot carry this!</span>')
					return
				end
				
				local cur_weight = 0
				for k, v in pairs(firstInventory) do
					if v.index ~= false and v.data and v.data.weight then
						local maff = v.data.weight * v.amt
						cur_weight = cur_weight + maff
					end
				end
				if oldSlot.data and oldSlot.data.weight and not exports["fsn_police"]:fsn_PDDuty() then
					local new_maff = oldSlot.data.weight * oldSlot.amt
					local newer_maff = cur_weight + new_maff
					if newer_maff > max_weight then
						invLog('<span style="color:red">This inventory cannot hold more than: 30</span>')
						return
					else
						invLog('Old weight: '..cur_weight..' | New weight: '..newer_maff..' | Added: '..new_maff..' ('..oldSlot.data.weight..' * '..data.amt..')')
					end
				end
			else	
				if not fsn_CanCarry(oldSlot.index, data.amt) then
					invLog('<span style="color:red">You cannot carry this!</span>')
					return
				end
				
				local cur_weight = 0
				for k, v in pairs(firstInventory) do
					if v.index ~= false and v.data and v.data.weight then
						local maff = v.data.weight * v.amt
						cur_weight = cur_weight + maff
					end
				end
				if oldSlot.data and oldSlot.data.weight and not exports["fsn_police"]:fsn_PDDuty() then
					local new_maff = oldSlot.data.weight * data.amt
					local newer_maff = cur_weight + new_maff
					if newer_maff > max_weight then
						invLog('<span style="color:red">This inventory cannot hold more than: 30</span>')
						return
					else
						invLog('Old weight: '..cur_weight..' | New weight: '..newer_maff..' | Added: '..new_maff..' ('..oldSlot.data.weight..' * '..data.amt..')')
					end
				end
			end
			if firstInventory[data.toSlot].index then
				if firstInventory[data.toSlot].index ~= oldSlot.index then
					invLog('<span style="color:red">This slot is occupied</span>')
					return
				end
				if firstInventory[data.toSlot].customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
				if oldSlot.customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
			end
		else
			if secondInventory[data.toSlot].index then
				if secondInventory[data.toSlot].index ~= oldSlot.index then
					invLog('<span style="color:red">This slot is occupied</span>')
					return
				end
				if secondInventory[data.toSlot].customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
				if oldSlot.customData then
					invLog('<span style="color:red">You cannot merge items with custom data!</span>')
					return
				end
			end
		end
		if data.amt == oldSlot.amt or data.amt == -99 then -- if moving all of item
			if data.toInv == 'playerInventory' then	
				-- moving all of item to my inv
				if firstInventory[data.toSlot].index == oldSlot.index then
					firstInventory[data.toSlot].amt = firstInventory[data.toSlot].amt + oldSlot.amt
				else
					firstInventory[data.toSlot] = secondInventory[data.fromSlot]
				end
			else
				-- moving all of item to somewhere else in their inv
				if secondInventory[data.toSlot].index == oldSlot.index then
					secondInventory[data.toSlot].amt = secondInventory[data.toSlot].amt + oldSlot.amt
				else
					secondInventory[data.toSlot] = secondInventory[data.fromSlot]
				end
			end
			secondInventory[data.fromSlot] = {}
		else -- if moving part of the stack
			if data.toInv == 'playerInventory' then
				-- moving part of the stack to my inv
				if firstInventory[data.toSlot].index == secondInventory[data.fromSlot].index then
					firstInventory[data.toSlot].amt = firstInventory[data.toSlot].amt + data.amt
				else
					firstInventory[data.toSlot] = {
						index = secondInventory[data.fromSlot].index,
						name = secondInventory[data.fromSlot].name,
						amt = data.amt,
						customData = secondInventory[data.fromSlot].customData,
					}
					if secondInventory[data.fromSlot].data and secondInventory[data.fromSlot].data.weight then
						if not firstInventory[data.toSlot].data then firstInventory[data.toSlot].data = {} end
						firstInventory[data.toSlot].data.weight = secondInventory[data.fromSlot].data.weight
					end
				end
				secondInventory[data.fromSlot].amt = secondInventory[data.fromSlot].amt - data.amt
			else
				-- moving part of the stack around in their inv
				if secondInventory[data.toSlot].index == secondInventory[data.fromSlot].index then
					secondInventory[data.toSlot].amt = secondInventory[data.toSlot].amt + data.amt
				else
					secondInventory[data.toSlot] = {
						index = secondInventory[data.fromSlot].index,
						name = secondInventory[data.fromSlot].name,
						amt = data.amt,
					}
				end
				secondInventory[data.fromSlot].amt = secondInventory[data.fromSlot].amt - data.amt
			end
		end
	else
		exports['mythic_notify']:DoCustomHudText('error', 'Inventory ('..data.fromInv..') not found!', 4000)
	end
	--if player send them update
	if secondInventory_type == 'ply' and secondInventory_id ~= 0 then
		TriggerServerEvent('fsn_inventory:ply:update', secondInventory_id, secondInventory)
	end
	-- send server vehicle update
	if secondInventory_type == 'trunk' or secondInventory_type == 'glovebox' then
		TriggerServerEvent('fsn_inventory:veh:update', secondInventory_type, secondInventory_id, secondInventory)
	end
	if secondInventory_type == 'apt' then
		TriggerEvent('fsn_apartments:inv:update', secondInventory)
	end
	if secondInventory_type == 'prop' then
		TriggerEvent('fsn_properties:inv:update', secondInventory)
	end
	updateGUI()
end)

RegisterNUICallback("dropSlot", function(data, cb)
	if data.fromInv ~= 'playerInventory' then
		invLog('<span style="color:red">You can only drop from your inventory</span>')
		return
	end
	local slot = firstInventory[data.fromSlot]
	if data.amt >= slot.amt or data.amt == -99 then
		data.amt = slot.amt
	end
	if data.amt == slot.amt then
		-- start dropping -- 
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local xyz = {x=coords.x, y=coords.y, z=coords.z}
		TriggerServerEvent('fsn_inventory:drops:drop', xyz, slot)
		-- end dropping --
		firstInventory[data.fromSlot] = {}
		updateGUI()
	else
		local item = {
			index=firstInventory[data.fromSlot].index,
			name=firstInventory[data.fromSlot].name,
			amt=data.amt,
			data = firstInventory[data.fromSlot].data,
			customData = firstInventory[data.fromSlot].customData
		}
		firstInventory[data.fromSlot].amt = firstInventory[data.fromSlot].amt - data.amt
		-- start dropping -- 
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local xyz = {x=coords.x, y=coords.y, z=coords.z}
		TriggerServerEvent('fsn_inventory:drops:drop', xyz, item)
		-- end dropping --
		updateGUI()
	end
end)

RegisterNUICallback("useSlot", function(data, cb)
	while invBusy do Citizen.Wait(1); print('invBusy') end
	if data.fromInv ~= 'playerInventory' then
		invLog('<span style="color:red">You can only use from your inventory</span>')
		return
	end
	invBusy = true
	local slot = firstInventory[data.fromSlot]
	if slot.index then
		if itemUses[slot.index] then
			toggleGUI()
			Citizen.Wait(100)
			itemUses[slot.index].use(slot)
			if itemUses[slot.index].takeItem then
				if firstInventory[data.fromSlot].amt ~= 1 then
					firstInventory[data.fromSlot].amt = firstInventory[data.fromSlot].amt-1
				else
					firstInventory[data.fromSlot] = {}
				end
				exports['mythic_notify']:DoHudText('success', 'You used 1: '..slot.name)
				updateGUI()
			else
				exports['mythic_notify']:DoHudText('success', 'You used: '..slot.name)
			end
		else
			invLog('<span style="color:red">This item does not have a use associated</span>')
			exports['mythic_notify']:DoHudText('error', 'This item does not have a use associated')
			invBusy = false
			return
		end
	end
	invBusy = false
end)

--[[
	Manage GUI
]]--
local gui = false
function toggleGUI()
	if gui then
		if secondInventory_type == 'ply' and secondInventory_id ~= 0 then
			TriggerServerEvent('fsn_inventory:ply:finished', secondInventory_id)
		end
		if secondInventory_type == 'trunk' or secondInventory_type == 'glovebox' then
			TriggerServerEvent('fsn_inventory:veh:finished', secondInventory_id)
			if secondInventory_type == 'trunk' then
				ExecuteCommand('d c 5')
			end
		end
		if secondInventory_type == 'prop' then
			TriggerEvent('fsn_properties:inv:closed', secondInventory_id)
		end
		if secondInventory_type == 'pd_locker' then
			TriggerServerEvent('fsn_inventory:locker:save', secondInventory)
		end
		if secondInventory_type == 'store_gun' then
			TriggerServerEvent('fsn_store_guns:closedStore', secondInventory_id)
		end
		if secondInventory_type == 'store' then
			TriggerServerEvent('fsn_store:closedStore', secondInventory_id)
		end
		secondInventory_type = 'ply'
		secondInventory_id = 0
		secondInventory = {}
		SetNuiFocus( false )
		SendNUIMessage({
			action = 'display',
			val = false
		})
		gui = false
	else
		SetNuiFocus( true, true )
		SendNUIMessage({
			action = 'display',
			val = true
		})
		updateGUI()
		gui = true
	end
end
RegisterNetEvent('fsn_inventory:gui:display')
AddEventHandler('fsn_inventory:gui:display', function()
	toggleGUI()
end)
RegisterNUICallback( "closeGUI", function(data, cb)
	toggleGUI()
end)
RegisterNetEvent('fsn_inventory:me:update')
AddEventHandler('fsn_inventory:me:update', function(tbl)
	firstInventory = tbl
	updateGUI()
end)
--[[
	Manage second inventory
]]--
RegisterNetEvent('fsn_inventory:ply:request')
AddEventHandler('fsn_inventory:ply:request', function(to)
	if beingused then
		exports['mythic_notify']:DoHudText('error', 'Your inventory cannot be accessed while it is currently in use.')
	else
		beingused = true
		updateGUI()
		TriggerServerEvent('fsn_inventory:sys:send', to, firstInventory)
	end
end)
RegisterNetEvent('fsn_inventory:ply:done')
AddEventHandler('fsn_inventory:ply:done', function()
	beingused = false
	updateGUI()
end)
RegisterNetEvent('fsn_inventory:ply:recieve')
AddEventHandler('fsn_inventory:ply:recieve', function(from, tbl)
	secondInventory_type = 'ply'
	secondInventory_id = from
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received inventory from Player('..from..')')
end)
RegisterNetEvent('fsn_inventory:veh:trunk:recieve')
AddEventHandler('fsn_inventory:veh:trunk:recieve', function(plate, tbl)
	secondInventory_type = 'trunk'
	secondInventory_id = plate
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received trunk from Vehicle('..plate..')')
	ExecuteCommand('d o 5')
end)
RegisterNetEvent('fsn_inventory:veh:glovebox:recieve')
AddEventHandler('fsn_inventory:veh:glovebox:recieve', function(plate, tbl)
	secondInventory_type = 'glovebox'
	secondInventory_id = plate
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received glovebox from Vehicle('..plate..')')
end)
RegisterNetEvent('fsn_inventory:apt:recieve')
AddEventHandler('fsn_inventory:apt:recieve', function(id, tbl)
	secondInventory_type = 'apt'
	secondInventory_id = id
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received inventory from Apartment('..id..')')
end)
RegisterNetEvent('fsn_inventory:prop:recieve')
AddEventHandler('fsn_inventory:prop:recieve', function(id, tbl)
	secondInventory_type = 'prop'
	secondInventory_id = id
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received inventory from Property('..id..')')
end)
RegisterNetEvent('fsn_inventory:pd_locker:recieve')
AddEventHandler('fsn_inventory:pd_locker:recieve', function(id, tbl)
	secondInventory_type = 'pd_locker'
	secondInventory_id = id
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received inventory from pd_locker('..id..')')
end)
RegisterNetEvent('fsn_inventory:store_gun:recieve')
AddEventHandler('fsn_inventory:store_gun:recieve', function(storeid, tbl)
	secondInventory_type = 'store_gun'
	secondInventory_id = storeid
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received data from gunstore('..storeid..')')
end)

RegisterNetEvent('fsn_inventory:store:recieve')
AddEventHandler('fsn_inventory:store:recieve', function(storeid, tbl)
	secondInventory_type = 'store'
	secondInventory_id = storeid
	secondInventory = tbl
	updateGUI()
	if not gui then
		toggleGUI()
	end
	invLog('received data from store('..storeid..')')
end)

--[[
	Manage items
]]--
RegisterNetEvent('fsn_inventory:item:take')
AddEventHandler('fsn_inventory:item:take', function(item, amt)
	print(':fsn_inventory: removing '..amt..' '..item)
	local taken = 0
	for k, v in pairs(firstInventory) do
		if taken < amt then
			local remaining = amt - taken 
			if v.index ~= false then
				if v.index == item then
					print(':fsn_inventory: '..v.amt..' '..v.index..' in slot '..k)
					if v.amt == remaining then
						-- take all out of 1 slot
						taken = taken + v.amt
						firstInventory[k] = {index=false}
					elseif v.amt > remaining then
						taken = taken + remaining
						firstInventory[k].amt = firstInventory[k].amt - remaining
					elseif v.amt < remaining then
						taken = taken + firstInventory[k].amt
						firstInventory[k] = {index=false}
					end
				end
			end
		end
	end
	exports['mythic_notify']:DoHudText('inform', 'Taken: '..taken..' '..item)
	updateGUI()
end)
RegisterNetEvent('fsn_inventory:items:add')
AddEventHandler('fsn_inventory:items:add', function(item)
	local placed = false
	if item.data and item.data.weight then
		local maff = item.data.weight * item.amt
		if fsn_CurrentWeight() + maff <= max_weight then
		else
			exports['mythic_notify']:DoHudText('error', 'You cannot carry '..item.amt..': '..item.name)
			return
		end
	end
	if fsn_CanCarry(item.index, item.amt) then
		for k, slot in pairs(firstInventory) do
			if not placed then 
				if slot.index then
					if not slot.customData then
						if not item.customData then
							if slot.index == item.index then
								firstInventory[k].amt = firstInventory[k].amt + item.amt
								placed = true
							end
						end
					end	
				else
					firstInventory[k] = item
					placed = true
				end
			end
		end
	else
		exports['mythic_notify']:DoHudText('error', 'You cannot carry '..item.amt..': '..item.name)
	end
	if not placed then
		exports['mythic_notify']:DoHudText('error', 'You do not have a slot free for this!')
		
		-- start dropping -- 
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local xyz = {x=coords.x, y=coords.y, z=coords.z}
		TriggerServerEvent('fsn_inventory:drops:drop', xyz, item)
		-- end dropping --
	else
		exports['mythic_notify']:DoHudText('inform', 'You got '..item.amt..' '..item.name)
	end
	updateGUI()
end)
RegisterNetEvent('fsn_inventory:items:addPreset')
AddEventHandler('fsn_inventory:items:addPreset', function(item, amt)
	if presetItems[item] then
		local insert = presetItems[item]
		insert.amt = amt
		TriggerEvent('fsn_inventory:items:add', insert)
	else
		exports['mythic_notify']:DoHudText('error', 'Item reset '..item..' seems to be missing')
	end
end)
RegisterNetEvent('fsn_inventory:item:add')
AddEventHandler('fsn_inventory:item:add', function(item, amount)
	print('legacy adding: '..amount..' '..item)
	TriggerEvent('fsn_inventory:items:addPreset', item, amount)
end)

RegisterNetEvent('fsn_inventory:items:emptyinv')
AddEventHandler('fsn_inventory:items:emptyinv', function()
	firstInventory = {{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},}	
end)

--[[
	CONVERT OLD INV / GIVE ID CARD ON FIRST JOIN
]]--
intiiated = false
function init(charTbl)
	local inventory	= json.decode(charTbl.char_inventory)
	if inventory.firstSpawned == true then
		-- you have the new inv very nice
		firstInventory = inventory.table
		intiiated = true
	else
		firstInventory = {{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},{index=false},}
		Citizen.Wait(500)
		TriggerEvent('fsn_licenses:giveID')
		intiiated = true
	end
end
AddEventHandler('fsn_main:character', function(charTbl)
	init(charTbl)
end)
--[[
	saving :)
]]--
RegisterNetEvent('fsn_main:characterSaving')
AddEventHandler('fsn_main:characterSaving', function()	
	if intiiated then
		print(':fsn_inventory: [INFO] Saving inventory')
		local inv = {
			firstSpawned = true,
			table = firstInventory,
		}
		TriggerServerEvent('fsn_inventory:database:update', inv)
	else
		print(':fsn_inventory: [ERROR] Your inventory was not initiated so cannot save.')
	end	
end)


--[[
	Weapons as items
]]--
local currentWeapon = false
local currentHotkey = false
Util.Tick(function()HideHudComponentThisFrame(19,true);DisableControlAction(0, 37, true);end)

function equipWeapon(item, key)
	if invBusy then Citizen.Wait(1);print'invBusy'; end
	invBusy = true
	if item and item.index then
		RemoveAllPedWeapons(GetPlayerPed(-1))
		print(item.index)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(item.index), item['customData'].ammo, 1, 0)
		SetCurrentPedWeapon(GetPlayerPed(-1), item.index, 0)
		
		currentWeapon = item
		currentHotkey = key
		firstInventory[key] = {index=false}

		RequestAnimDict("rcmjosh4")
		while not HasAnimDictLoaded("rcmjosh4") do Citizen.Wait(1) end
		RequestAnimDict("reaction@intimidation@cop@unarmed")
		while not HasAnimDictLoaded("reaction@intimidation@cop@unarmed") do Citizen.Wait(1) end

		DisablePlayerFiring(GetPlayerPed(-1), true)
		SetPedCurrentWeaponVisible(GetPlayerPed(-1), 1, 1, 1, 1)
		TaskPlayAnim(GetPlayerPed(-1), "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
		Citizen.Wait(800)
		DisablePlayerFiring(GetPlayerPed(-1), false)
		ClearPedTasks(GetPlayerPed(-1))
		TriggerServerEvent('fsn_main:logging:addLog', GetPlayerServerId(PlayerId()), 'weapons', 'Player('..GetPlayerServerId(PlayerId())..') equipped '..item.index..' with '..item['customData'].ammo..' ammo.')

	else
		if firstInventory[currentHotkey].index ~= false then
			exports['mythic_notify']:DoHudText('error', 'Slot '..currentHotkey..' is not empty!')
			invBusy = false
			return
		end
		local weapon, hash = GetCurrentPedWeapon(GetPlayerPed(-1), 1)
        if(weapon) then
            local _,ammoInClip = GetAmmoInClip(GetPlayerPed(-1), hash)
            local totalAmmo = GetAmmoInPedWeapon(GetPlayerPed(-1), hash)
            currentWeapon['customData'].ammo = totalAmmo
        else
        	currentWeapon['customData'].ammo = 0
        	exports['mythic_notify']:DoHudText('error', 'No weapon found - ammo reset.')
        end

		RemoveAllPedWeapons(GetPlayerPed(-1))

		ResetPedMovementClipset(GetPlayerPed(-1)) -- cant remember why im resetting this
		ResetPedStrafeClipset(GetPlayerPed(-1)) -- cant remember why im resetting this
		ResetPedWeaponMovementClipset(GetPlayerPed(-1)) -- cant remember why im resetting this
		ClearPedTasksImmediately(GetPlayerPed(-1)) -- cant remember why im resetting this

		GiveWeaponToPed(GetPlayerPed(-1), '2725352035', 0, 1, 0)
		SetCurrentPedWeapon(GetPlayerPed(-1), '2725352035', 0)
		
		TriggerServerEvent('fsn_main:logging:addLog', GetPlayerServerId(PlayerId()), 'weapons', 'Player('..GetPlayerServerId(PlayerId())..') holstered '..currentWeapon.index..' with '..currentWeapon['customData'].ammo..' ammo.')

		firstInventory[currentHotkey] = currentWeapon

		currentWeapon = false
		currentHotkey = false
	end
	invBusy = false
end


--[[
	Hotkeys
]]--
local hotkeys = {
	157, -- number 1
	158, -- number 2
	160, -- number 3
	164, -- number 4
	165  -- number 5
}
Util.Tick(function()
	if IsDisabledControlJustPressed(0,37) then
		local itms = {}
		local count = 1
		for k, v in ipairs(firstInventory) do
			if count < 6 then	
				itms[count] = v
				count = count + 1
			end
		end
		SendNUIMessage({
			actionbar = true,
			display = true,
			items = itms
		})
	end
	if IsDisabledControlJustReleased(0,37) then
		SendNUIMessage({
			actionbar = true,
			display = false,
		})
	end
	if not beingused and not gui then -- cant use if gui is open or someone else is using inv
		for number, control in pairs(hotkeys) do
			if IsControlJustReleased(1, control) or IsDisabledControlJustReleased(1, control) then

				--[[For using ammo while the gun is out. 
				This prevents the gun from being put away if you try to use another item slot. 
				In this case it will only leave the gun equipped if item.index == ammo
				]]--
				local item = firstInventory[number]

				--might add more ammo types and counts later but for now this gets people started with buying ammo instead of a whole new gun
				local ammocount = 25

				if item.index == 'ammo' then
					local playerPed = GetPlayerPed(-1)
					
					local found, equippedWeapon = GetCurrentPedWeapon(playerPed, true)
					  if found then
						  if equippedWeapon ~= nil then
							  local pedAmmo = GetAmmoInPedWeapon(playerPed, equippedWeapon)
							  local newAmmo = pedAmmo + ammocount
							  ClearPedTasks(playerPed)
							  local found, maxAmmo = GetMaxAmmo(playerPed, equippedWeapon)
							  if newAmmo < maxAmmo then
								  TaskReloadWeapon(playerPed)
								  SetPedAmmo(playerPed, equippedWeapon, newAmmo)
								  exports['mythic_notify']:DoCustomHudText('success', 'Reloaded')
								  TriggerEvent('fsn_inventory:item:take', 'ammo', 1)
							  else
								  exports['mythic_notify']:DoCustomHudText('error', 'Max Ammo')
							  end
						  end
					  end
				else
					if currentWeapon and currentWeapon['customData'].weapon then
						equipWeapon(false,number)
						return
					end
				end
				local item = firstInventory[number]
				if item.index == false then
					if currentWeapon then
						
					else
						exports['mythic_notify']:DoHudText('error', 'Nothing in slot: '..number)
						return
					end
				end
				if item['customData'] and item['customData'].weapon then
					if item['customData'].ammo and item['customData'].ammotype and item['customData'].quality then
						equipWeapon(item, number)
					else
						exports['mythic_notify']:DoHudText('error', 'This weapon is broken, you cannot use it.')
						return
					end
				else
					if itemUses[item.index] then
						itemUses[item.index].use(item)
						if itemUses[item.index].takeItem then
							if firstInventory[number].amt ~= 1 then
								firstInventory[number].amt = firstInventory[number].amt-1
							else
								firstInventory[number] = {}
							end
							exports['mythic_notify']:DoHudText('success', 'You used 1: '..item.name)
							updateGUI()
						else
							exports['mythic_notify']:DoHudText('success', 'You used: '..item.name)
						end
					else
						invLog('<span style="color:red">This item does not have a use associated</span>')
						exports['mythic_notify']:DoHudText('error', 'This item does not have a use associated')
						return
					end
				end
			end
		end
	end
end)
