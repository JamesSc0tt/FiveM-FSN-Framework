------------------------------------------------------- system
local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end
    
    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)
    
    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next
    
    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

------------------------------------------------------- datastore
local datastore = {
  peds = {},
  objects = false,
  vehicles = {},
  pickups = false,
  nearby = {
    peds = {},
    objects = {},
    vehicles = {},
    pickups = {}  
  }
}

local myPed = PlayerPedId()

------------------------------------------------------- exports
function getVehicles(nearby)
  if nearby then return datastore.nearby.vehicles else return datastore.vehicles end
end
function getPeds(nearby)
  if nearby then return datastore.nearby.peds else return datastore.peds end
end
function getPickups(nearby)
  if nearby then return datastore.nearby.pickups else return datastore.pickups end
end
function getObjects(nearby)
  if nearby then return datastore.nearby.objects else return datastore.objects end
end
--[[
function getPedNearCoords(x,y,z,Distance)
	for k, v in pairs(datastore.peds) do
		if GetDistanceBetweenCoords(GetEntityCoords(v), x, y, z, true) < Distance then
			return v
		end
	end
	return false
end
]]--
function getPedNearCoords(x,y,z,Distance)
    local TargetPed
    local Handle, Ped = FindFirstPed()
    repeat
        local DistanceBetween = GetDistanceBetweenCoords(x,y,z, GetEntityCoords(Ped), true)
        if DoesEntityExist(Ped) and not IsPedAPlayer(Ped) and DistanceBetween <= Distance then
            TargetPed = Ped
        end

    Success, Ped = FindNextPed(Handle)
    until not Success

    EndFindPed(Handle)
    return TargetPed
end 

------------------------------------------------------- internals
function get_objects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function get_pickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

function get_vehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function get_peds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end
Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if datastore.objects then
			datastore.objects = {}
			datastore.nearby.objects = {}
			for obj in get_objects() do
				table.insert(datastore.objects, #datastore.objects+1, obj)
				if GetDistanceBetweenCoords(GetEntityCoords(obj), GetEntityCoords(myPed), true) < 50 then
					table.insert(datastore.nearby.objects, #datastore.nearby.objects+1, obj)
				end
			end
		end
		if datastore.peds then
			datastore.peds = {}
			datastore.nearby.peds = {}
			for ped in get_peds() do
				table.insert(datastore.peds, #datastore.peds+1, ped)
				-- move this here to remove a thread
				SetPedDropsWeaponsWhenDead(ped, false)
				if GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(myPed), true) < 50 then
					table.insert(datastore.nearby.peds, #datastore.nearby.peds+1, ped)
				end
			end
		end
		if datastore.vehicles then
			datastore.vehicles = {}
			datastore.nearby.vehicles = {}
			for veh in get_vehicles() do
				table.insert(datastore.vehicles, #datastore.vehicles+1, veh)
				if GetDistanceBetweenCoords(GetEntityCoords(veh), GetEntityCoords(myPed), true) < 50 then
					table.insert(datastore.nearby.vehicles, #datastore.nearby.vehicles+1, veh)
				end
			end
		end
		if datastore.pickups then
			datastore.pickups = {}
			datastore.nearby.pickups = {}
			for pickup in get_pickups() do
				table.insert(datastore.pickups, #datastore.pickups+1, pickup)
				if GetDistanceBetweenCoords(GetEntityCoords(pickup), GetEntityCoords(myPed), true) < 50 then
					table.insert(datastore.nearby.pickups, #datastore.nearby.pickups+1, pickup)
				end
			end
		end
		Citizen.Wait(500) 
	end
end)
