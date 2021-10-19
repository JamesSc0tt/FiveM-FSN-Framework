--[[The MIT License (MIT)
Copyright (c) 2017 IllidanS4
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
]]

function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end

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
function fsn_drawText3D(x,y,z, text)
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

local dev_debug = false
RegisterNetEvent('fsn_dev:debug')
AddEventHandler('fsn_dev:debug', function()
  dev_debug = not dev_debug
end)
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if dev_debug then
      for obj in EnumerateObjects() do
        if GetDistanceBetweenCoords(GetEntityCoords(obj), GetEntityCoords(PlayerPedId())) < 10 then
          fsn_drawText3D(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, 'Model: ~g~'..GetEntityModel(obj)..'\n~w~X: ~b~'..GetEntityCoords(obj).x..'\n ~w~Y: ~b~'..GetEntityCoords(obj).y..'\n ~w~Z: ~b~'..GetEntityCoords(obj).z)
        end
      end
      for obj in EnumerateVehicles() do
        if GetDistanceBetweenCoords(GetEntityCoords(obj), GetEntityCoords(PlayerPedId())) < 30 then
          fsn_drawText3D(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, 'Model: ~g~'..GetEntityModel(obj)..'\n~w~X: ~b~'..GetEntityCoords(obj).x..'\n ~w~Y: ~b~'..GetEntityCoords(obj).y..'\n ~w~Z: ~b~'..GetEntityCoords(obj).z)
        end
      end
      for obj in EnumeratePeds() do
        if GetDistanceBetweenCoords(GetEntityCoords(obj), GetEntityCoords(PlayerPedId())) < 30 then
          fsn_drawText3D(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, 'Model: ~g~'..GetEntityModel(obj)..'\n~w~X: ~b~'..GetEntityCoords(obj).x..'\n ~w~Y: ~b~'..GetEntityCoords(obj).y..'\n ~w~Z: ~b~'..GetEntityCoords(obj).z)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------- developer stuffs ^ don't ask why it's here?
function GetNearbyPeds(X, Y, Z, Radius)
	local NearbyPeds = {}
	if tonumber(X) and tonumber(Y) and tonumber(Z) then
		if tonumber(Radius) then
			for Ped in EnumeratePeds() do
				if DoesEntityExist(Ped) then
					local PedPosition = GetEntityCoords(Ped, false)
					if Vdist(X, Y, Z, PedPosition.x, PedPosition.y, PedPosition.z) <= Radius then

            table.insert(NearbyPeds, Ped)
					end
				end
			end
		else
			print("GetNearbyPeds was given an invalid radius!")
		end
	else
		print("GetNearbyPeds was given invalid coordinates!")
	end
	return NearbyPeds
end
--------------------------------------------------------------------------------------------
inventory = {}
local maxspace = 30
local spacewithbag = 60
local init = true


function fsn_GetInventory()
	return inventory
end

function fsn_computeMaxSpace()
  if inventory["backpack"] then
    return spacewithbag
  else
    return maxspace
  end
end

function fsn_computeCurrentSpace()
  local num = 0
  for k, v in pairs(inventory) do
    local weight = items_table[k].weight * v.amount
    num = num + weight
  end
  return num
end

function fsn_CanCarry(item, amt)
	amt = math.floor(amt)
	local space = fsn_computeMaxSpace()
	local weight = items_table[item].weight * amt
	local new_weight = fsn_computeCurrentSpace() + weight
	if new_weight > space then
		print(new_weight..' > '..space)
		return false
	else
		print(new_weight..' < '..space)
		return true
	end
end

