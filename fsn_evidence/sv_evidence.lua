local evidence = {}

RegisterServerEvent('fsn_evidence:request')
AddEventHandler('fsn_evidence:request', function()
	TriggerClientEvent('fsn_evidence:receive', source, evidence)
end)

RegisterServerEvent('fsn_evidence:collect')
AddEventHandler('fsn_evidence:collect', function(id)
	local e = evidence[id]
	if e then
		TriggerClientEvent('fsn_evidence:display', source, e)
		evidence[id] = nil
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This evidence has already gone.' })
	end
	TriggerClientEvent('fsn_evidence:receive', -1, evidence)
end)

RegisterServerEvent('fsn_evidence:destroy')
AddEventHandler('fsn_evidence:destroy', function(id)
	local e = evidence[id]
	if e then
		evidence[id] = nil
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'You destroyed this evidence!' })
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This evidence has already gone.' })
	end
	TriggerClientEvent('fsn_evidence:receive', -1, evidence)
end)

-- evidence dropping
RegisterServerEvent('fsn_evidence:drop:casing')
AddEventHandler('fsn_evidence:drop:casing', function(wep,loc)
	--print('adding casing('..wep.ammoType..') for weapon '..wep.name..' at '..loc.x..','..loc.y..','..loc.z)
	evidence[#evidence+1] = {
		e_type = 'casing',
		loc = loc,
		details = {
			ammoType = wep.ammotype,
			serial = wep.Serial,
			owner = wep.Owner
		},
		expire = os.time() + 300,
	}
	--print(wep.Serial)
	--TriggerClientEvent('fsn_evidence:receive', -1, evidence)
end)

RegisterServerEvent('fsn_evidence:drop:blood')
AddEventHandler('fsn_evidence:drop:blood', function(charid,loc)
	--print('adding casing('..wep.ammoType..') for weapon '..wep.name..' at '..loc.x..','..loc.y..','..loc.z)
	evidence[#evidence+1] = {
		e_type = 'blood',
		loc = loc,
		details = {
			dnastring = charid
		},
		expire = os.time() + 300,
	}
	--TriggerClientEvent('fsn_evidence:receive', -1, evidence)
end)

Citizen.CreateThread(function()
	while true do Citizen.Wait(1000)
		if #evidence > 1 then
			for k, e in pairs(evidence) do
				if e.expire <= os.time() then
					print(k..' has expired')
					evidence[k] = nil
				end
			end
			TriggerClientEvent('fsn_evidence:receive', -1, evidence)
		end
	end
end)