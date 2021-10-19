local vehicle_colours = {
	'Black',
	'Graphite',
	'Black Steel',
	'Silver',
	'Bluish Silver',
	'Rolled Steel',
	'Shadow Silver',
	'Stone Silver',
	'Midnight Silver',
	'Cast Iron Silver',
	'Anthractite Black',
	'Matte Black',
	'Matte Gray',
	'Light Gray',
	'Util Black',
	'Util Black Poly',
	'Util Dark Silver',
	'Util Silver',
	'Util Gun Metal',
	'Util Shadow Silver',
	'Worn Black',
	'Worn Graphite',
	'Worn Silver Gray',
	'Worn Silver',
	'Worn Blue Silver',
	'Worn Shadow Silver',
	'Red',
	'Torino Red',
	'Formula Red',
	'Blaze Red',
	'Grace Red',
	'Garnet Red',
	'Sunset Red',
	'Cabernet Red',
	'Candy Red',
	'Sunrise Orange',
	'Gold',
	'Orange',
	'Red',
	'Dark Red',
	'Matte Orange',
	'Yellow',
	'Util Red',
	'Util Bright Red',
	'Util Garnet Red',
	'Worn Red',
	'Worn Golden Red',
	'Worn Dark Red',
	'Dark Green',
	'Metallic Racing Green',
	'Sea Green',
	'Olive Green',
	'Bright Green',
	'Metalic Gasoline Green',
	'Matte Lime Green',
	'Dark Green',
	'Worn Green',
	'Worn Sea Wash',
	'Metallic Midnight Blue',
	'Metallic Dark Blue',
	'Galaxy Blue',
	'Dark Blue',
	'Saxon Blue',
	'Blue',
	'Mariner Blue',
	'Harbor Blue',
	'Diamond Blue',
	'Surf Blue',
	'Nautical Blue',
	'Ultra Blue',
	'Schafter Purple',
	'Metallic Ultra Blue',
	'Racing Blue',
	'Light Blue',
	'Util Midnight Blue',
	'Util Blue',
	'Util Sea Foam Blue',
	'Util Lightening Blue',
	'Util Maui Blue Poly',
	'Util Bright Blue',
	'Slate Blue',
	'Dark Blue',
	'Blue',
	'Matte Midnight Blue',
	'Worn Dark Blue',
	'Worn Blue',
	'Baby Blue',
	'Yellow',
	'Race Yellow',
	'Bronze',
	'Dew Yellow',
	'Metallic Lime',
	'Metalic Champagne',
	'Feltzer Brown',
	'Creek Brown',
	'Chocolate Brown',
	'Maple Brown',
	'Saddle Brown',
	'Straw Brown',
	'Moss Brown',
	'Bison Brown',
	'Woodbeech Brown',
	'Beechwood Brown',
	'Straw Brown',
	'Sandy Brown',
	'Bleached Brown',
	'Cream',
	'Util Brown',
	'Util Medium Brown',
	'Util Light Brown',
	'Ice White',
	'Frost White',
	'Worn Honey Beige',
	'Worn Brown',
	'Dark Brown',
	'Worn Straw Beige',
	'Brushed Steel',
	'Brushed Black Steel',
	'Brushed Alluminum',
	'Chrome',
	'Worn Off-White',
	'Util Off-White',
	'Worn Orange',
	'Worn Light Orange',
	'Pea Green',
	'Worn Taxi Yellow',
	'Police Blue',
	'Green',
	'Matte Brown',
	'Worn Orange',
	'Ice White',
	'Worn White',
	'Worn Olive Army Green',
	'Pure White',
	'Hot Pink',
	'Salmon Pink',
	'Pfistrer Pink',
	'Bright Orange',
	'Green',
	'Flourescent Blue',
	'Midnight Blue',
	'Midnight Purple',
	'Wine Red',
	'Hunter Green',
	'Bright Purple',
	'Midnight Purple',
	'Carbon Black',
	'Matte Purple',
	'Matte Dark Purple',
	'Metallic Lava Red',
	'Olive Green',
	'Matte Olive Orab',
	'Dark Earth',
	'Desert Tan',
	'Matte Foilage Green',
	'Default Alloy',
	'Epsilon Blue',
	'Pure Gold',
	'Brushed Gold',
	'Secret Gold'
}

OnAtEnter = false
UseKey = true
if UseKey then
	ToggleKey = 303
end

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

