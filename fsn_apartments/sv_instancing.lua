local instances = {}

--RegisterServerEvent('fsn_apartments:instance

RegisterServerEvent('fsn_apartments:instance:leave')
RegisterServerEvent('fsn_apartments:instance:new')
RegisterServerEvent('fsn_apartments:instance:join')

AddEventHandler('fsn_apartments:instance:leave', function()
	for k,v in pairs(instances) do
		for key, value in pairs(v.players) do
			if value == source then
				instances[k].players[key] = nil
				TriggerClientEvent('fsn_apartments:instance:leave', source)
				print(source..' has left instance '..k)
				for kee, vaa in pairs(v.players) do
					TriggerClientEvent('fsn_apartments:instance:update', vaa, instances[k])
				end
			end
		end
	end
end)

AddEventHandler('fsn_apartments:instance:new', function()
	print(source..' is creating a new instance')
	for k, v in pairs(instances) do
		if table.contains(v.players, source) then
			TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:fsn_apartments:^0^r You are already in an instance.')
			print(source..' is already in an instance!')
			return
		end
	end
	local ins_id = #instances+1
	table.insert(instances, ins_id, {
		id = ins_id,
		players = {source},
		created = os.time()
	})
	TriggerClientEvent('fsn_apartments:instance:join', source, instances[ins_id])
end)

AddEventHandler('fsn_apartments:instance:join', function(id)
	for k, v in pairs(instances) do
		if table.contains(v.players, source) then
			TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:fsn_apartments:^0^r You are already in an instance.')
			return
		end
	end
	
	if instances[id] then
		table.insert(instances[id].players, #instances[id].players+1, source)
		
		for k,v in pairs(instances[id].players) do 
			TriggerClientEvent('fsn_apartments:instance:update', v, instances[id])
		end
		
		TriggerClientEvent('fsn_apartments:instance:join', id, instances[id])
	else
		TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:fsn_apartments:^0^r This instance does not exist.')
	end
end)

function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end