policelevel = 0

--[[
    Armory locations
]]

local armories = {
    ['lspd_armory'] = {
        id = 'lspd_armory',
        busy = false,
        stock = {},
    },
    ['paleto_armory'] = {
        id = 'paleto_armory',
        busy = false,
        stock = {},
    },
    ['bcso_armory'] = {
        id = 'bcso_armory',
        busy = false,
        stock = {},
    },
}

--[[
    Begin the stock for the armories based on pd level
]]

local recruitStock = {
    weapon_stungun          = {amt = 999, price = 1},
    weapon_flare            = {amt = 999, price = 1},
    weapon_nightstick       = {amt = 999, price = 1},
    weapon_flashlight       = {amt = 999, price = 1},
    weapon_fireextinguisher = {amt = 999, price = 1},
    armor                   = {amt = 999, price = 1},
}

local officerStock = {
    weapon_stungun          = {amt = 999, price = 1},
    weapon_flare            = {amt = 999, price = 1},
    weapon_nightstick       = {amt = 999, price = 1},
    weapon_flashlight       = {amt = 999, price = 1},
    weapon_fireextinguisher = {amt = 999, price = 1},
    weapon_pistol           = {amt = 999, price = 1},
    armor                   = {amt = 999, price = 1},
    ammo_pistol             = {amt = 999, price = 1},
    ammo_pistol_large       = {amt = 999, price = 1},
    ammo_shotgun            = {amt = 999, price = 1},
    ammo_shotgun_large      = {amt = 999, price = 1},
    ammo_rifle              = {amt = 999, price = 1},
    ammo_rifle_large        = {amt = 999, price = 1},
    scuba_gear              = {amt = 999, price = 1},
}

local sergeantStock = {
    weapon_stungun          = {amt = 999, price = 1},
    weapon_flare            = {amt = 999, price = 1},
    weapon_nightstick       = {amt = 999, price = 1},
    weapon_flashlight       = {amt = 999, price = 1},
    weapon_fireextinguisher = {amt = 999, price = 1},
    weapon_pistol           = {amt = 999, price = 1},
    weapon_carbinerifle     = {amt = 999, price = 1},
    weapon_pumpshotgun      = {amt = 999, price = 1},
    armor                   = {amt = 999, price = 1},
    ammo_pistol             = {amt = 999, price = 1},
    ammo_pistol_large       = {amt = 999, price = 1},
    ammo_shotgun            = {amt = 999, price = 1},
    ammo_shotgun_large      = {amt = 999, price = 1},
    ammo_rifle              = {amt = 999, price = 1},
    ammo_rifle_large        = {amt = 999, price = 1},
    scuba_gear              = {amt = 999, price = 1},

}

--[[
    End the stock

    Begin the actual item clarification
]]

local items = {}

--[[
    End items
]]


--[[
    Begin Events
]]

RegisterNetEvent('fsn_police:armory:request')
AddEventHandler('fsn_police:armory:request', function(armory_id, policelevel)
    --local policelevel = policelevel
    print(items)
    local a = armories[armory_id]
    if a then
        if a.busy == false then
            local inv = {}
            a.busy = source
            if policelevel == 1 then
                for k, s in pairs(recruitStock) do
                    if items[k] then
                        local item = items[k]
                        
                        if item.data then
                            item.data.price = s.price
                        else
                            item.data = {price=s.price}
                        end

                        item.amt = s.amt

                        item.data.weight = items[k].data.weight
                        
                        table.insert(inv, #inv+1, item)
                    else
                        print('ERROR (fsn_police) :: Item '..k..' is not defined in server.lua')
                    end
                end

                TriggerClientEvent('fsn_inventory:police_armory:recieve', source, armory_id, inv)

            elseif policelevel <= 4 then
                for k, s in pairs(officerStock) do
                    if items[k] then
                        local item = items[k]
                            
                        if item.data then
                            item.data.price = s.price
                        else
                            item.data = {price=s.price}
                        end

                        item.amt = s.amt

                        item.data.weight = items[k].data.weight
                            
                        table.insert(inv, #inv+1, item)
                    else
                        print('ERROR (fsn_police) :: Item '..k..' is not defined in server.lua')
                    end  
                end

                TriggerClientEvent('fsn_inventory:police_armory:recieve', source, armory_id, inv)

            elseif policelevel >=5 then
                for k, s in pairs(sergeantStock) do
                    if items[k] then
                        local item = items[k]
                    
                        if item.data then
                            item.data.price = s.price
                        else
                            item.data = {price=s.price}
                        end

                        item.amt = s.amt

                        item.data.weight = items[k].data.weight
                    
                        table.insert(inv, #inv+1, item)
                    else
                        print('ERROR (fsn_police) :: Item '..k..' is not defined in server.lua')
                    end
                end

                print(inv)
                TriggerClientEvent('fsn_inventory:police_armory:recieve', source, armory_id, inv)

            end
        else
            TriggerClientEvent('fsn_notify:displayNotification', source, 'This armory is in use by another player: '..a.busy, 'centerRight', 8000, 'error')
        end
    else
        TriggerClientEvent('fsn_notify:displayNotification', source, 'ERROR: This armory does not seem to exist', 'centerRight', 8000, 'error')
    end
end)

RegisterServerEvent('fsn_police:armory:boughtOne')
AddEventHandler('fsn_police:armory:boughtOne', function(armory_id, item)
	local a = armories[armory_id]
	if a then
		--if armories[armory_id]['stock'][item] then
			--stores[store_id]['stock'][item].amt = stores[store_id]['stock'][item].amt - 1
			--TriggerEvent('fsn_main:logging:addLog', source, 'weapons', '[GUNSTORE] Player('..source..') purchased '..item..' from '..store_id)
		--else
			--TriggerClientEvent('fsn_notify:displayNotification', source, 'ERROR: This store does not have that item - please speak to a developer', 'centerRight', 8000, 'error')
		--end
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, 'ERROR: This armory does not seem to exist', 'centerRight', 8000, 'error')
	end
end)

RegisterServerEvent('fsn_police:armory:closedArmory')
AddEventHandler('fsn_police:armory:closedArmory', function(armory_id)
	local a = armories[armory_id]
	if a then
		a.busy = false
	else 
		TriggerClientEvent('fsn_notify:displayNotification', source, 'ERROR: This armory does not seem to exist', 'centerRight', 8000, 'error')
	end
end)

RegisterNetEvent('fsn_police:armory:recieveItemsForArmory')
AddEventHandler('fsn_police:armory:recieveItemsForArmory', function(presetItems)
    items = presetItems
end)

AddEventHandler('playerDropped', function()
	for k,v in pairs(armories) do
		if v.busy == source then
			v.busy = false
		end
	end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print('^6' .. resourceName .. ' has started. Recieving presetItems for stock^0')
    TriggerEvent('fsn_inventory:sendItemsToArmory')
  end)

--[[
    End Events
]]