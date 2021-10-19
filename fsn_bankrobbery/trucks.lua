local moneyTruckHash = GetHashKey("stockade")
local payOut = 10000
local respawnTime = 2000 * 60 * 1000

-- Don't touch the code below or i can guarantee that the resource will crash.
local moneyTrucks ={
 [0] =  { ["x"] = -2469.812, ["y"] = 3792.616, ["z"] = 19.736, ["r"] = 168.889, ["breached"] = false},
 [1] =  { ["x"] = -628.790, ["y"] = 5258.434, ["z"] = 73.555, ["r"] = 116.800, ["breached"] = false},
 [2] =  { ["x"] = 322.723, ["y"] = 3418.192, ["z"] = 36.313, ["r"] = 256.886, ["breached"] = false},
 [3] =  { ["x"] = 1964.813, ["y"] = 3832.978, ["z"] = 31.689, ["r"] = 33.627, ["breached"] = false},
 [4] =  { ["x"] = -82.240, ["y"] = -2010.276, ["z"] = 17.695, ["r"] = 171.177, ["breached"] = false},
 [5] =  { ["x"] = -224.910, ["y"] = -2644.534, ["z"] = 5.678, ["r"] = 358.516, ["breached"] = false},
 [6] =  { ["x"] = 1407.299, ["y"] = -2056.321, ["z"] = 51.677, ["r"] = 111.545, ["breached"] = false}
}

--SetEntityCoords(PlayerPedId(), -2469.812, 3792.616, 19.736)
local truckDests = {
 [0] = {["x"] = -122.495, ["y"] =  6479.521, ["z"] =  31.047, ["r"] = 0},
 [1] = {["x"] = -392.572, ["y"] =  6062.591, ["z"] =  31.104, ["r"] = 0},
 [2] = {["x"] = 254.483, ["y"] =  190.450, ["z"] =  104.448, ["r"] = 0},
 [3] = {["x"] = -343.565, ["y"] =  -29.775, ["z"] =  47.089, ["r"] = 0},
 [4] = {["x"] = -35.136, ["y"] =  -699.135, ["z"] =  31.942, ["r"] = 0},
 [5] = {["x"] = -34.552, ["y"] =  -673.060, ["z"] =  31.944, ["r"] = 0},
 [6] = {["x"] = -19.869, ["y"] =  -670.819, ["z"] =  31.942, ["r"] = 90},
}

local storedMoneyTrucks = {}
local storedMoneyTruckPeds = {}
local storedMoneyTruckPeds2 = {}

local thisMoneyTruck
local thisMoneyTruckPed
local thisMoneyTruckPed2
local thisMoneyTruckCoord

local moneyTruckCords = {}
local moneyTruckGuardBlip = {}
local moneyTruckBlip = {}

local cashPickup = {}

function setupModel(model)
  RequestModel(model)
  while not HasModelLoaded(model) do
    RequestModel(model)
    Wait(0)
  end
  SetModelAsNoLongerNeeded(model)
end


