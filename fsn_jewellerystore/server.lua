local ongoing = false
local lastrobbery = 0
local currenttime = 0

local cases = {
	{-626.5326, -238.3758, 38.05, blip=false, robbed=true, lastrob=0},
	{ -625.6032, -237.5273, 38.05, blip=false, robbed=false, lastrob=0},
	{-626.9178, -235.5166, 38.05, blip=false, robbed=false, lastrob=0},
	{-625.6701, -234.6061, 38.05, blip=false, robbed=false, lastrob=0},
	{-626.8935, -233.0814, 38.05, blip=false, robbed=false, lastrob=0},
	{-627.9514, -233.8582, 38.05, blip=false, robbed=false, lastrob=0},
	{-624.5250, -231.0555, 38.05, blip=false, robbed=false, lastrob=0},
	{-623.0003, -233.0833, 38.05, blip=false, robbed=false, lastrob=0},
	{-620.1098, -233.3672, 38.05, blip=false, robbed=false, lastrob=0},
	{-620.2979, -234.4196, 38.05, blip=false, robbed=false, lastrob=0},
	{-619.0646, -233.5629, 38.05, blip=false, robbed=false, lastrob=0},
	{-617.4846, -230.6598, 38.05, blip=false, robbed=false, lastrob=0},
	{-618.3619, -229.4285, 38.05, blip=false, robbed=false, lastrob=0},
	{-619.6064, -230.5518, 38.05, blip=false, robbed=false, lastrob=0},
	{-620.8951, -228.6519, 38.05, blip=false, robbed=false, lastrob=0},
	{-619.7905, -227.5623, 38.05, blip=false, robbed=false, lastrob=0},
	{-620.6110, -226.4467, 38.05, blip=false, robbed=false, lastrob=0},
	{-623.9951, -228.1755, 38.05, blip=false, robbed=false, lastrob=0},
	{-624.8832, -227.8645, 38.05, blip=false, robbed=false, lastrob=0},
	{-623.6746, -227.0025, 38.05, blip=false, robbed=false, lastrob=0},
}


local amilocked = false
RegisterServerEvent('fsn_jewellerystore:doors:Lock')
AddEventHandler('fsn_jewellerystore:doors:Lock', function()
	amilocked = true
	TriggerClientEvent('fsn_jewellerystore:doors:State', -1, true)
	Citizen.Wait(1200000)
	amilocked = false
	TriggerClientEvent('fsn_jewellerystore:doors:State', -1, false)
end)

RegisterServerEvent('fsn_inventory:gasDoorunlock')
AddEventHandler('fsn_inventory:gasDoorunlock', function()
	TriggerClientEvent('fsn_jewellerystore:gasDoor:toggle', -1)
	TriggerClientEvent('fsn_police:911', -1, 69, 'AutoMSG', 'HUMANE LABS ALARM SYSTEM: Stolen ID card used to unlock door #3557')
	Citizen.Wait(5000)
	TriggerClientEvent('fsn_jewellerystore:gasDoor:toggle', -1)
end)

RegisterServerEvent('fsn_jewellerystore:case:rob')
AddEventHandler('fsn_jewellerystore:case:rob', function(case)
	local case = cases[case]
	local maff = case.lastrob + 1800
	if case.lastrob == 0 then
		maff = 0
	end
	if maff > currenttime then
		TriggerClientEvent('fsn_notify:displayNotification', source, 'This case has been robbed too recently', 'centerRight', 8000, 'error')
	else
		case.robbed = true
		case.lastrob = currenttime
		TriggerClientEvent('fsn_jewellerystore:case:startrob', source, case)
		TriggerClientEvent('fsn_jewellerystore:cases:update', -1, cases)
	end
end)

RegisterServerEvent('fsn_jewellerystore:cases:request')
AddEventHandler('fsn_jewellerystore:cases:request', function()
	TriggerClientEvent('fsn_jewellerystore:cases:update', -1, cases)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		currenttime = currenttime +1
		for k,case in pairs(cases) do
			if case.robbed then
				local maff = case.lastrob + 1800
				if case.lastrob == 0 then
					maff = 0
				end
				if maff > currenttime then
					--TriggerClientEvent('fsn_notify:displayNotification', source, 'This case has been robbed too recently', 'centerRight', 8000, 'error')
				else
					case.robbed = false
					case.lastrob = 0
					TriggerClientEvent('fsn_jewellerystore:cases:update', -1, cases)
				end
			end
		end
	end
end)