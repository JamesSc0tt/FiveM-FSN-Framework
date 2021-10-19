----------------------------------------------------- Drug stuffs
local drugs = {
  ["packaged_cocaine"] = {
	name = "Cocaine",
    street_price = 10
  },
  ["meth_rocks"] = {
	name = "Meth Rocks",
    street_price = 325
  },
  ["joint"] = {
	name = "Joint",
    street_price = 275
  }
}

local selling = false
local startsale = 0
local curtime = 0
local sold_peds = {}
local selling_item = ''

function fsn_getPlayerDrugs()
  local inventory = fsn_GetInventory()
  for k, v in pairs(drugs) do
    if inventory[k] then
      return k
    end
  end
  return false
end

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if fsn_getPlayerDrugs() ~= false and not IsPedInAnyVehicle(PlayerPedId()) then
			local obj = exports['fsn_main']:fsn_FindNearbyPed(2)
			if obj and IsPedHuman(obj) and not table.contains(sold_peds, obj) and not IsEntityDead(obj) then
				if not selling then
					fsn_drawText3D(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, '[~g~E~w~] Sell ~b~'..drugs[fsn_getPlayerDrugs()].name)
					if IsControlJustPressed(0, 38) then
						if math.random(0,100) > 58 then
							selling = true
							TaskLookAtEntity(obj, PlayerPedId(), 9000, 2084, 3)
							TaskStandStill(obj, 9000)
							startsale = curtime
							selling_item = fsn_getPlayerDrugs()
						else
						  if math.random(0,100) > 50 then
							  while not HasAnimDictLoaded('cellphone@') do
								RequestAnimDict('cellphone@')
								Citizen.Wait(5)
							  end
							  TriggerEvent('fsn_notify:displayNotification', 'They are not interested', 'centerLeft', 3000, 'error')
							  SetEntityAsMissionEntity(obj, true, true)
							  ClearPedTasksImmediately(obj)
							  SetEntityAsNoLongerNeeded(obj)
							  if math.random(0,100) > 70 then
								TaskPlayAnim(obj, 'cellphone@', 'cellphone_call_listen_base', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
							  end
							  Citizen.Wait(1000)
							  if not IsEntityDead(obj) then
								local pos = GetEntityCoords(obj)
								local coords = {
								  x = pos.x,
								  y = pos.y,
								  z = pos.z
								}
								TriggerServerEvent('fsn_police:dispatch', coords, 3)
							else
							  TriggerEvent('fsn_notify:displayNotification', 'They are not interested', 'centerLeft', 3000, 'error')
							  SetEntityAsMissionEntity(obj, true, true)
							  ClearPedTasksImmediately(obj)
							  SetEntityAsNoLongerNeeded(obj)
							end
						  end
						  table.insert(sold_peds, #sold_peds+1, {obj, true})
						end
					end
				else
					local selltime = startsale + 9
					if selltime > curtime then
						fsn_drawText3D(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, 'Selling')
					else
						fsn_drawText3D(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, 'Sold')
						local finishtime = selltime + 3
						while not HasAnimDictLoaded('mp_safehouselost@') do
							RequestAnimDict('mp_safehouselost@')
							Citizen.Wait(5)
						end
						TaskPlayAnim(PlayerPedId(), 'mp_safehouselost@', 'package_dropoff', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
						TaskPlayAnim(obj, 'mp_safehouselost@', 'package_dropoff', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
						if finishtime < curtime then
							selling = false
							if fsn_GetItemAmount(selling_item) < 7 then
							  sold_amount = fsn_GetItemAmount(selling_item)
							else
							  sold_amount = math.random(1, 7)
							end
							local price = math.random(drugs[selling_item].street_price - 100, drugs[selling_item].street_price + 100)
							price = price * sold_amount
							TriggerEvent('fsn_notify:displayNotification', 'They bought '..sold_amount..' '..items_table[selling_item].display_name..' for '..price..'DM', 'centerLeft', 3000, 'info')
							TriggerEvent('fsn_inventory:item:add', 'dirty_money', price)
							TriggerEvent('fsn_inventory:item:take', selling_item, sold_amount)

							table.insert(sold_peds, #sold_peds+1, {obj, true})
							Citizen.Wait(3000)
						end
					end
				end
			else
				if selling then
					TriggerEvent('fsn_notify:displayNotification', 'The transaction was cancelled...', 'centerLeft', 3000, 'error')
					selling = not selling
				end
			end
		end
	end
end)
Citizen.CreateThread(function()
	while true do Citizen.Wait(1000)
		curtime = curtime + 1
	end
end)
