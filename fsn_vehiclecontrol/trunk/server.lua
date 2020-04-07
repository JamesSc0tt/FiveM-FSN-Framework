RegisterServerEvent('fsn_vehiclecontrol:trunk:forceIn')
AddEventHandler('fsn_vehiclecontrol:trunk:forceIn', function(ply, netid)
	print(source..' is forcing '..ply..' into trunk of '..netid)
	TriggerClientEvent('fsn_vehiclecontrol:trunk:forceIn', ply, netid)
end)
print'ass'