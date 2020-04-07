local mysql = false
MySQL.ready(function()
	mysql = true
end)

local queue = false
Queue.OnReady(function()
	queue = true
end)

local prio = false
function doPriority()
	print 'i am running priority look at me im so sexual'
	MySQL.Async.fetchAll('SELECT * FROM `fsn_users` WHERE `priority` != 0', {}, function(res)
		for k, usr in pairs(res) do
			Queue.AddPriority(usr.steamid, tonumber(usr.priority))
			print(':fsn_priority: Adding priority('..usr.priority..') for user '..usr.name..'('..usr.steamid..')')
		end
	end)
	prio = true
end


Citizen.CreateThread(function()
	while not prio do
		Citizen.Wait(0)
		while mysql and queue and not prio do
			Citizen.Wait(0)
			doPriority()
			break
		end
	end
end)