function spawnMoneyTruck(delayTime, truckId, boolNew)
  setupModel(moneyTruckHash)
  setupModel(GetHashKey("s_m_m_security_01"))

  thisMoneyTruck = CreateVehicle(moneyTruckHash, moneyTrucks[truckId]["x"], moneyTrucks[truckId]["y"], moneyTrucks[truckId]["z"]-1.0001, moneyTrucks[truckId]["r"], true, false)
  RequestCollisionForModel(moneyTruckHash)

  N_0x06faacd625d80caa(thisMoneyTruck)

  SetVehicleDoorsLocked(thisMoneyTruck , 7)
  SetEntityAsNoLongerNeeded(thisMoneyTruck)
  SetVehicleOnGroundProperly(thisMoneyTruck)

  thisMoneyTruckPed = CreatePedInsideVehicle(thisMoneyTruck, 4, GetHashKey("s_m_m_security_01"), -1, true, false)
  thisMoneyTruckPed2 = CreatePedInsideVehicle(thisMoneyTruck, 4, GetHashKey("s_m_m_security_01"), 0, true, false)

  SetEntityAsMissionEntity(thisMoneyTruckPed, 0, 0)
  SetEntityAsMissionEntity(thisMoneyTruckPed2, 0, 0)

  setGaurd(thisMoneyTruckPed)
  setGaurd(thisMoneyTruckPed2)

  if(boolNew) then
    table.insert(storedMoneyTrucks,{truck = thisMoneyTruck})
  else
    table.insert(storedMoneyTrucks, truckId,{truck = thisMoneyTruck})
  end

  if(boolNew) then
    table.insert(storedMoneyTruckPeds,{ped = thisMoneyTruckPed})
    table.insert(storedMoneyTruckPeds2,{ped = thisMoneyTruckPed2})
  else
    table.insert(storedMoneyTruckPeds, truckId,{ped = thisMoneyTruckPed})
    table.insert(storedMoneyTruckPeds2, truckId,{ped = thisMoneyTruckPed2})
  end

  moneyTruckBlip[truckId] = AddBlipForEntity(thisMoneyTruck)
  SetBlipColour(moneyTruckBlip[truckId], 11)

  if truckId == 0 then
    TaskVehicleDriveToCoordLongrange(thisMoneyTruckPed, thisMoneyTruck, -34.552, -673.060, 31.944, 20.0,  447, 1.0)
  end

if truckId == 1 then
  --Money Truck follow lead
    TaskVehicleDriveToCoordLongrange(thisMoneyTruckPed, thisMoneyTruck, -34.552, -673.060, 31.944, 20.0,  447, 1.0)
  end

  if truckId > 1 then
    TaskVehicleDriveToCoordLongrange(thisMoneyTruckPed, thisMoneyTruck, -34.552, -673.060, 31.944, 20.0,  447, 1.0)
  end
  --TaskVehicleDriveToCoordLongrange(thisMoneyTruckPed,  thisMoneyTruck,  moneyTruckDest[1],  moneyTruckDest[3],  moneyTruckDest[3],  30.0,  447,  20)
  Citizen.Wait(delayTime)
end

function setGaurd(inputPed)
  SetPedShootRate(inputPed,  700)
  AddArmourToPed(inputPed, GetPlayerMaxArmour(thisMoneyTruckPed)- GetPedArmour(thisMoneyTruckPed))
  SetPedAlertness(inputPed, 100)
  SetPedAccuracy(inputPed, 100)
  SetPedCanSwitchWeapon(inputPed, true)
  SetEntityHealth(inputPed,  200)
  SetPedFleeAttributes(inputPed, 0, 0)
  SetPedCombatAttributes(inputPed, 46, true)
  SetPedCombatAbility(inputPed,  2)
  SetPedCombatRange(inputPed, 50)
  SetPedPathAvoidFire(inputPed,  1)
  SetPedPathCanUseLadders(inputPed,1)
  SetPedPathCanDropFromHeight(inputPed, 1)
  SetPedPathPreferToAvoidWater(inputPed, 1)
  SetPedGeneratesDeadBodyEvents(inputPed, 1)
  GiveWeaponToPed(inputPed, GetHashKey("WEAPON_SMG"), 5000, true, true)
  SetPedRelationshipGroupHash(inputPed, GetHashKey("security_guard"))
end

