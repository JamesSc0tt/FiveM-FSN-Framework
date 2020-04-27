local stores = {
	{id = 'liquorace', xyz = vector3(1392.3483886719, 3604.0036621094, 34.980926513672), blip=true, busy = false},

	{id = 'ltdgas', xyz = vector3(1698.4125976563, 4924.998046875, 42.063678741455), blip=true, busy = false},
  	{id = 'ltdgas', xyz = vector3(-707.94940185547, -914.28442382813, 19.215589523315), blip=true, busy = false},
  	{id = 'ltdgas', xyz = vector3(1163.341796875, -323.94161987305, 69.205139160156), blip=true, busy = false},
	{id = 'ltdgas', xyz = vector3(-48.42569732666, -1757.5212402344, 29.420993804932), blip=true, busy = false},
	  
	{id = 'robsliquor', xyz = vector3(-1487.6705322266, -379.61917114258, 40.163394927979), blip=true, busy = false},
	{id = 'robsliquor', xyz = vector3(-2968.5520019531, 390.56546020508, 15.043312072754), blip=true, busy = false},
	{id = 'robsliquor', xyz = vector3(1166.4477539063, 2708.3881835938, 38.157699584961), blip=true, busy = false},
	{id = 'robsliquor', xyz = vector3(1136.1823730469, -981.75445556641, 46.415802001953), blip=true, busy = false},
	{id = 'robsliquor', xyz = vector3(-1223.4569091797, -906.90423583984, 12.3263463974), blip=true, busy = false},
	  
	{id = 'twentyfourseven', xyz = vector3(25.816429138184, -1347.3413085938, 29.497024536133), blip=true, busy = false},
  	{id = 'twentyfourseven', xyz = vector3(374.22787475586, 326.03570556641, 103.56636810303), blip=true, busy = false},
  	{id = 'twentyfourseven', xyz = vector3(-3242.7116699219, 1001.4896240234, 12.830704689026), blip=true, busy = false},
  	{id = 'twentyfourseven', xyz = vector3(1961.62890625, 3741.0764160156, 32.343776702881), blip=true, busy = false},
  	{id = 'twentyfourseven', xyz = vector3(1730.2172851563, 6415.9599609375, 35.037227630615), blip=true, busy = false},
  	{id = 'twentyfourseven', xyz = vector3(2678.9938964844, 3281.0151367188, 55.241138458252), blip=true, busy = false},
  	{id = 'twentyfourseven', xyz = vector3(2557.4074707031, 382.74633789063, 108.62294769287), blip=true, busy = false},

  	{id = 'pillbox', xyz = vector3(316.72573852539, -588.17431640625, 43.291801452637), blip=false, busy = false}
}

