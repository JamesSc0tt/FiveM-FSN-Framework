local vehicles = {}
fuel_amount = 100

RegisterNetEvent('fsn_fuel:set')
AddEventHandler('fsn_fuel:set', function(car, fuelamount)
  if table.contains(vehicles, car) then
    for k, v in pairs(vehicles) do
      if v[1] == car then
        v[2] = fuelamount
      end
    end
  else
	table.insert(vehicles, {car, fuelamount})
  end
end)


RegisterNetEvent('fsn_fuel:update')
AddEventHandler('fsn_fuel:update', function(car, fuelamount)
  if table.contains(vehicles, car) then
    for k, v in pairs(vehicles) do
      if v[1] == car then
        v[2] = fuelamount
        fuel_amount = fuel_amount
      end
    end
  else
    table.insert(vehicles, {car, fuelamount})
    if IsPedInAnyVehicle(PlayerPedId()) then
      if GetVehiclePedIsIn(PlayerPedId()) == car then
        fuel_amount = fuelamount
      end
    end
  end
end)

local notified = false
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(4000)
    local consumption = 0.02
    local speed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * 2.236936
    if IsPedInAnyVehicle(PlayerPedId()) then
      if IsVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), false)) and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId() then
        if speed <= 2 then
          consumption = 0.01
        elseif speed < 30 then
          consumption = 0.02
        elseif speed < 50 then
          consumption = 0.03
        elseif speed < 80  then
          consumption = 0.7
        elseif speed > 120 then
          consumption = 0.4
        end
        if table.contains(vehicles, GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()))) then
          for _, car in pairs(vehicles) do
            if car[1] == GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())) then
              if fuel_amount - consumption <= 0 then
                fuel_amount = 0
              else
                fuel_amount = fuel_amount - consumption
              end
              vehicles[_][2] = fuel_amount
              TriggerServerEvent('fsn_fuel:update', GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())), fuel_amount)
            end
          end
          if fuel_amount < 20 then
            if not notified then
              TriggerEvent('fsn_notify:displayNotification', 'You are running out of fuel!!', 'centerRight', 3000, 'error')
              notified = true
              PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
              Citizen.Wait(100)
              PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
              Citizen.Wait(100)
              PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
            end
          end
          if fuel_amount == 0 then
            SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()), false, true, false)
          elseif fuel_amount < 5 then
            SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()), false, true, false)
            Citizen.Wait(500)
            SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()), true, true, false)
          end
        else
          fuel_amount = math.random(30, 100)
          table.insert(vehicles, {GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())), fuel_amount})
        end
      end
    else
      notified = false
    end
  end
end)

local fuel_stations = {
  {49.41872, 2778.793, 58.04395},
  {263.8949, 2606.463, 44.98339},
  {1039.958, 2671.134, 39.55091},
  {1207.26, 2660.175, 37.89996},
  {2539.685, 2594.192, 37.94488},
  {2679.858, 3263.946, 55.24057},
  {2005.055, 3773.887, 32.40393},
  {1687.156, 4929.392, 42.07809},
  {1701.314, 6416.028, 32.76395},
  {179.8573, 6602.839, 31.86817},
  {-94.46199, 6419.594, 31.48952},
  {-2554.996, 2334.402, 33.07803},
  {-1800.375, 803.6619, 138.6512},
  {-1437.622, -276.7476, 46.20771},
  {-2096.243, -320.2867, 13.16857},
  {-724.6192, -935.1631, 19.21386},
  {-526.0198, -1211.003, 18.18483},
  {-70.21484, -1761.792, 29.53402},
  {265.6484, -1261.309, 29.29294},
  {819.6538, -1028.846, 26.40342},
  {1208.951, -1402.567, 35.22419},
  {1181.381, -330.8471, 69.31651},
  {620.8434, 269.1009, 103.0895},
  {2581.321, 362.0393, 108.4688},
  {1785.894, 3330.969, 41.37560},
  {174.62915039063, -1562.1729736328, 29.263854980469}
}

local price = 0
Citizen.CreateThread(function()
  for k, v in pairs(fuel_stations) do
    local blip = AddBlipForCoord(v[1], v[2], v[3])
    SetBlipSprite(blip, 361)
    SetBlipColour(blip, 4)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Fuel Station")
    EndTextCommandSetBlipName(blip)
  end
  while true do
    Citizen.Wait(0)
    for _, fstn in pairs(fuel_stations) do
      if GetDistanceBetweenCoords(fstn[1], fstn[2], fstn[3], GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z) < 10 then
        if not IsPedInAnyVehicle(PlayerPedId()) then
          local veh = fsn_lookingAt()
          if veh then
            local veh_index = 0
            for k, v in pairs(vehicles) do
              if v[1] == GetVehicleNumberPlateText(veh) then
                veh_index = k
              end
            end
            if veh_index ~= 0 then
              if IsVehicleEngineOn(veh) then
                SetTextComponentFormat("STRING")
              	AddTextComponentString("~r~Your engine must be OFF to refuel!")
              	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
              else
                SetTextComponentFormat("STRING")
              	AddTextComponentString("Hold ~INPUT_PICKUP~ to fuel your car ("..vehicles[veh_index][2].."/100)")
              	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
                if IsControlPressed(0, 38) then
                  if vehicles[veh_index][2]+0.2 < 100 then
                    vehicles[veh_index][2] = vehicles[veh_index][2]+0.2
                    fuel_amount = fuel_amount+0.2
                    price = price + 0.5
                  else
                    fuel_amount = 100
                    vehicles[veh_index][2] = 100
                  end
                end
              end
            end
          end
        else
          if price ~= 0 then
            if exports.fsn_police:fsn_PDDuty() or exports.fsn_ems:fsn_EMSDuty() then
              TriggerEvent('fsn_notify:displayNotification', 'State charged $'..price..' for fuel.', 'centerLeft', 2000, 'info')
              price = 0
            else
              TriggerEvent('fsn_bank:change:walletMinus', price)
              price = 0
            end
          end
        end
      end
    end
  end
end)
