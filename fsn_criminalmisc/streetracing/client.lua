local races = {}
local inrace = false
local myrace = 0
local myrace_xy = {}
local racestarted = false
local raceblip = false

RegisterNetEvent('fsn_criminalmisc:racing:createRace')
AddEventHandler('fsn_criminalmisc:racing:createRace', function()
	if IsWaypointActive() then
		local wypt = GetBlipInfoIdCoord(GetFirstBlipInfoId(8))
		local signup = 0 
		Citizen.CreateThread(function()
		  DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
		  local editOpen = true
		  while UpdateOnscreenKeyboard() == 0 or editOpen do
			Wait(0)
			drawTxt('How much is this race to enter?',4,1,0.5,0.30,0.7,255,255,255,255)
			drawTxt('~b~Minimum race fee of $500',4,1,0.5,0.35,0.4,255,255,255,255)
			drawTxt('~r~Races will expire 5 minutes after created',4,1,0.5,0.49,0.4,255,255,255,255)
			if UpdateOnscreenKeyboard() ~= 0 then
			  editOpen = false
			  if UpdateOnscreenKeyboard() == 1 then
				if tonumber(GetOnscreenKeyboardResult()) then
					signup = tonumber(GetOnscreenKeyboardResult())
					local pos = GetEntityCoords(PlayerPedId())
					local ex = pos.x
					local why = pos.y
					local zed = pos.z
					local name, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
					local name2, var2 = GetStreetNameAtCoord(wypt.x, wypt.y, 0, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
					TriggerServerEvent('fsn_criminalmisc:racing:newRace', signup, GetStreetNameFromHashKey(name), ex, why, zed, wypt.x, wypt.y, GetStreetNameFromHashKey(name2))
				else
					TriggerEvent('fsn_notify:displayNotification', 'You need to enter a number', 'centerRight', 4000, 'error')
				end
			  end
			  break
			end
		  end
		end)
	else
		TriggerEvent('fsn_notify:displayNotification', 'You do not have a waypoint set', 'centerLeft', 4000, 'error')
	end
end)

RegisterNetEvent('fsn_criminalmisc:racing:update')
AddEventHandler('fsn_criminalmisc:racing:update', function(tbl)
	races = tbl
end)

RegisterNetEvent('fsn_criminalmisc:racing:putmeinrace')
AddEventHandler('fsn_criminalmisc:racing:putmeinrace', function(id, members)
	for k, v in ipairs(races) do
		if v.race_id == id then
			ClearGpsPlayerWaypoint()
			SetWaypointOff()
			if raceblip then
				RemoveBlip(raceblip)
			end
			raceblip = AddBlipForCoord(v.finish.x, v.finish.y, 0.0)
			SetBlipSprite(raceblip, 38)
			SetBlipColour(raceblip, 3)
			SetBlipRouteColour(raceblip, 1)
			SetBlipRoute(raceblip,  true)
			inrace = true
			myrace_xy = v.finish
			myrace = k
		end
	end
	TriggerEvent('fsn_notify:displayNotification', 'You entered a race with '.. #members-1 ..' other people', 'centerRight', 4000, 'success')
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if inrace then
			if not races[myrace] then
				TriggerEvent('fsn_notify:displayNotification', 'You lost the race.', 'centerRight', 4000, 'error')
				if raceblip then
					RemoveBlip(raceblip)
				end
				SetNewWaypoint(myrace_xy.x,myrace_xy.y)
				myrace = 0
				inrace = false
				racestarted = false
			end
		end
		if IsPedInAnyVehicle(PlayerPedId()) then --and IsPedDiving(PlayerPedId()) then
			for key, race in ipairs(races) do
				if race.state == 1 then -- waiting for people
					if GetDistanceBetweenCoords(race.start.x, race.start.y, race.start.z, GetEntityCoords(PlayerPedId()), false) < 20 then
						if inrace then
							-- already in the race
							fsn_drawText3D(race.start.x, race.start.y, race.start.z, '~y~Waiting~w~ for other racers...\nMoving too far will ~r~forfeit~w~ your signup fee ($'..race.start.price..')! ')
						else
							if exports["fsn_main"]:fsn_CanAfford(race.start.price) then
								fsn_drawText3D(race.start.x, race.start.y, race.start.z, '[~g~E~w~] to join race ($'..race.start.price..')')
								if IsControlJustPressed(0, 38) then
									TriggerServerEvent('fsn_criminalmisc:racing:joinRace', race.race_id) 
								end
							else
								fsn_drawText3D(race.start.x, race.start.y, race.start.z, '~r~You cannot afford to join the race!')
							end
						end
					else
						if inrace then
							TriggerEvent('fsn_notify:displayNotification', 'You left the race.', 'centerRight', 4000, 'error')
							if raceblip then
								RemoveBlip(raceblip)
							end
							myrace = 0
							inrace = false
							racestarted = false
						end
					end
				elseif race.state == 2 and key == myrace then -- race starting 
					if GetDistanceBetweenCoords(race.start.x, race.start.y, race.start.z, GetEntityCoords(PlayerPedId()), false) < 20 then
						if inrace then
							-- already in the race
							fsn_drawText3D(race.start.x, race.start.y, race.start.z, '~g~The race will begin in less than 20 seconds!~w~\nMoving too far will ~r~forfeit~w~ your signup fee ($'..race.start.price..')! ')
						end
					else
						if inrace then
							TriggerEvent('fsn_notify:displayNotification', 'You left the race.', 'centerRight', 4000, 'error')
							if raceblip then
								RemoveBlip(raceblip)
							end
							myrace = 0
							inrace = false
							racestarted = false
						end
					end
				elseif race.state == 3 and key == myrace then -- race ongoing
					fsn_drawText3D(race.finish.x, race.finish.y, race.start.z, 'Race End')
					if GetDistanceBetweenCoords(race.finish.x, race.finish.y, GetEntityCoords(PlayerPedId())['x'], GetEntityCoords(PlayerPedId()), false) < 2 then
						 TriggerServerEvent('fsn_criminalmisc:racing:win', key)
						 if raceblip then
							RemoveBlip(raceblip)
						end
						myrace = 0
						inrace = false
						racestarted = false
					end
				elseif race.state == 4 and key == myrace then -- race ended
				else -- unknown state??
				
				end
			end
		end
	end
end)