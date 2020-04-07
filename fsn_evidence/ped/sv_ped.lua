local pedStates = {}

RegisterServerEvent('fsn_evidence:ped:update')
AddEventHandler('fsn_evidence:ped:update', function(tbl)
	if not pedStates[source] then
		pedStates[source] = {}
	end
	pedStates[source] = tbl
	TriggerClientEvent('fsn_evidence:ped:update', -1, source, pedStates[source])
end)