local policeDoors = {}
local propertyDoors = {}
local amipolice = true
function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.2, 0.2)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

RegisterNetEvent('fsn_doormanager:doorLocked')
AddEventHandler('fsn_doormanager:doorLocked', function(doorType, doorID)
  if doorType == 'police' then
    local door = policeDoors[doorID]
    door["locked"] = true
  end
end)

RegisterNetEvent('fsn_doormanager:doorUnlocked')
AddEventHandler('fsn_doormanager:doorUnlocked', function(doorType, doorID)
  if doorType == 'police' then
    local door = policeDoors[doorID]
    door["locked"] = false
  end
end)
RegisterNetEvent('fsn_doormanager:sendDoors')
AddEventHandler('fsn_doormanager:sendDoors', function(police, property)
  policeDoors = police
  propertyDoors = property
end)
----------------------------------------
AddEventHandler('fsn_police:init', function(policeLevel)
  if policeLevel > 0 then
    amipolice = true
  else
    amipolice = false
  end
  TriggerServerEvent('fsn_doormanager:requestDoors')
end)
TriggerServerEvent('fsn_doormanager:requestDoors')
----------------------------------------
function fsn_doorUnlockSound()
  Citizen.CreateThread(function()
    PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
  end)
end

function fsn_loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)
    for k, v in pairs(policeDoors) do
      local closestDoor = GetClosestObjectOfType(v.x, v.y, v.z, 1.0, v.objName, false, false, false)
      local doorCoords = GetEntityCoords(closestDoor)
      if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, v.x, v.y, v.z, true) < 10 then
        if v.locked then
          FreezeEntityPosition(closestDoor, true)
        else
          FreezeEntityPosition(closestDoor, false)
        end
      end
      if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, v.x, v.y, v.z, true) < 2 then
        if amipolice then
          if v.locked then
            fsn_drawText3D(v.txtX, v.txtY, v.txtZ, "[E] to ~g~unlock door")
            FreezeEntityPosition(closestDoor, true)
          else
            fsn_drawText3D(v.txtX, v.txtY, v.txtZ, "[E] to ~r~lock door")
            FreezeEntityPosition(closestDoor, false)
          end
          if IsControlJustPressed(1,51) then
			if v.locked then
              --TaskPlayAnim(PlayerPedId(), 'missheistfbisetup1', 'unlock_enter_janitor', 8.0, -1, false, false, false, false)
              fsn_loadAnimDict( "gestures@f@standing@casual" )
              TaskPlayAnim(PlayerPedId(), "gestures@f@standing@casual", "gesture_hand_down", 8.0, 1.0, 3, 2, 0, 0, 0, 0 )
              fsn_doorUnlockSound()
              TriggerServerEvent('fsn_doormanager:unlockDoor', 'police', k)
              FreezeEntityPosition(closestDoor, false)
            else
              fsn_loadAnimDict( "gestures@f@standing@casual" )
              TaskPlayAnim(PlayerPedId(), "gestures@f@standing@casual", "gesture_hand_down", 8.0, 1.0, 3, 2, 0, 0, 0, 0 )
              fsn_doorUnlockSound()
              TriggerServerEvent('fsn_doormanager:lockDoor', 'police', k)
              FreezeEntityPosition(closestDoor, true)
            end
					end
        else
          if v.locked then
            fsn_drawText3D(v.txtX, v.txtY, v.txtZ, "~r~LOCKED")
          else
            fsn_drawText3D(v.txtX, v.txtY, v.txtZ, "~g~UNLOCKED")
          end
        end
      end
    end
  end
end)