function checkMoneyTruckTick()
  for i=0, 6, 1 do
    thisMoneyTruck = storedMoneyTrucks[i+1].truck
    thisMoneyTruckPed = storedMoneyTruckPeds[i+1].ped
    thisMoneyTruckPed2 = storedMoneyTruckPeds2[i+1].ped
    thisMoneyTruckBreached = moneyTrucks[i][breached]
    thisMoneyTruckCoord = GetEntityCoords(thisMoneyTruckPed)
    if DoesEntityExist(thisMoneyTruck) then
    --check to see if we are at endlocation so we can choose another location rand to go to
    if GetDistanceBetweenCoords(thisMoneyTruckCoord.x, thisMoneyTruckCoord.y, thisMoneyTruckCoord.z, -34.552, -673.060, 31.944, true) < 60.0 then
      Citizen.Trace("Security van" .. thisMoneyTruck .. "has arrived \n")
      SetEntityAsMissionEntity(thisMoneyTruck, 0, 0)
      ClearPedTasks(thisMoneyTruckPed)
      Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(thisMoneyTruck))
      DeletePed(Citizen.PointerValueIntInitialized(thisMoneyTruckPed))
      DeletePed(Citizen.PointerValueIntInitialized(thisMoneyTruckPed2))
    end

    if GetVehicleDoorAngleRatio(thisMoneyTruck, 2) > .1 or GetVehicleDoorAngleRatio(thisMoneyTruck, 3) > .1 then
      if not moneyTrucks[i]["breached"] then
        GetEntityCoords(thisMoneyTruck, 1)
        cashPickup[i] = CreatePickup(GetHashKey("PICKUP_MONEY_SECURITY_CASE"), GetOffsetFromEntityInWorldCoords(thisMoneyTruck, 0.0, -5.0, 1.0001))
      end
      moneyTrucks[i]["breached"] = true
      Wait(1000)
    end

    if moneyTrucks[i]["breached"] then
      --check to see the pickup has been collected
      if HasPickupBeenCollected(cashPickup[i]) then
        if i == 0 or i == 1  or i > 1 then
          --TriggerEvent("fs_freemode:displaytext", "You ~g~robbed~w~ the security van, ~y~escape~w~ the cops.", 10000)
		  TriggerEvent('fsn_notify:displayNotification', 'You robbed the truck for '..payOut..'DM', 'centerLeft', 6000, 'info')
          --TriggerServerEvent('fs_freemode:missionComplete', payOut)
          TriggerEvent('fsn_inventory:item:add', 'dirty_money', payOut)
		  --SetPlayerWantedLevel(GetPlayerPed(playerPed),3,0)
          Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(thisMoneyTruck))
          DeletePed(Citizen.PointerValueIntInitialized(thisMoneyTruckPed))
          DeletePed(Citizen.PointerValueIntInitialized(thisMoneyTruckPed2))
          RemovePickup(cashPickup[i])
        end
      end
    end

    if GetVehicleBodyHealth(thisMoneyTruck) < 5.0 then
      NetworkExplodeVehicle(thisMoneyTruck,1,1,1)
      SetEntityAsMissionEntity(thisMoneyTruck, 0, 0)
      Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(thisMoneyTruck))
      DeletePed(Citizen.PointerValueIntInitialized(thisMoneyTruckPed))
      DeletePed(Citizen.PointerValueIntInitialized(thisMoneyTruckPed2))
    end
  end
end
end

Citizen.CreateThread(function()
  SetFarDrawVehicles(true)
  Citizen.Wait(10000)
	if exports["fsn_inventory"]:fsn_HasItem('radio_receiver') then
		TriggerEvent('fsn_phone:recieveMessage', {
		  sender = 'DarkWeb',
		  from_number = 666,
		  to_number = -1,
		  message = 'Just got word there\'s some armored trucks driving around, might be worth hitting them?'
		})
	end
  --TriggerEvent("fs_freemode:notify", "CHAR_MARTIN", 4, 27, "Martin", "Security Vans Robbery", "Just to let you know you, there are some security vans driving around to rob")
    --setup trucks
  if NetworkIsHost() then
    for i=0, 6, 1 do
      spawnMoneyTruck(2000, i, true)
      Wait(1)
    end

    while true do
      Wait(0)
      checkMoneyTruckTick()
    end
  end
end)