local script = {
	required_online = 2, -- how many gang members have to be online
}

local config = {
	["Grove Street Families"] = { -- name of the gang
		short = 'GSF', -- short term for the gang
		xyz = {x = 101.521, y = -1937.802, z = 20.803}, -- gang territory center
		color = {0,255,0}, -- gang colour 
		members = {}, -- ignore this, will be filled by the script
		npc = {
			model = 's_m_y_clown_01', -- model for the interaction NPC
			xyz = {x=112.561,y=-1961.200,z=20.950,h=16.643}, -- location of the interaction NPC
		},
		takeover = {
			cost = 100000, -- how much it costs to first takeover this gang 
			mdls = {'s_m_y_clown_01'}, -- models that spawn during takeover 
			lvls = {2, 5, 8, 10, 15, 35}, -- number of levels and NPCS that spawn, example: {2 (round 1 spawns 2 NPCs), 5 (round 2 spawns 5 NPCs), 8 (round 4 spawns 8 NPCs)}
			coords = { -- coords that the models can spawn at
				{x = 129.5389251709, y = -1946.0511474609, z = 20.580942153931},
				{x = 131.91596984863, y = -1918.9207763672, z = 21.016706466675},
				{x = 128.45547485352, y = -1937.7961425781, z = 20.629131317139},
				{x = 95.077911376953, y = -1962.1037597656, z = 20.747623443604},
				{x = 81.038185119629, y = -1953.8833007813, z = 20.763277053833},
				{x = 74.092803955078, y = -1943.9144287109, z = 20.818670272827},
				{x = 74.102516174316, y = -1937.4017333984, z = 20.999967575073}
			},
		},
	}
}

RegisterServerEvent('fsn_gangs:request')
AddEventHandler('fsn_gangs:request', function()
	TriggerClientEvent('fsn_gangs:recieve', source, config)
end)

RegisterServerEvent('fsn_gangs:tryTakeOver')
AddEventHandler('fsn_gangs:tryTakeOver', function(key)
	if config[key] then
		local g = config[key]
		local online_members = {}
		for _,m in pairs(g.members) do
			if export['fsn_main']:fsn_GetPlayerFromCharacterId(m.id) and NetworkIsPlayerActive(fsn_GetPlayerFromCharacterId(m.id)) then
				table.insert(online_members, #online_members+1, export['fsn_main']:fsn_GetPlayerFromCharacterId(m.id))
			end
		end
		if #online_members < script.required_online then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Not enough gang members online'})
			return
		end
		if not g.takeover.ongoing then

		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Somebody is already doing a takeover'})
			return
		end
	end
end)