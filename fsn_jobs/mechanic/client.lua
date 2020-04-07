local clockloc = {x = 548.83673095703, y = -188.42317199707, z = 54.481338500977}
local carloc = {
  inside = {x = 545.96234130859, y = -176.90148925781, z = 54.43835067749, h = 91.259986877441},
  out = {x = 532.19537353516, y = -177.41616821289, z = 54.462707519531}
}
local carinfo = {
  inspected = false,
  inspect = {x = 542.20849609375, y = -176.93003845215, z = 54.503692626953},
  repair = {
    [1] = {x = 545.9482421875, y = -175.42169189453, z = 54.481334686279, h = 176.73480224609},
    [2] = {x = 548.60986328125, y = -176.71714782715, z = 54.481338500977, h = 85.204887390137},
    [3] = {x = 546.12677001953, y = -178.63162231445, z = 54.481338500977, h = 356.86795043945}
  }
}
local ismech = false
local carinloc = false
local repspot = -1

RegisterNetEvent('fsn_jobs:mechanic:toggleduty')
AddEventHandler('fsn_jobs:mechanic:toggleduty', function()
  if ismech then
    ismech = false
    TriggerEvent('fsn_notify:displayNotification', 'You are no longer a mechanic.', 'centerLeft', 4000, 'error')
    fsn_SetJob('Unemployed')
  else
    ismech = true
    TriggerEvent('fsn_notify:displayNotification', 'You have signed on duty! Await customers.', 'centerLeft', 4000, 'success')
     fsn_SetJob('Mechanic')
  end
end)

