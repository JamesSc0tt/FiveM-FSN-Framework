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
--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for obj in EnumerateObjects() do
			if GetDistanceBetweenCoords(GetEntityCoords(obj), GetEntityCoords(PlayerPedId())) < 1 then
				if GetEntityModel(obj) == -742198632 then
					SetTextComponentFormat("STRING")
					AddTextComponentString("Press ~INPUT_PICKUP~ to drink ~b~water~w~ ($2)")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustPressed(0, 38) then
						while not HasAnimDictLoaded('amb@code_human_in_car_mp_actions@drink@std@rps@base') do
							RequestAnimDict('amb@code_human_in_car_mp_actions@drink@std@rps@base')
							Citizen.Wait(5)
						end
						TaskPlayAnim(PlayerPedId(), 'amb@code_human_in_car_mp_actions@drink@std@rps@base', 'idle_a', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
						TriggerEvent('fsn_inventory:use:drink', 15)
						TriggerEvent('fsn_bank:change:walletMinus', 2)
					end
				end
				if GetEntityModel(obj) == 690372739 then
					SetTextComponentFormat("STRING")
					AddTextComponentString("Press ~INPUT_PICKUP~ to drink ~b~coffee~w~ ($3)")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustPressed(0, 38) then
						while not HasAnimDictLoaded('amb@code_human_in_car_mp_actions@drink@std@rps@base') do
							RequestAnimDict('amb@code_human_in_car_mp_actions@drink@std@rps@base')
							Citizen.Wait(5)
						end
						TaskPlayAnim(PlayerPedId(), 'amb@code_human_in_car_mp_actions@drink@std@rps@base', 'idle_a', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
						TriggerEvent('fsn_inventory:use:drink', 17)
						TriggerEvent('fsn_bank:change:walletMinus', 3)
					end
				end
			end
		end
	end
end)
]]--