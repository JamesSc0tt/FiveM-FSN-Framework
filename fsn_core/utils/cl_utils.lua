Util = {}

--[[
	Util.Tick(f: function, ms=0: number)
		A simple wrapper for CreateThread + while
]]
function Util.Tick(f, ms)
	Citizen.CreateThread(function()
		while true do
			if f() then break end
			Citizen.Wait(ms or 0)
		end
	end)
end

function Util.FreezePlayer(ply, freeze)
    SetPlayerControl(ply, not freeze, 0)
	SetPlayerInvincible(ply, freeze)
    local ped = GetPlayerPed(ply)

    SetEntityVisible(ped, not freeze)
    SetEntityCollision(ped, not freeze)
	FreezeEntityPosition(ped, freeze)
end

--[[
	Resource Listener
]]
function Util.ResourceListener(res, start, stop)
	local data = { IsReady = false }
	setmetatable(data, { __index=exports[res] })

	AddEventHandler("onResourceStart", function(resource)
		if res ~= resource then return end

		while GetResourceState(res) == "starting" do Citizen.Wait(0) end
		if GetResourceState(res) ~= "started" then return end

		data.IsReady = true
		start(data)
	end)
	AddEventHandler("onResourceStop", function(resource)
		if res ~= resource then return end

		data.IsReady = false
		stop(data)
	end)
	Citizen.CreateThread(function()
		while GetResourceState(res) == "starting" do Citizen.Wait(0) end
		if GetResourceState(res) ~= "started" then return end
		Citizen.Wait(0)

		data.IsReady = true
		start(data)
	end)

	return data
end

--[[
	Iterators
		Util.FindObjects()
		Util.FindVehicles()
		Util.FindPickups()

		Usage:
		for ped in Util.FindPeds() do
			<do something with 'ped'>
		end
		Recommend using https://luafun.github.io/intro.html to filter etc

	https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2
]]
do
	local gc = {}
	function gc.__gc(p)
		if p.h then p.d(p.h) end
		p.h, p.n, p.d = nil, nil, nil
	end
	local function gen(p, ent)
		ent = ent ~= -1 and ent or nil
		return ent, ent and select(2, p.n(p.h)) or gc.__gc(p)
	end
	local function iterator(init, next, drop)
		local handle, ent = init()
		local param = setmetatable({ha=handle, next=next, drop=drop}, gc)
		return gen, param, ent
	end

	function Util.FindObjects()
		return iterator(FindFirstObject, FindNextObject, EndFindObject)
	end

	function Util.FindVehicles()
		return iterator(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
	end

	function Util.FindPickups()
		return iterator(FindFirstPickup, FindNextPickup, EndFindPickup)
	end
end