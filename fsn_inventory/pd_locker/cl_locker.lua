local spot = {x = 472.884765625, y = -990.33770751953, z = 24.914703369141}

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if GetDistanceBetweenCoords(spot.x, spot.y, spot.z, GetEntityCoords(PlayerPedId()), true) < 10 then
			DrawMarker(25,spot.x, spot.y, spot.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(spot.x, spot.y, spot.z, GetEntityCoords(PlayerPedId()), true) < 1 then
				if exports["fsn_doormanager"]:IsDoorLocked(21) == false or exports["fsn_police"]:fsn_PDDuty() then
					Util.DrawText3D(spot.x, spot.y, spot.z, '[E] Access ~b~Police Locker', {255,255,255,200}, 0.25)
					if IsControlJustPressed(0,38) then
						TriggerServerEvent('fsn_inventory:locker:request')
					end
					if exports["fsn_police"]:fsn_getPDLevel() > 8 then
						Util.DrawText3D(spot.x, spot.y, spot.z+0.2, '[LALT+NUM5] ~r~EMPTY POLICE LOCKER\n(this cannot be undone)', {255,255,255,200}, 0.25)
						if IsControlPressed(0,19) then
							if IsControlJustPressed(0,126) then
								TriggerServerEvent('fsn_inventory:locker:empty')
							end
						end
					end
				end
			end
		end
	end
end)