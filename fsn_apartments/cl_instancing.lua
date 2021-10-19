-------------------
-- Instance stuff
-- _seriously idk why this is here_
-------------------
local instanced = false
local instance_debug = false
local myinstance = {}
function instanceMe(state)
	print'thiswasremoved'
end
function inInstance()
	return instanced	
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if instance_debug then
			local xyz = GetEntityCoords(PlayerPedId())
			if instanced then
				Util.DrawText3D(xyz.x, xyz.y, xyz.z, 'InstanceID: '..myinstance.id..'\nPlayers: '..table.concat(myinstance.players, ', ')..'\nCreated: '..myinstance.created, {0,255,0,255}, 0.3)
			else
				Util.DrawText3D(xyz.x, xyz.y, xyz.z, 'No instance', {255,0,0,255}, 0.3)
			end
		end
		for _, id in ipairs(GetActivePlayers()) do
			if instanced then
				SetVehicleDensityMultiplierThisFrame(0.0)
				SetRandomVehicleDensityMultiplierThisFrame(0.0)
				if table.contains(myinstance.players, GetPlayerServerId(id)) then
					-- can see/hear
					local ped = GetPlayerPed(id)
					SetEntityVisible(ped, true, 0)
					SetEntityCollision(ped, true, true)
				else
					-- cannot see/hear
					local ped = GetPlayerPed(id)
					if ped ~= PlayerPedId() then
						SetEntityVisible(ped, false, 0)
						SetEntityCollision(ped, false, false)
					end
				end
			else
				SetVehicleDensityMultiplierThisFrame(0.2)
				SetRandomVehicleDensityMultiplierThisFrame(0.2)
				local ped = GetPlayerPed(id)
				if ped ~= PlayerPedId() then
					SetEntityVisible(ped, true, 0)
					SetEntityCollision(ped, true, true)
				end
			end
		end
	end
end)

RegisterNetEvent('fsn_apartments:instance:join')
AddEventHandler('fsn_apartments:instance:join', function(inst)
	instanced = true
	myinstance = inst
end)

RegisterNetEvent('fsn_apartments:instance:update')
AddEventHandler('fsn_apartments:instance:update', function(inst)
	myinstance = inst
end)

RegisterNetEvent('fsn_apartments:instance:leave')
AddEventHandler('fsn_apartments:instance:leave', function()
	instanced = false
	myinstance = {}
end)

RegisterNetEvent('fsn_apartments:instance:debug')
AddEventHandler('fsn_apartments:instance:debug', function()
	instance_debug = not instance_debug
end)

function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end