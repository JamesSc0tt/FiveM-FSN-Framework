local crafting = false
local crafting_start = 0
Citizen.CreateThread(function()
	local craft_spot = {x = 2358.9116210938, y = 3136.5368652344, z = 48.208744049072}
	--while true do Citizen.Wait(0)
		for k, v in pairs(robbables) do
			--local bleep = AddBlipForCoord(v.x, v.y, v.z)
			--SetBlipSprite(bleep, 1)
			--SetBlipColour(bleep, 3)
			--SetBlipAsShortRange(bleep, true)
			--BeginTextCommandSetBlipName("STRING")
			--AddTextComponentString("Robbable Property")
			--EndTextCommandSetBlipName(bleep)
		end
	--end
	while true do Citizen.Wait(0)
		-- craft crowbar
		if GetDistanceBetweenCoords(craft_spot.x,craft_spot.y,craft_spot.z, GetEntityCoords(PlayerPedId()), true) < 10 then
			DrawMarker(25,craft_spot.x, craft_spot.y, craft_spot.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(craft_spot.x,craft_spot.y,craft_spot.z, GetEntityCoords(PlayerPedId()), true) < 2 then
				Util.DrawText3D(craft_spot.x, craft_spot.y, craft_spot.z, '[E] Craft ~b~Crowbar', {255,255,255,200}, 0.25)
				if crafting then
					if crafting_start+5000 <= GetGameTimer() then
						print 'crafting false'
						crafting = false
						exports["fsn_progress"]:removeBar()
						
						
						TriggerEvent('fsn_inventory:items:add', {
							index = 'crowbar',
							name = 'Crowbar',
							amt = 2,
							data = {
								weight = 3.0
							},
						})
					else
						--print 'still crafting'
						--exports["fsn_progress"]:removeBar()
					end
				else
					if IsControlJustPressed(0,38) then
						if exports["fsn_inventory"]:fsn_HasItem('aluminium') and exports["fsn_inventory"]:fsn_HasItem('steel') then
							if exports["fsn_inventory"]:fsn_GetItemAmount('aluminium') < 2 then
								exports['mythic_notify']:DoCustomHudText('error', 'You need 2 aluminium', 4000)					
								return
							end
							if exports["fsn_inventory"]:fsn_GetItemAmount('steel') < 5 then
								exports['mythic_notify']:DoCustomHudText('error', 'You need 5 steel', 4000)
								return
							end
							
							crafting = true
							crafting_start = GetGameTimer()
							exports["fsn_progress"]:fsn_ProgressBar(58, 133, 255,'Crafting',5)
							TriggerEvent('fsn_inventory:item:take', 'aluminium', 2)
							TriggerEvent('fsn_inventory:item:take', 'steel', 5)
						else
							exports['mythic_notify']:DoCustomHudText('error', 'You are missing a required resource.', 4000)
							--[[
							TriggerEvent('fsn_inventory:items:add', {
								index = 'aluminium',
								name = 'Aluminium',
								amt = 2,
								data = {
									weight = 2.0
								},
							})
							TriggerEvent('fsn_inventory:items:add', {
								index = 'steel',
								name = 'Steel',
								amt = 5,
								data = {
									weight = 2.0
								},
							})
							]]--
						end
					end
				end
			else
				if crafting then
					crafting = false
					--exports["fsn_progress"]:removeBar()
				end
			end
		end
	end
end)

--[[
	Gathering
]]--
	local gathering_spots = {
		{x = -3174.7419433594, y = 3028.3059082031, z = -33.588928222656},
		{x = -3180.1616210938, y = 3047.1909179688, z = -38.609729766846},
		{x = -3182.7651367188, y = 3055.8120117188, z = -38.639709472656},
		{x = -3178.3395996094, y = 3040.2111816406, z = -34.352951049805},
		{x = -3173.0275878906, y = 3037.5463867188, z = -34.205795288086},
		{x = -3173.3486328125, y = 3017.4841308594, z = -39.274028778076},
		{x = -3172.7990722656, y = 3020.6306152344, z = -34.81258392334},
		{x = -3182.83984375, y = 3009.8308105469, z = -40.095069885254},
		{x = -3176.0131835938, y = 3021.3854980469, z = -39.140880584717},
		{x = -3199.40234375, y = 3035.2478027344, z = -37.261611938477}
	}
	local bleep = AddBlipForCoord(gathering_spots[1].x, gathering_spots[1].y, gathering_spots[1].z)
	SetBlipSprite(bleep, 353)
	SetBlipAsShortRange(bleep, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("offshore")
	EndTextCommandSetBlipName(bleep)
	current_gathering = math.random(1,#gathering_spots)
	Citizen.CreateThread(function()
		while true do Citizen.Wait(0)
			local g = gathering_spots[current_gathering]
			if GetDistanceBetweenCoords(g.x,g.y,g.z,GetEntityCoords(PlayerPedId()),false) < 50 then
				DrawMarker(1,g.x, g.y, g.z,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
				if GetDistanceBetweenCoords(g.x,g.y,g.z,GetEntityCoords(PlayerPedId()),true) < 1 then
					TriggerEvent('fsn_inventory:items:add', {
						index = 'aluminium',
						name = 'Aluminium',
						amt = math.random(1,2),
						data = {
							weight = 2.0
						},
					})
					Citizen.Wait(500)
					current_gathering = math.random(1,#gathering_spots)
				end
			end
		end
	end)
	
--[[
	Robbery stuff
]]--
local robbing = false
local robbing_id = false

local leave = {x = 346.60235595703, y = -1012.9641723633, z = -99.196189880371}

local searching = false
local searching_id = false
local searching_start = 0

RegisterNetEvent('fsn_criminalmisc:houserobbery:try')
AddEventHandler('fsn_criminalmisc:houserobbery:try', function()
	local tyme = exports["fsn_timeandweather"]:getTime()
	print('current time is: '..tyme[1]..':'..tyme[2])
	if tyme[1] > 6 and tyme[1] < 18 then
		exports['mythic_notify']:DoCustomHudText('inform', 'This action is restricted to night.', 4000)
		return
	end
	if exports["fsn_police"]:fsn_getCopAmt() < 1 then
		exports['mythic_notify']:DoCustomHudText('error', 'No PD.', 4000)
		return 
	end
	if exports["fsn_inventory"]:fsn_HasItem('crowbar') then
		if robbing then return end
		for k, v in pairs(robbables) do
			if GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(PlayerPedId()), true) < 2 then
				exports['mythic_notify']:DoCustomHudText('inform', 'Attempting to rob property: '..v.info..'.', 4000)
				robbing_id = k
				break
			end
		end
		
		if robbing_id then
			-- cooldown stuff
				
			if robbables[robbing_id].cooldown then
				if robbables[robbing_id].cooldown+18000 > GetGameTimer() then
					exports['mythic_notify']:DoCustomHudText('error', 'This is not ready yet.', 4000)
					return
				end
			end
			robbables[robbing_id].cooldown = GetGameTimer()
			
			-- pd call
			local pos = GetEntityCoords(PlayerPedId())
			local coords = {
				x = pos.x,
				y = pos.y,
				z = pos.z
			}
			TriggerServerEvent('fsn_police:dispatch', coords, 18, 'I think /'..robbables[robbing_id].info..'/ is currently being broken into!')
			
			-- animation
			RequestAnimDict("veh@break_in@0h@p_m_one@")
			while not HasAnimDictLoaded("veh@break_in@0h@p_m_one@") do
				Citizen.Wait(0)
			end
			if not IsEntityPlayingAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3) then
				TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
				Citizen.Wait(8000)
				ClearPedTasks(PlayerPedId())
			end
			Citizen.Wait(1)		
			ClearPedTasks(PlayerPedId())
			
			-- instance stuff
			TriggerServerEvent('fsn_apartments:instance:new')
			SetEntityCoords(PlayerPedId(), 347.04724121094,-1000.2844848633,-99.194671630859)
			
			-- prepare robbables
			for k,v in pairs(inside) do
				inside[k].robbed = false
				if math.random(1,100) < 50 then
					inside[k].available = true
				else
					inside[k].available = false
				end
			end
			
			robbing = true
			Citizen.CreateThread(function()
				while robbing do Citizen.Wait(0)
					if GetDistanceBetweenCoords(347.04724121094,-1000.2844848633,-99.194671630859, GetEntityCoords(PlayerPedId()), true) > 100 then
						-- instance stuff
						TriggerServerEvent('fsn_apartments:instance:leave')
						
						SetEntityCoords(PlayerPedId(), robbables[robbing_id].x, robbables[robbing_id].y, robbables[robbing_id].z)
						robbing = false
						robbing_id = false
						searching = false 
					end
					DrawMarker(25, leave.x, leave.y, leave.z - 0.95, 0, 0, 0, 0, 0, 0, 0.50, 0.50, 10.3, 245, 179, 66, 140, 0, 0, 1, 0, 0, 0, 0)
					if GetDistanceBetweenCoords(leave.x, leave.y, leave.z, GetEntityCoords(PlayerPedId()),true) < 1 then
						Util.DrawText3D(leave.x, leave.y, leave.z, '[E] Leave', {255,255,255,200}, 0.3)
						if IsControlJustPressed(0,38) then
							-- instance stuff
							TriggerServerEvent('fsn_apartments:instance:leave')
							
							SetEntityCoords(PlayerPedId(), robbables[robbing_id].x, robbables[robbing_id].y, robbables[robbing_id].z)
							robbing = false
							robbing_id = false
							searching = false 
							
						end
					end
					
					for k, v in pairs(inside) do
						if v.available then
							if v.robbed then
								DrawMarker(25, v.xyz.x, v.xyz.y, v.xyz.z - 0.95, 0, 0, 0, 0, 0, 0, 0.50, 0.50, 10.3, 245, 179, 66, 140, 0, 0, 1, 0, 0, 0, 0)
							else
								DrawMarker(25, v.xyz.x, v.xyz.y, v.xyz.z - 0.95, 0, 0, 0, 0, 0, 0, 0.50, 0.50, 10.3, 255, 255, 255, 140, 0, 0, 1, 0, 0, 0, 0)
								if GetDistanceBetweenCoords(v.xyz.x, v.xyz.y, v.xyz.z, GetEntityCoords(PlayerPedId()),true) < 1 then
									if not searching then
										Util.DrawText3D(v.xyz.x, v.xyz.y, v.xyz.z, '[E] Search:\n'..v.name, {255,255,255,200}, 0.3)
										if IsControlJustPressed(0,38) then
											searching = true
											searching_id = k
											searching_start = GetGameTimer()
											exports["fsn_progress"]:fsn_ProgressBar(58, 133, 255,'Looting',5)
											TriggerEvent('fsn_needs:stress:add', 3)
											Citizen.CreateThread(function()
												while searching do Citizen.Wait(0)
													local spot = inside[searching_id]
													if GetDistanceBetweenCoords(spot.xyz.x,spot.xyz.y,spot.xyz.z,GetEntityCoords(PlayerPedId()),true) < 1 then 
														if searching_start+5000 <= GetGameTimer() then
															exports["fsn_progress"]:removeBar()
															searching = false
															inside[searching_id].robbed = true
															if v.cash > 0 then
																TriggerEvent('fsn_bank:change:walletAdd', math.random(v.cash / 2, v.cash * 2))
															end
															for _,itm in pairs(v.items) do
																if math.random(1,100) < 40 then
																	if itm.preset then
																		TriggerEvent('fsn_inventory:items:addPreset', itm.item, math.random(1,3))
																	end
																end
															end
															for i=1,math.random(1,3) do
																local item = unique_items[math.random(1,#unique_items)]
																item.amt = 1
																TriggerEvent('fsn_inventory:items:add', item)
															end
														end
													else
														exports["fsn_progress"]:removeBar()
														inside[searching_id].robbed = true
														searching = false
														
													end
												end 
											end)
										end
									end
								end
							end
						else
							DrawMarker(25, v.xyz.x, v.xyz.y, v.xyz.z - 0.95, 0, 0, 0, 0, 0, 0, 0.50, 0.50, 10.3, 255, 0, 0, 140, 0, 0, 1, 0, 0, 0, 0)
						end
					end
				end
			end)
		else
			exports['mythic_notify']:DoCustomHudText('error', 'No property nearby.', 4000)
		end
	else
		exports['mythic_notify']:DoCustomHudText('error', 'You are missing a required resource.', 4000)
	end
end)

