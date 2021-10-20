RegisterNetEvent('fsn_criminalmisc:robbing:startRobbing')
AddEventHandler('fsn_criminalmisc:robbing:startRobbing', function(ply)
	while not HasAnimDictLoaded('mini@triathlon') do
		RequestAnimDict('mini@triathlon')
		Citizen.Wait(5)
	end
	TaskPlayAnim(PlayerPedId(), "mini@triathlon", "rummage_bag", 8.0, -8, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(2500)
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(ply)), GetEntityCoords(PlayerPedId()), true) < 3 then
		exports['mythic_notify']:DoHudText('success', 'Robbing player: '..GetPlayerServerId(ply))
		TriggerServerEvent('fsn_inventory:sys:request', GetPlayerServerId(ply), GetPlayerServerId(PlayerId()))
	else
		exports['mythic_notify']:DoHudText('error', 'Player is too far away!')
	end
end)