local vehicles = {}; RPWorking = true
myKeys = {}

RegisterNetEvent('fsn_vehiclecontrol:getKeys')
RegisterNetEvent('fsn_vehiclecontrol:giveKeys')
AddEventHandler('fsn_vehiclecontrol:getKeys', function(veh)
	if not table.contains(myKeys, GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))) then
		table.insert(myKeys, {GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)),true})
		TriggerEvent('fsn_notify:displayNotification', 'You got keys to this vehicle!', 'centerLeft', 5000, 'info')
	else
		TriggerEvent('fsn_notify:displayNotification', 'You already have keys to the vehicle', 'centerLeft', 5000, 'info')
	end
end)
AddEventHandler('fsn_vehiclecontrol:giveKeys', function()
	if IsPedInAnyVehicle(PlayerPedId()) then
		if exports.fsn_cargarage:fsn_IsVehicleOwner(GetVehiclePedIsIn(PlayerPedId(), false)) then
			local ply = false
			for _, id in ipairs(GetActivePlayers()) do --for id = 0, 32 do
	      if NetworkIsPlayerActive(id) then
	        ped = GetPlayerPed(id)
					if ped ~= PlayerPedId() then
						if GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(PlayerPedId())) < 5 then
							if IsPedInAnyVehicle(ped) and GetVehiclePedIsIn(ped, false) == GetVehiclePedIsIn(PlayerPedId(), false)then
								ply = id
							else
								TriggerEvent('fsn_notify:displayNotification', 'They have to be in the car too!!', 'centerLeft', 5000, 'info')
								return
							end
						end
					end
				end
			end
			if ply then
				TriggerServerEvent('fsn_vehiclecontrol:givekeys', GetVehiclePedIsIn(PlayerPedId(), false), GetPlayerServerId(ply))
				TriggerEvent('fsn_notify:displayNotification', ':FSN: You gave keys to: '..ply, 'centerRight', 5000, 'info')
			else
				TriggerEvent('fsn_notify:displayNotification', 'Nobody detected :(<br>You have no friends', 'centerRight', 5000, 'info')
			end
		else
			TriggerEvent('fsn_notify:displayNotification', 'You cannot give keys to a vehicle you do not own', 'centerLeft', 5000, 'info')
		end
	else
		TriggerEvent('fsn_notify:displayNotification', 'You have to be in the vehicle to give keys', 'centerLeft', 5000, 'info')
	end
end)

RegisterNetEvent('EngineToggle:Engine')
RegisterNetEvent('EngineToggle:RPDamage')

