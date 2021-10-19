inbed = false
mybed = 0 
local mycharge = 0
beds = {
	{
		enter = {x = 333.70169067383, y = -579.32836914063, z = 43.317234039307},
		bed = {x = 334.14465332031, y = -578.15869140625, z = 44.009075164795, h = 160.98306274414},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = 344.33535766602, y = -581.96209716797, z = 43.315013885498},
		bed = {x = 344.9494934082, y = -580.83331298828, z = 44.01636505127, h = 150.24169921875},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = 348.57412719727, y = -583.07806396484, z = 43.315013885498},
		bed = {x = 349.83334350586, y = -583.59423828125, z = 44.016368865967, h = 257.1083984375},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = 352.26821899414, y = -584.34741210938, z = 43.315017700195},
		bed = {x = 353.02993774414, y = -584.76959228516, z = 44.105567932129, h = 247.2795715332},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = 355.67907714844, y = -585.49719238281, z = 43.315013885498},
		bed = {x = 356.50100708008, y = -585.82067871094, z = 44.105571746826, h = 250.98168945313},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = 359.14797973633, y = -586.76055908203, z = 43.315013885498},
		bed = {x = 360.20581054688, y = -587.06304931641, z = 44.016361236572, h = 245.10762023926},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = 437.25469970703, y = -976.29083251953, z = 26.668552398682},
		bed = {x = 438.08071899414, y = -976.27307128906, z = 27.584774017334, h = 270.8410949707},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = -261.06463623047, y = 6321.1850585938, z = 32.436405181885},
		bed = {x = -260.35006713867, y = 6320.4848632813, z = 33.3583984375, h = 218.50010681152},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = -258.75869750977, y = 6318.6782226563, z = 32.436382293701},
		bed = {x = -257.88885498047, y = 6318.1064453125, z = 33.358402252197, h = 225.05325317383},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = -256.3515625, y = 6324.2641601563, z = 32.435466766357},
		bed = {x = -255.64268493652, y = 6325.3139648438, z = 33.3583984375, h = 317.27590942383},
		occupied = {false, 0, false, {0,0}},
	},
}

RegisterNetEvent('fsn_ems:bed:update')
AddEventHandler('fsn_ems:bed:update', function(bedid, bed)
	beds[bedid] = bed
	--print('fsn_ems:bed Bed update for ('..bedid..') ['..tostring(bed)..']')
end)

function fsn_drawText3D(x,y,z, text,r,g,b)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.3, 0.3)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 140)
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
		Citizen.Wait(10000)
		if inbed then
			local newhealth =GetEntityHealth(PlayerPedId())+10 
			if newhealth >= 200 then
				SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
				TriggerEvent('fsn_notify:displayNotification', 'You are fully healed', 'centerLeft', 2000, 'error')
				TriggerEvent('mythic_hospital:client:ResetLimbs')
				TriggerEvent('mythic_hospital:client:RemoveBleed')
			else
				SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId())+10)
				TriggerEvent('fsn_notify:displayNotification', 'Healing...', 'centerLeft', 2000, 'error')
			end
			TriggerServerEvent('fsn_ems:bed:health', mybed, GetEntityHealth(PlayerPedId()), GetEntityHealth(PlayerPedId()))
		end
	end
