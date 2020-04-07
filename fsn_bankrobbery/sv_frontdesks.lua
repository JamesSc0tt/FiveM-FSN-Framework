local desks = {
	["Hawick Ave"] = {
		door = {
			mdl = -1184592117,
			x = 309.730,
			y = -280.239,
			z = 54.438,
			locked = true
		},
		keyboards = {
			--mdl = -954257764,
			[1] = {
				payout = math.random(500,1000),
				robspot = {x = 311.05963134766, y = -279.4684753418, z = 54.16463470459, h = 341.77679443359},
				x = 311.296,
				y = -278.917,
				z = 54.380,
				robbed = false,
			},
			[2] = {
				payout = math.random(500,1000),
				robspot = {x = 312.52819824219, y = -279.99087524414, z = 54.164661407471, h = 334.24438476563},
				x = 312.679,
				y = -279.417,
				z = 54.380,
				robbed = false,
			},
			[3] = {
				payout = math.random(500,1000),
				robspot = {x = 314.01126098633, y = -280.52255249023, z = 54.164703369141, h = 338.13391113281},
				x = 614.118,
				y = -279.945,
				z = 54.380,
				robbed = false,
			},
			[4] = {
				payout = math.random(500,1000),
				robspot = {x = 315.26541137695, y = -281.04843139648, z = 54.16471862793, h = 335.29302978516},
				x = 315.42,
				y = -280.437,
				z = 54.380,
				robbed = false,
			},
		}
	},
	["Legion Sq"] = {
		door = {
			mdl = -1184592117,
			x = 145.399,
			y = -1041.872,
			z = 29.641,
			locked = true
		},
		keyboards = {
			--mdl = -954257764,
			[1] = {
				payout = math.random(500,1000),
				robspot = {x = 146.72927856445, y = -1041.1540527344, z = 29.367919921875, h = 340.09686279297},
				x = 146.966,
				y = -1040.550,
				z = 29.584,
				robbed = 'hacked',
			},
			[2] = {
				payout = math.random(500,1000),
				robspot = {x = 148.19299316406, y = -1041.6196289063, z = 29.36795425415, h = 338.73071289063},
				x = 148.349,
				y = -1041.051,
				z = 29.584,
				robbed = 'nothacked',
			},
			[3] = {
				payout = math.random(500,1000),
				robspot = {x = 149.5933380127, y = -1042.1168212891, z = 29.367990493774, h = 347.94549560547},
				x = 149.788,
				y = -1041.79,
				z = 29.584,
				robbed = 'nothacked',
			},
			[4] = {
				payout = math.random(500,1000),
				robspot = {x = 150.82872009277, y = -1042.5831298828, z = 29.368017196655, h = 343.71429443359},
				x = 151.093,
				y = -1042.072,
				z = 29.584,
				robbed = 'nothacked',
			},
		}
	},
}

RegisterServerEvent('fsn_bankrobbery:desks:doorUnlock')
AddEventHandler('fsn_bankrobbery:desks:doorUnlock', function(bank)
	desks[bank]['door'].locked = false
	TriggerClientEvent('fsn_bankrobbery:desks:receive', -1, desks)
end)

RegisterServerEvent('fsn_bankrobbery:desks:request')
AddEventHandler('fsn_bankrobbery:desks:request', function()
	TriggerClientEvent('fsn_bankrobbery:desks:receive', source, desks)
end)

RegisterServerEvent('fsn_bankrobbery:desks:startHack')
AddEventHandler('fsn_bankrobbery:desks:startHack', function(bank, board)
	print('bank('..bank..'), keyboard('..board..') is being robbed')
	local computer = desks[bank]['keyboards'][board]
	computer['robbed'] = 'hacking'
	TriggerClientEvent('fsn_bankrobbery:desks:receive', -1, desks)
end)

RegisterServerEvent('fsn_bankrobbery:desks:endHack')
AddEventHandler('fsn_bankrobbery:desks:endHack', function(bank, board, state)
	local computer = desks[bank]['keyboards'][board]
	if state then
		-- hacking was successful
		computer['robbed'] = 'hacked'
		TriggerClientEvent('fsn_bank:change:bankAdd', source, computer['payout'])
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'You hacked the device and wired $'..computer['payout']..' to your account.' })
	else
		-- hacking was failed, allow retry with hacking kit
		if computer['robbed'] == 'hackfailed' then
			computer['robbed'] = 'hacked'
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You failed to hack the device!' })
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You can retry the hacking if you have the right device.' })
		else
			computer['robbed'] = 'hackfailed'
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You failed the retry of the computer hacking.' })
		end
	end
	TriggerClientEvent('fsn_bankrobbery:desks:receive', -1, desks)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(900000)
		desks = {
			["Hawick Ave"] = {
				door = {
					mdl = -1184592117,
					x = 309.730,
					y = -280.239,
					z = 54.438,
					locked = true
				},
				keyboards = {
					--mdl = -954257764,
					[1] = {
						payout = math.random(500,1000),
						robspot = {x = 311.05963134766, y = -279.4684753418, z = 54.16463470459, h = 341.77679443359},
						x = 311.296,
						y = -278.917,
						z = 54.380,
						robbed = false,
					},
					[2] = {
						payout = math.random(500,1000),
						robspot = {x = 312.52819824219, y = -279.99087524414, z = 54.164661407471, h = 334.24438476563},
						x = 312.679,
						y = -279.417,
						z = 54.380,
						robbed = false,
					},
					[3] = {
						payout = math.random(500,1000),
						robspot = {x = 314.01126098633, y = -280.52255249023, z = 54.164703369141, h = 338.13391113281},
						x = 614.118,
						y = -279.945,
						z = 54.380,
						robbed = false,
					},
					[4] = {
						payout = math.random(500,1000),
						robspot = {x = 315.26541137695, y = -281.04843139648, z = 54.16471862793, h = 335.29302978516},
						x = 315.42,
						y = -280.437,
						z = 54.380,
						robbed = false,
					},
				}
			},
			["Legion Sq"] = {
				door = {
					mdl = -1184592117,
					x = 145.399,
					y = -1041.872,
					z = 29.641,
					locked = true
				},
				keyboards = {
					--mdl = -954257764,
					[1] = {
						payout = math.random(500,1000),
						robspot = {x = 146.72927856445, y = -1041.1540527344, z = 29.367919921875, h = 340.09686279297},
						x = 146.966,
						y = -1040.550,
						z = 29.584,
						robbed = 'hacked',
					},
					[2] = {
						payout = math.random(500,1000),
						robspot = {x = 148.19299316406, y = -1041.6196289063, z = 29.36795425415, h = 338.73071289063},
						x = 148.349,
						y = -1041.051,
						z = 29.584,
						robbed = 'nothacked',
					},
					[3] = {
						payout = math.random(500,1000),
						robspot = {x = 149.5933380127, y = -1042.1168212891, z = 29.367990493774, h = 347.94549560547},
						x = 149.788,
						y = -1041.79,
						z = 29.584,
						robbed = 'nothacked',
					},
					[4] = {
						payout = math.random(500,1000),
						robspot = {x = 150.82872009277, y = -1042.5831298828, z = 29.368017196655, h = 343.71429443359},
						x = 151.093,
						y = -1042.072,
						z = 29.584,
						robbed = 'nothacked',
					},
				}
			}
		}
	end
end)
