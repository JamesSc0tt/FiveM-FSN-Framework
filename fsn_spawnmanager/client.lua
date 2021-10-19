local my_char = false 
local locs = {
	{ name = 'Apartment', ["x"] = 312.96966552734,["y"] = -218.2705078125, ["z"] = 54.221797943115, h = 282.91 },
	{ name = 'Los Santos Airport', x = -1037.74, y = -2738.04, z = 20.1693, h = 282.91 },
	{ name = 'Bus Station', x = 454.349, y = -661.036, z = 27.6534, h = 282.91 },
	{ name = 'Train Station', x = -206.674, y = -1015.1, z = 30.1381, h = 282.91 },
	{ name = 'Paleto', x = -215.027, y = 6218.83, z = 31.4915, h = 282.91 },
	{ name = 'Sandy Shores', x = 1955.54, y = 3843.48, z = 32.0165, h = 282.91 },
	{ name = 'Pier', x = -1686.61, y = -1068.16, z = 13.1522, h = 282.91 },
	{ name = 'Legion Square', x = 238.69, y = -762.66, z = 30.82, h = 158.23 },
	{ name = 'Vinewood', x = 280.571, y = 182.679, z = 104.504, h = 282.91 },
}

local busy = false
local script_cam = false

function camToLoc(key)
	while busy do Citizen.Wait(1) end
	busy = true
	SendNUIMessage({
		hide = true
	})

	DoScreenFadeOut(1000)
	Citizen.Wait(800)
	RenderScriptCams(false, true, 500, true, true)
	SetEntityCoords(PlayerPedId(),-505.09, -1224.11, 232.2)
	Citizen.Wait(200)
	DoScreenFadeIn(1000)
	Citizen.Wait(1001)

	local loc = locs[key]
	for k,v in pairs(locs) do
		if v.selected then
			v.selected = false
		end
		if k == key then
			v.selected = true
		end
	end
    local playerPed = PlayerPedId()
    SetEntityVisible(playerPed, false, 0)
    SetEntityCoords(playerPed, loc.x, loc.y, loc.z)
    FreezeEntityPosition(playerPed, true)
    RenderScriptCams(true,true,true,true,true)
    PlaySoundFrontend(-1, "CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", 1)
    startcam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(startcam, -505.09, -1224.11, 232.2)
    SetCamActive(startcam, true)
    PointCamAtCoord(startcam, loc.x, loc.y, loc.z+200)

    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(cam, loc.x, loc.y, loc.z+200)
    PointCamAtCoord(cam, loc.x, loc.y, loc.z+2)
    SetCamActiveWithInterp(cam, startcam, 3700, true, true)
    PlaySoundFrontend(-1, "CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", 1)
    Citizen.Wait(3700)
	PlaySoundFrontend(-1, "CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", 1)
    cam2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(cam2, loc.x, loc.y, loc.z+1)
    PointCamAtCoord(cam2, loc.x+10, loc.y, loc.z)
    SetCamActiveWithInterp(cam2, cam, 900, true, true)
    busy = false
    SendNUIMessage({
		locs = locs
	})
end



function openGUI(char)
	SendNUIMessage({
		locs = locs
	})
	SetNuiFocus(true,true)
end

RegisterNetEvent('fsn_spawnmanager:start')
AddEventHandler('fsn_spawnmanager:start', function(char)
    SetEntityVisible(PlayerPedId(), false, 0)
    if char then
		my_char = char
		TriggerEvent("clothes:spawn", json.decode(char.char_model))
	else
		print('skipping, charid: '..my_char.char_id)
		TriggerEvent("clothes:spawn", json.decode(my_char.char_model))
	end
	

	DoScreenFadeOut(1000)
	Citizen.Wait(900)
	SetEntityCoords(PlayerPedId(),-505.09, -1224.11, 232.2)
	FreezeEntityPosition(PlayerPedId(), true)
	SetEntityVisible(PlayerPedId(),false)
	Citizen.Wait(100)
	DoScreenFadeIn(1000)
	Citizen.Wait(1001)
	openGUI(my_char)
end)

RegisterNUICallback('camToLoc', function(data, cb)
	if data.loc then
		camToLoc(data.loc+1)
	end
end)

RegisterNUICallback('spawnAtLoc', function(data, cb)
	local spawnloc = false
	for k, v in pairs(locs) do
		if v.selected then
			spawnloc = locs[k]
		end	
	end
	if not spawnloc then
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Re-select your spawning location'})
	else
		DoScreenFadeOut(1000)
		Citizen.Wait(900)
		RenderScriptCams(false, true, 500, true, true)

		TriggerEvent('fsn_main:character', my_char)
		TriggerEvent('fsn_police:init', my_char.char_police)
		TriggerEvent('fsn_jail:init', my_char.char_id)
		TriggerEvent('fsn_inventory:initChar', my_char.char_inventory)
		TriggerEvent('fsn_bank:change:bankAdd', 0)
		TriggerEvent('fsn_ems:reviveMe:force')

		TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Spawn: '..spawnloc.name})
	
		TriggerServerEvent('fsn_apartments:getApartment', my_char.char_id)

		SendNUIMessage({
			hide = true
		})
		SetNuiFocus(false)

		--[[
		 spawn stuffs :)
		]]--

		SetEntityVisible(PlayerPedId(), true)
		FreezeEntityPosition(PlayerPedId(), false)

		--TriggerEvent('fsn->esx:clothing:spawn', json.decode(my_char.char_model))
		--TriggerEvent("clothes:spawn", json.decode(my_char.char_model))

		if spawnloc.name == 'Apartment' then
			exports['fsn_apartments']:EnterMyApartment()
			TriggerEvent('spawnme')
			TriggerEvent("clothes:spawn", json.decode(my_char.char_model))
		else
			SetEntityCoords(PlayerPedId(), spawnloc.x, spawnloc.y,spawnloc.z)
			TriggerEvent('spawnme')
			TriggerEvent("clothes:spawn", json.decode(my_char.char_model))
		end

		Citizen.Wait(100)
		DoScreenFadeIn(1000)
		Citizen.Wait(1001)
	end
end)

--[[
Citizen.CreateThread(function()
	Citizen.Wait(4000)
	TriggerEvent('fsn_spawnmanager:start', {})
end)
]]--