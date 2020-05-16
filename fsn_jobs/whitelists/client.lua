local myCharID = 0
local Whitelists = {}

function isWhitelisted(groupid)
	local _wl = Whitelists[groupid]
	local _me = exports['fsn_main']:fsn_CharID()
	
	if _wl.owner == _me then -- or table.contains(_wl.access, _me) then
		print(_me..' is whitelisted in '.._wl.title..' (owned by: '.._wl.owner..')')
		return true
	else
		for k, v in pairs(_wl.access) do
			if v.charid == _me then
				print(_me..' is whitelisted in '.._wl.title..' (owned by: '.._wl.owner..')')
				return true
			end
		end
		print(_me..' is not whitelisted in '.._wl.title..' (owned by: '.._wl.owner..')')
		return false
	end
end

function getWhitelistDetails(groupid)
	TriggerServerEvent('fsn_jobs:whitelist:request')
	return Whitelists[groupid]
end

function inAnyWhitelist()
	local myWhitelists = {}
	for k, _wl in pairs(Whitelists) do
		if isWhitelisted(k) then
			table.insert(myWhitelists, #myWhitelists+1, k)
		end
	end
	if myWhitelists == {} then
		return false
	else
		return myWhitelists
	end
end

function addToWhitelist(wlid, charid, level)
	if Whitelists[wlid].owner == exports["fsn_main"]:fsn_CharID() then
		if level > 0 then
			TriggerServerEvent('fsn_jobs:whitelist:add', wlid, charid, level)
			exports['mythic_notify']:DoCustomHudText('inform', 'Adding '..charid..' to '..Whitelists[wlid].title..' at '..level, 4000)
		else
			TriggerServerEvent('fsn_jobs:whitelist:remove', wlid, charid)
			exports['mythic_notify']:DoCustomHudText('inform', 'Removing '..charid..' from '..Whitelists[wlid].title, 4000)
		end
	else
		exports['mythic_notify']:DoCustomHudText('error', 'ERROR: WL owned by '..Whitelists[wlid].owner, 4000)
	end
end 

----------------------------------------------
-- CLOCKIN SHIT
----------------------------------------------
local current_clockid = 0
function toggleWhitelistClock(id)
	print('toggling clock for id '..id)
	if current_clockid == 0 then
		-- not clocked in
		TriggerServerEvent('fsn_jobs:whitelist:clock:in', exports["fsn_main"]:fsn_CharID(), id)
	else
		-- is clocked in 
		TriggerServerEvent('fsn_jobs:whitelist:clock:out', exports["fsn_main"]:fsn_CharID(), current_clockid)
	end
end
function isWhitelistClockedIn(id)
	if current_clockid == id then
		return true
	else
		return false
	end
end

RegisterNetEvent('fsn_jobs:whitelist:clock:in')
AddEventHandler('fsn_jobs:whitelist:clock:in', function(id)
	
	current_clockid = id

	--[[
	Set your whitelists ids here for example whitelist id 1 is PDM 2 is mechanic etc etc. 
	This can be found in the whitelists/server.lua and your database under fsn_whitelists
	]]--
	if current_clockid == 1 then
		fsn_SetJob('CarDealer')
	
	elseif current_clockid == 2 then
		fsn_SetJob("Mechanic")
	
	elseif current_clockid == 3 then
		fsn_SetJob('Rancher')
	
	elseif current_clockid == 4 then
		fsn_SetJob('BoatDealer')
	end

end)
RegisterNetEvent('fsn_jobs:whitelist:clock:out')
AddEventHandler('fsn_jobs:whitelist:clock:out', function()
	current_clockid = 0

	fsn_SetJob('Unemployed')

end)

RegisterNetEvent('fsn_jobs:whitelist:update')
AddEventHandler('fsn_jobs:whitelist:update', function(tbl)
	Whitelists = tbl
end)

TriggerServerEvent('fsn_jobs:whitelist:request')