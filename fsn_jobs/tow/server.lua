RegisterServerEvent('fsn_jobs:tow:mark')
AddEventHandler('fsn_jobs:tow:mark', function(towPlate, officer)
	if officer == false then officer = source end
	TriggerClientEvent('fsn_jobs:tow:marked', -1, towPlate, officer)
end)