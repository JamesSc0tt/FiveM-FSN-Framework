local guiEnabled = false
local rentalText = true
local returnText = false
local rentalMenuOpen = false

DecorRegister("bikeRental:rented", 3)

  local bikeRentalCoords = { -- Bike Rental Locations/Coords.
     {location="Occupation/Elgin Garage Booth", x=278.79272460938, y=-346.39349365234, z=44.91987991333},
     {location="Beach/Pier Bike Rental", x=-1223.59, y=-1496.72, z=4.36},
  }


Citizen.CreateThread(function()
        for _, v in pairs(bikeRentalCoords) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 226)
            SetBlipColour(v.blip, 4)
            SetBlipScale(v.blip, 0.6)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Bike Rental")
            EndTextCommandSetBlipName(v.blip)
        end
            while true do
                Citizen.Wait(0)
                for k, v in pairs(bikeRentalCoords) do
                    local playerPed = PlayerPedId()
                    local playerPos = GetEntityCoords(playerPed, 1)

            if GetDistanceBetweenCoords(v.x, v.y, v.z, playerPos, 1) <= 2 then
                if not IsPedInAnyVehicle(playerPed, false) then
                    if rentalText == true then
                        Util.DrawText3D(playerPos['x'], playerPos['y'], playerPos['z'] + 0.3, '~r~[E] ~w~Bike Rentals', {255, 255, 255, 255}, 0.25) -- Add this for Live Utils.
                    end
                    elseif IsPedInAnyVehicle(playerPed, false) and DecorGetInt(GetVehiclePedIsIn(PlayerPedId(), false), "bikeRental:rented") == 1 then
                        Util.DrawText3D(playerPos['x'], playerPos['y'], playerPos['z'] + 0.3, '~r~[E] ~w~Return Bike', {255, 255, 255, 255}, 0.25) -- Add this for Live Utils.
                        rentalText = false
                        returnText = true
                    else
                        Util.DrawText3D(playerPos['x'], playerPos['y'], playerPos['z'] + 0.3, '"Not on a Rented Bike', {255, 255, 255, 255}, 0.25) -- Add this for Live Utils.
                        rentalText = false
                        returnText = false
                end

                if IsControlJustPressed(1, 38) and rentalText == true then -- [E] Open
                    rentalText = false

                    EnableGui(true)
                    SetNuiFocus(true, true)
                end
            
                if IsControlJustPressed(1, 38) and returnText == true then -- [E] Open
                    deleteCar()
                    TriggerEvent('fsn_notify:displayNotification', 'Rented Bike Returned', 'centerLeft', 4000, 'success')
                end
            
                if guiEnabled == false then
                    rentalText = true
                end
            end
        end
    end
end)

      -- Vehicle Spawner START --
function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, x, y, z + 1, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1) -- Teleport into bike seat.
    DecorSetInt(vehicle, "bikeRental:rented", 1)
end
    -- Vehicle Spawner END --

    -- Vehicle Delete START --
function deleteCar()
    if DecorGetInt(GetVehiclePedIsIn(PlayerPedId(), false), "bikeRental:rented") == 1 then -- Check if vehicle is a Rented Bike.    
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        SetEntityAsMissionEntity(vehicle, true, true)
        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle))
        rentalText = true
        returnText = false
    else
        print("Not a rented bike.")
    end
end 
    -- Vehicle Delete END --

      -- NUI STUFF --

function EnableGui(enable)
    SetNuiFocus(enable)
    guiEnabled = enable
    
    SendNUIMessage({
        type = "enableui",
        enable = enable
    })
end

RegisterNUICallback('escape', function(data, cb)
    EnableGui(false)
    SetNuiFocus(false, false)
    rentalText = true
    cb('ok')
end)

RegisterNUICallback('rentBike', function(data, cb)
    if exports["fsn_main"]:fsn_GetWallet() >= tonumber(data.price) then
        TriggerEvent('fsn_bank:change:walletMinus', data.price)
        TriggerEvent('fsn_notify:displayNotification', 'Bike Rented!', 'centerLeft', 4000, 'success')
        spawnCar(data.model)
        rentalText = true
        EnableGui(false)
        SetNuiFocus(false, false)
        cb('ok')       
        -- print("Rented "..data.model.." for "..data.price) -- debug, remove if yah want.
        -- print("DEBUG: BIKE MODEL="..data.model.." PRICE=$"..data.price)
    else
        TriggerEvent('fsn_notify:displayNotification', 'Not enough money.', 'centerLeft', 4000, 'error')
    end
end)

Citizen.CreateThread(function()
    while true do
        if guiEnabled then
            DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
            DisableControlAction(0, 2, guiEnabled) -- LookUpDown
    
            DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate
    
            DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride
    
            if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
                 SendNUIMessage({
                    type = "click"
                })
            end
        end
        Citizen.Wait(0)
    end
end)