end)

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(296.18298339844,-584.42895507813,42.720436096191)
	SetBlipSprite(blip, 80)
	BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Hospital")
	EndTextCommandSetBlipName(blip)
	SetBlipAsShortRange(blip, true)
	while true do
	Citizen.Wait(0)
		if inbed then
			if beds[mybed].occupied[3] then
				fsn_drawText3D(beds[mybed].enter.x, beds[mybed].enter.y, beds[mybed].enter.z-0.3, "You are restrained to the bed.", 255, 0, 0)
			else
				fsn_drawText3D(beds[mybed].enter.x, beds[mybed].enter.y, beds[mybed].enter.z-0.3, "[E] Leave bed", 255, 255, 255)
				if IsControlJustPressed(0, 51) then
					TriggerServerEvent('fsn_ems:bed:occupy', mybed)
					DoScreenFadeOut(1000)
					Citizen.Wait(1010)
					SetEntityCoords(PlayerPedId(), beds[mybed].enter.x, beds[mybed].enter.y, beds[mybed].enter.z)
					inbed = false
					mybed = 0
					Citizen.Wait(1500)
					DoScreenFadeIn(2000)
				end
			end
			for i=1,345 do
				if i > 10 and i ~= 249 and i ~= 25 and i ~= 245 and i ~= 51 then
					DisableControlAction(1, i, true)
				end
			end
		end
		if GetDistanceBetweenCoords(305.85437011719,-595.95141601563,43.291790008545, GetEntityCoords(PlayerPedId()), true) < 10 then
			DrawMarker(1,305.85437011719,-595.95141601563,43.291790008545-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(305.85437011719,-595.95141601563,43.291790008545,GetEntityCoords(PlayerPedId()), true) < 1 then
				SetTextComponentFormat("STRING")
				if #onduty_ems <= 0 then
					AddTextComponentString("Press ~INPUT_PICKUP~ to check in")
					if IsControlJustPressed(0, 51) then
						for k, v in pairs(beds) do
							if not v.occupied[1] and not inbed then
								TriggerServerEvent('fsn_ems:bed:occupy', k)
								if fsn_IsDead() then
									TriggerEvent('fsn_ems:reviveMe')
								end
								DoScreenFadeOut(1000)
								Citizen.Wait(1010)
								SetEntityCoords(PlayerPedId(), v.bed.x, v.bed.y, v.bed.z)
								SetEntityHeading(PlayerPedId(), v.bed.h)
								ExecuteCommand("e sleep")
								inbed = true
								mybed = k
								Citizen.Wait(1500)
								DoScreenFadeIn(2000)
							end
						end
						if not inbed then
							TriggerEvent('fsn_notify:displayNotification', 'There aren\'t any available beds at this time.', 'centerLeft', 6000, 'error')
						end
					end
				else
					AddTextComponentString("Head back to the ward to see a doctor.")  
				end
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
		end
		for k, v in pairs(beds) do
			if GetDistanceBetweenCoords(v.enter.x, v.enter.y, v.enter.z, GetEntityCoords(PlayerPedId()), true) < 10 then
				if GetDistanceBetweenCoords(v.enter.x, v.enter.y, v.enter.z, GetEntityCoords(PlayerPedId()), true) < 1 then
					if v.occupied[1] then
						fsn_drawText3D(v.enter.x, v.enter.y, v.enter.z-0.6, v.occupied[4][1].." / "..v.occupied[4][2], 255, 255, 255)
						DrawMarker(25,v.enter.x, v.enter.y, v.enter.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 255, 0, 0, 10, 0, 0, 2, 0, 0, 0, 0)
						fsn_drawText3D(v.enter.x, v.enter.y, v.enter.z, "This bed is occupied by: "..v.occupied[2], 255, 255, 255)
						if exports["fsn_police"].fsn_PDDuty() then
							if v.occupied[3] then
								fsn_drawText3D(v.enter.x, v.enter.y, v.enter.z-0.1, "[E] Release restraints", 66, 209, 244)
								if IsControlJustPressed(0, 51) then
									while not HasAnimDictLoaded('mp_arresting') do
										RequestAnimDict('mp_arresting')
										Citizen.Wait(5)
									end
									TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_arrest_on_floor', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
									TriggerServerEvent('fsn_ems:bed:restraintoggle', k)
								end
							else
								fsn_drawText3D(v.enter.x, v.enter.y, v.enter.z-0.1, "[E] Restrain to bed", 66, 209, 244)
								if IsControlJustPressed(0, 51) then
									while not HasAnimDictLoaded('mp_arresting') do
										RequestAnimDict('mp_arresting')
										Citizen.Wait(5)
									end
									TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_arrest_on_floor', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
									TriggerServerEvent('fsn_ems:bed:restraintoggle', k)
								end
							end 
						end
						if emsonduty then
							fsn_drawText3D(v.enter.x, v.enter.y, v.enter.z-0.1, "[E] Attend patient", 66, 209, 244)
							if IsControlJustPressed(0, 51) then
								ExecuteCommand('ems revive '..v.occupied[2])
							end
						end
					else
						DrawMarker(25,v.enter.x, v.enter.y, v.enter.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 255, 255, 255, 140, 0, 0, 2, 0, 0, 0, 0)
						fsn_drawText3D(v.enter.x, v.enter.y, v.enter.z, "[E] Enter bed", 255, 255, 255)
						if IsControlJustPressed(0, 51) then
							TriggerServerEvent('fsn_ems:bed:occupy', k)
							if fsn_IsDead() then
								TriggerEvent('fsn_ems:reviveMe')
							end
							DoScreenFadeOut(1000)
							Citizen.Wait(1010)
							SetEntityCoords(PlayerPedId(), v.bed.x, v.bed.y, v.bed.z)
							SetEntityHeading(PlayerPedId(), v.bed.h)
							ExecuteCommand("e sleep")
							inbed = true
							mybed = k
							Citizen.Wait(1500)
							DoScreenFadeIn(2000)
						end
					end
				end
			end
		end
	end
end)