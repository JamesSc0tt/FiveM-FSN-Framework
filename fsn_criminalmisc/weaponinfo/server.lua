local dropid = 0
local locktable = false
local droppedWeapons = {}

RegisterServerEvent('fsn_criminalmisc:weapons:addDrop')
AddEventHandler('fsn_criminalmisc:weapons:addDrop', function(droppedWeapon, xyz)
	while locktable do
		Citizen.Wait(1)
		print 'table is locked, waiting'
	end
	if not locktable then
		locktable = true
		dropid = dropid + 1
		local droppedid = dropid
		table.insert(droppedWeapons, #droppedWeapons+1, {
			dropid = droppedid,
			loc = xyz,
			weapon = droppedWeapon
		})
		TriggerClientEvent('fsn_criminalmisc:weapons:updateDropped', -1, droppedWeapons)
		TriggerEvent('fsn_main:logging:addLog', source, 'weapons', 'Player('..source..') dropped '..droppedWeapon.name)
		locktable = false
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, '<b>WEAPON DROPPING IS BROKENED', 'centerLeft', 6000, 'error')
	end
end)

RegisterServerEvent('fsn_criminalmisc:weapons:pickup')
AddEventHandler('fsn_criminalmisc:weapons:pickup', function(droppedid)
	while locktable do
		Citizen.Wait(1)
		print 'table is locked, waiting'
	end
	if not locktable then
		local pickup = false
		locktable = true
		
		for k, v in pairs(droppedWeapons) do
			if v.dropid == droppedid then
				pickup = true
				TriggerClientEvent('fsn_criminalmisc:weapons:pickup', source, v.weapon)
				TriggerEvent('fsn_main:logging:addLog', source, 'weapons', 'Player('..source..') picked up '..v.weapon.name)
				table.remove(droppedWeapons, k)
			end
		end
		if not pickup then
			TriggerClientEvent('fsn_notify:displayNotification', source, 'This weapon does not seem to exist', 'centerLeft', 6000, 'error')
		end
		TriggerClientEvent('fsn_criminalmisc:weapons:updateDropped', -1, droppedWeapons)
		
		locktable = false
	else
		TriggerClientEvent('fsn_notify:displayNotification', source, '<b>WEAPON PICKUP IS BROKENED', 'centerLeft', 6000, 'error')
	end
end)