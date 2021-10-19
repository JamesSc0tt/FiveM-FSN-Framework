local picklocking = false
local lastSafe = 0

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

local desks = {}
RegisterNetEvent('fsn_bankrobbery:desks:receive')
AddEventHandler('fsn_bankrobbery:desks:receive', function(tbl)
	desks = tbl
end)

RegisterNetEvent('fsn_criminalmisc:lockpicking')
AddEventHandler('fsn_criminalmisc:lockpicking', function()
	if not picklocking then
		for k, v in pairs(desks) do
			if GetDistanceBetweenCoords(v.door.x, v.door.y, v.door.z, GetEntityCoords(PlayerPedId()), true) < 2 then
				picklocking = true
				TriggerEvent('fsn_commands:me', 'Begins smashing at the bank door lock...')
				while ( not HasAnimDictLoaded( "mini@safe_cracking" ) ) do
					RequestAnimDict( "mini@safe_cracking" )
					Citizen.Wait( 5 )
				end
				TaskPlayAnim(PlayerPedId(), "mini@safe_cracking", "idle_base", 8.0, 1.0, 12000, 2, 0, 0, 1, 1 )
				Citizen.Wait( 12000 )
				if exports["fsn_police"]:fsn_getCopAmt() > 0 then
					TriggerServerEvent('fsn_bankrobbery:desks:doorUnlock', k)
					local pos = GetEntityCoords(PlayerPedId())
					local coords = {
					 x = pos.x,
					 y = pos.y,
					 z = pos.z
					}
					TriggerServerEvent('fsn_police:dispatch', coords, 12, '10-90 | BANK HOLDUP IN PROGRESS')
					picklocking = false
					CancelEvent()
				else
					TriggerEvent('fsn_commands:me', 'looks like the lock is stronger without the cops around...')
					picklocking = false
					CancelEvent()
				end
			end
		end
		local lost_safe = {x = 977.23968505859, y = -104.10308074951, z = 74.845184326172}
		if GetDistanceBetweenCoords(lost_safe.x, lost_safe.y, lost_safe.z, GetEntityCoords(PlayerPedId())) < 2 then
			print(exports['fsn_police']:fsn_getCopAmt()..' are online')
			if exports['fsn_police']:fsn_getCopAmt() < 3 then
				--TriggerEvent('fsn_bankrobbery:LostMC:spawn')
				TriggerEvent('fsn_notify:displayNotification', 'There are not enough police to do this heist.', 'centerLeft', 3500, 'error')
			else
				picklocking = true
				while ( not HasAnimDictLoaded( "mini@safe_cracking" ) ) do
					RequestAnimDict( "mini@safe_cracking" )
					Citizen.Wait( 5 )
				end
				TaskPlayAnim(PlayerPedId(), "mini@safe_cracking", "idle_base", 8.0, 1.0, 12000, 2, 0, 0, 1, 1 )
				Citizen.Wait( 12000 )
				if math.random(1,100) > 50 then
					TriggerEvent('fsn_bankrobbery:LostMC:spawn')
				end
				if math.random(1,100) > 80 then
					local maff = lastSafe + 900
					if maff < exports["fsn_main"]:fsn_GetTime() then
						lastSafe = exports["fsn_main"]:fsn_GetTime()
						TriggerEvent('fsn_notify:displayNotification', 'You got into the LostMC safe...', 'centerLeft', 6000, 'success')
						if math.random(1,100) > 50 then
							TriggerEvent('fsn_inventory:item:add', 'modified_drillbit', 1)
						end
						TriggerEvent('fsn_inventory:item:add', 'dirty_money', math.random(450,4000))
						if math.random(1, 100) > 50 then TriggerEvent('fsn_inventory:item:add', 'lockpick', math.random(1,5)) end
						if math.random(1, 100) > 50 then TriggerEvent('fsn_inventory:item:add', 'zipties', math.random(1,3)) end
						if math.random(1, 100) > 50 then TriggerEvent('fsn_inventory:item:add', 'joint', math.random(1,10)) end
						if math.random(1, 100) > 50 then TriggerEvent('fsn_inventory:item:add', 'joint', math.random(1,10)) end
						if math.random(1, 100) > 70 then TriggerEvent('fsn_inventory:item:add', 'packaged_cocaine', math.random(1,5)) end
						--TriggerEvent('fsn_bankrobbery:LostMC:spawn')
						local pos = GetEntityCoords(PlayerPedId())
						local coords = {
						 x = pos.x,
						 y = pos.y,
						 z = pos.z
						}
						TriggerServerEvent('fsn_police:dispatch', coords, 12, '10-90 | LostMC have reported a robbery at the ganghouse...')
					else
						TriggerEvent('fsn_notify:displayNotification', 'You cannot do this yet', 'centerLeft', 3500, 'error')
					end
				else
					TriggerEvent('fsn_notify:displayNotification', 'You broke your lockpick...', 'centerLeft', 3500, 'error')
					TriggerEvent('fsn_inventory:item:take', 'lockpick', 1)
				end
			end
			picklocking = false
		else
			picklocking = true
			doLockpick()
		end
	end
end)

