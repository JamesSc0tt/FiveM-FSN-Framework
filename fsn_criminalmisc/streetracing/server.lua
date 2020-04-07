local raceid = 1
local races = {}

RegisterServerEvent('fsn_criminalmisc:racing:newRace')
AddEventHandler('fsn_criminalmisc:racing:newRace', function(cost, streetname, startx, starty, startz, ex, why, racetoname)
	local rid = raceid + 1
	local race = {
		race_id = rid,
		starttime = os.time(),
		start = {
			x = startx,
			y = starty,
			z = startz,
			price = cost,
		},
		finish = {
			x = ex,
			y = why
		},
		state = 1,
		members = {},
	}
	table.insert(races, #races+1, race)
	TriggerClientEvent('fsn_criminalmisc:racing:update', -1, races)
end)

RegisterServerEvent('fsn_criminalmisc:racing:joinRace')
AddEventHandler('fsn_criminalmisc:racing:joinRace', function(id)
	for k, v in pairs(races) do
		if v.race_id == id then
			if v.state == 1 then
				table.insert(v.members, #v.members+1, source)
				TriggerClientEvent('fsn_criminalmisc:racing:putmeinrace', source, v.race_id, v.members)
			else
				TriggerClientEvent('fsn_notify:displayNotification', source, 'Too late!', 'centerLeft', 4000, 'error')
			end
		end
	end
end)

RegisterServerEvent('fsn_criminalmisc:racing:win')
AddEventHandler('fsn_criminalmisc:racing:win', function(id)
	if races[id] then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'You won the race!'})
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Received: $'..races[id].start.price * #races[id].members})
		TriggerClientEvent('fsn_bank:change:walletAdd', source, races[id].start.price * #races[id].members)
		races[id] = nil
		TriggerClientEvent('fsn_criminalmisc:racing:update', -1, races)
	else
		TriggerClientEvent('fsn_criminalmisc:racing:update', -1, races)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for k,v in pairs(races) do
			if v.state == 1 then -- waiting for members
				if v.starttime+30 <= os.time() then
				--if v.starttime+120 <= os.time() then
					print'state1over'
					if #v.members > 1 then
						races[k].state = 2
						TriggerClientEvent('fsn_criminalmisc:racing:update', -1, races)
						for key,val in pairs(v.members) do
							TriggerClientEvent('mythic_notify:client:SendAlert', val, { type = 'inform', text = 'The race will begin in 1 minute!' })
						end
						races[k].starttime = os.time()
					else
						for key,val in pairs(v.members) do
							TriggerClientEvent('mythic_notify:client:SendAlert', val, { type = 'error', text = 'There are not enough members in the race.' })
							TriggerClientEvent('mythic_notify:client:SendAlert', val, { type = 'error', text = 'The race was cancelled.' })
							TriggerClientEvent('mythic_notify:client:SendAlert', val, { type = 'success', text = 'You were refunded: '..v.start.price })
							TriggerClientEvent('fsn_bank:change:walletAdd', val, v.start.price)
						end
						races[k] = nil
						TriggerClientEvent('fsn_criminalmisc:racing:update', -1, races)
					end 
				end
			elseif v.state == 2 then -- waiting for race start
				if v.starttime+10 <= os.time() then
				--if v.starttime+30 <= os.time() then
					races[k].state = 3
					TriggerClientEvent('fsn_criminalmisc:racing:update', -1, races)
					for key,val in pairs(v.members) do
						TriggerClientEvent('mythic_notify:client:SendAlert', val, { type = 'success', text = 'The race has began!' })
						TriggerClientEvent('mythic_notify:client:SendAlert', val, { type = 'success', text = 'Go' })
						TriggerClientEvent('mythic_notify:client:SendAlert', val, { type = 'success', text = 'Go' })
						TriggerClientEvent('mythic_notify:client:SendAlert', val, { type = 'success', text = 'Go' })
					end
					races[k].starttime = os.time()
				end
			elseif v.state == 3 then -- race started
				if v.starttime+600 <= os.time() then
					for key,val in pairs(v.members) do
						TriggerClientEvent('mythic_notify:client:SendAlert', val, { type = 'error', text = 'The race took too long, it was disbanded.' })
					end
					races[k] = nil
					TriggerClientEvent('fsn_criminalmisc:racing:update', -1, races)
				end
			elseif v.state == 4 then -- race ended
				
			else -- unknown state?? 
			
			end
		end
	end
end)