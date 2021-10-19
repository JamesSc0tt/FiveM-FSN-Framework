local laptop = {x = 1208.73046875, y = -3114.8859863281, z = 5.5622911453247}
local dropoff = {x = 1204.7564697266, y = -3116.3649902344, z = 5.1010489463806}
local cars = {
  "Blista","Dilettante","Prairie","Rhapsody","Panto","F620","Oracle2","Dominator","Buccaneer","Ruiner","Rebel2","Sandking","BJXL","Seminole","Emperor2","Surge","Bison","Journey","Taco","Zentorno","RapidGT","Exemplar","Washington","Patriot","Jackal"
}
local required = false
local lastjob = 0

Citizen.CreateThread(function()
  --local blip = AddBlipForCoord(laptop.x, laptop.y, laptop.z)
  --SetBlipSprite(blip, 277)
  --SetBlipColour(blip, 1)
  --SetBlipAsShortRange(blip, true)
  --BeginTextCommandSetBlipName("STRING")
  --AddTextComponentString("Unknown")
  --EndTextCommandSetBlipName(blip)
  while true do
    Citizen.Wait(0)
    if GetDistanceBetweenCoords(dropoff.x, dropoff.y, dropoff.z, GetEntityCoords(PlayerPedId()), true) < 3 and required then
      if IsPedInAnyVehicle(PlayerPedId()) then
        local car = GetVehiclePedIsUsing(PlayerPedId())
        if GetEntityModel(car) == GetHashKey(required) then
          SetTextComponentFormat("STRING")
          AddTextComponentString("Press ~INPUT_PICKUP~ to scrap this vehicle")
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
			if exports["fsn_cargarage"]:fsn_IsVehicleOwner(car) then
				TriggerEvent('chatMessage', '', {255,255,255}, '^5^*DARK WEB |^0^r You want to scrap your own car? Fuck off on that traceable shit.')
			else 
				TaskLeaveVehicle(PlayerPedId(), car, 1)
				SetVehicleDoorsLockedForAllPlayers(car, true)
				SetVehicleEngineHealth(car, -4000)
				SetVehicleEngineOn(car, false, true, false)

				SetVehicleDoorOpen(car, 7, false, false)
				Wait(500)
				SetVehicleDoorOpen(car, 6, false, false)
				SetVehicleTyreBurst(car, 0, true, 1000)
				Wait(500)
				SetVehicleDoorOpen(car, 5, false, false)
				SetVehicleTyreBurst(car, 1, true, 1000)
				Wait(500)
				SetVehicleDoorOpen(car, 4, false, false)
				SetVehicleTyreBurst(car, 2, true, 1000)
				Wait(500)
				SetVehicleDoorOpen(car, 3, false, false)
				SetVehicleTyreBurst(car, 3, true, 1000)
				Wait(500)
				SetVehicleDoorOpen(car, 2, false, false)
				SetVehicleTyreBurst(car, 4, true, 1000)
				Wait(500)
				SetVehicleDoorOpen(car, 1, false, false)
				SetVehicleTyreBurst(car, 5, true, 1000)
				Wait(500)
				SetVehicleDoorOpen(car, 0, false, false)
				Wait(500)

				SetVehicleDoorBroken(car, 7, true)
				Wait(500)
				SetVehicleDoorBroken(car, 6, true)
				Wait(500)
				SetVehicleDoorBroken(car, 5, true)
				Wait(500)
				SetVehicleDoorBroken(car, 4, true)
				Wait(500)
				SetVehicleDoorBroken(car, 3, true)
				Wait(500)
				SetVehicleDoorBroken(car, 2, true)
				Wait(500)
				SetVehicleDoorBroken(car, 1, true)
				Wait(500)
				SetVehicleDoorBroken(car, 0, true)
				Wait(500)
				SetEntityAsMissionEntity( car, true, true )
				Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( car ) )

				required = false
				lastjob = 0
				TriggerEvent('fsn_inventory:item:add', 'dirty_money', math.random(5000,12000))
				
				if math.random(1,100) < 50 then
					TriggerEvent('fsn_inventory:items:add', {
						index = 'steel',
						name = 'Steel',
						amt = math.random(1,2),
						data = {
							weight = 2.0
						},
					})
				end
			end
          end
        else
          SetTextComponentFormat("STRING")
          AddTextComponentString("~r~This isn't the right vehicle..")
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        end
      end
    end
    if GetDistanceBetweenCoords(laptop.x, laptop.y, laptop.z, GetEntityCoords(PlayerPedId()), true) < 10 then
      DrawMarker(1,laptop.x, laptop.y, laptop.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
      if GetDistanceBetweenCoords(laptop.x, laptop.y, laptop.z, GetEntityCoords(PlayerPedId()), true) < 1 then
        if required == false then
          SetTextComponentFormat("STRING")
          AddTextComponentString("Press ~INPUT_PICKUP~ to request a job.")
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
            required = cars[math.random(1, #cars)]
            lastjob = GetNetworkTime()
            TriggerEvent('chatMessage', '', {255,255,255}, '^5^*DARK WEB |^0^r We need you to find us a '..GetDisplayNameFromVehicleModel(required))
          end
        else
          if lastjob + 20 > GetNetworkTime() then
            SetTextComponentFormat("STRING")
            AddTextComponentString("Press ~INPUT_PICKUP~ to request a new job.")
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0,38) then
              local vehs = exports["fsn_entfinder"]:getVehicles(false)
			  local veh = vehs[math.random(1,#vehs)]
			  required = GetEntityModel(veh)
              lastjob = GetNetworkTime()
              TriggerEvent('chatMessage', '', {255,255,255}, '^5^*DARK WEB |^0^r We need you to find us a '..GetDisplayNameFromVehicleModel(required))
            end
          else
            SetTextComponentFormat("STRING")
            AddTextComponentString("~r~You can't get a new job yet!")
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            SetNotificationTextEntry("STRING");
            AddTextComponentString('~r~You are looking for: ~w~'..required);
            SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "~b~DARK WEB", "");
            DrawNotification(false, true);
          end
        end
      end
    end
  end
end)
