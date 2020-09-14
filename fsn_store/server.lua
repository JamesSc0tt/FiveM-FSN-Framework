-- These will restock every restart, unless you make something so it doesn't.
local stores = {

  --[[
    YOUR BASIC ASS STORES
  ]]

    ['liquorace'] = {
      busy = false,
      stock = {
        beef_jerky        = {amt=999,price=4},
        cupcake           = {amt = 999, price = 1},
        microwave_burrito = {amt = 999, price = 8},
        panini            = {amt = 999, price = 6},
        pepsi             = {amt = 999, price = 5},
        phone             = {amt = 999, price = 250},
        bandage           = {amt = 1500, price = 250},
        binoculars        = {amt = 999, price = 250}

      }
    },

    ['ltdgas'] = {
		busy = false,
      stock = {
        beef_jerky        = {amt=999,price=4},
        cupcake           = {amt = 999, price = 1},
        microwave_burrito = {amt = 999, price = 8},
        panini            = {amt = 999, price = 6},
        pepsi             = {amt = 999, price = 5},
        phone             = {amt = 999, price = 250},
        bandage           = {amt = 1500, price = 250},
        binoculars         = {amt = 999, price = 250}

      }
    },
	
    ['robsliquor'] = {
      busy = false,
      stock = {
        beef_jerky        = {amt=999,price=4},
        cupcake           = {amt = 999, price = 1},
        microwave_burrito = {amt = 999, price = 8},
        panini            = {amt = 999, price = 6},
        pepsi             = {amt = 999, price = 5},
        phone             = {amt = 999, price = 250},
        bandage           = {amt = 1500, price = 250},
        binoculars        = {amt = 999, price = 250}
      }
    },

    ['twentyfourseven'] = {
      busy = false,
      stock = {
        beef_jerky        = {amt=999,price=4},
        cupcake           = {amt = 999, price = 1},
        microwave_burrito = {amt = 999, price = 8},
        panini            = {amt = 999, price = 6},
        pepsi             = {amt = 999, price = 5},
        phone             = {amt = 999, price = 250},
        bandage           = {amt = 1500, price = 250},
        binoculars        = {amt = 999, price = 250}

      }
    },

    ['pillbox'] = {
      busy = false,
      stock = {
        beef_jerky        = {amt=999,price=4},
        cupcake           = {amt = 999, price = 1},
        microwave_burrito = {amt = 999, price = 8},
        panini            = {amt = 999, price = 6},
        pepsi             = {amt = 999, price = 5},
        phone             = {amt = 999, price = 250},
        bandage           = {amt = 1500, price = 250},
        binoculars        = {amt = 999, price = 250}

      }
    },

    --[[
      GUN STORES HELL YEAH!
    ]]
    ['ply_owner'] = {
      busy = false,
      stock = {
        weapon_assaultrifle   	= {amt = 999, price = 10000},
        weapon_combatpistol 	  = {amt = 999, price = 500},
        weapon_smg 			      	= {amt = 999, price = 500},
        weapon_fireextinguisher = {amt = 999, price = 500},
        ammo_pistol 			      = {amt = 999, price = 600},
        ammo_pistol_large 		  = {amt = 999, price = 800},
        ammo_smg 				        = {amt = 999, price = 600},
        ammo_smg_large 			    = {amt = 999, price = 800},
        armor 					        = {amt = 999, price = 1000},
      }
    }
}

local items = {}

--[[
	Hint: you could add some code here to make players own stores and put stock in??
]]--

RegisterServerEvent('fsn_store:request')
AddEventHandler('fsn_store:request', function(store_id, gunstore)
  local s = stores[store_id]
    if s then
        if s.busy == false then
            s.busy = source
            local inv = {}
            for k, v in pairs(s.stock) do
                if items[k] then
                    local item = items[k]
                    if item.data then
                      item.data.price = s.stock[k].price
                    else
                      item.data = {price=s.stock[k].price}
                    end
                    item.amt = s.stock[k].amt

                    table.insert(inv, #inv+1, item)
                else
                     print('ERROR (fsn_store) :: Item '..k..' is not defined in server.lua')
                end
            end

            TriggerClientEvent('fsn_inventory:store:recieve', source, store_id, inv, gunstore)
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

RegisterNetEvent('fsn_store:recieveItemsForStore')
AddEventHandler('fsn_store:recieveItemsForStore', function(presetItems)

  items = presetItems

end)

AddEventHandler('playerDropped', function()
	for k,v in pairs(stores) do
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
  TriggerEvent('fsn_inventory:sendItemsToStore')
end)