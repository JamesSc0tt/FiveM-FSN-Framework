ShutdownLoadingScreen()
Player = {}
--[[
	Player states
]]
Player.InGame = false

--[[
	Player spawning
]]
local spawnman = Util.ResourceListener("spawnmanager",function(spawnman)
	spawnman:setAutoSpawn(false)

	local spawn = {
		x = 0, y = 0, z = 0,
		heading = 0,
		model = "u_m_y_zombie_01",
		skipFade = true
	}
	spawnman:spawnPlayer(spawn, function()
		Util.FreezePlayer(ply, true)
	end)
end)

local menu_spawn = vector3(0,0,0)
Util.Tick(function()
	if not Player.InGame and #(GetEntityCoords(ped)-menu_spawn) > 10 then
		SetEntityCoordsNoOffset(ped, menu_spawn)
		Util.FreezePlayer(ply, true)
	end
end, 1000)