RegisterNetEvent('fsn_police:search:start:inventory')
AddEventHandler('fsn_police:search:start:inventory', function(officerid)
  local my_inv = {}
  for k, v in pairs(inventory) do
    local item = items_table[k].display_name
    table.insert(my_inv,#my_inv+1,{amount = v.amount,display_name = item})
  end
  print(officerid)
  TriggerServerEvent('fsn_police:search:end:inventory', my_inv, officerid)
end)

RegisterNetEvent('fsn_inventory:empty')
AddEventHandler('fsn_inventory:empty', function()
  inventory = {}
  TriggerServerEvent('fsn_inventory:database:update', inventory)
end)

local dropped_entities = {}
local my_entities = {}
RegisterNetEvent('fsn_inventory:floor:update')
AddEventHandler('fsn_inventory:floor:update', function(tbl)
	dropped_entities = tbl
end)
--------------------------------------------------------------------------------------------------------
--[[
RegisterNetEvent('fsn_inventory:itemhasdropped')
AddEventHandler('fsn_inventory:itemhasdropped', function(item, hash, xyz, amount, pickupid)
  --TriggerEvent('fsn_notify:displayNotification', item..' was dropped @ '..xyz[1], 'centerLeft', 3000, 'error')
  table.insert(dropped_entities,#dropped_entities+1, {
    item = item,
    hash = hash,
    xyz = xyz,
    amount = amount,
    pickupid = pickupid
  })
end)
]]--
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for k, obj in pairs(dropped_entities) do
      if GetDistanceBetweenCoords(obj.xyz[1], obj.xyz[2], obj.xyz[3], GetEntityCoords(PlayerPedId()), true) < 2 then
        SetTextComponentFormat("STRING")
        AddTextComponentString("Press ~INPUT_PICKUP~ to pick up ~y~["..obj.amount.."X] "..items_table[obj.item].display_name)
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        if IsControlJustPressed(0, 38) then
		local space = fsn_computeMaxSpace()
		local weight = items_table[obj.item].weight * obj.amount
		local new_weight = fsn_computeCurrentSpace() + weight
		if new_weight > space then
			TriggerEvent('fsn_notify:displayNotification', 'You do not have room.', 'centerLeft', 3000, 'error')				
		else
		  --TriggerServerEvent('fsn_inventory:itempickup', obj.pickupid)
		  --TriggerEvent('fsn_inventory:item:add', obj.item, obj.amount)

		  local object = GetClosestObjectOfType(obj.xyz[1], obj.xyz[2], obj.xyz[3], 5.0, obj.hash, false, false, false)
		  local netId = NetworkGetNetworkIdFromEntity(object)
		  if netId ~= 0 then
		    if not NetworkHasControlOfNetworkId(netId) then
		      NetworkRequestControlOfNetworkId(netId)
					while not NetworkHasControlOfNetworkId(netId) do
						Citizen.Wait(1)
					end
		    end
		  end
		  while not HasAnimDictLoaded('pickup_object') do
		    RequestAnimDict('pickup_object')
		    Citizen.Wait(5)
		  end
		  TaskPlayAnim(PlayerPedId(), 'pickup_object', 'pickup_low', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
		  SetEntityAsMissionEntity(object, true, true)
			      DeleteObject(object)
		  if DoesObjectOfTypeExistAtCoords(obj.xyz[1], obj.xyz[2], obj.xyz[3], 5.0, obj.hash, true) then
		    object = GetClosestObjectOfType(obj.xyz[1], obj.xyz[2], obj.xyz[3], 5.0, obj.hash, false, false, false)
		    SetEntityAsMissionEntity(object, true, true)
		    DeleteObject(object)
		  end
		  TriggerServerEvent('fsn_inventory:itempickup', obj.pickupid)
		  TriggerEvent('fsn_commands:me', 'picked up '..obj.amount..' '..items_table[obj.item].display_name)
		  Citizen.Wait(1000)
		  ClearPedTasks(PlayerPedId())
		end
        end
      end
    end
  end
end)

--[[
RegisterNetEvent('fsn_inventory:removedropped')
AddEventHandler('fsn_inventory:removedropped', function(id)
  for k, v in pairs(dropped_entities) do
    if v.pickupid == id then
      table.remove(dropped_entities,k)
    end
  end
end)
]]--
RegisterNetEvent('fsn_inventory:item:drop')
AddEventHandler('fsn_inventory:item:drop', function(item)
  if inventory[item] then
    Citizen.CreateThread(function()
  		local editOpen = true
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8S", "", "", "", "", "", 64)
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        if UpdateOnscreenKeyboard() == 2 then
          qty = 0
          editOpen = false
          inventory[item] = inventory[item]
        elseif UpdateOnscreenKeyboard() == 1 then
          editOpen = false
          qty = GetOnscreenKeyboardResult()
          if qty == 'all' then
            qty = math.floor(fsn_GetItemAmount(item))
          else
            if tonumber(qty) then
              qty = math.floor(tonumber(qty))
			      if qty < 1 or qty > 100 then
				      TriggerEvent('fsn_notify:displayNotification', 'issue with input', 'centerLeft', 3000, 'error')
				    return
            end
          else
              TriggerEvent('fsn_notify:displayNotification', 'Enter an amount or "all"', 'centerLeft', 3000, 'error')
            end
          end
          if fsn_GetItemAmount(item) < qty then
            TriggerEvent('fsn_notify:displayNotification', 'You do not have '..qty..' '..items_table[item].display_name..'s', 'centerLeft', 3000, 'error')
            return
          end
          while not HasAnimDictLoaded('pickup_object') do
            RequestAnimDict('pickup_object')
            Citizen.Wait(5)
          end
          local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 0.5, 0)
          if items_table[item].modelhash then
            RequestModel(items_table[item].modelhash)
        	  while not HasModelLoaded(items_table[item].modelhash) do
        	    Wait(1)
        	  end
            local obj = CreateObject(items_table[item].modelhash, coords, true, true, true)
            PlaceObjectOnGroundProperly(obj)
          end
          TaskPlayAnim(PlayerPedId(), 'pickup_object', 'pickup_low', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)

          table.insert(my_entities, #my_entities+1, {
            hash = items_table[item].modelhash,
            xyz = coords
          })

          TriggerEvent('fsn_inventory:item:take', item, qty)
          TriggerEvent('fsn_commands:me', 'dropped '..qty..' '..items_table[item].display_name)
          TriggerServerEvent('fsn_inventory:item:dropped', item, items_table[item].modelhash, {coords.x, coords.y, coords.z}, qty)
          Citizen.Wait(1000)
          ClearPedTasks(PlayerPedId())
          break
  			end
  			Wait(1)
  		end
  	end)
  end
