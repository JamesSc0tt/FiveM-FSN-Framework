local truckspawn = {x = 769.27258300781, y = -3195.3212890625, z = 5.9940619468689, h = 269.38400268555}
local cur_truck = false
local cur_trailer = false
local owned_truck = false
local mission_index = 0
local trailer_blip = false
local mission_blip = false
local jobs = {
  {trailer="trailerlogs",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=1202.677,y=-1315.115,z=37.086},payout=800},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=2582.918,y=291.401,z=110.334},payout=1300},
  {trailer="tanker",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=2553.624,y=419.674,z=110.695},payout=1200},
  {trailer="trailers2",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=149.510,y=6420.317,z=33.162},payout=2700},
  {trailer="trailerlogs",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=-573.645,y=5373.040,z=72.091},payout=1800},
  {trailer="trailerlogs",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=-802.937,y=5408.595,z=35.785},payout=2200},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=1740.179,y=-1537.763,z=112.6675},payout=1300},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=2771.391,y=1708.718,z=24.03442},payout=1900},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=2945.976,y=2799.294,z=40.91628},payout=2200},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=1701.656,y=3270.308,z=40.68462},payout=2300},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=2910.136,y=4379.666,z=49.87375},payout=2400},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=2296.635,y=4960.685,z=41.09084},payout=1700},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=285.5617,y=2827.475,z=43.29112},payout=1800},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=-2325.3,y=3440.267,z=30.78492},payout=2400},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=-2170.515,y=4274.922,z=48.8249},payout=2300},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=-511.9664,y=5261.947,z=80.468},payout=2500},
  {trailer="trailers",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=204.4641,y=6388.259,z=31.26069},payout=2100},
}

function spawnTruck(cost)
  local hashKey = GetHashKey("phantom")
	RequestModel(hashKey)
	while not HasModelLoaded(hashKey) do
	    Wait(.5)
	end
	if not IsAnyVehicleNearPoint(truckspawn.x, truckspawn.y, truckspawn.z, 6.0) then
		cur_truck = CreateVehicle(RequestModel(hashKey),truckspawn.x, truckspawn.y, truckspawn.z,truckspawn.h,true,false)
    TriggerEvent('fsn_fuel:update', GetVehicleNumberPlateText(cur_truck), 100)
		SetVehicleOnGroundProperly(cur_truck)
  	TriggerEvent('fsn_cargarage:makeMine', cur_truck, GetDisplayNameFromVehicleModel(GetEntityModel(cur_truck)), GetVehicleNumberPlateText(cur_truck))
    TriggerEvent('fsn_bank:change:walletMinus', cost)
    TaskWarpPedIntoVehicle(PlayerPedId(),cur_truck,-1)
    getNewJob(0)
	else
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^1:FSN:^0^r There cannot be anything in the truck pickup area!')
  end
end

