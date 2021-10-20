itemUses = {
	["crowbar"] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_criminalmisc:houserobbery:try')
		end,
	},
	["scuba"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:rebreather:use')
		end,
	},
	["id"] = {
		takeItem = false,
		use = function(item)
			local players = {}
			for _, ply in pairs(GetActivePlayers()) do
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(ply)),GetEntityCoords(PlayerPedId()),true) < 5 then
					players[#players+1] = GetPlayerServerId(ply)
				end
			end
			TriggerServerEvent('fsn_licenses:id:display', players, item.customData.Name, item.customData.Occupation, item.customData.DOB, item.customData.Issue, item.customData.CharID)
		end,
	},
	["painkillers"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('mythic_hospital:client:UsePainKiller', 2)
		end
	},
	["morphine"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('mythic_hospital:client:UsePainKiller', 6)
		end
	},
	["bandage"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('mythic_hospital:client:RemoveBleed')
			TriggerEvent('fsn_ems:ad:stopBleeding')
			TriggerEvent('fsn_evidence:ped:addState', 'Has bandage', 'UPPER_BODY', 20)
			if GetEntityHealth(PlayerPedId()) < 131 then
				TriggerEvent('fsn_inventory:item:take', 'bandage', 1)
				while ( not HasAnimDictLoaded( "oddjobs@assassinate@guard" ) ) do
					RequestAnimDict( "oddjobs@assassinate@guard" )
					Citizen.Wait( 5 )
				end
				TaskPlayAnim(PlayerPedId(), "oddjobs@assassinate@guard", "unarmed_fold_arms", 8.0, 1.0, 2500, 2, 0, 0, 0, 0 )  
				Citizen.Wait(1500)
				SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId())+15)
			else
				TriggerEvent('fsn_notify:displayNotification', 'You don\'t need to use a bandage!<br>Visit an EMS personnel or a hospital to heal more.', 'centerLeft', 3500, 'error')
			end
		end
	},
	["repair_kit"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_vehiclecontrol:damage:repairkit')
		end
	},
	["beef_jerky"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:use:food', 15)
		end
	},
	["cupcake"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:use:food', 5)
		end
	},
	["cupcake"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:use:food', 5)
			if math.random(1, 100) < 5 then
				TriggerEvent('fsn_evidence:ped:addState', 'Crumbs down chest', 'UPPER_BODY')
			end
		end
	},
	["tuner_chip"] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('xgc-tuner:openTuner')
		end
	},
	["burger"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:use:food', 23)
		end
	},
	["microwave_burrito"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:use:food', 15)
		end
	},
	["panini"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:use:food', 13)
		end
	},
	["pepsi"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:use:drink', 10)
		end
	},
	["pepsi_max"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:use:drink', 10)
		end
	},
	["water"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:use:drink', 20)
		end
	},
	["coffee"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:use:drink', 25)
		end
	},
	["lockpick"] = {
		takeItem = false,
		use = function(item)
			print'uselockpick'
			TriggerEvent('fsn_criminalmisc:lockpicking')
		end
	},
	["phone"] = {
		takeItem = false,
		use = function(item)
			ExecuteCommand('p')
		end
	},
	["joint"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_criminalmisc:drugs:effects:weed')
			TriggerEvent('fsn_evidence:ped:addState', 'Seems agitated', 'UPPER_BODY')
		end
	},
	["meth_rocks"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_criminalmisc:drugs:effects:meth')
			TriggerEvent('fsn_evidence:ped:addState', 'Red eyes', 'HEAD')
			TriggerEvent('mythic_hospital:client:UseAdrenaline')
		end
	},
	["meth_rocks"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_criminalmisc:drugs:effects:cocaine')
			TriggerEvent('fsn_evidence:ped:addState', 'Grinding jaw', 'HEAD')
		end
	},
	["cigarette"] = {
		takeItem = true,
		use = function(item)
		TriggerEvent('fsn_criminalmisc:drugs:effects:smokeCigarette')
		end
	},
	["binoculars"] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('binoculars:Activate')
		end
	},
	["ecola_drink"] = {
		takeItem = true,
		use = function(item)
			TriggerEvent('fsn_inventory:use:drink', 50)
		end
	},
	["empty_canister"] = {
		takeItem = true,
		use = function(item)
			if GetDistanceBetweenCoords(3563.146484375, 3673.47265625, 28.121885299683, GetEntityCoords(PlayerPedId()), true) < 1 then
				TriggerEvent('fsn_inventory:item:take', 'empty_canister', 1)
				TriggerEvent('fsn_inventory:item:add', 'gas_canister', 1)
			else
				TriggerEvent('fsn_notify:displayNotification', 'Nothing to do with that here', 'centerLeft', 3000, 'error')
			end
		end
	},
	["gas_canister"] = {
		takeItem = true,
		use = function(item)
			local gasuse = {x = -628.78393554688, y = -226.52185058594, z = 55.901119232178}
			if GetDistanceBetweenCoords(gasuse.x, gasuse.y, gasuse.z, GetEntityCoords(PlayerPedId()), true) < 1 then
				TriggerEvent('fsn_notify:displayNotification', 'It looks like the vent is locked, you\'ll need to find another way to do this', 'centerLeft', 3000, 'info')
			else
				TriggerEvent('fsn_notify:displayNotification', 'Nothing to do with that here', 'centerLeft', 3000, 'error')
			end
		end
	},
	['ammo_pistol'] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_inventory:useAmmo', 'ammo_pistol')
		end
	},
	['ammo_pistol_large'] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_inventory:useAmmo', 'ammo_pistol_large')
		end
	},
	['ammo_shotgun'] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_inventory:useAmmo', 'ammo_shotgun')
		end
	},
	['ammo_shotgun_large'] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_inventory:useAmmo', 'ammo_shotgun_large')
		end
	},
	['ammo_rifle'] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_inventory:useAmmo', 'ammo_rifle')
		end
	},
	['ammo_rifle_large'] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_inventory:useAmmo', 'ammo_rifle_large')
		end
	},
	['ammo_smg'] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_inventory:useAmmo', 'ammo_smg')
		end
	},
	['ammo_smg_large'] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_inventory:useAmmo', 'ammo_smg_large')
		end
	},
	['ammo_sniper'] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_inventory:useAmmo', 'ammo_sniper')
		end
	},
	['ammo_sniper_large'] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_inventory:useAmmo', 'ammo_sniper_large')
		end
	},
	['armor'] = {
		takeItem = false,
		use = function(item)
			TriggerEvent('fsn_inventory:useArmor')
		end
	},
}