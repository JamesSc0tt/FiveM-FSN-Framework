policelevel = 0

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

local recruitStock = {
    WEAPON_STUNGUN = {amt = 999, price = 1},
    WEAPON_FLARE = {amt = 999, price = 1},
    WEAPON_NIGHTSTICK = {amt = 999, price = 1},
    WEAPON_FLASHLIGHT = {amt = 999, price = 1},
    WEAPON_FIREEXTINGUISHER = {amt = 999, price = 1},
    armor = {amt = 999, price = 1},
}

local officerStock = {
    WEAPON_STUNGUN = {amt = 999, price = 1},
    WEAPON_FLARE = {amt = 999, price = 1},
    WEAPON_NIGHTSTICK = {amt = 999, price = 1},
    WEAPON_FLASHLIGHT = {amt = 999, price = 1},
    WEAPON_FIREEXTINGUISHER = {amt = 999, price = 1},
    WEAPON_PISTOL = {amt = 999, price = 1},
    armor = {amt = 999, price = 1},
    ammo_pistol = {amt = 999, price = 1},
    ammo_pistol_large = {amt = 999, price = 1},
    ammo_shotgun = {amt = 999, price = 1},
    ammo_shotgun_large = {amt = 999, price = 1},
    ammo_rifle = {amt = 999, price = 1},
    ammo_rifle_large = {amt = 999, price = 1},
    scuba_gear = {amt = 999, price = 1},
}

local sergeantStock = {
    WEAPON_STUNGUN = {amt = 999, price = 1},
    WEAPON_FLARE = {amt = 999, price = 1},
    WEAPON_NIGHTSTICK = {amt = 999, price = 1},
    WEAPON_FLASHLIGHT = {amt = 999, price = 1},
    WEAPON_FIREEXTINGUISHER = {amt = 999, price = 1},
    WEAPON_PISTOL = {amt = 999, price = 1},
    WEAPON_CARBINERIFLE = {amt = 999, price = 1},
    WEAPON_PUMPSHOTGUN = {amt = 999, price = 1},
    armor = {amt = 999, price = 1},
    ammo_pistol = {amt = 999, price = 1},
    ammo_pistol_large = {amt = 999, price = 1},
    ammo_shotgun = {amt = 999, price = 1},
    ammo_shotgun_large = {amt = 999, price = 1},
    ammo_rifle = {amt = 999, price = 1},
    ammo_rifle_large = {amt = 999, price = 1},
    scuba_gear = {amt = 999, price = 1},

}

local items = {
    ['WEAPON_STUNGUN'] = {
        index = "WEAPON_STUNGUN",
        name = "Stun Gun",
        amt = 1,
        customData = {
            weapon = 'true',
            ammo = 0,
            ammotype = 'none',
            quality = 'normal',
            PDIssued = Util.MakeString(6)
        }
    },

    ['WEAPON_FLARE'] = {
        index = "WEAPON_FLARE",
        name = "Flare",
        amt = 1,
        customData = {
            weapon = 'true',
            ammo = 100,
            ammotype = 'none',
            quality = 'normal',
        }
    },

    ['WEAPON_NIGHTSTICK'] = {
        index = "WEAPON_NIGHTSTICK",
        name = "Nightstick",
        amt = 1,
        customData = {
            weapon = 'true',
            ammo = 0,
            ammotype = 'none',
            quality = 'normal',
        }
    },

    ['WEAPON_FIREEXTINGUISHER'] = {
        index = "WEAPON_FIREEXTINGUISHER",
        name = "Fire Extinguisher",
        amt = 1,
        customData = {
            weapon = 'true',
            ammo = 200,
            ammotype = 'none',
            quality = 'normal',
        }
    },

    ['WEAPON_PISTOL'] = {
        index = "WEAPON_PISTOL",
        name = "Pistol",
        amt = 1,
        customData = {
            weapon = 'true',
            ammo = 200,
            ammotype = 'pistol_ammo',
            quality = 'normal',
            PDIssued = Util.MakeString(6)
        }
    },

    ['WEAPON_FLASHLIGHT'] = {
        index = "WEAPON_FLASHLIGHT",
        name = "Flashlight",
        amt = 1,
        customData = {
            weapon = 'true',
            ammo = 0,
            ammotype = 'none',
            quality = 'normal',
        }
    },

    ['WEAPON_PUMPSHOTGUN'] = {
        index = "WEAPON_PUMPSHOTGUN",
        name = "Pump Shotgun",
        amt = 1,
        customData = {
            weapon = 'true',
            ammo = 200,
            ammotype = '12gauge_ammo',
            quality = 'normal',
            PDIssued = Util.MakeString(6)
        }
    },
    
    ['WEAPON_CARBINERIFLE'] = {
        index = "WEAPON_CARBINERIFLE",
        name = "Carbine Rifle",
        amt = 1,
        customData = {
            weapon = 'true',
            ammo = 200,
            ammotype = 'rifle_ammo',
            quality = 'normal',
            PDIssued = Util.MakeString(6)
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

    scuba_gear = {
        index = 'scuba',
        name = 'Scuba Gear',
        data = {
            weight = 6.0
        },
    },
}

RegisterNetEvent('fsn_police:armory:request')
AddEventHandler('fsn_police:armory:request', function(armory_id, policelevel)
    --local policelevel = policelevel
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

AddEventHandler('playerDropped', function()
	for k,v in pairs(armories) do
		if v.busy == source then
			v.busy = false
		end
	end
end)
                