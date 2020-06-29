-- These will restock every restart, unless you make something so it doesn't.
local stores = {
	['ply_owner'] = {
		busy = false,
		stock = {
			WEAPON_ASSAULTRIFLE = {amt=999,price=10000},
			WEAPON_COMBATPISTOL = {amt=999,price=500},
			WEAPON_SMG = {amt=999,price=500},
            ammo_pistol = {amt = 999, price = 600},
            ammo_pistol_large = {amt = 999, price = 800},
            ammo_smg = {amt = 999, price = 600},
			ammo_smg_large = {amt = 999, price = 800},
			armor = {amt = 999, price = 1000},
		}
	}
}
local weapon = {
	index = "WEAPON_ASSAULTRIFLE",
	name = "ASSAULT RIFLE",
	amt = 1,
	data = {
		weight = 5,
	},
	customData = {
		weapon = 'true',
		ammo = 200,
		ammotype = 'rifle_ammo',
		quality = 'perfect',
	}
}

local items = {
	['WEAPON_ASSAULTRIFLE'] = weapon,
	['WEAPON_COMBATPISTOL'] = {
        index = "WEAPON_COMBATPISTOL",
        name = "Combat Pistol",
        data = {
            weight = 9,
        },
        customData = {
            weapon = 'true',
            ammo = 200,
            ammotype = 'ammo_pistol',
            quality = 'normal',
            Serial = ''
        }
	},
	['WEAPON_SMG'] = {
        index = "WEAPON_SMG",
        name = "SMG",
        data = {
            weight = 9,
        },
        customData = {
            weapon = 'true',
            ammo = 200,
            ammotype = 'ammo_smg',
            quality = 'normal',
            Serial = ''
        }
    },
    ammo_pistol = {
        index = 'ammo_pistol',
        name = "Pistol Ammo",
		data = {
			weight = 5.5
		},
    },
    ammo_pistol_large = {
        index = 'ammo_pistol_large',
        name = "Large Pistol Ammo",
		data = {
			weight = 8.5
		},
    },
    ammo_smg = {
        index = 'ammo_smg',
        name = "SMG Ammo",
		data = {
			weight = 5.5
		},
    },
    ammo_smg_large = {
        index = 'ammo_smg_large',
        name = "Large SMG Ammo",
		data = {
			weight = 8.5
		},
    },
    ammo_shotgun = {
        index = 'ammo_shotgun',
        name = "Shotgun Ammo",
		data = {
			weight = 6.5
		},
    },
    ammo_shotgun_large = {
        index = 'ammo_shotgun_large',
        name = "Large Shotgun Ammo",
		data = {
			weight = 9.5
		},
    },
    ammo_rifle = {
        index = 'ammo_rifle',
        name = "Rifle Ammo",
		data = {
			weight = 6.5
		},
    },
    ammo_rifle_large = {
        index = 'ammo_rifle_large',
        name = "Large Rifle Ammo",
		data = {
			weight = 9.5
		},
    },
    ammo_sniper = {
        index = 'ammo_sniper',
        name = "Sniper Ammo",
		data = {
			weight = 6.5
		},
    },
    ammo_sniper_large = {
        index = 'ammo_sniper_large',
        name = "Large Sniper Ammo",
		data = {
			weight = 9.5
		},
	},
	armor = {
        index = 'armor',
        name = "Kevlar",
		data = {
			weight = 13.5
		},
    },
}

--[[
	Hint: you could add some code here to make players own stores and put stock in??
]]--

RegisterServerEvent('fsn_store_guns:request')
AddEventHandler('fsn_store_guns:request', function(store_id)
	local s = stores[store_id]
	if s then
		if s.busy == false then
			s.busy = source
			local inv = {}
			for k, v in pairs(s.stock) do
				if items[k] then
					local item = items[k]
					if item.data then
						item.data.price=s.stock[k].price
					else
						item.data = {price=s.stock[k].price}
					end
					item.amt = s.stock[k].amt

					table.insert(inv, #inv+1, item)
				else
					print('ERROR (fsn_store_guns) :: Item '..k..' is not defined in server.lua')
				end
			end

			TriggerClientEvent('fsn_inventory:store_gun:recieve', source, store_id, inv)
		else
			TriggerClientEvent('fsn_notify:displayNotification', source, 'This store is in use by another player: '..s.busy, 'centerRight', 8000, 'error')
		end 
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, 'ERROR: This store does not seem to exist', 'centerRight', 8000, 'error')
	end
end)

RegisterServerEvent('fsn_store_guns:boughtOne')
AddEventHandler('fsn_store_guns:boughtOne', function(store_id, item)
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

RegisterServerEvent('fsn_store_guns:closedStore')
AddEventHandler('fsn_store_guns:closedStore', function(store_id)
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