--  -------------------
--  BEGIN:       Locals
--  -------------------

--  -------------------
--  END:         Locals
--  -------------------

--  -------------------
--  BEGIN:      Threads
--  -------------------

--  -------------------
--  END:        Threads
--  -------------------

--  -------------------
--  BEGIN:    Functions
--  -------------------

local function SpawnVehicle(name, coordinates, heading, licensePlate)
    RequestModel(name)

    while not HasModelLoaded(name) do
        Wait(100)
    end

    local vehicle = CreateVehicle(name, coordinates, heading, true, true)

    SetEntityAsMissionEntity(vehicle, true, true)

    if licensePlate then
        SetVehicleNumberPlateText(vehicle, licensePlate)
    end

    SetModelAsNoLongerNeeded(name)

    return vehicle

end

local function getVehicleInDirection(coordFrom, coordTo)

    local playerPed = PlayerPedId()

    local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, playerPed, 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
    return vehicle
    
end

local function lookingAt()

    local targetVehicle = false
    local playerPed = PlayerPedId()

	local coordA = GetEntityCoords(playerPed, 1)
	local coordB = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 20.0, -1.0)
	targetVehicle = getVehicleInDirection(coordA, coordB)

    return targetVehicle
    
end

--  -------------------
--  END:      Functions
--  -------------------

--  -------------------
--  BEGIN:      Exports
--  -------------------

--  -------------------
--  END:        Exports
--  -------------------

--  -------------------
--  BEGIN:       Events
--  -------------------

RegisterNetEvent('fsn_developer:deleteVehicle')
AddEventHandler('fsn_developer:deleteVehicle', function()

    local playerPed = PlayerPedId()

    if IsPedInAnyVehicle(playerPed, false) then

        local vehicle = GetVehiclePedIsIn(playerPed)

        SetEntityAsMissionEntity( vehicle, true, true)
        DeleteVehicle(vehicle)

    else

        local vehicle = lookingAt()

        SetEntityAsMissionEntity(vehicle, true, true)
        DeleteVehicle(vehicle)

    end

end)

RegisterNetEvent('fsn_developer:spawnVehicle')
AddEventHandler('fsn_developer:spawnVehicle', function(vehmodel)

    local playerPed     = PlayerPedId()
    local playerCoords  = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    local model         = vehmodel
    local devPlate      = ' DevCar '
    local vehicle       = SpawnVehicle(model, playerCoords, playerHeading, devPlate)

    SetVehicleOnGroundProperly(vehicle)

    --exports['LegacyFuel']:SetFuel(vehicle, 100)

    SetVehicleNumberPlateTextIndex(vehicle, 4)
    SetPedIntoVehicle(playerPed, vehicle, -1)

    TriggerEvent('fsn_cargarage:makeMine', vehicle, GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)), GetVehicleNumberPlateText(vehicle))

    TriggerEvent('fsn_notify:displayNotification', 'You now own this vehicle!', 'centerLeft', 4000, 'success')
    TriggerEvent('fsn_notify:displayNotification', 'You spawned '..model, 'centerLeft', 2000, 'info')

end)

RegisterNetEvent('fsn_developer:fixVehicle')
AddEventHandler('fsn_developer:fixVehicle', function()

    local playerPed     = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)

    if vehicle ~= 0 then

        TriggerEvent('fsn_fuel:update', vehicle, 100)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
        SetVehicleDirtLevel(vehicle, 0)
        
    end


end)

RegisterNetEvent('fsn_developer:getKeys')
AddEventHandler('fsn_developer:getKeys', function()

    local playerPed     = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)

    if vehicle ~= 0 then

		TriggerEvent('fsn_cargarage:makeMine', vehicle, GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)), GetVehicleNumberPlateText(vehicle))
		TriggerEvent('fsn_notify:displayNotification', 'You now own this vehicle!', 'centerLeft', 4000, 'success')
        
    end


end)

RegisterNetEvent('fsn_developer:sendXYZ')
AddEventHandler('fsn_developer:sendXYZ', function()

    local playerPed = PlayerPedId()
    local x, y, z   = table.unpack(GetEntityCoords(playerPed, true))
    local h         = GetEntityHeading(playerPed)

    TriggerServerEvent('fsn_developer:printXYZ', x, y, z, h)

end)

--  -------------------
--  END:         Events
--  -------------------