Util.Tick(function()
	for k, s in pairs(stores) do
		local playerPed = GetPlayerPed(-1)
		local playerPos = GetEntityCoords(playerPed)
		local storeCoords = s.xyz
		local dist = Util.GetVecDist(playerPos, storeCoords)

		if dist < 10.0 then
			DrawMarker(25, s.xyz.x,s.xyz.y,s.xyz.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
			if dist < 2.0 then
				if not s.busy then
					Util.DrawText3D(s.xyz.x, s.xyz.y, s.xyz.z, '[ E ] Access Store',{255,255,255,200}, 0.25)
					if IsControlJustReleased(0, Util.GetKeyNumber('E')) then
						TriggerServerEvent('fsn_store:request', s.id)
					end
				else
					Util.DrawText3D(s.xyz.x, s.xyz.y, s.xyz.z, '~r~ Store in use\n Please try again later',{255,255,255,200}, 0.25)
				end
			end
		end
	end
end)
		

Citizen.CreateThread( function()
  for k, store in pairs(stores) do
	if store.blip then 
		local blip = AddBlipForCoord(store.xyz.x, store.xyz.y, store.xyz.z)
		SetBlipSprite(blip, 52)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Store")
		EndTextCommandSetBlipName(blip)
	end 
  end
end )

local storekeepers = {
	{x = -705.81408691406, y = -914.63317871094, z = 19.215587615967, h = 88.849708557129, ped = false},
	{x = -46.755832672119, y = -1758.6920166016, z = 29.421007156372, h = 50.685424804688, ped = false},
	{x = 24.2922706604, y = -1347.4547119141, z = 29.497022628784, h = 270.94165039063, ped = false},
	{x = -1222.3319091797, y = -908.91625976563, z = 12.326347351074, h = 26.143705368042, ped = false},
	{x = -1486.1457519531, y = -377.66079711914, z = 40.163425445557, h = 139.18792724609, ped = false},
	{x = 372.76062011719, y = 328.07223510742, z = 103.56637573242, h = 249.64683532715, ped = false},
	{x = 1164.9409179688, y = -323.45886230469, z = 69.205146789551, h = 97.392929077148, ped = false},
	{x = 1133.9039306641, y = -982.02099609375, z = 46.415802001953, h = 271.70544433594, ped = false},
	{x = 1959.0269775391, y = 3741.3435058594, z = 32.343746185303, h = 299.91790771484, ped = false},
	{x = 1166.1110839844, y = 2710.9475097656, z = 38.157703399658, h = 176.98136901855, ped = false},
	{x = 1392.1517333984, y = 3606.2194824219, z = 34.980926513672, h = 201.22804260254, ped = false},
	{x = 1697.9591064453, y = 4922.5615234375, z = 42.063674926758, h = 326.3063659668, ped = false},
	{x = 316.4407043457, y = -587.11462402344, z = 43.291835784912, h = 184.49844360352, ped = false}
}
local robbing = false
local robbingstart = 0
local lastrob = 0
local curtime = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		curtime = curtime+1
	end
end)
Citizen.CreateThread(function()
	Citizen.Wait(10000)
	while true do
		Citizen.Wait(0)
		for k,v in pairs(storekeepers) do
			if GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
				if v.ped then
					if IsPlayerFreeAiming(PlayerId()) and IsPlayerFreeAimingAtEntity(PlayerId(), v.ped) then
						if robbing then
							TaskStandStill(v.ped, 3000)
							TaskCower(v.ped, 3000)
							if not IsEntityPlayingAnim(v.ped, 'random@mugging3', "handsup_standing_base", 3) then
								RequestAnimDict('random@mugging3')
								TaskPlayAnim(v.ped, "random@mugging3", "handsup_standing_base", 4.0, -4, -1, 49, 0, 0, 0, 0)
							end
							local maff = robbingstart + 30
							if maff < curtime then
								robbing = false
								TriggerEvent('fsn_bank:change:walletAdd', math.random(100, 600))
								TriggerEvent('fsn_inventory:item:add', 'dirty_money', math.random(500,1000))
								Citizen.Wait(4000)
							end
						elseif not IsPedInCombat(v.ped) then
							local quickmaff = lastrob + 1800
							if quickmaff < curtime or lastrob == 0 then
								if math.random(0,100) > 20 then
									TaskStandStill(v.ped, 3000)
									TaskCower(v.ped, 3000)
									SetPedSweat(v.ped, 100.0)
									robbing = true
									TriggerEvent('fsn_notify:displayNotification', 'Robbing...', 'centerLeft', 6000, 'info')
									exports["fsn_progress"]:fsn_ProgressBar(58, 133, 255,'ROBBING',30)
									robbingstart = curtime
									lastrob = curtime
									if not IsEntityPlayingAnim(v.ped, 'random@mugging3', "handsup_standing_base", 3) then
										RequestAnimDict('random@mugging3')
										TaskPlayAnim(v.ped, "random@mugging3", "handsup_standing_base", 4.0, -4, -1, 49, 0, 0, 0, 0)
									end
									if math.random(0,100) > 30 then
										local pos = GetEntityCoords(GetPlayerPed(-1))
										local coords = {
										 x = pos.x,
										 y = pos.y,
										 z = pos.z
										}
										TriggerServerEvent('fsn_police:dispatch', coords, 12, '10-31b | ARMED ROBBERY IN PROGRESS')
									end
								else
									TaskCombatPed(v.ped, GetPlayerPed(-1), 0, 16)
									if math.random(0,100) > 30 then
										local pos = GetEntityCoords(GetPlayerPed(-1))
										local coords = {
										 x = pos.x,
										 y = pos.y,
										 z = pos.z
										}
										TriggerServerEvent('fsn_police:dispatch', coords, 12, '10-31b | ARMED ROBBERY IN PROGRESS')
									end
									robbing = false
								end
							else
								TriggerEvent('fsn_notify:displayNotification', 'You can\'t do that yet!', 'centerLeft', 6000, 'info')
								local pos = GetEntityCoords(GetPlayerPed(-1))
								local coords = {
								 x = pos.x,
								 y = pos.y,
								 z = pos.z
								}
								TriggerServerEvent('fsn_police:dispatch', coords, 12, '10-31b | Attempted armed store robbery')
								Citizen.Wait(6000)
							end
						end
					else
						if robbing then
							exports["fsn_progress"]:removeBar()
							TriggerEvent('fsn_notify:displayNotification', 'You failed...', 'centerLeft', 6000, 'error')
							robbing = false
							Citizen.Wait(6000)
						end
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(10000)
	while true do Citizen.Wait(0)
		for k,v in pairs(storekeepers) do
			if GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
				if exports["fsn_entfinder"]:getPedNearCoords(v.x, v.y, v.z,5) then
					if GetEntityModel(exports["fsn_entfinder"]:getPedNearCoords(v.x, v.y, v.z,5)) == 416176080 then
						v.ped = exports["fsn_entfinder"]:getPedNearCoords(v.x, v.y, v.z,5)
						fsn_drawText3D(GetEntityCoords(v.ped).x, GetEntityCoords(v.ped).y, GetEntityCoords(v.ped).z, '~w~ ')
					else
						if v.ped then
							if not IsPedFleeing(v.ped) and not IsPedFleeing(v.ped) then
								v.ped = false
							end
						end
					end
					--v.ped = exports['fsn_main']:fsn_FindPedNearbyCoords(v.x, v.y, v.z,5)
				else
					if not v.ped then
						RequestModel(416176080)
						while not HasModelLoaded(416176080) do
							Wait(1)
						end
						v.ped = CreatePed(5, 416176080, v.x, v.y, v.z, true, true)
						SetEntityHeading(v.ped, v.h)
					elseif GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(v.ped, true)) < 50 then
						if not IsPedInCombat(v.ped) and not IsPedFleeing(v.ped) then
							RequestModel(416176080)
							while not HasModelLoaded(416176080) do
								Wait(1)
							end
							v.ped = CreatePed(5, 416176080, v.x, v.y, v.z, true, true)
							SetEntityHeading(v.ped, v.h)
						end
					end
				end
			end
		end
	end
end)