RegisterNetEvent('fsn_vehiclecontrol:keys:carjack')
AddEventHandler('fsn_vehiclecontrol:keys:carjack', function(plate)
	TriggerEvent('fsn_notify:displayNotification', 'You got keys to: '..string.upper(plate), 'centerRight', 3000, 'info')
	table.insert(myKeys, {plate,true})
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 7) then
			if IsPedInAnyVehicle(PlayerPedId()) and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId() then
				if GetVehicleDoorsLockedForPlayer(GetVehiclePedIsIn(PlayerPedId(), false), PlayerId()) then
					SetVehicleDoorsLockedForAllPlayers(GetVehiclePedIsIn(PlayerPedId(), false), false)
					TriggerEvent('fsn_notify:displayNotification', 'unlocked', 'centerRight', 3000, 'info')
					TriggerEvent('fsn_commands:me', 'unlocked the vehicle...')
				else
					TriggerEvent('fsn_notify:displayNotification', 'locked', 'centerRight', 3000, 'info')
					SetVehicleDoorsLockedForAllPlayers(GetVehiclePedIsIn(PlayerPedId(), false), true)
					TriggerEvent('fsn_commands:me', 'locked the vehicle...')
				end
			else
				local veh = fsn_lookingAt()
				if veh then
					if exports.fsn_cargarage:fsn_IsVehicleOwner(veh) or table.contains(myKeys, GetVehicleNumberPlateText(veh)) then
						if GetVehicleDoorsLockedForPlayer(veh, PlayerId()) then
							SetVehicleDoorsLockedForAllPlayers(veh, false)
							TriggerEvent('fsn_notify:displayNotification', 'unlocked', 'centerRight', 3000, 'info')
							TriggerEvent('fsn_commands:me', 'unlocked the vehicle...')
						else
							TriggerEvent('fsn_notify:displayNotification', 'locked', 'centerRight', 3000, 'info')
							SetVehicleDoorsLockedForAllPlayers(veh, true)
							TriggerEvent('fsn_commands:me', 'locked the vehicle...')
						end
					end
				end
			end
		end
		if UseKey and ToggleKey then
			if IsControlJustReleased(1, ToggleKey) then
				if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId() then
					--if exports.fsn_cargarage:fsn_IsVehicleOwner(GetVehiclePedIsIn(PlayerPedId(), false)) or table.contains(myKeys, GetVehiclePedIsIn(PlayerPedId(), false)) then
						if fuel_amount > 0 then
							TriggerEvent('EngineToggle:Engine')
						end
					--else
						--TriggerEvent('fsn_notify:displayNotification', 'You don\'t have the keys for this vehicle!', 'centerLeft', 3000, 'error')
				--	end
				end
			end
		end
		if GetSeatPedIsTryingToEnter(PlayerPedId()) == -1 and not table.contains(vehicles, GetVehiclePedIsTryingToEnter(PlayerPedId())) then
			table.insert(vehicles, {GetVehiclePedIsTryingToEnter(PlayerPedId()), false})--IsVehicleEngineOn(GetVehiclePedIsTryingToEnter(PlayerPedId()))})
		elseif IsPedInAnyVehicle(PlayerPedId(), false) and not table.contains(vehicles, GetVehiclePedIsIn(PlayerPedId(), false)) then
			table.insert(vehicles, {GetVehiclePedIsIn(PlayerPedId(), false), false})--IsVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), false))})
		end
		for i, vehicle in ipairs(vehicles) do
			if DoesEntityExist(vehicle[1]) then
				if (GetPedInVehicleSeat(vehicle[1], -1) == PlayerPedId()) or IsVehicleSeatFree(vehicle[1], -1) then
					if RPWorking then
						if fuel_amount > 0 then
							SetVehicleEngineOn(vehicle[1], vehicle[2], true, false)
							if not IsPedInAnyVehicle(PlayerPedId(), false) or (IsPedInAnyVehicle(PlayerPedId(), false) and vehicle[1]~= GetVehiclePedIsIn(PlayerPedId(), false)) then
								if IsThisModelAHeli(GetEntityModel(vehicle[1])) or IsThisModelAPlane(GetEntityModel(vehicle[1])) then
									if vehicle[2] then
										SetHeliBladesFullSpeed(vehicle[1])
									end
								end
							end
						end
					end
				end
			else
				table.remove(vehicles, i)
			end
		end
	end
end)

local function canunlock()
	if exports.fsn_cargarage:fsn_IsVehicleOwner(GetVehiclePedIsIn(PlayerPedId(), false)) or table.contains(myKeys, GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))) then
		return true
	else
		return false
	end
end

AddEventHandler('EngineToggle:Engine', function()
	if not canunlock() then
		TriggerEvent('fsn_notify:displayNotification', 'You don\'t have the keys for this vehicle!', 'centerLeft', 3000, 'error')
	return end
	if IsThisModelAPlane(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))) and not exports["fsn_licenses"]:fsn_hasLicense('pilot') then 
		TriggerEvent('fsn_notify:displayNotification', 'You are not trained to start this engine', 'centerLeft', 3000, 'error')
	return end
	local veh
	local StateIndex
	for i, vehicle in ipairs(vehicles) do
		if vehicle[1] == GetVehiclePedIsIn(PlayerPedId(), false) then
			veh = vehicle[1]
			StateIndex = i
		end
	end
	--Citizen.Wait(1500)
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		if (GetPedInVehicleSeat(veh, -1) == PlayerPedId()) then
			vehicles[StateIndex][2] = not IsVehicleEngineOn(veh)
			if vehicles[StateIndex][2] then
				TriggerEvent('fsn_commands:me', 'turns the engine on.')
			else
				TriggerEvent('fsn_commands:me', 'turns the engine off.')
			end
		end
  end
end)

AddEventHandler('EngineToggle:RPDamage', function(State)
	RPWorking = State
end)

if OnAtEnter then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if GetSeatPedIsTryingToEnter(PlayerPedId()) == -1 then
				for i, vehicle in ipairs(vehicles) do
					if vehicle[1] == GetVehiclePedIsTryingToEnter(PlayerPedId()) and not vehicle[2] then
						Citizen.Wait(3500)
						vehicle[2] = true
					end
				end
			end
		end
	end)
end

function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end
