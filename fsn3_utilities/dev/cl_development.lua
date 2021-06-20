local dev_mode = false

local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end

    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)

    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next

    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

function EnumerateObjects()
  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

function drawtextinloc(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.3, 0.3)
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

function toggle_dev()
	dev_mode = not dev_mode
	if dev_mode then
		Citizen.CreateThread(function()
			while dev_mode do
				Citizen.Wait(0)
				for obj in EnumerateObjects() do
					if GetDistanceBetweenCoords(GetEntityCoords(obj), GetEntityCoords(GetPlayerPed(-1))) < 10 then
						drawtextinloc(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, 'Model: ~g~'..GetEntityModel(obj)..'\n~w~X: ~b~'..GetEntityCoords(obj).x..'\n ~w~Y: ~b~'..GetEntityCoords(obj).y..'\n ~w~Z: ~b~'..GetEntityCoords(obj).z)
					end
				end
				for obj in EnumerateVehicles() do
					if GetDistanceBetweenCoords(GetEntityCoords(obj), GetEntityCoords(GetPlayerPed(-1))) < 30 then
						drawtextinloc(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, 'Model: ~g~'..GetEntityModel(obj)..'\n~w~X: ~b~'..GetEntityCoords(obj).x..'\n ~w~Y: ~b~'..GetEntityCoords(obj).y..'\n ~w~Z: ~b~'..GetEntityCoords(obj).z)
					end
				end
				for obj in EnumeratePeds() do
					if GetDistanceBetweenCoords(GetEntityCoords(obj), GetEntityCoords(GetPlayerPed(-1))) < 30 then
						drawtextinloc(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, 'Model: ~g~'..GetEntityModel(obj)..'\n~w~X: ~b~'..GetEntityCoords(obj).x..'\n ~w~Y: ~b~'..GetEntityCoords(obj).y..'\n ~w~Z: ~b~'..GetEntityCoords(obj).z)
					end
				end
			end
		end)
	end
end
RegisterCommand("dev", function()
	toggle_dev()
end, false)