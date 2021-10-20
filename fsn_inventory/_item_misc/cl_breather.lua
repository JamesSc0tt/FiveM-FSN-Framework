local equipped = false

RegisterNetEvent('fsn_inventory:rebreather:use')
AddEventHandler('fsn_inventory:rebreather:use', function()
	equipped = true
	equipped_time = GetGameTimer()
	exports['mythic_notify']:DoHudText('success', 'Scuba activated')
end)

local loc = {x = -1164.76171875, y = -1586.4027099609, z = 4.3897089958191}

Citizen.CreateThread(function()
	local bleep = AddBlipForCoord(loc.x, loc.y, loc.z)
	SetBlipSprite(bleep, 597)
	SetBlipColour(bleep, 0)
	SetBlipAsShortRange(bleep, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Scuba Store")
	EndTextCommandSetBlipName(bleep)
	while true do Citizen.Wait(0)
		if equipped then
			SetPedMaxTimeUnderwater(PlayerPedId(), 400.00)
			SetEnableScuba(PlayerPedId(),true)
			if equipped_time+600000 < GetGameTimer() then
				equipped = false
				exports['mythic_notify']:DoHudText('error', 'Scuba expired')
			end
		else
			SetPedMaxTimeUnderwater(PlayerPedId(), 100.00)
			SetEnableScuba(PlayerPedId(),false)
		end
		
		-- store
		if GetDistanceBetweenCoords(loc.x, loc.y, loc.z, GetEntityCoords(PlayerPedId()), false) < 10 then
			DrawMarker(25,loc.x, loc.y, loc.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(loc.x, loc.y, loc.z, GetEntityCoords(PlayerPedId()), false) < 1 then
				Util.DrawText3D(loc.x, loc.y, loc.z, '[E] Buy ~b~Scuba Gear', {255,255,255,200}, 0.25)
				if IsControlJustPressed(0,38) then
					if exports["fsn_main"]:fsn_CanAfford(500) then
						TriggerEvent('fsn_bank:change:walletMinus', 500)
						TriggerEvent('fsn_inventory:items:add', {
							index = 'scuba',
							name = 'Scuba Gear',
							amt = 1,
							data = {
								weight = 6.0
							},
						})
					end
				end
			end
		end
	end
end)