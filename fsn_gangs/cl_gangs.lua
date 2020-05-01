local takeover = false -- do NOT touch this
local takeover_t = false -- do NOT touch this
local takeover_timeout = 600 -- max seconds a takeover can last, or fail
takeover_timeout = takeover_timeout * 1000 -- do NOT touch this
local takeover_r_timeout = 60 -- max seconds a round can take, or fail
takeover_r_timeout = takeover_r_timeout * 1000 -- do NOT touch this

function MissionText(text, subtext,time)
	Citizen.CreateThread(function()
		time = time * 1000
		local scaleform = RequestScaleformMovie("mp_big_message_freemode")
		while not HasScaleformMovieLoaded(scaleform) do
			Citizen.Wait(0)
		end

		BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
		PushScaleformMovieMethodParameterString(text)
		if subtext then
			PushScaleformMovieMethodParameterString(subtext)
		else
			PushScaleformMovieMethodParameterString('')
		end
		PushScaleformMovieMethodParameterInt(5)
		EndScaleformMovieMethod()

		local start = GetGameTimer()
		while true do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
			if start + time < GetGameTimer() then break end
		end
	end)
end

local ingang = false
function isInTerritory()
	return ingang
end

local mygang = false
local mylevel = 0
local nearbygang = false
function myGang()
	return mygang,mylevel
end
function nearbyGang()
	return nearbygang
end

local gangs = {}
RegisterNetEvent('fsn_gangs:recieve')
AddEventHandler('fsn_gangs:recieve', function(tbl)
	gangs = tbl
	for name,g in pairs(gangs) do
		if g.members then
			for _,m in pairs(g.members) do
				if exports['fsn_main']:fsn_CharID() == m.id then
					mygang = g.short
					mylevel = m.level
				end
			end
		end
	end
end)

Util.Tick(function()
	local cur_gang = false
	local cur_nearby = false
	for name,g in pairs(gangs) do
		if not g.npc.ped or not DoesEntityExist(g.npc.ped) then
			RequestModel(GetHashKey(g.npc.model))
			while not HasModelLoaded(GetHashKey(g.npc.model)) do Citizen.Wait(1) end
			g.npc.ped = CreatePed(1, GetHashKey(g.npc.model), g.npc.xyz.x, g.npc.xyz.y, g.npc.xyz.z, g.npc.xyz.h, false, true)
			Citizen.Wait(1000)
			FreezeEntityPosition(g.npc.ped, true)
			SetModelAsNoLongerNeeded(GetHashKey(g.npc.model))
		else
			if IsPedDeadOrDying(g.npc.ped) then
				if not g.npc.npc_death_cooldown then
					g.npc.npc_death_cooldown = GetGameTimer()
				else
					if g.npc.npc_death_cooldown + 800000 < GetGameTimer() then 
						DeleteEntity(g.npc.ped)
						g.npc.npc_death_cooldown = false
					end
				end
			end
		end
		if Util.GetVecDist(vector3(g.xyz.x, g.xyz.y, g.xyz.z),GetEntityCoords(GetPlayerPed(-1))) < 75 then
			DrawMarker(1,g.xyz.x, g.xyz.y, g.xyz.z-13,0,0,0,0,0,0,150.0,150.0,20.0,g.color[1],g.color[2],g.color[3],175,0,0,0,1)
			cur_gang = g.short
			if not IsPedDeadOrDying(g.npc.ped) and Util.GetVecDist(vector3(g.npc.xyz.x, g.npc.xyz.y, g.npc.xyz.z),GetEntityCoords(GetPlayerPed(-1))) < 2 then
				Util.DrawText3D(g.npc.xyz.x, g.npc.xyz.y, g.npc.xyz.z+0.2, string.upper(name))
				if not g.owner then
					Util.DrawText3D(g.npc.xyz.x, g.npc.xyz.y, g.npc.xyz.z-0.1, '[E] Takeover ($'..g.takeover.cost..')')
				elseif g.short == myGang() then
					Util.DrawText3D(g.npc.xyz.x, g.npc.xyz.y, g.npc.xyz.z, 'Welcome Back')
				else
					Util.DrawText3D(g.npc.xyz.x, g.npc.xyz.y, g.npc.xyz.z-0.1, '[E] Takeover')
					if IsControlJustPressed(0, Util.GetKeyNumber('E')) then
						--TriggerServerEvent('fsn_gangs:tryTakeOver', name)
						TAKEOVER(name)
					end
				end
			end
		elseif Util.GetVecDist(vector3(g.xyz.x, g.xyz.y, g.xyz.z),GetEntityCoords(GetPlayerPed(-1))) < 180 then
			if not cur_gang then cur_nearby = g.short end 
		end
	end
	if cur_gang ~= false then
		if not ingang then
			ingang = cur_gang
			nearbygang = cur_gang
		end
	else
		if cur_nearby then
			nearbygang = cur_nearby
		end
		ingang = false
	end
end)

