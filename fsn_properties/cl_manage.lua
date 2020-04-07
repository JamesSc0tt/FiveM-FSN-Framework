local myKeys = {}
RegisterNetEvent('fsn_properties:keys:give')
AddEventHandler('fsn_properties:keys:give', function(id)
	table.insert(myKeys, #myKeys+1, id)
end)

function hasPropKeys(id)
	for k,v in pairs(myKeys) do
		return true
	end
	return false
end