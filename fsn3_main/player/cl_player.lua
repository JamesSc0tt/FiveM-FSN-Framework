local PLY = {}

PLY.ready = false

PLY.id = 'ERR'

PLY.init = function()
	-- freeze, hide & move player
	DoScreenFadeOut(500)
	SetEntityCoords(GetPlayerPed(-1), 228.2057, -1006.487, -98.999) -- send to char select area
	SetEntityHeading(GetPlayerPed(-1), 171.173) -- look away from the corner
	PlaceObjectOnGroundProperly(GetPlayerPed(-1))
	DoScreenFadeIn(500)
	
	SetEntityVisible(GetPlayerPed(-1), false)
	FreezeEntityPosition(GetPlayerPed(-1), true)
	SetPlayerInvincible(GetPlayerPed(-1), true)
	DoScreenFadeIn(500)

	TriggerServerEvent('fsn3:characters')
	--Citizen.Wait(500)
	while not PLY.ready do
		Citizen.Wait(0)
		HideHudAndRadarThisFrame()
		DisableAllControlActions(0)
		SetEntityVisible(GetPlayerPed(-1), false)
		FreezeEntityPosition(GetPlayerPed(-1), true)
		SetPlayerInvincible(GetPlayerPed(-1), true)
	end
end
RegisterNetEvent('fsn3:ply:init')
AddEventHandler('fsn3:ply:init', function(id)
	-- called when a player is forced to reset / spawn
	PLY.id = id
	PLY.init()
end)
Citizen.CreateThread(function()
	TriggerEvent('fsn3:ply:init', 12) 
end)


PLY.instanceinfo = {}
PLY.instance = function(action)
	switch({
		['check'] = function()
			if PLY.instance ~= {} then

			else
				print 'PLY is not in instance'
			end
		end,
	}, action)
end

PLY.reset = function()
	if PLY.ready then
		-- reset the player due to potential bugs.
		DoScreenFadeIn(500)
		FreezeEntityPosition(GetPlayerPed(-1), false)
		SetPlayerInvincible(GetPlayerPed(-1), false)
		SetEntityVisible(GetPlayerPed(-1), true)
		EnableAllControlActions(0)

		TriggerEvent("chat:addMessage", 'Player reset')
	else
		TriggerEvent("chat:addMessage", 'Your player is not initialised, please re-log')
	end
end
RegisterCommand("resetplayer", function()
	PLY.ready = true
	PLY.reset()
end, false)