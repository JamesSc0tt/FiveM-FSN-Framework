------------------------- me handcuff
local amicuffed = false
DecorRegister("crim_cuff")
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2500)
		if amicuffed then
			if IsPedRunning(PlayerPedId()) then
				SetPedToRagdoll(PlayerPedId(), 1, 1000, 0, 0, 0, 0)
				Citizen.Wait(math.random(2000,5000))
			end
		end
	end
end)

local escorted = false
local escortedto = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if escorted then
			if IsPedRagdoll(crimPed) then
				DetachEntity(PlayerPedId(), true, false)
				escorted = false
				escortedto = false
			end
			if DecorGetBool(crimPed, "deadPly") then
				DetachEntity(PlayerPedId(), true, false)
				escorted = false
				escortedto = false
			end
		end 
	end
end)

local dragtime = 0
RegisterNetEvent('fsn_criminalmisc:toggleDrag')
AddEventHandler('fsn_criminalmisc:toggleDrag', function(crim)
  if not escorted then
	local maff = dragtime + 3
	if maff < myTime or dragtime == 0 then
		local myPed = PlayerPedId()
		local crimPed = GetPlayerPed(GetPlayerFromServerId(crim))
		escortedto = crimPed
		if IsPedInAnyVehicle(PlayerPedId()) then
		  TaskLeaveVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId()), 16)
		end
		AttachEntityToEntity(myPed, crimPed, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		escorted = true
		dragtime = myTime
	end
  else
	local maff = dragtime + 3
	if dragtime < myTime then
		DetachEntity(PlayerPedId(), true, false)
		escorted = false
		escortedto = false
		dragtime = myTime
	end
  end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if amicuffed then
			DecorSetBool(PlayerPedId(), "crim_cuff", true)
			DisableControlAction(1, 18, true)
			DisableControlAction(1, 24, true)
			DisableControlAction(1, 69, true)
			DisableControlAction(1, 92, true)
			DisableControlAction(1, 106, true)
			DisableControlAction(1, 122, true)
			DisableControlAction(1, 135, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(1, 144, true)
			DisableControlAction(1, 176, true)
			DisableControlAction(1, 223, true)
			DisableControlAction(1, 229, true)
			DisableControlAction(1, 237, true)
			DisableControlAction(1, 257, true)
			DisableControlAction(1, 329, true)
			DisableControlAction(1, 80, true)
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 250, true)
			DisableControlAction(1, 263, true)
			DisableControlAction(1, 310, true)
			DisableControlAction(1, 22, true)
			DisableControlAction(1, 55, true)
			DisableControlAction(1, 76, true)
			DisableControlAction(1, 102, true)
			DisableControlAction(1, 114, true)
			DisableControlAction(1, 143, true)
			DisableControlAction(1, 179, true)
			DisableControlAction(1, 193, true)
			DisableControlAction(1, 203, true)
			DisableControlAction(1, 216, true)
			DisableControlAction(1, 255, true)
			DisableControlAction(1, 298, true)
			DisableControlAction(1, 321, true)
			DisableControlAction(1, 328, true)
			DisableControlAction(1, 331, true)
			DisableControlAction(0, 63, false)
			DisableControlAction(0, 64, false)
			DisableControlAction(0, 59, false)
			DisableControlAction(0, 278, false)
			DisableControlAction(0, 279, false)
			DisableControlAction(0, 68, false)
			DisableControlAction(0, 69, false)
			DisableControlAction(0, 75, false)
			DisableControlAction(0, 76, false)
			DisableControlAction(0, 102, false)
			DisableControlAction(0, 81, false)
			DisableControlAction(0, 82, false)
			DisableControlAction(0, 83, false)
			DisableControlAction(0, 84, false)
			DisableControlAction(0, 85, false)
			DisableControlAction(0, 86, false)
			DisableControlAction(0, 106, false)
			DisableControlAction(0, 25, false)
			while not HasAnimDictLoaded('mp_arresting') do
				RequestAnimDict('mp_arresting')
				Citizen.Wait(5)
			end
			if not IsEntityPlayingAnim(PlayerPedId(), 'mp_arresting', 'idle', 3) and not IsPedRagdoll(PlayerPedId()) then
				TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
			end
		else
			DecorSetBool(PlayerPedId(), "crim_cuff", false)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for _, id in ipairs(GetActivePlayers()) do
			if NetworkIsPlayerActive(id) then
				  local ped = GetPlayerPed(id)
				  if GetDistanceBetweenCoords(GetEntityCoords(ped, false), GetEntityCoords(PlayerPedId(),false), true) < 2 and DecorGetBool(ped, "crim_cuff") then
						if ped ~= PlayerPedId() then
							fsn_drawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, '~r~Ziptied~g~\n[H] to cut free\n[E] to escort\n[X] to rob')
							if IsControlJustPressed(0, 304) and not IsPedInAnyVehicle(PlayerPedId(), true) then
								TriggerServerEvent('fsn_criminalmisc:handcuffs:requestunCuff', GetPlayerServerId(id))
							end
							if IsControlJustPressed(0, 38) then
								if HasPedGotWeapon(PlayerPedId(), GetHashKey("WEAPON_KNIFE"), false) then
									--print('attempting to uncuff '..GetPlayerServerId(id))
									TriggerServerEvent('fsn_criminalmisc:handcuffs:toggleEscort', GetPlayerServerId(id)) 
									Citizen.Wait(1000)
								else
									TriggerEvent('fsn_notify:displayNotification', 'You do not have a knife to cut these', 'centerLeft', 4000, 'error')
								end
							end
							if IsControlJustPressed(0, 73) and not IsPedInAnyVehicle(PlayerPedId(), true) then
								--TriggerServerEvent('fsn_criminalmisc:robbing:requesRob', GetPlayerServerId(id)) 
								TriggerEvent('fsn_criminalmisc:robbing:startRobbing', id)
							end
						else
							fsn_drawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, '~r~Ziptied')
						end
				  end
			end 
		end
	end
