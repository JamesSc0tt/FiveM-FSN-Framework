local carrycarried = {}
RegisterServerEvent('fsn_ems:carry:start')
AddEventHandler('fsn_ems:carry:start', function(deaded)
	print(source..' is trying to carry '..deaded)
	if carrycarried[source] or carrycarried[deaded] then return end -- already being carried/carrying
	print('carrying')
	carrycarried[source] = true
	carrycarried[deaded] = true
	TriggerClientEvent('fsn_ems:carry:start', source, deaded)
	TriggerClientEvent('fsn_ems:carried:start', deaded, source)
end)

RegisterServerEvent('fsn_ems:carry:end')
AddEventHandler('fsn_ems:carry:end', function(deaded)
	if not carrycarried[source] or not carrycarried[deaded] then return end -- not being carried/carrying
	carrycarried[source] = nil
	carrycarried[deaded] = nil
	TriggerClientEvent('fsn_ems:carry:end', source, deaded)
	TriggerClientEvent('fsn_ems:carried:end', deaded, source)
end)
print'ass'