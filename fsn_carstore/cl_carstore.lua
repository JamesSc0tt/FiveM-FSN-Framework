local inside_store = {x = -43.723617553711, y = -1099.2775878906, z = 26.422357559204}
local car_spots = {}

function BuyCar(key)
	local veh = car_spots[key].car.object
	local model = GetEntityModel(veh)
	local colors = table.pack(GetVehicleColours(veh))
	local extra_colors = table.pack(GetVehicleExtraColours(veh))

	Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
	local pos = {-61.230403900146, -1105.9610595703, 25.955364227295,74.102165222168}
	
	FreezeEntityPosition(ped,false)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
	personalvehicle = CreateVehicle(model,pos[1],pos[2],pos[3],pos[4],true,false)
	SetModelAsNoLongerNeeded(model)

	SetVehicleOnGroundProperly(personalvehicle)
	SetVehicleHasBeenOwnedByPlayer(personalvehicle,true)
	local id = NetworkGetNetworkIdFromEntity(personalvehicle)
	SetNetworkIdCanMigrate(id, true)
	--Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
	SetEntityAsMissionEntity(personalvehicle, true, true)
	SetVehicleColours(personalvehicle,colors[1],colors[2])
	SetVehicleExtraColours(personalvehicle,extra_colors[1],extra_colors[2])
	TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
	SetEntityVisible(ped,true)
	
	local details = {
		plate = GetVehicleNumberPlateText(personalvehicle),
		livery = 0,
		fuel = 100,
		damage = {
			engine = 1000,
			body = 1000,
			advanced = {
				electronics = 100,
				clutch = 100,
				gearbox = 100,
				brakes = 100,
				transmission = 100,
				axle = 100,
				fuel_injectors = 100,
				fuel_tank = 100,
				tires = 100,
			},
		},
		modkit = 0,
		customisations = {
			plate = 0,
			windows = 0,
			colours = {
				main = {0,0},
				extras = {0,0},
			},
			neons = {
				enabled = {false, false, false},
				colours = {0,0,0},
			},
			wheels = {
				type = 0,
				smoke = {0,0,0},
			},
			mods = {},
		}
	}
	
	local finance = {
		outright = true,
		buyprice = car_spots[key].car.buyprice+car_spots[key].car.commission,
		base = car_spots[key].car.buyprice,
		commission = car_spots[key].car.commission
	}
	
	TriggerServerEvent('fsn_cargarage:buyVehicle', exports["fsn_main"]:fsn_CharID(), car_spots[key].car.name, car_spots[key].car.model, GetVehicleNumberPlateText(personalvehicle), details, finance, 'c', 0)
	exports['mythic_notify']:DoCustomHudText('success', 'You bought '..car_spots[key].car.name..' for $'..car_spots[key].car.buyprice+car_spots[key].car.commission, 3000)
	TriggerEvent('fsn_bank:change:walletMinus', car_spots[key].car.buyprice+car_spots[key].car.commission)
	TriggerEvent('fsn_cargarage:makeMine', personalvehicle, car_spots[key].car.model, GetVehicleNumberPlateText(personalvehicle))
end