function InspectVehicle()
  if carinloc then
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^3HEALTH |^r^0 Engine: '..math.floor(GetVehicleEngineHealth(carinloc))..'/1000')
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^3HEALTH |^r^0 Body: '..math.floor(GetVehicleBodyHealth(carinloc))..'/1000')
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^3HEALTH |^r^0 Tank: '..math.floor(GetVehiclePetrolTankHealth(carinloc))..'/1000')
    carinfo.inspected = true
    repspot = 1
  else
    TriggerEvent('fsn_notify:displayNotification', 'No vehicle detected!<br>Try readding the car into the garage', 'centerLeft', 3000, 'error')
  end
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if ismech then
      if carinloc then
        if not carinfo.inspected then
          DrawMarker(1,carinfo.inspect.x, carinfo.inspect.y, carinfo.inspect.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
          if GetDistanceBetweenCoords(carinfo.inspect.x, carinfo.inspect.y, carinfo.inspect.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
            SetTextComponentFormat("STRING")
            AddTextComponentString("Press ~INPUT_PICKUP~ to inspect the vehicle")
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0, 51) then
              SetVehicleDoorOpen(carinloc, 4, false, false)
              TriggerEvent('fsn_notify:displayNotification', 'Inspecting...', 'centerLeft', 5000, 'info')
              Citizen.Wait(5000)
              InspectVehicle()
            end
          end
        else
          if repspot > 0 then
            local reep = carinfo.repair[repspot]
            DrawMarker(1,reep.x, reep.y, reep.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
          end
        end
      end
      if GetDistanceBetweenCoords(carloc.out.x, carloc.out.y, carloc.out.z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
        DrawMarker(1,carloc.out.x, carloc.out.y, carloc.out.z-1,0,0,0,0,0,0,4.001,4.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(carloc.out.x, carloc.out.y, carloc.out.z, GetEntityCoords(GetPlayerPed(-1)), true) < 5 then
          if IsPedInAnyVehicle(GetPlayerPed(-1)) then
            SetTextComponentFormat("STRING")
            AddTextComponentString("Press ~INPUT_VEH_HEADLIGHT~ to put the car in the garage")
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0, 74) then
              carinloc = GetVehiclePedIsUsing(GetPlayerPed(-1))
              if carinloc then
                TaskLeaveVehicle(GetPlayerPed(-1), carinloc, 16)
                SetVehicleDoorsShut(carinloc, false)
                Citizen.Wait(850)
                SetEntityCollision(carinloc, false, false)
                SetEntityHeading(carinloc, carloc.inside.h)
                SetEntityCoords(carinloc, carloc.inside.x, carloc.inside.y, carloc.inside.z, false, false, false, false)
                FreezeEntityPosition(carinloc, true)
              else
                TriggerEvent('fsn_notify:displayNotification', 'No vehicle detected!', 'centerLeft', 3000, 'error')
              end
            end
          else
            if carinloc then
              SetTextComponentFormat("STRING")
              AddTextComponentString("Press ~INPUT_PICKUP~ to retrieve the vehicle")
              DisplayHelpTextFromStringLabel(0, 0, 1, -1)
              if IsControlJustPressed(0, 51) then
                SetVehicleDoorsShut(carinloc, false)
                SetEntityCoords(carinloc, carloc.out.x, carloc.out.y, carloc.out.z, false, false, false, false)
                SetEntityCollision(carinloc, true, true)
                FreezeEntityPosition(carinloc, false)
                carinfo.inspected = false
                carinloc = false
              end
            end
          end
        end
      end
    end
    if GetDistanceBetweenCoords(clockloc.x, clockloc.y, clockloc.z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
      DrawMarker(1,clockloc.x, clockloc.y, clockloc.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
      if GetDistanceBetweenCoords(clockloc.x, clockloc.y, clockloc.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
        if ismech then
          SetTextComponentFormat("STRING")
          AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~quit")
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0, 51) then
            TriggerServerEvent('fsn_jobs:mechanic:toggle')
          end
        else
          SetTextComponentFormat("STRING")
          AddTextComponentString("Press ~INPUT_PICKUP~ to become a ~g~mechanic")
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0, 51) then
            TriggerServerEvent('fsn_jobs:mechanic:toggle')
          end
        end
      end
    end
  end
end)


-- Volagn Mechanic Decor inspect/repair. Commented out for now.
--[[  vehicleDecors = {
    ["Fuel Level"] = {damage = 'fuelLevel', name ="FuelLevel"},
    ["Electronics"] = {damage = 'vehDMG:electronics', name ="Electronics"},
    ["Clutch"] = {damage = 'vehDMG:clutch', name ="Clutch"},
    ["Gearbox"] = {damage = 'vehDMG:gearbox', name ="Gearbox"},
    ["Brakes"] = {damage = 'vehDMG:brakes', name ="Brakes"},
    ["Transmission"] = {damage = 'vehDMG:transmission', name ="Transmission"},
    ["Axle"] = {damage = 'vehDMG:axle', name ="Axle"},
    ["Fuel Injectors"] = {damage = 'vehDMG:fuel_injectors', name ="FuelInjectors"},
    ["Fuel Tank"] = {damage = 'vehDMG:fuel_tank', name ="FuelTank"},
    ["Tire Depth"] = {damage = 'vehDMG:tyre_depth', name ="TireDepth"}
  }


 
 -- Inspection and Repair for Mechanics Chat Commands \\ Debug
RegisterCommand('vehinspect', function(source, args)
  if ismech == true then
   if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
      local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
      for item_name in pairs(vehicleDecors) do
      local decorInt = DecorGetInt(GetVehiclePedIsIn(GetPlayerPed(-1), false), vehicleDecors[item_name].damage)
      TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, item_name..' is '..decorInt.."%")
      end
    end
  end
end, false)
 
RegisterCommand('vehrepair', function(source, args)
  if ismech == true then
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local decorArgs = args[1]
    for item_name in pairs(vehicleDecors) do
  if args[1] == vehicleDecors[item_name].name then decorArgs = vehicleDecors[item_name].damage
     mechanicRepair(decorArgs)
    end
  end
  end
end, false)

function mechanicRepair(part)
  local playerPed = GetPlayerPed(-1)
  local playerPos = GetEntityCoords(playerPed, 1)
  local coordA = GetEntityCoords(GetPlayerPed(-1), 1)
  local coordB = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 1.0, 0.0)
  local vehiclePos = getVehicleInDirection(coordA, coordB)
    if vehiclePos ~= nil then
      if DoesEntityExist(vehiclePos) and IsEntityAVehicle(vehiclePos) then
        if GetDistanceBetweenCoords(coordB, playerPos, 1) <= 4 then
  
          local currentValue = DecorGetInt(vehiclePos, part)
  
          if part == "vehDMG:electronics" and currentValue ~= 100 then
            print("Repairing Electronics")
            TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, "Taken 9 Electronics and 7 Plastic; blablablaa")
            -- Take items from inventory
          elseif part == "vehDMG:clutch" and currentValue ~= 100 then
            print("Repairing Clutch")
            TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, "Taken 6 Metal and 4 Plastic; blablablaa")
            -- Take items from inventory
          elseif part == "vehDMG:gearbox" and currentValue ~= 100 then
            print("Repairing Gearbox")
            TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, "Taken 6 Metal and 4 Plastic; blablablaa")
            -- Take items from inventory
          elseif part == "vehDMG:brakes" and currentValue ~= 100 then
            print("Repairing Brakes")
            TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, "Taken 6 Metal and 4 Plastic; blablablaa")
            -- Take items from inventory
          elseif part == "vehDMG:transmission" and currentValue ~= 100 then
            print("Repairing Transmission")
            TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, "Taken 6 Metal and 4 Plastic; blablablaa")
            -- Take items from inventory
          elseif part == "vehDMG:axle" and currentValue ~= 100 then
            print("Repairing Axle")
            TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, "Taken 6 Metal and 4 Plastic; blablablaa")
            -- Take items from inventory
          elseif part == "vehDMG:fuel_injectors" and currentValue ~= 100 then
            print("Repairing Fuel Injectors")
            TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, "Taken 6 Metal and 4 Plastic; blablablaa")
            -- Take items from inventory
          elseif part == "vehDMG:fuel_tank" and currentValue ~= 100 then
            print("Repairing Fuel Tank")
            TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, "Taken 6 Metal and 4 Plastic; blablablaa")
            -- Take items from inventory
          elseif part == "vehDMG:tyre_depth" and currentValue ~= 100 then
            print("Repairing 'Tyre Depth'")
            TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, "Taken 6 Metal and 4 Plastic; blablablaa")
            -- Take items from inventory
          end
    if currentValue >= 100 then  -- if DecorInt is 100 or greater do nothing. Sets Int to 100 just incase of exploit.
      TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, part.." is/are already fully repaired.")
      DecorSetInt(vehiclePos, part, 100)
      -- No progress bar
    elseif currentValue >= 88 then  -- else if DecorInt is 88 or higher automatically repair to 100%.
      TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, part.." repaired from "..currentValue.."% to 100%")
      DecorSetInt(vehiclePos, part, 100)
      -- Add progress bar
    else -- else add +12 int to the current value of the part.
    DecorSetInt(vehiclePos, part, currentValue + 12)
    TriggerEvent('chatMessage', '^1DEBUG', {255, 255, 255}, "Repairing "..part) -- DEBUG \\ Remove me later
    -- Add progress bar
          end
        end
      end
    end
  end
  
  function getVehicleInDirection(coordFrom, coordTo)
      local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
      local _, _, _, _, vehicle = GetRaycastResult(rayHandle)
      return vehicle
  end --]]