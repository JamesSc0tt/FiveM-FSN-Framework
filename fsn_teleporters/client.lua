local spots = {
  ["Bahama Mamas"] = {
    enter = {x = -1388.6383056641, y = -586.48455810547, z = 30.218963623047},
    exit = {x = -1387.5959472656, y = -588.03881835938, z = 30.319515228271},
    locked = false
  },
  ["The Morgue"] = {
    enter = {x = 240.86027526855, y = -1379.3193359375, z = 33.741725921631},
    exit = {x = 274.08386230469, y = -1360.3371582031, z = 24.5378074646},
    locked = false
  },
  ["Hospital Offices"] = {
    enter = {x = 340.39904785156, y = -592.73004150391, z = 43.281723022461},
    exit = {x = 254.40155029297, y = -1372.5345458984, z = 29.648010253906},
    locked = false
  },
  ["ICU"] = {
    enter = {x = 333.99166870117, y = -569.83361816406, z = 43.317420959473},
    exit = {x = 276.59255981445, y = -1334.7238769531, z = 24.537803649902},
    locked = false
  },
  ["The Thinking Box"] = {
    enter = {x = -1062.8592529297, y = -240.67185974121, z = 44.021133422852},
    exit = {x = -1063.5947265625, y = -239.77041625977, z = 44.021133422852},
    locked = false
  },
  ["Meeting Room"] = {
    enter = {x = -1048.2038574219, y = -238.30305480957, z = 44.021053314209},
    exit = {x = -1047.1921386719, y = -237.75674438477, z = 44.021053314209},
    locked = false
  },
  ["Courthouse"] = {
    enter = {x = 269.19464111328, y = -432.84234619141, z = 45.324928283691},
    exit = {x = 224.7947845459, y = -419.65487670898, z = -118.19955444336},
    locked = false
  },
  ["Courtroom"] = {
    enter = {x = 235.94152832031, y = -413.40606689453, z = -118.16347503662},
    exit = {x = 238.66616821289, y = -334.35528564453, z = -118.77346801758},
    locked = true
  },
  ["Court Bench"] = {
    enter = {x = -1006.8142700195, y = -481.06991577148, z = 50.027072906494},
    exit = {x = 241.27047729492, y = -304.19039916992, z = -118.79995727539},
    locked = false
  },
  ["Judges Office"] = {
    enter = {x = 242.90141296387, y = -416.60583496094, z = -118.1996307373},
    exit = {x = -1002.9207763672, y = -477.94250488281, z = 50.027153015137},
    locked = false
  },
  ["Pillbox Roof"] = {
    enter = {x = 246.681, y = -1372.209, z = 24.537},
    exit = {x = 338.826, y = -583.955, z = 74.165},
    locked = false
  },
  ["Comedy Club"] = {
    enter = {x = -430.142, y = 261.665, z = 83.005},
    exit = {x = -458.790, y = 284.750, z = 78.521},
    locked = false
  }
}

local savingWeapons = {
  "WEAPON_KNIFE",
  "WEAPON_NIGHTSTICK",
  "WEAPON_HAMMER",
  "WEAPON_BAT",
  "WEAPON_GOLFCLUB",
  "WEAPON_CROWBAR",
  "WEAPON_PISTOL",
  "WEAPON_COMBATPISTOL",
  "WEAPON_APPISTOL",
  "WEAPON_PISTOL50",
  "WEAPON_MICROSMG",
  "WEAPON_SMG",
  "WEAPON_ASSAULTSMG",
  "WEAPON_ASSAULTRIFLE",
  "WEAPON_CARBINERIFLE",
  "WEAPON_ADVANCEDRIFLE",
  "WEAPON_MG",
  "WEAPON_COMBATMG",
  "WEAPON_PUMPSHOTGUN",
  "WEAPON_SAWNOFFSHOTGUN",
  "WEAPON_ASSAULTSHOTGUN",
  "WEAPON_BULLPUPSHOTGUN",
  "WEAPON_STUNGUN",
  "WEAPON_SNIPERRIFLE",
  "WEAPON_SMOKEGRENADE",
  "WEAPON_BZGAS",
  "WEAPON_MOLOTOV",
  "WEAPON_FIREEXTINGUISHER",
  "WEAPON_PETROLCAN",
  "WEAPON_SNSPISTOL",
  "WEAPON_SPECIALCARBINE",
  "WEAPON_HEAVYPISTOL",
  "WEAPON_BULLPUPRIFLE",
  "WEAPON_HOMINGLAUNCHER",
  "WEAPON_PROXMINE",
  "WEAPON_SNOWBALL",
  "WEAPON_VINTAGEPISTOL",
  "WEAPON_DAGGER",
  "WEAPON_FIREWORK",
  "WEAPON_MUSKET",
  "WEAPON_MARKSMANRIFLE",
  "WEAPON_HEAVYSHOTGUN",
  "WEAPON_GUSENBERG",
  "WEAPON_HATCHET",
  "WEAPON_COMBATPDW",
  "WEAPON_KNUCKLE",
  "WEAPON_MARKSMANPISTOL",
  "WEAPON_BOTTLE",
  "WEAPON_FLAREGUN",
  "WEAPON_FLARE",
  "WEAPON_REVOLVER",
  "WEAPON_SWITCHBLADE",
  "WEAPON_MACHETE",
  "WEAPON_FLASHLIGHT",
  "WEAPON_MACHINEPISTOL",
  "WEAPON_DBSHOTGUN",
  "WEAPON_COMPACTRIFLE",
  "GADGET_PARACHUTE"
}

