function getVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end
function fsn_lookingAt()
	local targetVehicle = false

	local coordA = GetEntityCoords(PlayerPedId(), 1)
	local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, -1.0)
	targetVehicle = getVehicleInDirection(coordA, coordB)

	return targetVehicle
end

function fsn_NearestPlayersC(x, y, z, radius)
	local players = {}
	for _, id in ipairs(GetActivePlayers()) do --for id = 0, 128 do
		local ppos = GetEntityCoords(GetPlayerPed(id))
		if GetDistanceBetweenCoords(ppos.x, ppos.y, ppos.z, x, y, z) < radius then
			table.insert(players, #players+1, id)
		end
	end
end

function fsn_NearestPlayersS(x, y, z, radius)
	local players = {}
	for id = 0, 128 do
		local ppos = GetEntityCoords(GetPlayerPed(id))
		if GetDistanceBetweenCoords(ppos.x, ppos.y, ppos.z, x, y, z) < radius then
			table.insert(players, #players+1, GetPlayerServerId(id))
		end
	end
	return players
end
function loadAnim( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------
-- CLOTHING COMMANDS
-------------------------------------------------------------------------------------------------------------------------------------------------
local mask = {
	id = 0,
	txt = 0,
	pal = 0
}
RegisterNetEvent('fsn_commands:clothing:mask')
AddEventHandler('fsn_commands:clothing:mask', function()
	if mask.id ~= 0 then
		SetPedComponentVariation(PlayerPedId(), 1, mask.id, mask.txt, mask.pal)
		mask.id = 0
		mask.txt = 0
		mask.pal = 0
		---
		local pos = GetEntityCoords(PlayerPedId())
		local players = fsn_NearestPlayersS(pos.x, pos.y, pos.z, 10)
		TriggerServerEvent('fsn_commands:me', 'puts their mask on', players)
	else
		mask.id = GetPedDrawableVariation(PlayerPedId(), 1)
		mask.txt = GetPedTextureVariation(PlayerPedId(), 1)
		mask.pal = GetPedPaletteVariation(PlayerPedId(), 1)
		SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0)
		---
		local pos = GetEntityCoords(PlayerPedId())
		local players = fsn_NearestPlayersS(pos.x, pos.y, pos.z, 10)
		TriggerServerEvent('fsn_commands:me', 'takes their mask off', players)
	end
end)

local hat = {
	id = 0,
	txt = 0
}
RegisterNetEvent('fsn_commands:clothing:hat')
AddEventHandler('fsn_commands:clothing:hat', function()
	if hat.id ~= 0 then
		SetPedPropIndex(PlayerPedId(), 0, hat.id, hat.txt, 0, true)
		hat.id = 0
		hat.txt = 0
		---
		local pos = GetEntityCoords(PlayerPedId())
		local players = fsn_NearestPlayersS(pos.x, pos.y, pos.z, 10)
		TriggerServerEvent('fsn_commands:me', 'puts their hat on', players)
	else
		hat.id = GetPedPropIndex(PlayerPedId(), 0)
		hat.txt = GetPedPropTextureIndex(PlayerPedId(), 0)
		SetPedPropIndex(PlayerPedId(), 0, 11, 0, true)
		---
		local pos = GetEntityCoords(PlayerPedId())
		local players = fsn_NearestPlayersS(pos.x, pos.y, pos.z, 10)
		TriggerServerEvent('fsn_commands:me', 'takes their hat off', players)
	end
end)

local glasses = {
	id = 0,
	txt = 0
}
RegisterNetEvent('fsn_commands:clothing:glasses')
AddEventHandler('fsn_commands:clothing:glasses', function()
	if glasses.id ~= 0 then
		SetPedPropIndex(PlayerPedId(), 1, glasses.id, glasses.txt, 0, true)
		glasses.id = 0
		glasses.txt = 0
		---
		local pos = GetEntityCoords(PlayerPedId())
		local players = fsn_NearestPlayersS(pos.x, pos.y, pos.z, 10)
		TriggerServerEvent('fsn_commands:me', 'puts their glasses on', players)
	else
		glasses.id = GetPedPropIndex(PlayerPedId(), 1)
		glasses.txt = GetPedPropTextureIndex(PlayerPedId(), 1)
		SetPedPropIndex(PlayerPedId(), 1, 0, 0, true)
		---
		local pos = GetEntityCoords(PlayerPedId())
		local players = fsn_NearestPlayersS(pos.x, pos.y, pos.z, 10)
		TriggerServerEvent('fsn_commands:me', 'takes their glasses off', players)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE COMMANDS
-------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('fsn_commands:service:pingAccept')
AddEventHandler('fsn_commands:service:pingAccept', function(ping)
	SetNewWaypoint(ping.loc.x, ping.loc.y)
	exports['mythic_notify']:DoCustomHudText('success', 'Ping accepted. Waypoint updated.', 5000)
end)
RegisterNetEvent('fsn_commands:service:pingStart')
AddEventHandler('fsn_commands:service:pingStart', function(to)
	TriggerServerEvent('fsn_commands:service:addPing', {x=GetEntityCoords(PlayerPedId()).x, y=GetEntityCoords(PlayerPedId()).y, z=GetEntityCoords(PlayerPedId()).z}, to)
end)
RegisterNetEvent('fsn_commands:service:request')
AddEventHandler('fsn_commands:service:request', function(type)
	local tbl = {x = GetEntityCoords(PlayerPedId()).x, y = GetEntityCoords(PlayerPedId()).y, z = GetEntityCoords(PlayerPedId()).z}
	TriggerServerEvent('fsn_commands:service:sendrequest', type, tbl)
end)
-------------------------------------------------------------------------------------------------------------------------------------------------
-- MISC COMMANDS
-------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('fsn_commands:vehdoor:open')
AddEventHandler('fsn_commands:vehdoor:open', function(id)
	local veh = fsn_lookingAt()
	if IsPedInAnyVehicle(PlayerPedId()) then
		veh = GetVehiclePedIsIn(PlayerPedId(),false)		
	end
	if veh then
		while not NetworkHasControlOfEntity(veh) do
			print'requestingcontrol'
			NetworkRequestControlOfEntity(veh)
			Citizen.Wait(1)
		end
		print'gotcontrol'
		SetVehicleDoorOpen(veh, id, false, false)
		--SetVehicleDoorShut(veh, id, false)
	end
end)
RegisterNetEvent('fsn_commands:vehdoor:close')
AddEventHandler('fsn_commands:vehdoor:close', function(id)
	local veh = fsn_lookingAt()
	if IsPedInAnyVehicle(PlayerPedId()) then
		veh = GetVehiclePedIsIn(PlayerPedId(),false)		
	end
	if veh then
		while not NetworkHasControlOfEntity(veh) do
			print'requestingcontrol'
			NetworkRequestControlOfEntity(veh)
			Citizen.Wait(1)
		end
		print'gotcontrol'
		--SetVehicleDoorOpen(car, id, false, false)
		SetVehicleDoorShut(veh, id, false)
	end
end)
RegisterNetEvent('fsn_commands:window')
AddEventHandler('fsn_commands:window', function()
	RollDownWindow(GetVehiclePedIsIn(PlayerPedId(), false), 0)
end)

RegisterNetEvent('fsn_commands:hc:takephone')
AddEventHandler('fsn_commands:hc:takephone', function()
	TriggerEvent('fsn_notify:displayNotification', 'Your phone has been taken!', 'centerRight', 8000, 'success')
	if exports.fsn_inventory:fsn_HasItem('phone') then
		TriggerEvent('fsn_inventory:item:take', 'phone', 1)
	end
end)
RegisterNetEvent('fsn_commands:getHDC')
AddEventHandler('fsn_commands:getHDC', function(hdc)
	handcuffcommand = hdc
end)
function fsn_getHDC()
	return handcuffcommand
end

AddEventHandler('fsn_main:character', function()
	TriggerServerEvent('fsn_commands:requestHDC')
end)

RegisterNetEvent('fsn_commands:dropweapon')
AddEventHandler('fsn_commands:dropweapon', function()
	if exports.fsn_ems:fsn_IsDead() then
			TriggerEvent('fsn_notify:displayNotification', 'Mate, you\'re downed, don\'t be so stupid.', 'centerLeft', 4000, 'error')
	else
		if GetSelectedPedWeapon(PlayerPedId()) ~= -1569615261 then
			RemoveWeaponFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()))
			TriggerEvent('fsn_notify:displayNotification', 'Weapon dropped', 'centerLeft', 4000, 'success')
		else
			TriggerEvent('fsn_notify:displayNotification', 'You cannot drop your fists!!', 'centerLeft', 4000, 'error')
		end
	end
end)

RegisterNetEvent('fsn_commands:walk:set')
AddEventHandler('fsn_commands:walk:set', function(src, set)
	if src == GetPlayerServerId(PlayerId()) then
		ResetPedMovementClipset(PlayerPedId(), 0.0)
		if set ~= 'reset' then
			SetPedMovementClipset(PlayerPedId(), set, 0)
		end
	else
		ResetPedMovementClipset(GetPlayerPed(GetPlayerFromServerId(src)), 0.0)
		if set ~= 'reset' then
			SetPedMovementClipset(GetPlayerPed(GetPlayerFromServerId(src)), set, 0)
		end
	end
end)

RegisterNetEvent('fsn_commands:me')
AddEventHandler('fsn_commands:me', function(action)
	local pos = GetEntityCoords(PlayerPedId())
	local players = fsn_NearestPlayersS(pos.x, pos.y, pos.z, 10)
	TriggerServerEvent('fsn_commands:me', action, players)
end)


function fsn_drawTextMe3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.3, 0.3)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 140)
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
RegisterNetEvent('fsn_commands:me:3d')
AddEventHandler('fsn_commands:me:3d', function(player, action)
	Citizen.CreateThread(function()
		local mestarttime = exports["fsn_main"]:fsn_GetTime()
		while true do
			Citizen.Wait(0)
			local ped = GetPlayerPed(GetPlayerFromServerId(player))
			local pos = GetEntityCoords(ped)
			if mestarttime+8 > exports["fsn_main"]:fsn_GetTime() then
				fsn_drawTextMe3D(pos.x,pos.y,pos.z, action)
			else
				break
			end
		end
	end)
end)