function getNewJob(cost)
  if DoesEntityExist(cur_trailer) then
    SetEntityAsMissionEntity( cur_trailer, true, true )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( cur_trailer ) )
  end
  local index = math.random(1, #jobs)
  local job = jobs[index]
  mission_index = index
  local hashKey = GetHashKey(job.trailer)
	RequestModel(hashKey)
	while not HasModelLoaded(hashKey) do
	    Wait(.5)
	end
  if not IsAnyVehicleNearPoint(job.pickup.x, job.pickup.y, job.pickup.z, 6.0) then
    if mission_blip then
      RemoveBlip(mission_blip)
      mission_blip = false
    end
		cur_trailer = CreateVehicle(RequestModel(hashKey),job.pickup.x, job.pickup.y, job.pickup.z,job.pickup.h,true,false)
		SetVehicleOnGroundProperly(cur_trailer)
  	TriggerEvent('fsn_cargarage:makeMine', cur_trailer, GetDisplayNameFromVehicleModel(GetEntityModel(cur_trailer)), GetVehicleNumberPlateText(cur_trailer))
    if cost ~= 0 then
      TriggerEvent('fsn_bank:change:walletMinus', cost)
    end
    TaskWarpPedIntoVehicle(PlayerPedId(),cur_trailer,-1)

    trailer_blip = AddBlipForCoord(job.pickup.x, job.pickup.y, job.pickup.z)
    SetBlipSprite(trailer_blip, 1)
    SetBlipColour(trailer_blip, 11)
    SetBlipRoute(trailer_blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Trailer")
    EndTextCommandSetBlipName(trailer_blip)
    SetBlipAsShortRange(trailer_blip, false)
    TriggerEvent('fsn_notify:displayNotification', 'Delivery #'..mission_index..' marked on the GPS.', 'centerLeft', 8000, 'info')
  else
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^1:FSN:^0^r Something is blocking the trailer pickup spot.')
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^1:FSN:^0^r Get out of the truck and get a new job, you\'ve not been charged.')
  end
  fsn_SetJob('Trucker')
end

Citizen.CreateThread(function()
  local blip = AddBlipForCoord(truckspawn.x, truckspawn.y, truckspawn.z)
  SetBlipSprite(blip, 477)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Trailer")
  EndTextCommandSetBlipName(blip)
  SetBlipAsShortRange(blip, true)
  while true do
    Citizen.Wait(0)
    -----------------------------------------------------------------
    -- Mission shit
    -----------------------------------------------------------------
    if mission_index ~= 0 then
      if GetDistanceBetweenCoords(GetEntityCoords(cur_trailer), jobs[mission_index].dropoff.x, jobs[mission_index].dropoff.y, jobs[mission_index].dropoff.z) < 10 then
        DetachVehicleFromTrailer(cur_truck)
        local pay = math.random(jobs[mission_index].payout - 800, jobs[mission_index].payout + 300)
        TriggerEvent('fsn_bank:change:walletAdd', pay)
        TriggerEvent('fsn_notify:displayNotification', 'You delivered the trailer for: <b style="color:limegreen">$'..pay, 'centerLeft', 8000, 'success')
        Wait(1000)
        DeleteEntity(cur_trailer)
        if mission_blip then
          RemoveBlip(mission_blip)
          mission_blip = false
        end
        if trailer_blip then
          RemoveBlip(trailer_blip)
          trailer_blip = false
        end
        cur_trailer = false
        mission_index = 0
        trailer_blip = false
        mission_blip = false
        fsn_SetJob('Returning Trucker')
      end
      if IsVehicleAttachedToTrailer(cur_truck) then
        if trailer_blip then
          local job = jobs[mission_index]
          if not mission_blip then
            mission_blip = AddBlipForCoord(job.dropoff.x, job.dropoff.y, job.dropoff.z)
            print('DEBUG: '..job.dropoff.x..', '..job.dropoff.y..', '..job.dropoff.z)
            SetBlipSprite(mission_blip, 1)
            SetBlipColour(mission_blip, 1)
            SetBlipRoute(mission_blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Dropoff")
            EndTextCommandSetBlipName(mission_blip)
            SetBlipAsShortRange(mission_blip, false)
          end
          if trailer_blip then
            RemoveBlip(trailer_blip)
            trailer_blip = false
          end
        end
      end
    end
    -----------------------------------------------------------------
    -- Truck/Job shit
    -----------------------------------------------------------------
    if GetDistanceBetweenCoords(truckspawn.x,truckspawn.y,truckspawn.z, GetEntityCoords(PlayerPedId())) < 5 and not IsPedInAnyVehicle(PlayerPedId()) then
      if mission_index == 0 then
        if cur_truck then
          SetTextComponentFormat("STRING")
          AddTextComponentString("Press ~INPUT_PICKUP~ to get a new job (~g~$500~w~)")
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
            if exports.fsn_main:fsn_GetWallet() >= 500 then
              getNewJob(500)
            else
              TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
            end
          end
        else
          SetTextComponentFormat("STRING")
          AddTextComponentString("Press ~INPUT_PICKUP~ to get a truck & job (~g~$500~w~)")
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
            if exports.fsn_main:fsn_GetWallet() >= 100 then
              spawnTruck(500)
            else
              TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
            end
          end
        end
      else
        SetTextComponentFormat("STRING")
        AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~return~w~ your truck\nPress ~INPUT_VEH_DUCK~ to ~g~get~w~ a new job ($500)")
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        if IsControlJustPressed(0,73) then
          if exports.fsn_main:fsn_GetWallet() >= 0 then
            if trailer_blip then
              RemoveBlip(trailer_blip)
              trailer_blip = false
            end
            print('just pressed x')
            getNewJob(500)
          else
            TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
          end
        end
        if IsControlJustPressed(0,38) then
          if mission_blip then
            RemoveBlip(mission_blip)
            mission_blip = false
          end
          if trailer_blip then
            RemoveBlip(trailer_blip)
            trailer_blip = false
          end
          mission_index = 0
          if DoesEntityExist(cur_truck) then
            TriggerEvent('fsn_bank:change:walletAdd', 400)
            SetEntityAsMissionEntity( cur_truck, true, true )
            Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( cur_truck ) )
          else
            TriggerEvent('fsn_notify:displayNotification', 'You destroyed/lost your truck! Fined $500!', 'centerRight', 4000, 'error')
            TriggerEvent('fsn_bank:change:bankMinus', 500)
          end
          if DoesEntityExist(cur_trailer) then
            SetEntityAsMissionEntity( cur_trailer, true, true )
            Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( cur_trailer ) )
          end
          cur_truck = false
          cur_trailer = false
          fsn_SetJob('Unemployed')
        end
      end
    end
  end
end)
