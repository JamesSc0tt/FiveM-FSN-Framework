-- carry dead people not escort

carrying = false
carrying_id = 0

function carryingWho()
	return carrying_id
end

carried = false
carried_id = false

function loadAnim( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent('fsn_ems:carried:start')
AddEventHandler('fsn_ems:carried:start', function(carrier)
	carried = true
	carried_id = carrier
	ClearPedTasksImmediately(PlayerPedId())
	if IsPedRagdoll(PlayerPedId()) then
		SetPedCanRagdoll(PlayerPedId(), false)
	end
	TriggerEvent('fsn_vehiclecontrol:trunk:forceOut')
end)

RegisterNetEvent('fsn_ems:carry:start')
AddEventHandler('fsn_ems:carry:start', function(carryingid)
	carrying = true
	carrying_id = carryingid
end)

RegisterNetEvent('fsn_ems:carried:end')
AddEventHandler('fsn_ems:carried:end', function(carrier)
	carried = false
	carried_id = 0 
	DetachEntity(PlayerPedId())
	ClearPedTasksImmediately(PlayerPedId())
end)

RegisterNetEvent('fsn_ems:carry:end')
AddEventHandler('fsn_ems:carry:end', function(carryingid)
	carrying = false
	carrying_id = 0
	SetPedCanRagdoll(PlayerPedId(), true)
end)

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if carried then 
			local ped = GetPlayerPed(GetPlayerFromServerId(carried_id))
			loadAnim( "amb@world_human_bum_slumped@male@laying_on_left_side@base" ) 
			if not IsEntityPlayingAnim(PlayerPedId(), "amb@world_human_bum_slumped@male@laying_on_left_side@base", "base", 3) then
				TaskPlayAnim(PlayerPedId(), "amb@world_human_bum_slumped@male@laying_on_left_side@base", "base", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
			end
			if not IsEntityAttached(PlayerPedId()) then
				AttachEntityToEntity(PlayerPedId(), ped, 1, -0.68, -0.2, 0.94, 180.0, 180.0, 60.0, 1, 1, 0, 1, 0, 1)
			end
		end
		--if carrying then
			
		--end
	end
end)

DecorRegister("fsn_ems:dead")
DecorSetBool(PlayerPedId(), "fsn_ems:dead", false)
Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if fsn_IsDead() then
			DecorSetBool(PlayerPedId(), "fsn_ems:dead", true)
		else
			DecorSetBool(PlayerPedId(), "fsn_ems:dead", false)
		end
		for _, id in ipairs(GetActivePlayers()) do --for id = 0, 128 do
			local ped = GetPlayerPed(id)
			if DecorGetBool(ped, "fsn_ems:dead") and ped ~= PlayerPedId() then
				if GetDistanceBetweenCoords(GetEntityCoords(ped, false), GetEntityCoords(PlayerPedId(),false), true) < 2 then
					if not carrying then
						Util.DrawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, '~r~Knocked Out~w~\n[LALT + C] Carry\n[LALT + A] Attend\n[LALT + E] Search/Rob', {255,255,255,200}, 0.25)
						if IsControlPressed(0, 19) then
							if IsControlJustPressed(0, 79) then
								-- carry (C)
								TriggerServerEvent('fsn_ems:carry:start', GetPlayerServerId(id))
							end
							
							if IsControlJustPressed(0, 34) then
								-- attend (A)
								TaskLookAtCoord(PlayerPedId(), GetEntityCoords(ped), 1000, 0, 2)
								ExecuteCommand('e kneel2')
							end
							
							if IsControlJustPressed(0,38) then
								-- rob (E)
								TriggerEvent('fsn_criminalmisc:robbing:startRobbing', id)
								ExecuteCommand('e kneel2')
							end
						end
					else
						Util.DrawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, '~r~Knocked Out~w~\n[LALT + E] Drop', {255,255,255,200}, 0.25)
						if IsControlPressed(0, 19) then
							if IsControlJustPressed(0, 38) then
								-- carry (C)
								TriggerServerEvent('fsn_ems:carry:end', GetPlayerServerId(id))
							end
						end
					end
				end
			end
		end 
	end
end)

-- other shit
DetachEntity(PlayerPedId())