end)

RegisterNetEvent('fsn_inventory:item:give')
AddEventHandler('fsn_inventory:item:give', function(item)
  if inventory[item] then

  end
end)

RegisterNetEvent('fsn_inventory:item:use')
AddEventHandler('fsn_inventory:item:use', function(item)
  if inventory[item] then
    items_table[item].use()
  else
    TriggerEvent('fsn_notify:displayNotification', 'You don\'t have any '..items_table[item].display_name, 'centerLeft', 3000, 'success')
  end
end)

RegisterNetEvent('fsn_inventory:item:add')
AddEventHandler('fsn_inventory:item:add', function(item, amount)
  amount = math.floor(amount)
  local space = fsn_computeMaxSpace()
  local weight = items_table[item].weight * amount
  local new_weight = fsn_computeCurrentSpace() + weight
  if new_weight > space then
    TriggerEvent('fsn_notify:displayNotification', 'You don\'t have room!', 'centerLeft', 3000, 'error')
  else
    if inventory[item] then
      inventory[item].amount = inventory[item].amount + amount
      TriggerEvent('fsn_notify:displayNotification', 'You got '..amount..'x '..items_table[item].display_name, 'centerLeft', 3000, 'success')
    else
      inventory[item] = {}
      inventory[item].display_name = items_table[item].display_name
      inventory[item].amount = amount
      TriggerEvent('fsn_notify:displayNotification', 'You got '..amount..'x '..items_table[item].display_name, 'centerLeft', 3000, 'success')
    end
  end
  TriggerServerEvent('fsn_inventory:database:update', inventory)
end)

RegisterNetEvent('fsn_inventory:item:take')
AddEventHandler('fsn_inventory:item:take', function(item, amount)
  amount = math.floor(amount)
  if inventory[item] then
    if inventory[item].amount > amount then
      inventory[item].amount = inventory[item].amount - amount
    else
      inventory[item] = nil
    end
    TriggerServerEvent('fsn_inventory:database:update', inventory)
  else
    TriggerEvent('chatMessage', 'FSN', {255,0,0}, 'How\'d you use an item you do not have?????')
  end
end)

RegisterNetEvent('fsn_inventory:initChar')
RegisterNetEvent('fsn_inventory:init')
AddEventHandler('fsn_inventory:initChar', function(invtbl)
  inventory = json.decode(invtbl)
  init = true
  TriggerEvent('fsn_inventory:init', sendtojs)
end)

RegisterNetEvent('fsn_menu:requestInventory')
RegisterNetEvent('fsn_inventory:update')
AddEventHandler('fsn_menu:requestInventory', function()
  TriggerEvent('fsn_inventory:update', inventory)
end)

function fsn_HasPhone()
  if inventory["phone"] then
    return true
  else
    return false
  end
end

function fsn_HasItem(item)
  if inventory[item] then
    return true
  else
    return false
  end
end

function fsn_GetItemDetails(item)
  return items_table[item]
end

function fsn_GetItemAmount(item)
  if inventory[item] then
    return inventory[item].amount
  else
    return 0
  end
end
----------------------------------------------------- Store stuffs
RegisterNetEvent('fsn_inventory:prebuy')
RegisterNetEvent('fsn_inventory:buyItem')
AddEventHandler('fsn_inventory:prebuy', function(item)
  local space = fsn_computeMaxSpace()
  local weight = items_table[item].weight * 1
  local new_weight = fsn_computeCurrentSpace() + weight
  if new_weight > space then
    TriggerEvent('fsn_notify:displayNotification', 'You cannot carry this!', 'centerLeft', 3000, 'error')
  else
    TriggerEvent('fsn_inventory:buyItem', item, items_table[item].price, 1)
  end
end)