RegisterNetEvent('fsn_commands:sendxyz')
AddEventHandler('fsn_commands:sendxyz', function()
  local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
  TriggerServerEvent('fsn_commands:printxyz', x, y, z, GetEntityHeading(PlayerPedId()))
end)


RegisterNetEvent('fsn_commands:airlift')
AddEventHandler('fsn_commands:airlift', function()
	exports.fsn_ems:fsn_Airlift()
end)
-------------------------------------------------------------------------------------------------------------------------------------------------
-- DEV COMMANDS
-------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('fsn_commands:dev:spawnCar')
AddEventHandler('fsn_commands:dev:spawnCar', function(car)
  local myPed = PlayerPedId()
  local player = PlayerId()
  local vehicle = GetHashKey(car)
  RequestModel(vehicle)
  while not HasModelLoaded(vehicle) do
    Wait(1)
  end
  local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 5.0, 0)
  local spawned_car = CreateVehicle(vehicle, coords, GetEntityHeading(myPed), true, true)
  SetVehicleOnGroundProperly(spawned_car)
  SetModelAsNoLongerNeeded(vehicle)
	SetEntityAsMissionEntity(spawned_car, false, true)
  Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(spawned_car))
	TriggerEvent('fsn_cargarage:makeMine', spawned_car, GetDisplayNameFromVehicleModel(GetEntityModel(spawned_car)), GetVehicleNumberPlateText(spawned_car))
	TriggerEvent('fsn_notify:displayNotification', 'You now own this vehicle!', 'centerLeft', 4000, 'success')
	TriggerEvent('fsn_notify:displayNotification', 'You spawned '..car, 'centerLeft', 2000, 'info')
