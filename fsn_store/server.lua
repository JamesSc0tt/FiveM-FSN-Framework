-- These will restock every restart, unless you make something so it doesn't.
local stores = {
    ['liquorace'] = {
		busy = false,
		stock = {
            beef_jerky = {amt=999,price=4},
            cupcake = {amt = 999, price = 1},
            microwave_burrito = {amt = 999, price = 8},
            panini = {amt = 999, price = 6},
            pepsi = {amt = 999, price = 5},
            phone = {amt = 999, price = 250},
            bandage = {amt = 1500, price = 250},
            binoculars = {amt = 999, price = 250}

		}
    },
    ['ltdgas'] = {
		busy = false,
		stock = {
            beef_jerky = {amt=999,price=4},
            cupcake = {amt = 999, price = 1},
            microwave_burrito = {amt = 999, price = 8},
            panini = {amt = 999, price = 6},
            pepsi = {amt = 999, price = 5},
            phone = {amt = 999, price = 250},
            bandage = {amt = 1500, price = 250},
            binoculars = {amt = 999, price = 250}

		}
    },
	
    ['robsliquor'] = {
		busy = false,
		stock = {
            beef_jerky = {amt=999,price=4},
            cupcake = {amt = 999, price = 1},
            microwave_burrito = {amt = 999, price = 8},
            panini = {amt = 999, price = 6},
            pepsi = {amt = 999, price = 5},
            phone = {amt = 999, price = 250},
            bandage = {amt = 1500, price = 250},
            binoculars = {amt = 999, price = 250}
		}
    },
    ['twentyfourseven'] = {
		busy = false,
		stock = {
            beef_jerky = {amt=999,price=4},
            cupcake = {amt = 999, price = 1},
            microwave_burrito = {amt = 999, price = 8},
            panini = {amt = 999, price = 6},
            pepsi = {amt = 999, price = 5},
            phone = {amt = 999, price = 250},
            bandage = {amt = 1500, price = 250},
            binoculars = {amt = 999, price = 250}

		}
    },
    ['pillbox'] = {
		busy = false,
		stock = {
            beef_jerky = {amt=999,price=4},
            cupcake = {amt = 999, price = 1},
            microwave_burrito = {amt = 999, price = 8},
            panini = {amt = 999, price = 6},
            pepsi = {amt = 999, price = 5},
            phone = {amt = 999, price = 250},
            bandage = {amt = 1500, price = 250},
            binoculars = {amt = 999, price = 250}

		}
    },
}

local items = {
    beef_jerky = {
		index = 'beef_jerky',
		name = 'Beef Jerky',
		weight = 0.5
    },
    cupcake = {
		index = 'cupcake',
        name = 'Cupcake',
        weight = 0.5
    },
    microwave_burrito = {
		index = 'microwave_burrito',
		name = 'Microwave Burrito',
		weight = 1.5
    },
    panini = {
		index = 'panini',
		name = 'Panini',
		weight = 1
    },
    pepsi = {
		index = 'pepsi',
		name = 'Pepsi',
		weight = 1
    },
    pepsi_max = {
		index = 'pepsi_max',
		name = 'Pepsi Max',
		weight = 1
    },
    water = {
		index = 'water',
		name = 'Water',
		weight = 1

    },
    coffee = {
		index = 'coffee',
		name = 'Coffee',
		weight = 1
    },
    lockpick = {
		index = 'lockpick',
		name = 'Lockpick',
		weight = 1.5
    },
    zipties = {
		index = 'zipties',
		name = 'Zip Ties',
		weight = 3
    },
    phone = {
		index = 'phone',
		name = 'Phone',
		weight = 1
    },
    bandage = {
		index = 'bandage',
		name = 'Bandage',
		weight = 0.4
    },
    binoculars = {
		index = 'binoculars',
		name = 'Binoculars',
		weight = 3
    },


}

--[[
	Hint: you could add some code here to make players own stores and put stock in??
]]--

RegisterServerEvent('fsn_store:request')
AddEventHandler('fsn_store:request', function(store_id)
	local s = stores[store_id]
    if s then
        if s.busy == false then
            s.busy = source
            local inv = {}
            for k, v in pairs(s.stock) do
                if items[k] then
                    local item = items[k]
                    item.data = {price=s.stock[k].price}
                    item.amt = s.stock[k].amt

                    table.insert(inv, #inv+1, item)
                else
                     print('ERROR (fsn_store) :: Item '..k..' is not defined in server.lua')
                end
            end

            TriggerClientEvent('fsn_inventory:store:recieve', source, store_id, inv)
         else
            TriggerClientEvent('fsn_notify:displayNotification', source, 'This store is in use by another player: '..s.busy, 'centerRight', 8000, 'error')
        end
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, 'ERROR: This store does not seem to exist', 'centerRight', 8000, 'error')
	end
end)

RegisterServerEvent('fsn_store:boughtOne')
AddEventHandler('fsn_store:boughtOne', function(store_id, item)
	local s = stores[store_id]
	if s then
		if stores[store_id]['stock'][item] then
			stores[store_id]['stock'][item].amt = stores[store_id]['stock'][item].amt - 1
			TriggerEvent('fsn_main:logging:addLog', source, 'weapons', '[GUNSTORE] Player('..source..') purchased '..item..' from '..store_id)
		else
			TriggerClientEvent('fsn_notify:displayNotification', source, 'ERROR: This store does not have that item - please speak to a developer', 'centerRight', 8000, 'error')
		end
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, 'ERROR: This store does not seem to exist', 'centerRight', 8000, 'error')
	end
end)

RegisterServerEvent('fsn_store:closedStore')
AddEventHandler('fsn_store:closedStore', function(store_id)
	local s = stores[store_id]
	if s then
		s.busy = false
	else 
		TriggerClientEvent('fsn_notify:displayNotification', source, 'ERROR: This store does not seem to exist', 'centerRight', 8000, 'error')
	end
end)

AddEventHandler('playerDropped', function()
	for k,v in pairs(stores) do
		if v.busy == source then
			v.busy = false
		end
	end
end)