Util.Tick(function()
	if GetDistanceBetweenCoords(inside_store.x, inside_store.y, inside_store.z, GetEntityCoords(PlayerPedId()), true) < 100 then
		for key, car in pairs(car_spots) do
			if car.car.model then
				if not DoesEntityExist(car.car.object) then
					RequestModel(GetHashKey(car.car.model))
					while not HasModelLoaded(GetHashKey(car.car.model)) do
						Citizen.Wait(1)
						if GetDistanceBetweenCoords(inside_store.x, inside_store.y, inside_store.z, GetEntityCoords(PlayerPedId()), true) < 10 then
							Util.DrawText3D(car.x, car.y, car.z, ':FSN: Loading vehicle: '..car.car.model, {255, 0, 0, 255}, 0.2)
						end
					end
					car.car.object = CreateVehicle(GetHashKey(car.car.model), car.x, car.y, car.z-1, car.h, false, false)
					FreezeEntityPosition(car.car.object, true)
					SetVehicleOnGroundProperly(car.car.object)
					SetVehicleColours(car.car.object, car.car.color[1], car.car.color[2])
					SetVehicleExtraColours(car.car.object, -1, -1)
				else
					if IsEntityAttachedToAnyVehicle(car.car.object) then
						-- someone is trying to tow this shit
						DetachEntity(car.car.object)
					end
					if GetDistanceBetweenCoords(car.x,car.y,car.z, GetEntityCoords(car.car.object), true) > 2 then
						-- car is not where it's supposed to be :/
						SetEntityCoords(car.car.object, car.x, car.y, car.z-1, 1, 0, 0, 1)
						SetVehicleOnGroundProperly(car.car.object)
					end
					FreezeEntityPosition(car.car.object, true)
					SetEntityInvincible(car.car.object,true)
					SetEntityAsMissionEntity( car.car.object, true, true )
					SetVehicleNumberPlateText(car.car.object, "PDMFLOOR")
					
					if not car.updated then
						IsEntityVisible(car.car.object)
						Citizen.Wait(10)
						DeleteEntity(car.car.object)
						if not car.updatestart then
							car.updatestart = GetNetworkTime()
						end
						if car.updatestart+300 < GetNetworkTime() then
							local primary, secondary = GetVehicleColours(car.car.object)
							print('PRIMARY: '..primary..' ?? '..car.car.color[1])
							print('SECONDARY: '..secondary..' ?? '..car.car.color[2])
							car.updated = true
							car.updatestart = false
						else
							Util.DrawText3D(car.x, car.y, car.z, ':FSN: Updating vehicle', {255, 0, 0, 255}, 0.2)
						end
					else
						if GetDistanceBetweenCoords(car.x, car.y, car.z, GetEntityCoords(PlayerPedId()), true) < 2 then
							Util.DrawText3D(car.x, car.y, car.z+0.25, ':FSN: Vehicle: '..car.car.name, {255, 255, 255, 255}, 0.3)
							Util.DrawText3D(car.x, car.y, car.z+0.15, 'Base Price: $'..car.car.buyprice, {255, 255, 255, 200}, 0.2)
							Util.DrawText3D(car.x, car.y, car.z+0.1, 'Commission: '..car.car.commission..'%', {255, 255, 255, 200}, 0.2)
							local comm = math.floor(car.car.buyprice / 100 * car.car.commission)
							Util.DrawText3D(car.x, car.y, car.z+0.05, 'Actual Price $'..car.car.buyprice+comm, {255, 255, 255, 200}, 0.2)
							if exports["fsn_jobs"]:isWhitelistClockedIn(1) then
								Util.DrawText3D(car.x, car.y, car.z-0.5, '[E] Organise Finance ~b~||~w~ [H] Change ~b~||~w~ /comm {new%}', {255, 255, 255, 255}, 0.25)
								Util.DrawText3D(car.x, car.y, car.z-0.10, '~g~[G]~w~ to test drive',{255, 255, 255, 255}, 0.25)
								if IsControlJustPressed(0, 74) then
									-- [H] Change car
									OpenCreator(key)
								end
								if IsControlJustPressed(0, 38) then
									-- [E] Organise finance
									exports['mythic_notify']:DoCustomHudText('error', 'Your business has not been around long enough to afford this!', 3000)
								end
								if IsControlJustPressed(0, 47) then
									-- [G] Test Drive
									TestDriveVehicle(key)
								end
							else
								Util.DrawText3D(car.x, car.y, car.z-0.5, '[E] Purchase ~b~||~w~ Talk to an employee to discuss finance or to test drive!', {255, 255, 255, 255}, 0.25)
								if IsControlJustPressed(0, 38) then
									-- [E] Purchase
									if exports["fsn_main"]:fsn_CanAfford(car.car.buyprice+comm) then
										BuyCar(key)
									else
										exports['mythic_notify']:DoCustomHudText('error', 'You cannot afford $'..car.car.buyprice+comm..' right now', 3000)
									end
								end
							end
						end
					end					
				end
			else
				Util.DrawText3D(car.x, car.y, car.z+2, ':FSN: Car not set', {255, 0, 0, 255}, 0.2)
			end
		end
	end
end, 0)

TriggerServerEvent('fsn_carstore:floor:Request')
RegisterNetEvent('fsn_carstore:floor:Update')
AddEventHandler('fsn_carstore:floor:Update', function(tbl)
	car_spots = tbl
end)
RegisterNetEvent('fsn_carstore:floor:UpdateCar')
AddEventHandler('fsn_carstore:floor:UpdateCar', function(updatedcar, tbl)
	print('fsn_carstore: got update for car('..updatedcar..')')
	car_spots[updatedcar]['car']['color'] = tbl['car']['color']
	car_spots[updatedcar]['car']['model'] = tbl['car']['model']
	car_spots[updatedcar]['car']['name'] = tbl['car']['name']
	car_spots[updatedcar]['car']['commission'] = tbl['car']['commission']
	car_spots[updatedcar]['car']['buyprice'] = tbl['car']['buyprice']
	car_spots[updatedcar]['updated'] = false
end)