end)

RegisterNetEvent('fsn_criminalmisc:handcuffs:startCuffed')
AddEventHandler('fsn_criminalmisc:handcuffs:startCuffed', function(srv_id)
	if not amicuffed then
		local crimPed = GetPlayerPed(GetPlayerFromServerId(srv_id))
		SetEntityHeading(PlayerPedId(), GetEntityHeading(crimPed))
		SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(crimPed, 0.0, 0.45, 0.0))
		while not HasAnimDictLoaded('mp_arrest_paired') do
			RequestAnimDict('mp_arrest_paired')
			Citizen.Wait(5)
		end
		TaskPlayAnim(PlayerPedId(), "mp_arrest_paired", "crook_p2_back_right", 8.0, -8, -1, 32, 0, 0, 0, 0)
		Citizen.Wait(3500)
		amicuffed = true
	else
		--TriggerServerEvent('fsn_notify:displayNotification', srv_id, 'Player is already ziptied', 'centerLeft', 4000, 'error')
	end
end)

RegisterNetEvent('fsn_criminalmisc:handcuffs:startunCuffed')
AddEventHandler('fsn_criminalmisc:handcuffs:startunCuffed', function(srv_id)
	local crimPed = GetPlayerPed(GetPlayerFromServerId(srv_id))
	SetEntityHeading(PlayerPedId(), GetEntityHeading(crimPed))
	SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(crimPed, 0.0, 0.45, 0.0))
	Citizen.Wait(2200)
	escorted = false
	escortedto = false
	amicuffed = false
	Citizen.Wait(500)
	ClearPedTasks(PlayerPedId())
end)
------------------------- handcuff someone else
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if HasHandcuffs() and not exports["fsn_ems"]:fsn_IsDead() and not IsPedInAnyVehicle(PlayerPedId()) and not exports["fsn_apartments"]:inInstance() then
			for _, id in ipairs(GetActivePlayers()) do
				if NetworkIsPlayerActive(id) then
				  local ped = GetPlayerPed(id)
				  if not IsPedInAnyVehicle(ped) and GetDistanceBetweenCoords(GetEntityCoords(ped, false), GetEntityCoords(PlayerPedId(),false), true) < 2 and ped ~= PlayerPedId() then
					if DecorGetBool(GetPlayerPed(id), "crim_cuff") == false then
					  showLoadingPrompt("[SHIFT + Y] ziptie "..GetPlayerServerId(id), 6000, 3)
					end
					if IsControlPressed(0,21) then
					  if IsControlJustPressed(0, 246) then
						TriggerServerEvent('fsn_criminalmisc:handcuffs:requestCuff', GetPlayerServerId(id))
						Citizen.Wait(1000)
					  end
					end
				  end
				end
			end
		end
	end
end)

RegisterNetEvent('fsn_criminalmisc:handcuffs:startCuffing')
AddEventHandler('fsn_criminalmisc:handcuffs:startCuffing', function()
	while not HasAnimDictLoaded('mp_arrest_paired') do
		RequestAnimDict('mp_arrest_paired')
		Citizen.Wait(5)
	end
	TaskPlayAnim(PlayerPedId(), "mp_arrest_paired", "cop_p2_back_right", 8.0, -8, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(2500)	
end)

RegisterNetEvent('fsn_criminalmisc:handcuffs:startunCuffing')
AddEventHandler('fsn_criminalmisc:handcuffs:startunCuffing', function()
	while not HasAnimDictLoaded('mp_arresting') do
		RequestAnimDict('mp_arresting')
		Citizen.Wait(5)
	end
	TaskPlayAnim(PlayerPedId(), "mp_arresting", "a_uncuff", 8.0, -8, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(2500)	
end)
