local droppedItems = {}

function PickupAnimation()
	RequestAnimDict('pickup_object')
	while not HasAnimDictLoaded('pickup_object') do
		Citizen.Wait(5)
		print 'loading anim'
	end
	TaskPlayAnim(PlayerPedId(), 'pickup_object', 'pickup_low', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
	Citizen.Wait(1000)
	ClearPedTasks(PlayerPedId())
end

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		for i, d in pairs(droppedItems) do
			if GetDistanceBetweenCoords(d.loc.x,d.loc.y,d.loc.z,GetEntityCoords(PlayerPedId()),false) < 10 then
				DrawMarker(25,d.loc.x, d.loc.y, d.loc.z - 0.95, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(d.loc.x,d.loc.y,d.loc.z,GetEntityCoords(PlayerPedId()),true) < 2 then
					Util.DrawText3D(d.loc.x,d.loc.y,d.loc.z, '[ALT+E] Pickup~y~\n'..d.item.name, {255,255,255,200}, 0.25)
					if IsControlPressed(0, 19) then
						if IsControlJustPressed(0,38) then
							if exports['fsn_inventory']:fsn_CanCarry(d.item.index, d.item.amt) then
								TriggerServerEvent('fsn_inventory:drops:collect', i)
								PickupAnimation()
							else
								TriggerEvent('fsn_notify:displayNotification', 'You can not carry this item. (Max Weight Limit: 40)', 'centerLeft', 3000, 'error')
							end	
						end
					end
				end
			end
		end
	end
end)

RegisterNetEvent('fsn_inventory:drops:send')
AddEventHandler('fsn_inventory:drops:send', function(tbl)
	print(':fsn_inventory_dropping: got update of '..#tbl..' items')
	droppedItems = tbl
end)

TriggerServerEvent('fsn_inventory:drops:request')