-- command shit
RegisterNetEvent('fsn_carstore:floor:commission')
AddEventHandler('fsn_carstore:floor:commission', function(amt)
	for k,v in pairs(car_spots) do
		if GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(PlayerPedId()), true) < 2 then
			TriggerServerEvent('fsn_carstore:floor:commission', k, amt)
		end
	end
end)
RegisterNetEvent('fsn_carstore:floor:color:One')
AddEventHandler('fsn_carstore:floor:color:One', function(col)
	for k,v in pairs(car_spots) do
		if GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(PlayerPedId()), true) < 2 then
			TriggerServerEvent('fsn_carstore:floor:color:One', k, col)
		end
	end
end)
RegisterNetEvent('fsn_carstore:floor:color:Two')
AddEventHandler('fsn_carstore:floor:color:Two', function(col)
	for k,v in pairs(car_spots) do
		if GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(PlayerPedId()), true) < 2 then
			TriggerServerEvent('fsn_carstore:floor:color:Two', k, col)
		end
	end
end)

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(-45.805393218994, -1098.3745117188, 26.422348022461) -- Chapman Motors
	SetBlipSprite(blip, 225)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, 0.9)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Chapman Motors")
	EndTextCommandSetBlipName(blip)
	Citizen.Wait(0)
end)

-- Test Drive Functions

function TestDriveVehicle(key)
	if TestingCar then
		exports['mythic_notify']:DoCustomHudText('error', 'Test vehicle already out. Only one test vehicle can be out at a time.', 7000)
		return;
	end
	TestingCar = true

	local veh = car_spots[key].car.object
	local model = GetEntityModel(veh)
	local colors = table.pack(GetVehicleColours(veh))
	local extra_colors = table.pack(GetVehicleExtraColours(veh))

	Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
	local pos = {-45.347373962402, -1082.3184814453, 26.691509246826}
	
	FreezeEntityPosition(ped,false)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
	testvehicle = CreateVehicle(model,pos[1],pos[2],pos[3],pos[4],true,false)
	SetModelAsNoLongerNeeded(model)

	SetVehicleOnGroundProperly(testvehicle)
	SetVehicleHasBeenOwnedByPlayer(testvehicle,true)
	exports['mythic_notify']:DoCustomHudText('success', 'The test vehicle is outside.', 3000)
	local id = NetworkGetNetworkIdFromEntity(testvehicle)
	SetNetworkIdCanMigrate(id, true)
	--Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
	SetEntityAsMissionEntity(testvehicle, true, true)
	SetVehicleColours(testvehicle,colors[1],colors[2])
	SetVehicleExtraColours(testvehicle,extra_colors[1],extra_colors[2])
	SetVehicleNumberPlateText(testvehicle, "PDM TEST")

	TriggerEvent('fsn_cargarage:makeMine', testvehicle, car_spots[key].car.model, GetVehicleNumberPlateText(testvehicle))

	TestingCar = testvehicle
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if TestingCar then
			local playerPed = PlayerPedId()
			local playerPos = GetEntityCoords(playerPed)

			local testVehicleReturn = vector3(-45.347373962402, -1082.3184814453, 26.691509246826)

			if Util.GetVecDist(playerPos, testVehicleReturn.xyz) < 10 then
				Util.DrawText3D(testVehicleReturn.x, testVehicleReturn.y, testVehicleReturn.z+0.5, 'Press ~g~[ E ]~w~ to return the test vehicle.', {255, 255, 255, 255}, 0.25)
				if IsControlJustPressed(0, Util.GetKeyNumber("E"), IsDisabledControlJustPressed(0, Util.GetKeyNumber("E"))) then
					local maxPassengers = GetVehicleMaxNumberOfPassengers(TestingCar)
					for seat = -1,maxPassengers-1,1 do
						local ped = GetPedInVehicleSeat(TestingCar, seat)
						if ped and ped ~= 0 then TaskLeaveVehicle(ped, TestingCar,16); end
					end
					SetEntityAsMissionEntity( TestingCar, false, true )
					Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( TestingCar ) )
					exports['mythic_notify']:DoCustomHudText('success', 'Test vehicle has been returned')
					if DoesEntityExist(TestingCar) then SetVehicleUndriveable(TestingCar, true); end
					TestingCar = false
				end
			end
		end
	end
end)