local lockpicking_car = false
local lockpicking_vehicle = false
local lockpicking_start = 0
local lockpicking_length = 0 
function doLockpick()
	while ( not HasAnimDictLoaded( "mini@safe_cracking" ) ) do
		RequestAnimDict( "mini@safe_cracking" )
		Citizen.Wait( 5 )
	end
	TaskPlayAnim(PlayerPedId(), "mini@safe_cracking", "idle_base", 8.0, 1.0, 1000, 2, 0, 0, 1, 1 )
	if IsPedInAnyVehicle(PlayerPedId()) then
		lockpicking_vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		TriggerEvent('fsn_commands:me', 'attempts to hotwire the vehicle...')
		lockpicking_car = true
	else
		if fsn_lookingAt() then
			lockpicking_vehicle = fsn_lookingAt()
			TriggerEvent('fsn_commands:me', 'attempts to lockpick the vehicle...')
			lockpicking_car = true
		else
			TriggerEvent('fsn_notify:displayNotification', 'No vehicle detected', 'centerRight', 3000, 'info')
		end
	end
	
	lockpicking_start = exports["fsn_main"]:fsn_GetTime()
	lockpicking_length = GetVehicleMaxSpeed(lockpicking_vehicle)
	if lockpicking_length > 55 then
		print 'fast car make lockpicking longer'
		local mafffff = lockpicking_length / 2
		lockpicking_length = lockpicking_length + mafffff
	end
	print('lockpicking car for: '..lockpicking_length)
	exports["fsn_progress"]:fsn_ProgressBar(58, 133, 255,'Lockpicking',lockpicking_length)
	dispatchAlert(lockpicking_vehicle)
	Citizen.CreateThread(function()
		while lockpicking_car do
			Citizen.Wait(0)
			local maff = lockpicking_start + lockpicking_length
			if maff >= exports["fsn_main"]:fsn_GetTime() then
				if GetDistanceBetweenCoords(GetEntityCoords(lockpicking_vehicle), GetEntityCoords(PlayerPedId())) > 5 or IsControlJustPressed( 1,  288 ) then
					picklocking = false
					exports["fsn_progress"]:removeBar()
					lockpicking_car = false
				end
				if not IsEntityPlayingAnim(PlayerPedId(), "mini@safe_cracking", "idle_base", 3) then
					TaskPlayAnim(PlayerPedId(), "mini@safe_cracking", "idle_base", 8.0, 1.0, 1000, 2, 0, 0, 1, 1 )
				end
			else
				-- i finished
				local plate = GetVehicleNumberPlateText(lockpicking_vehicle)
				TriggerEvent('fsn_vehiclecontrol:keys:carjack', plate)
				if math.random(1, 100) > 70 then
					TriggerEvent('fsn_notify:displayNotification', 'You broke the lockpick.', 'centerLeft', 5000, 'error')
					TriggerEvent('fsn_inventory:item:take', 'lockpick', 1)
				end
				picklocking = false
				lockpicking_car = false
			end
		end
	end)
end

function dispatchAlert(veh)
	if math.random(1,100) < 40 then
		local pos = GetEntityCoords(PlayerPedId())
		local coords = {
			x = pos.x,
			y = pos.y,
			z = pos.z
		}
		local colour = table.pack(GetVehicleColours(veh))
		colour = colour[1]
		colour = vehicle_colours[colour+1]
		local vehicle = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
		local plate = GetVehicleNumberPlateText(veh)
		if plate then
			TriggerServerEvent('fsn_police:dispatch', coords, 10, '10-60 | Vehicle: '..vehicle..' | Plate: '..plate..' | Color: '..colour)
		end
	end
end