local desks = {}

RegisterNetEvent('fsn_bankrobbery:desks:receive')
AddEventHandler('fsn_bankrobbery:desks:receive', function(tbl)
	desks = tbl
end)
TriggerServerEvent('fsn_bankrobbery:desks:request')

Util.Tick(function()
	for k, v in pairs(desks) do
		-- doors
		if GetDistanceBetweenCoords(v.door.x, v.door.y, v.door.z, GetEntityCoords(PlayerPedId()), true) < 3 then
			if v.door.locked then
				local door = GetClosestObjectOfType(v.door.x, v.door.y, v.door.z, 1.0, v.door.mdl, false, false, false)
				if door then
					Util.DrawText3D(v.door.x, v.door.y, v.door.z, 'LOCKED', {255, 0, 0, 140}, 0.2)
					FreezeEntityPosition(door, true)
					SetStateOfClosestDoorOfType(v.door.mdl, v.door.x, v.door.y, v.door.z, true, 0, 0)
				end
			else
				local door = GetClosestObjectOfType(v.door.x, v.door.y, v.door.z, 1.0, v.door.mdl, false, false, false)
				if door then
					FreezeEntityPosition(door, false)
					SetStateOfClosestDoorOfType(v.door.mdl, v.door.x, v.door.y, v.door.z, false, 0, 0)
				end
			end
		end
		if not v.door.locked then
			for key, keyboard in pairs(v.keyboards) do
				if GetDistanceBetweenCoords(keyboard.robspot.x, keyboard.robspot.y, keyboard.robspot.z, GetEntityCoords(PlayerPedId()), true) < 0.5 then
					if keyboard.robbed == 'nothacked' then
						Util.DrawText3D(keyboard.x, keyboard.y, keyboard.z, '[E] Begin hack', {255, 255, 255, 200}, 0.25)
						if IsControlJustPressed(0,38) then
							TriggerServerEvent('fsn_bankrobbery:desks:startHack', k, key)
							
							local function afterHack(success, timeremaining)
								if success then
									TriggerServerEvent('fsn_bankrobbery:desks:endHack', k, key, success)
									TriggerEvent('fsn_needs:stress:add', 5)
									TriggerEvent('mhacking:hide')
								else
									TriggerServerEvent('fsn_bankrobbery:desks:endHack', k, key, success)
									TriggerEvent('fsn_needs:stress:add', 5)
									TriggerEvent('mhacking:hide')
								end
							end
							
							TriggerEvent("mhacking:show")
							TriggerEvent("mhacking:start",8,30,afterHack)
						end
					elseif keyboard.robbed == 'hacking' then
						Util.DrawText3D(keyboard.x, keyboard.y, keyboard.z, 'Hack ongoing...', {245, 188, 66, 200}, 0.25)
					elseif keyboard.robbed == 'hackingfailed' then
						Util.DrawText3D(keyboard.x, keyboard.y, keyboard.z, '[E] Try again', {245, 188, 66, 200}, 0.25)
					else
						Util.DrawText3D(keyboard.x, keyboard.y, keyboard.z, 'Computer Offline', {255, 0, 0, 100}, 0.25)
					end
				end
			end
		end
	end
end, 0)