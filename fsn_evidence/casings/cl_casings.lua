Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if IsPedShooting(GetPlayerPed(-1)) and exports["fsn_criminalmisc"]:HoldingWeapon() and not exports["fsn_police"]:fsn_PDDuty() then
			local wep = exports["fsn_criminalmisc"]:weaponInfo(GetSelectedPedWeapon(GetPlayerPed(-1)))
			local pos = GetEntityCoords(GetPlayerPed(-1))
			local coords = {
			 x = pos.x,
			 y = pos.y,
			 z = pos.z
			}
			TriggerServerEvent('fsn_evidence:drop:casing',wep,pos)
			if wep.isAuto then
				Citizen.Wait(500)
			else
				Citizen.Wait(1000)
			end
		end
	end
end)
