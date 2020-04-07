local isOrdering = false

RegisterNetEvent('fsn_phones:USE:darkweb:order')
AddEventHandler('fsn_phones:USE:darkweb:order', function(iswep, item, amt)
	deliveryTypeOne(iswep, item, amt)
end)

function fillVehicle(ped, vehicle, escort, escorting)
	if IsVehicleSeatFree(vehicle, -1) then
    	TaskWarpPedIntoVehicle(ped, vehicle, -1)
    elseif IsVehicleSeatFree(vehicle, 0) then
    	TaskWarpPedIntoVehicle(ped, vehicle, 0)
	elseif IsVehicleSeatFree(vehicle, -2) then
    	TaskWarpPedIntoVehicle(ped, vehicle, -2)
    elseif IsVehicleSeatFree(vehicle, 1) then
    	TaskWarpPedIntoVehicle(ped, vehicle, 1)
	else
		print 'no seat in vehicle for ped'
	end
end

function deliveryTypeOne(iswep, item, amt)
	local deliveryStage = 1
	local deliveryDestination = {x = 1543.1730957031, y = -2152.7312011719, z = 77.538871765137, h = 245.11592102051}--{x = 1564.5300292969, y = -2161.73828125, z = 77.266471862793, h = 171.06405639648}
	local deliveryVehicle =  {
		ent = false,
		blip = false,
		vehicle = 'SPEEDO4',
		peds = 1,
		pedents = {},
		ped = 'mp_m_waremech_01',
		loc = {x = -975.47357177734, y = -2237.2094726563, z = 8.6007471084595, h = 226.70767211914}
	}
	local deliveryCooldown = 30
	local deliveryProtection = {
		{	
			ent = false,
			blip = false,
			vehicle = 'mesa3',
			peds = 4,
			pedents =  {},
			ped = 'mp_m_securoguard_01',
			loc = {x = -968.43029785156, y = -2243.8000488281, z = 8.6396036148071, h = 229.18266296387}
		},
		{
			ent = false,
			blip = false,
			vehicle = 'mesa3',
			peds = 3,
			pedents = {},
			ped = 'mp_m_securoguard_01',
			loc = {x = -980.98614501953, y = -2231.7346191406, z = 8.6372041702271, h = 226.14091491699}
		}
	}
	local deliveryFront = false
	Citizen.CreateThread(function()
		-- load models
		RequestModel(GetHashKey(deliveryVehicle.vehicle))
		while not HasModelLoaded(GetHashKey(deliveryVehicle.vehicle)) do
			Citizen.Wait(1)
		end
		RequestModel(GetHashKey(deliveryVehicle.ped))
		while not HasModelLoaded(GetHashKey(deliveryVehicle.ped)) do
			Citizen.Wait(1)
		end
		for k, v in pairs(deliveryProtection) do
			if not HasModelLoaded(GetHashKey(v.vehicle)) then
				RequestModel(GetHashKey(v.vehicle))
				while not HasModelLoaded(GetHashKey(v.vehicle)) do
					Citizen.Wait(1)
				end
			end
			if not HasModelLoaded(GetHashKey(v.ped)) then
				RequestModel(GetHashKey(v.ped))
				while not HasModelLoaded(GetHashKey(v.ped)) do
					Citizen.Wait(1)
				end
			end
		end
		
		-- spawn vehicles
		deliveryVehicle.ent = CreateVehicle(GetHashKey(deliveryVehicle.vehicle), deliveryVehicle.loc.x, deliveryVehicle.loc.y, deliveryVehicle.loc.z, deliveryVehicle.loc.h, true, true)
		
		deliveryVehicle.blip = AddBlipForEntity(deliveryVehicle.ent)
		SetBlipSprite(deliveryVehicle.blip, 1)
		SetBlipColour(deliveryVehicle.blip, 1)
		SetBlipAsShortRange(deliveryVehicle.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Delivery Vehicle")
		EndTextCommandSetBlipName(deliveryVehicle.blip)
		
		for k, v in pairs(deliveryProtection) do
			v.ent = CreateVehicle(GetHashKey(v.vehicle), v.loc.x, v.loc.y, v.loc.z, v.loc.h, true, true)
			
			v.blip = AddBlipForEntity(v.ent)
			SetBlipSprite(v.blip, 1)
			SetBlipColour(v.blip, 2)
			SetBlipAsShortRange(v.blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Protection Vehicle")
			EndTextCommandSetBlipName(v.blip)
		end
		-- spawn peds
		for i=1,deliveryVehicle.peds do
			local id = #deliveryVehicle.pedents+1
			deliveryVehicle.pedents[id] = CreatePed(0,GetHashKey(deliveryVehicle.ped),deliveryVehicle.loc.x, deliveryVehicle.loc.y, deliveryVehicle.loc.z+math.random(5,10), deliveryVehicle.loc.h, true, true)
			SetPedDiesInVehicle(deliveryVehicle.pedents[id], false)
			SetPedConfigFlag(deliveryVehicle.pedents[id], 32, false)
			--TaskWarpPedIntoVehicle(deliveryVehicle.pedents[id], deliveryVehicle.ent, -2)
			fillVehicle(deliveryVehicle.pedents[id], deliveryVehicle.ent)
			Citizen.Wait(100)
			if GetPedInVehicleSeat(deliveryVehicle.ent, -1) == deliveryVehicle.pedents[id] then
				TaskVehicleDriveToCoord(deliveryVehicle.pedents[id], deliveryVehicle.ent, deliveryDestination.x, deliveryDestination.y, deliveryDestination.z, -1, GetHashKey(deliveryVehicle.vehicle), 1, 0, true)
			end
		end
		for k, v in pairs(deliveryProtection) do
			for i=1,v.peds do
				local id = #v.pedents+1
				v.pedents[id] = CreatePed(0,GetHashKey(v.ped),v.loc.x, v.loc.y, v.loc.z+math.random(5,10), v.loc.h, true, true)
				GiveWeaponToPed(v.pedents[id], GetHashKey("WEAPON_MINIGUN"), 200, false, true)
				SetPedDiesInVehicle(v.pedents[id], false)
				fillVehicle(v.pedents[id], v.ent)
				SetPedConfigFlag(v.pedents[id], 32, false)
				Citizen.Wait(100)
				if GetPedInVehicleSeat(v.ent, -1) == v.pedents[id] then
					if not deliveryFront then
						TaskVehicleEscort(v.pedents[id], v.ent, deliveryVehicle.ent, -1, -1, 1, 10, 0, 10)
						--TaskVehicleDriveToCoord(v.pedents[id], v.ent, deliveryDestination.x, deliveryDestination.y, deliveryDestination.z, 60000, GetHashKey(deliveryVehicle.vehicle), 1, 0, true)
						TaskVehicleDriveToCoord(v.pedents[id], v.ent, deliveryDestination.x, deliveryDestination.y, deliveryDestination.z, -1, GetHashKey(v.vehicle), 1, 0, true)
						
						--deliveryFront = true
					else
						--TaskVehicleDriveToCoord(v.pedents[id], v.ent, deliveryDestination.x, deliveryDestination.y, deliveryDestination.z, 60000, GetHashKey(deliveryVehicle.vehicle), 1, 0, true)
					end
				end
			end
		end
		while true do Citizen.Wait(0)
			if deliveryStage == 1 then
				if GetDistanceBetweenCoords(GetEntityCoords(deliveryVehicle.ent), deliveryDestination.x, deliveryDestination.y, deliveryDestination.z, false) < 10 then
					TriggerEvent('fsn_notify:displayNotification', 'Delivery has reached it\'s location.', 'centerLeft', 6000, 'error')
					DeleteEntity(deliveryVehicle.ent)
					for k, v in pairs(deliveryProtection) do
						DeleteEntity(v.ent)
					end
					deliveryStage = 2
				end
			elseif deliveryStage == 2 then
				deliveryVehicle.ent = CreateVehicle(GetHashKey(deliveryVehicle.vehicle), deliveryVehicle.loc.x, deliveryVehicle.loc.y, deliveryVehicle.loc.z, deliveryVehicle.loc.h, true, true)

				deliveryVehicle.blip = AddBlipForEntity(deliveryVehicle.ent)
				SetBlipSprite(deliveryVehicle.blip, 1)
				SetBlipColour(deliveryVehicle.blip, 1)
				SetBlipAsShortRange(deliveryVehicle.blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString("Delivery Vehicle")
				EndTextCommandSetBlipName(deliveryVehicle.blip)
				
				
			end
		end
	end)
end

--deliveryTypeOne(false, 'vpn1', 1)