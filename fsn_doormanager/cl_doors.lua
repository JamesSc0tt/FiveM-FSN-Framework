local doors = {}
RegisterNetEvent('fsn_doormanager:request')
AddEventHandler('fsn_doormanager:request', function(tbl)
	doors = tbl
end)

local keys = false
AddEventHandler('fsn_police:init', function(policeLevel)
  if policeLevel > 0 then
    keys = true
  else
    keys = false
  end
  TriggerServerEvent('fsn_doormanager:request')
end)
AddEventHandler('fsn_police:update', function(tbl)
	for k, v in pairs(tbl) do
		if v == GetPlayerServerId(PlayerId()) then
			keys = true
		end
	end
end)
TriggerServerEvent('fsn_doormanager:request')

function LookingAt(id, x,y,z)
	if doors[id].lookingat == false then return true end
	local coordA = GetEntityCoords(PlayerPedId(), 1)
	local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0)
    --DrawMarker(1,coordB,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
	if GetDistanceBetweenCoords(x,y,z,coordB,false) < 1.0 then
		return true
	else
		return false
	end
end
function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

local locking = false
local locking_id = 0
local locking_start = 0 
function ToggleLock(id)
	locking = true
	locking_id = id
	locking_start = GetGameTimer()
	LoadAnimDict( "gestures@f@standing@casual" )
	TaskPlayAnim(PlayerPedId(), "gestures@f@standing@casual", "gesture_hand_down", 8.0, 1.0, 3, 2, 0, 0, 0, 0 )
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'door-lock', 0.1)
end

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if locking then
			local d = doors[locking_id]
			Util.DrawText3D(d.disp.x, d.disp.y,d.disp.z, 'Toggling..', {255, 255, 255, 200}, 0.2)
			if locking_start+800 < GetGameTimer() then
				TriggerServerEvent('fsn_doormanager:toggle', locking_id)
				locking = false
				locking_id = 0
				locking_start = 0 
			end 
		else	
			for k, d in pairs(doors) do
				if d.double then
					local dist = GetDistanceBetweenCoords(d.disp.x, d.disp.y,d.disp.z,GetEntityCoords(PlayerPedId()),true)
					if dist < 20 then
						local door_one = GetClosestObjectOfType(d.ents[1].x, d.ents[1].y,d.ents[1].z, 0.5, d.ents[1].mdl, false, false, false)
						local door_two = GetClosestObjectOfType(d.ents[2].x, d.ents[2].y,d.ents[2].z, 0.5, d.ents[2].mdl, false, false, false)
						if door_one and door_two then
							if d.locked then
								FreezeEntityPosition(door_one, true)
								FreezeEntityPosition(door_two, true)
								if dist < d.lockdist then
									if keys and LookingAt(k, d.disp.x, d.disp.y,d.disp.z) then
										Util.DrawText3D(d.disp.x, d.disp.y,d.disp.z, '[E] ~g~UNLOCK', {255, 255, 255, 200}, 0.2)
										if IsControlJustPressed(0,38) then
											ToggleLock(k)
										end
									else
										if dist < 2 then
											Util.DrawText3D(d.disp.x, d.disp.y,d.disp.z, '~r~LOCKED', {255, 255, 255, 200}, 0.2)
										end
									end
								end
							else
								FreezeEntityPosition(door_one, false)
								FreezeEntityPosition(door_two, false)
								if dist < d.lockdist then
									if keys and LookingAt(k, d.disp.x, d.disp.y,d.disp.z) then
										Util.DrawText3D(d.disp.x, d.disp.y,d.disp.z, '[E] ~r~Lock', {255, 255, 255, 200}, 0.2)
										if IsControlJustPressed(0,38) then
											ToggleLock(k)
										end
									else
										if dist < 2 then
											Util.DrawText3D(d.disp.x, d.disp.y,d.disp.z, '~g~UNLOCKED', {255, 255, 255, 200}, 0.2)
										end
									end
								end
							end
						else
							Util.DrawText3D(d.disp.x, d.disp.y,d.disp.z, 'ERR: Missing door ('..k..')', {255, 0, 0, 255}, 0.2)
						end
					end
				else
					local dist = GetDistanceBetweenCoords(d.ents[1].x, d.ents[1].y,d.ents[1].z,GetEntityCoords(PlayerPedId()),true)
					if dist < 20 then
						local door = GetClosestObjectOfType(d.ents[1].x, d.ents[1].y,d.ents[1].z, 0.1, d.ents[1].mdl, false, false, false)
						if door then
							if d.locked then
								FreezeEntityPosition(door, true)
								if dist < d.lockdist then 
									if keys and LookingAt(k, d.disp.x, d.disp.y,d.disp.z) then
										Util.DrawText3D(d.disp.x, d.disp.y,d.disp.z, '[E] ~g~UNLOCK', {255, 255, 255, 200}, 0.2)
										if IsControlJustPressed(0,38) then
											ToggleLock(k)
										end
									else
										if dist < 2 then
											Util.DrawText3D(d.disp.x, d.disp.y,d.disp.z, '~r~LOCKED', {255, 255, 255, 200}, 0.2)
										end
									end
								end
							else
								FreezeEntityPosition(door, false)
								if dist < d.lockdist then 
									if keys and LookingAt(k, d.disp.x, d.disp.y,d.disp.z) then
										Util.DrawText3D(d.disp.x, d.disp.y,d.disp.z, '[E] ~r~LOCK', {255, 255, 255, 200}, 0.2)
										if IsControlJustPressed(0,38) then
											ToggleLock(k)
										end
									else
										if dist < 2 then
											Util.DrawText3D(d.disp.x, d.disp.y,d.disp.z, '~g~UNLOCKED', {255, 255, 255, 200}, 0.2)
										end
									end
								end
							end 
						else
							Util.DrawText3D(d.ents[1].x, d.ents[1].y,d.ents[1].z, 'ERR: Missing door ('..k..')', {255, 0, 0, 255}, 0.2)
						end
					end
				end
			end
		end
	end
end)
--SetEntityCoords(PlayerPedId(), -774.10675, -9.47164536, 10.1702633)

function IsDoorLocked(id)
	if doors[id] then
		return doors[id].locked
	else
		return true
	end
end