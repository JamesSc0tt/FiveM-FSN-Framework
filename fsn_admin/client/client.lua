--  -------------------
--  BEGIN:       Locals
--  -------------------

local frozen = false

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

RegisterNetEvent('fsn_admin:spawnVehicle')
AddEventHandler('fsn_admin:spawnVehicle', function(vehmodel)

    local playerPed     = PlayerPedId()
    local playerCoords  = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    local model         = vehmodel
    local devPlate      = ' Admin '
    local vehicle       = SpawnVehicle(model, playerCoords, playerHeading, devPlate)

    SetVehicleOnGroundProperly(vehicle)

    --exports['LegacyFuel']:SetFuel(vehicle, 100)

    SetVehicleNumberPlateTextIndex(vehicle, 4)
    SetPedIntoVehicle(playerPed, vehicle, -1)

    TriggerEvent('fsn_cargarage:makeMine', vehicle, GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)), GetVehicleNumberPlateText(vehicle))

    TriggerEvent('fsn_notify:displayNotification', 'You now own this vehicle!', 'centerLeft', 4000, 'success')
    TriggerEvent('fsn_notify:displayNotification', 'You spawned '..model, 'centerLeft', 2000, 'info')

end)

RegisterNetEvent('fsn_admin:requestXYZ')
AddEventHandler('fsn_admin:requestXYZ', function(sendto)

  local coords = {x=GetEntityCoords(PlayerPedId()).x, y=GetEntityCoords(PlayerPedId()).y, z=GetEntityCoords(PlayerPedId()).z}
  TriggerServerEvent('fsn_admin:sendXYZ', sendto, coords)

end)

RegisterNetEvent('fsn_admin:recieveXYZ')
AddEventHandler('fsn_admin:recieveXYZ', function(xyz)

  SetEntityCoords(PlayerPedId(), xyz.x, xyz.y, xyz.z, 1, 0, 0, 1)

end)

RegisterNetEvent('fsn_admin:FreezeMe')
AddEventHandler('fsn_admin:FreezeMe', function(adminName)

  if frozen then
    TriggerEvent('chat:addMessage', {
      template = '^1^*:fsn_admin:^r^0 You have been unfrozen by admin: '..adminName,
      args = {}
    })
    frozen = false
  else
    TriggerEvent('chat:addMessage', {
      template = '^1^*:fsn_admin:^r^0 You have been frozen by admin: '..adminName,
      args = {}
    })
    frozen = true
  end
  
end)

--  -------------------
--  END:         Events
--  -------------------