function TAKEOVER(key)
	MissionText("~g~TAKEOVER STARTED", false, 3)
	local g = gangs[key]
	takeover = true
	takeover_t = {
		start = GetGameTimer(),
		g = key,
		round = {
			start = GetGameTimer(),
			cur = 1,
			started = false,
			peds = {},
		}
	}
end
Util.Tick(function()
	if takeover then 
		local t = takeover_t
		local g = gangs[t.g]
		if t.start + takeover_timeout < GetGameTimer() then takeover = false MissionText('~r~TAKEOVER FAILED', 'You took too long to takeover!', 10) end
		if t.round.start + takeover_r_timeout < GetGameTimer() then takeover = false MissionText('~r~TAKEOVER FAILED', 'Round ~y~'..t.round.cur..'~w~ took too long!', 10) end  
		if not t.round.started then
			if t.round.cur > #g.takeover.lvls then
				-- takeover is complete

				takeover = false
				MissionText('~g~TAKEOVER COMPLETE', 'You are now the leader of: '..t.g,10)
			else
				local num = g.takeover.lvls[t.round.cur]
				for i=1,num do
					local m = GetHashKey(g.takeover.mdls[math.random(1,#g.takeover.mdls)])
					RequestModel(m)
					while not HasModelLoaded(m) do Citizen.Wait(1) end
					local l = g.takeover.coords[math.random(1, #g.takeover.coords)]
					local PED = CreatePed(1, m, l.x, l.y, l.z,l.h, false, true)

					-- REMOVE THIS LINE
					FreezeEntityPosition(PED, true)
					table.insert(t.round.peds, #t.round.peds+1, PED)
				end
				t.round.started = true
				t.round.start = GetGameTimer()
			end
		else
			local dead = 0
			-- round is going on
			if exports['fsn_ems']:fsn_IsDead() then
				takeover = false
				MissionText('~r~TAKEOVER FAILED', 'You died.', 10)
			end
			for k,PED in pairs(t.round.peds) do
				if not NetworkHasControlOfEntity(PED) then
					NetworkRequestControlOfNetworkId(NetworkGetNetworkIdFromEntity(PED))
					while not NetworkHasControlOfNetworkId(NetworkGetNetworkIdFromEntity(PED)) do
						Citizen.Wait(0)
					end
				end
				DrawMarker(1,GetEntityCoords(PED),0,0,0,0,0,0,1.0,1.0,30.0,255,0,0,60,0,0,0,1)

				if not DoesEntityExist(PED) or IsEntityDead(PED) then
					dead = dead+1
				end
			end

			if dead >= g.takeover.lvls[t.round.cur] then
				-- round has ended
				for k,PED in pairs(t.round.peds) do
					DeleteEntity(PED)
				end

				TriggerEvent('mythic_notify:client:SendAlert', { type = 'success', text = 'Round '..t.round.cur..' complete!'})
				t.round.cur = t.round.cur + 1
				t.round.peds = {}
				t.round.started = false
			end
		end 
	else
		if takeover_t then
			for _,PED in pairs(takeover_t.round.peds) do
				DeleteEntity(PED)
			end
			takeover_t = false
		end
	end

end)

Citizen.CreateThread(function()
	TriggerServerEvent('fsn_gangs:request')
end)


Citizen.CreateThread(function()
	StopEntityFire(GetPlayerPed(-1))
	while true do Citizen.Wait(0)
		if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_f_freemode_01') or GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
			if GetPedDrawableVariation(GetPlayerPed(-1), 1) == 94 and GetPedTextureVariation(GetPlayerPed(-1),1) == 1 then
				if not IsEntityOnFire(GetPlayerPed(-1)) then
					StartEntityFire(GetPlayerPed(-1))
					Citizen.Wait(1000)
					StopEntityFire(GetPlayerPed(-1))
					Citizen.Wait(1000)
					StartEntityFire(GetPlayerPed(-1))
					Citizen.Wait(1000)
					StopEntityFire(GetPlayerPed(-1))
					Citizen.Wait(1000)
				end
			end
		end
	end
end)