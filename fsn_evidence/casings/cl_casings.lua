local wep

RegisterNetEvent('fsn_evidence:weaponInfo')
AddEventHandler('fsn_evidence:weaponInfo', function(weapon)
	if weapon ~= nil then
		wep = weapon
	end
end)

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) and exports["fsn_criminalmisc"]:HoldingWeapon() and not exports["fsn_police"]:fsn_PDDuty() then
			--print(wep)
			local pos = GetEntityCoords(PlayerPedId())
			local coords = {
			 x = pos.x,
			 y = pos.y,
			 z = pos.z
			}
			if wep ~= nil then
				TriggerServerEvent('fsn_evidence:drop:casing',wep,pos)
			end
			if wep.isAuto then
				Citizen.Wait(500)
			else
				Citizen.Wait(1000)
			end
		end
	end
end)