end)

RegisterNetEvent('fsn_commands:dev:weapon')
AddEventHandler('fsn_commands:dev:weapon', function(wep, addtoChar)
	if addtoChar == 'false' then
		GiveWeaponToPed(PlayerPedId(), GetHashKey(wep), 200)
		SetCurrentPedWeapon(PlayerPedId(), GetHashKey(wep), true)
	else
		TriggerEvent('fsn_criminalmisc:weapons:add:unknown', GetHashKey(wep), 200)
	end
end)

RegisterNetEvent('fsn_commands:dev:fix')
AddEventHandler('fsn_commands:dev:fix', function()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		TriggerEvent('fsn_fuel:update', vehicle, 100.0)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
		SetVehicleDirtLevel(vehicle, 0)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICE COMMANDS
-------------------------------------------------------------------------------------------------------------------------------------------------
function IsPDCar(veh)
	if GetVehicleClass(veh) == 18 then
		return true
	else
		return false
	end
end

policeWeapons = {
	['WEAPON_CARBINERIFLE'] = {
		index = "WEAPON_CARBINERIFLE",
		name = "Carbine Rifle",
		amt = 1,
		customData = {
			weapon = 'true',
			ammo = 200,
			ammotype = 'rifle_ammo',
			quality = 'normal',
			Serial = 'PoliceIssued'
		}
	  },
	  ['WEAPON_PUMPSHOTGUN'] = {
		index = "WEAPON_PUMPSHOTGUN",
		name = "Pump Shotgun",
		amt = 1,
		customData = {
			weapon = 'true',
			ammo = 200,
			ammotype = 'shotgun_ammo',
			quality = 'normal',
			Serial = 'PoliceIssued'
		}
	  },

}

RegisterNetEvent('fsn_commands:police:shotgun')
AddEventHandler('fsn_commands:police:shotgun', function()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		--[[
		local car = GetVehiclePedIsIn(PlayerPedId())
		local d1,d2 = GetModelDimensions(GetEntityModel(car))
        local moveto = GetOffsetFromEntityInWorldCoords(car, 0.0,d1["y"]-0.5,0.0)
		if GetDistanceBetweenCoords(moveto, GetEntityCoords(PlayerPedId()), true) < 2 then
			exports["fsn_progress"]:fsn_ProgressBar(58, 133, 255,'UNHOLSTERING',6)
			--TaskOpenVehicleDoor(PlayerPedId(), car, 6000, 5, 8.0)
			SetVehicleDoorOpen(car, 5, false, false)
			FreezeEntityPosition(PlayerPedId(), true)
			Citizen.Wait(6000)
			FreezeEntityPosition(PlayerPedId(), false)
			SetVehicleDoorShut(car, 5, false)
			TriggerEvent('fsn_criminalmisc:weapons:add:police', GetHashKey('WEAPON_PUMPSHOTGUN'), 250)
		else
			TriggerEvent('fsn_notify:displayNotification', 'Go to the back of the car', 'centerLeft', 4000, 'error')
		end
		]]--
		TriggerEvent('fsn_notify:displayNotification', 'Go to the back of the car', 'centerLeft', 4000, 'error')
	elseif fsn_lookingAt() then
		local car = fsn_lookingAt()
		local d1,d2 = GetModelDimensions(GetEntityModel(car))
        local moveto = GetOffsetFromEntityInWorldCoords(car, 0.0,d1["y"]-0.5,0.0)
		if GetDistanceBetweenCoords(moveto, GetEntityCoords(PlayerPedId()), true) < 2 then
			exports["fsn_progress"]:fsn_ProgressBar(58, 133, 255,'UNHOLSTERING',6)
			--TaskOpenVehicleDoor(PlayerPedId(), car, 6000, 5, 8.0)
			SetVehicleDoorOpen(car, 5, false, false)
			FreezeEntityPosition(PlayerPedId(), true)
			Citizen.Wait(6000)
			FreezeEntityPosition(PlayerPedId(), false)
			SetVehicleDoorShut(car, 5, false)
			--TriggerEvent('fsn_criminalmisc:weapons:add:police', GetHashKey('WEAPON_PUMPSHOTGUN'), 250)
			local pweapon
			for k,v in pairs(policeWeapons) do
				if k == 'WEAPON_PUMPSHOTGUN' then
					pweapon = v
				end		
			end
			print(pweapon)
			TriggerEvent('fsn_inventory:items:add', pweapon, 1)
		else
			TriggerEvent('fsn_notify:displayNotification', 'Go to the back of the car', 'centerLeft', 4000, 'error')
		end
	else
		TriggerEvent('fsn_notify:displayNotification', 'You need to be looking at a police car!', 'centerLeft', 4000, 'error')
	end
end)

RegisterNetEvent('fsn_commands:police:rifle')
AddEventHandler('fsn_commands:police:rifle', function()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		--[[
		local car = GetVehiclePedIsIn(PlayerPedId())
		local d1,d2 = GetModelDimensions(GetEntityModel(car))
        local moveto = GetOffsetFromEntityInWorldCoords(car, 0.0,d1["y"]-0.5,0.0)
		if GetDistanceBetweenCoords(moveto, GetEntityCoords(PlayerPedId()), true) < 2 then
			exports["fsn_progress"]:fsn_ProgressBar(58, 133, 255,'UNHOLSTERING',6)
			--TaskOpenVehicleDoor(PlayerPedId(), car, 6000, 5, 8.0)
			SetVehicleDoorOpen(car, 5, false, false)
			FreezeEntityPosition(PlayerPedId(), true)
			Citizen.Wait(6000)
			FreezeEntityPosition(PlayerPedId(), false)
			SetVehicleDoorShut(car, 5, false)
			TriggerEvent('fsn_criminalmisc:weapons:add:police', GetHashKey('WEAPON_CARBINERIFLE'), 250)
		else
			TriggerEvent('fsn_notify:displayNotification', 'Go to the back of the car', 'centerLeft', 4000, 'error')
		end
		]]--
		TriggerEvent('fsn_notify:displayNotification', 'Go to the back of the car', 'centerLeft', 4000, 'error')
	elseif fsn_lookingAt() then
		local car = fsn_lookingAt()
		if IsPDCar(car) then
			local d1,d2 = GetModelDimensions(GetEntityModel(car))
			local moveto = GetOffsetFromEntityInWorldCoords(car, 0.0,d1["y"]-0.5,0.0)
			if GetDistanceBetweenCoords(moveto, GetEntityCoords(PlayerPedId()), true) < 2 then
				exports["fsn_progress"]:fsn_ProgressBar(58, 133, 255,'UNHOLSTERING',6)
				--TaskOpenVehicleDoor(PlayerPedId(), car, 6000, 5, 8.0)
				SetVehicleDoorOpen(car, 5, false, false)
				FreezeEntityPosition(PlayerPedId(), true)
				Citizen.Wait(6000)
				FreezeEntityPosition(PlayerPedId(), false)
				SetVehicleDoorShut(car, 5, false)
				--TriggerEvent('fsn_criminalmisc:weapons:add:police', GetHashKey('WEAPON_CARBINERIFLE'), 250)
				local pweapon
				for k,v in pairs(policeWeapons) do
					if k == 'WEAPON_CARBINERIFLE' then
						pweapon = v
					end		
				end
				print(pweapon)
				TriggerEvent('fsn_inventory:items:add', pweapon, 1)
			else
				TriggerEvent('fsn_notify:displayNotification', 'Go to the back of the car', 'centerLeft', 4000, 'error')
			end
		else
			TriggerEvent('fsn_notify:displayNotification', 'The car needs to be a PD car.', 'centerLeft', 4000, 'error')
		end
	else
		TriggerEvent('fsn_notify:displayNotification', 'You need to be looking at a police car!', 'centerLeft', 4000, 'error')
	end
end)

RegisterNetEvent('fsn_commands:police:towMark')
AddEventHandler('fsn_commands:police:towMark', function()
  if IsPedInAnyVehicle(PlayerPedId(), false) then
    local car = GetVehiclePedIsIn(PlayerPedId())
	ExecuteCommand('pd tow '..GetVehicleNumberPlateText(car))		
  else
    local car = fsn_lookingAt()
	ExecuteCommand('pd tow '..GetVehicleNumberPlateText(car))
  end
end)

RegisterNetEvent('fsn_commands:police:pedcarry')
AddEventHandler('fsn_commands:police:pedcarry', function()
	local ped = exports['fsn_main']:fsn_FindNearbyPed(2)
	local isPlayer=false
	for i = 0, 31 do
		if(ped == GetPlayerPed(i)) then
			  isPlayer = true
		end
	end
	if ped then
		if isPlayer then
			TriggerEvent('fsn_notify:displayNotification', 'You cannot carry a player', 'centerLeft', 4000, 'error')
		end
		loadAnim('anim@narcotics@trash')
		TaskPlayAnim(PlayerPedId(),'anim@narcotics@trash', 'drop_front',0.9, -8, 1500, 49, 3.0, 0, 0, 0) 
		TaskTurnPedToFaceEntity(PlayerPedId(), ped, 1.0)
		SetBlockingOfNonTemporaryEvents(ped, true)		
		SetPedSeeingRange(ped, 0.0)		
		SetPedHearingRange(ped, 0.0)		
		SetPedFleeAttributes(ped, 0, false)		
		SetPedKeepTask(ped, true)	
			loadAnim( "dead" ) 
			TaskPlayAnim(ped, "dead", "dead_f", 8.0, 8.0, -1, 1, 0, 0, 0, 0)
		DetachEntity(ped)
		ClearPedTasks(ped)
		loadAnim( "amb@world_human_bum_slumped@male@laying_on_left_side@base" ) 
		TaskPlayAnim(ped, "amb@world_human_bum_slumped@male@laying_on_left_side@base", "base", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
			AttachEntityToEntity(ped, PlayerPedId(), 1, -0.68, -0.2, 0.94, 180.0, 180.0, 60.0, 1, 1, 0, 1, 0, 1)
			loadAnim( "missfinale_c2mcs_1" ) 
			TaskPlayAnim(PlayerPedId(), "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 1.0, 1.0, -1, 50, 0, 0, 0, 0)
		local holdingBody = true
		ClearPedTasksImmediately(PlayerPedId())
		while (holdingBody) do
			Citizen.Wait(1)
			if not IsEntityPlayingAnim(PlayerPedId(), "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 3) then
				loadAnim( "missfinale_c2mcs_1" ) 
				TaskPlayAnim(PlayerPedId(), "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 1.0, 1.0, -1, 50, 0, 0, 0, 0)
			end
			if IsControlJustPressed(0, 38) or (GetHashKey("WEAPON_UNARMED") ~= GetSelectedPedWeapon(PlayerPedId()))  then
				holdingBody = false
				DetachEntity(ped)
			end
		end
		ClearPedTasks(PlayerPedId())	  
		DetachEntity(ped)
	else
		TriggerEvent('fsn_notify:displayNotification', 'No ped found', 'centerLeft', 4000, 'error')
	end
end)

RegisterNetEvent('fsn_commands:police:pedrevive')
AddEventHandler('fsn_commands:police:pedrevive', function()
	local ped = exports['fsn_main']:fsn_FindNearbyPed(2)
	if ped then
		local isPlayer=false
		for i = 0, 31 do
			if(ped == GetPlayerPed(i)) then
				  isPlayer = true
			end
		end
		if not isPlayer then
			SetEntityHealth(ped, 100)
			ResurrectPed(ped)
            ReviveInjuredPed(ped)
            ClearPedTasksImmediately(ped)
			TriggerEvent('fsn_notify:displayNotification', 'You revived the ped', 'centerLeft', 4000, 'success')
		else
			TriggerEvent('fsn_notify:displayNotification', 'You cannot revive a player with pedrevive', 'centerLeft', 4000, 'error')
		end
	else
		TriggerEvent('fsn_notify:displayNotification', 'No ped found', 'centerLeft', 4000, 'error')
	end
end)
RegisterNetEvent('fsn_commands:police:cpic:trigger')
AddEventHandler('fsn_commands:police:cpic:trigger', function(id)
	TriggerServerEvent('fsn_police:database:CPIC:search', id)
end)
RegisterNetEvent('fsn_commands:police:livery')
AddEventHandler('fsn_commands:police:livery', function(num)
	if IsPedInAnyVehicle(PlayerPedId()) then
		SetVehicleLivery(GetVehiclePedIsIn(PlayerPedId(), false), num)
	end
end)

RegisterNetEvent('fsn_commands:police:extras')
AddEventHandler('fsn_commands:police:extras', function()
	if IsPedInAnyVehicle(PlayerPedId()) then
		local veh = GetVehiclePedIsIn(PlayerPedId(), false)
		local a = 0
		TriggerEvent('chatMessage', 'FSN', {255,0,0}, '-----------------------------------------')
		repeat
			a = a + 1
			if DoesExtraExist(veh, a) then
				if IsVehicleExtraTurnedOn(veh, a) then
					TriggerEvent('chatMessage', 'FSN', {255,0,0}, 'Extra ID: '..a..' Toggle: true')
				else
						TriggerEvent('chatMessage', 'FSN', {255,0,0}, 'Extra ID: '..a..' Toggle: false')
				end
			end
    until( a > 25 )
		TriggerEvent('chatMessage', 'FSN', {255,0,0}, '-----------------------------------------')
	end
end)

RegisterNetEvent('fsn_commands:police:extra')
AddEventHandler('fsn_commands:police:extra', function(num)
	if IsPedInAnyVehicle(PlayerPedId()) then
		if num == 'all' then
			local a = 0
			repeat
				a = a + 1
				if IsVehicleExtraTurnedOn(GetVehiclePedIsIn(PlayerPedId(), false), a) then
					SetVehicleExtra(GetVehiclePedIsIn(PlayerPedId(), false), a, 1)
				else
					SetVehicleExtra(GetVehiclePedIsIn(PlayerPedId(), false), a, 0)
				end
	    until( a > 25 )
		else
			if IsVehicleExtraTurnedOn(GetVehiclePedIsIn(PlayerPedId(), false), tonumber(num)) then
				SetVehicleExtra(GetVehiclePedIsIn(PlayerPedId(), false), tonumber(num), 1)
				TriggerEvent('fsn_notify:displayNotification', 'Setting '..num..' to <b>OFF', 'centerLeft', 4000, 'success')
			else
				SetVehicleExtra(GetVehiclePedIsIn(PlayerPedId(), false), tonumber(num), 0)
				TriggerEvent('fsn_notify:displayNotification', 'Setting '..num..' to <b>ON', 'centerLeft', 4000, 'success')
			end
		end
	end
end)

RegisterNetEvent('fsn_commands:police:car')
AddEventHandler('fsn_commands:police:car', function(car)
  local myPed = PlayerPedId()
  local player = PlayerId()
  local vehicle = GetHashKey(car)
  RequestModel(vehicle)
  while not HasModelLoaded(vehicle) do
    Wait(1)
  end
  local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 5.0, 0)
  local spawned_car = CreateVehicle(vehicle, coords, GetEntityHeading(myPed), true, true)
  SetVehicleOnGroundProperly(spawned_car)
  SetModelAsNoLongerNeeded(vehicle)
	SetEntityAsMissionEntity(spawned_car, false, true)
  --Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(spawned_car))
	TriggerEvent('fsn_cargarage:makeMine', spawned_car, GetDisplayNameFromVehicleModel(GetEntityModel(spawned_car)), GetVehicleNumberPlateText(spawned_car))
	TriggerEvent('fsn_fuel:set', spawned_car, 100.0)
  TriggerEvent('fsn_notify:displayNotification', 'You spawned '..car, 'centerLeft', 2000, 'info')
	TriggerEvent('fsn_notify:displayNotification', 'You now own this vehicle!', 'centerLeft', 4000, 'success')
end)

RegisterNetEvent('fsn_commands:police:fix')
AddEventHandler('fsn_commands:police:fix', function()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		FreezeEntityPosition(vehicle, true)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
		SetVehicleDirtLevel(vehicle, 0)
		TriggerEvent('fsn_notify:displayNotification', 'Fabio came to fix & clean your car!', 'centerLeft', 2000, 'info')
		FreezeEntityPosition(vehicle, false)
	else
		TriggerClientEvent('chatMessage', ':FSN:', {255,0,0}, 'You aren\'t in a car!')
	end
end)

DecorRegister("fsn_police:car:booted")
RegisterNetEvent('fsn_commands:police:boot')
AddEventHandler('fsn_commands:police:boot', function()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
    local car = GetVehiclePedIsIn(PlayerPedId())
		TriggerEvent('fsn_notify:displayNotification', '<b>You <span style="color:#4abf52">added</span> a boot to this car', 'centerLeft', 3000, 'info')
		TriggerServerEvent('fsn_commands:police:booted', GetVehicleNumberPlateText(car), GetEntityModel(car))
  else
    local car = fsn_lookingAt()
		TriggerEvent('fsn_notify:displayNotification', '<b>You <span style="color:#4abf52">added</span> a boot to this car', 'centerLeft', 3000, 'info')
		TriggerServerEvent('fsn_commands:police:booted', GetVehicleNumberPlateText(car), GetEntityModel(car))
  end
end)

RegisterNetEvent('fsn_police:runplate:target')
AddEventHandler('fsn_police:runplate:target', function()
	local car = fsn_lookingAt()
	local plater = GetVehicleNumberPlateText(car)
	TriggerServerEvent('fsn_police:runplate::target', plater)
end)

RegisterNetEvent('fsn_commands:police:unboot')
AddEventHandler('fsn_commands:police:unboot', function()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
    local car = GetVehiclePedIsIn(PlayerPedId())
		TriggerEvent('fsn_notify:displayNotification', '<b>You <span style="color:#bf4d4a">removed</span> a boot from this car', 'centerLeft', 3000, 'info')
		TriggerServerEvent('fsn_commands:police:unbooted', GetVehicleNumberPlateText(car), GetEntityModel(car))
  else
    local car = fsn_lookingAt()
		TriggerEvent('fsn_notify:displayNotification', '<b>You <span style="color:#bf4d4a">removed</span> a boot from this car', 'centerLeft', 3000, 'info')
		TriggerServerEvent('fsn_commands:police:unbooted', GetVehicleNumberPlateText(car), GetEntityModel(car))
  end
end)

local booted_cars = {}
RegisterNetEvent('fsn_commands:police:updateBoot')
AddEventHandler('fsn_commands:police:updateBoot', function(plate, mdl, toggle)
	if toggle then
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local car = GetVehiclePedIsIn(PlayerPedId(), false)
			if plate == GetVehicleNumberPlateText(car) and mdl == GetEntityModel(car) then
				FreezeEntityPosition(car, true)
				TriggerEvent('fsn_notify:displayNotification', 'This car has been <b style="color:red">BOOTED', 'centerLeft', 3000, 'error')
			end
		end
		table.insert(booted_cars, #booted_cars+1, {plate=plate, mdl=mdl, status=toggle})
		TriggerEvent('fsn_notify:displayNotification', plate..' with '..mdl..' has been booted', 'centerLeft', 3000, 'info')
	else
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local car = GetVehiclePedIsIn(PlayerPedId(), false)
			if plate == GetVehicleNumberPlateText(car) and mdl == GetEntityModel(car) then
				FreezeEntityPosition(car, false)
				TriggerEvent('fsn_notify:displayNotification', 'This car has been <b style="color:green">UNBOOTED', 'centerLeft', 3000, 'error')
			end
		end
		for k, v in pairs(booted_cars) do
			if v.plate == plate and v.mdl == mdl then
				table.remove(booted_cars,k)
			end
		end
		TriggerEvent('fsn_notify:displayNotification', plate..' with '..mdl..' has been unbooted', 'centerLeft', 3000, 'info')
	end
end)

local boot_test = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local car = GetVehiclePedIsIn(PlayerPedId(), false)
			for k, v in pairs(booted_cars) do
				if v.plate == GetVehicleNumberPlateText(car) and v.mdl == GetEntityModel(car) then
					if not boot_test then
						FreezeEntityPosition(car, true)
						TriggerEvent('fsn_notify:displayNotification', 'This car has been <b style="color:red">BOOTED', 'centerLeft', 3000, 'error')
						boot_test = true
					end
				end
			end
			if not boot_test then
				FreezeEntityPosition(car, false)
				boot_test = true
			end
		else
			boot_test = false
		end
	end
end)

RegisterNetEvent('fsn_commands:police:impound')
AddEventHandler('fsn_commands:police:impound', function()
  if IsPedInAnyVehicle(PlayerPedId(), false) then
    local car = GetVehiclePedIsIn(PlayerPedId())
    SetEntityAsMissionEntity( car, false, true )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( car ) )
  else
    local car = fsn_lookingAt()
    SetEntityAsMissionEntity( car, false, true )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( car ) )
  end
end)

RegisterNetEvent('fsn_commands:police:impound2')
AddEventHandler('fsn_commands:police:impound2', function()
  if IsPedInAnyVehicle(PlayerPedId(), false) then
    local car = GetVehiclePedIsIn(PlayerPedId())
		TriggerServerEvent('fsn_cargarage:impound', GetVehicleNumberPlateText(car))
    SetEntityAsMissionEntity( car, false, true )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( car ) )
  else
    local car = fsn_lookingAt()
		TriggerServerEvent('fsn_cargarage:impound', GetVehicleNumberPlateText(car))
    SetEntityAsMissionEntity( car, false, true )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( car ) )
  end
end)
