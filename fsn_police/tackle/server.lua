RegisterServerEvent('Tackle:Server:TacklePlayer')
AddEventHandler('Tackle:Server:TacklePlayer', function(Tackled, ForwardVectorX, ForwardVectorY, ForwardVectorZ, Tackler)
	TriggerClientEvent("Tackle:Client:TacklePlayer", Tackled, ForwardVectorX, ForwardVectorY, ForwardVectorZ, Tackler)
end)