function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.3, 0.3)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 140)
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

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for k, v in pairs(spots) do
      if GetDistanceBetweenCoords(v.enter.x, v.enter.y, v.enter.z, GetEntityCoords(PlayerPedId()), true) < 10 then
        DrawMarker(25,v.enter.x, v.enter.y, v.enter.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 255, 255, 255, 140, 0, 0, 2, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(v.enter.x, v.enter.y, v.enter.z, GetEntityCoords(PlayerPedId()), true) < 1 then
          if v.locked then
            fsn_drawText3D(v.enter.x, v.enter.y, v.enter.z, "~r~"..k.." is locked!")
          else
            if IsControlJustPressed(0, 51) then
			  local canenter = true
			  if not exports["fsn_police"]:fsn_PDDuty() then
				  if k == 'Courtroom' then
					for k, v in pairs(savingWeapons) do
						if HasPedGotWeapon(PlayerPedId(), GetHashKey(v)) and canenter then
							TriggerEvent('fsn_notify:displayNotification', 'No weapons in the courtroom.', 'centerLeft', 4000, 'error')
							canenter = false
						end
					end
				  end
			  end
			  if canenter then
				  DoScreenFadeOut(1000)
				  Citizen.Wait(1500)
				  SetEntityCoords(PlayerPedId(), v.exit.x, v.exit.y, v.exit.z)
				  Citizen.Wait(1500)
				  DoScreenFadeIn(2000)
			  end
            end
          end
        end
      end
      if GetDistanceBetweenCoords(v.exit.x, v.exit.y, v.exit.z, GetEntityCoords(PlayerPedId()), true) < 10 then
        DrawMarker(25,v.exit.x, v.exit.y, v.exit.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 255, 255, 255, 140, 0, 0, 2, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(v.exit.x, v.exit.y, v.exit.z, GetEntityCoords(PlayerPedId()), true) < 1 then
          fsn_drawText3D(v.exit.x, v.exit.y, v.exit.z, "Press [E] to exit "..k)
          if IsControlJustPressed(0, 51) then
            DoScreenFadeOut(1000)
            Citizen.Wait(1500)
            SetEntityCoords(PlayerPedId(), v.enter.x, v.enter.y, v.enter.z)
            Citizen.Wait(1500)
            DoScreenFadeIn(2000)
          end
        end
      end
    end
  end
end)

RegisterNetEvent('fsn_doj:judge:toggleLock')
AddEventHandler('fsn_doj:judge:toggleLock', function(tf)
	spots["Courtroom"].locked = tf
end)

--SetEntityCoords(PlayerPedId(), -458.790, 284.750, 78.521)

RegisterNetEvent('fsn_teleporters:teleport:waypoint')
AddEventHandler('fsn_teleporters:teleport:waypoint', function(source)
  local playerPed = PlayerPedId()
  local WaypointHandle = GetFirstBlipInfoId(8)

  if DoesBlipExist(WaypointHandle) then
      local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

      for height = 1, 1000 do
          SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

          local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

          if foundGround then
              SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

              break
          end

          Citizen.Wait(5)
      end
    else 
    end
end)


RegisterNetEvent('fsn_teleporters:teleport:coordinates')
AddEventHandler('fsn_teleporters:teleport:coordinates', function(x, y, z)
  local playerPed = PlayerPedId()


  -- lua doesnt know floats from tonumbers apperantly so make that number a float otherwise it will crash when trying to tp
  local coordx = x + .00
  local coordy = y + .00
  local coordz = z + .00


    print( 'What you entered:', x,y,z, 'What you tped to:', coordx,coordy,coordz)

    SetPedCoordsKeepVehicle(playerPed, coordx, coordy, coordz)
  
  

  Citizen.Wait(5)

end)