local id_spot = {x = -551.44750976563, y = -190.33755493164, z = 38.219680786133}
local dl_spot = {x = -553.81396484375, y = -191.76734924316, z = 38.219673156738}

local myChar = {}
AddEventHandler('fsn_main:character', function(tbl)
	myChar = tbl
end)
Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if GetDistanceBetweenCoords(-548.19848632813, -199.1042175293, 38.219657897949, GetEntityCoords(PlayerPedId()),true) < 50 then
			DrawMarker(25,id_spot.x, id_spot.y, id_spot.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
			DrawMarker(25,dl_spot.x, dl_spot.y, dl_spot.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(dl_spot.x, dl_spot.y, dl_spot.z, GetEntityCoords(PlayerPedId()),true) < 0.5 then
				Util.DrawText3D(dl_spot.x, dl_spot.y, dl_spot.z, '[E] Buy ~b~Drivers License~w~ ($500)\n~r~UNAVAILABLE', {255,255,255,200}, 0.25)
			end
			if GetDistanceBetweenCoords(id_spot.x, id_spot.y, id_spot.z, GetEntityCoords(PlayerPedId()),true) < 0.5 then
				Util.DrawText3D(id_spot.x, id_spot.y, id_spot.z, '[E] Collect ~g~Citizen ID', {255,255,255,200}, 0.25)
				if IsControlJustPressed(0,38) then
					TriggerServerEvent('fsn_licenses:id:request', myChar)
				end
			end
		end
	end
end)

RegisterNetEvent('fsn_licenses:giveID')
AddEventHandler('fsn_licenses:giveID', function()
	TriggerServerEvent('fsn_licenses:id:request', myChar)
end)