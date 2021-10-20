local blip = {x = -1187.1330566406, y = -886.71539306641, z = 13.995163917542}

function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.2, 0.2)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local washedhands = false
local currentorder = -1
local lastorder = 0
local currenttime = 1
local nextorder = 0
local orders = {
	[1] = {price = 150, order = {"burger", "fries", "ecola_drink"}},
	[2] = {price = 10, order = {"ecola_drink"}},
	[3] = {price = 75, order = {"ecola_drink", "fries"}},
	[4] = {price = 120, order = {"fries", "burger"}},
	[5] = {price = 60, order = {"burger"}},
	[6] = {price = 60, order = {"fries"}},
	[6] = {price = 10, order = {"ecola_drink"}},
}

local storage = {burgers=0,fries=0,drinks=0}

Citizen.CreateThread(function()
	while true do Citizen.Wait(1000)
		currenttime = currenttime + 1
	end
end)

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(-1187.6320800781,-887.10430908203,13.995164871216)
	SetBlipSprite(blip, 106)
	SetBlipColour(blip, 0)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("BurgerShot")
	EndTextCommandSetBlipName(blip)
	while true do Citizen.Wait(0)
		-- Storage take
		if GetDistanceBetweenCoords(-1197.05078125, -893.90710449219, 13.995162963867, GetEntityCoords(PlayerPedId()), true) < 5 then
			DrawMarker(1,-1197.05078125, -893.90710449219, 13.995162963867-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(-1197.05078125, -893.90710449219, 13.995162963867, GetEntityCoords(PlayerPedId()), true) < 1 then
				fsn_drawText3D(-1197.05078125, -893.90710449219, 13.995162963867, 'Burgers: '..storage.burgers..'/5\nFries: '..storage.fries..'/5\nDrinks: '..storage.drinks..'/5')
				SetTextComponentFormat("STRING")
				AddTextComponentString("~INPUT_PICKUP~ Take eCola\n~INPUT_SPECIAL_ABILITY_SECONDARY~ Take Burger\n~INPUT_ENTER~ Take Fries")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0,38) then
					if not fsn_HasItem('ecola_drink') then
						if storage.drinks > 0 then
							TriggerEvent('fsn_inventory:item:add', 'ecola_drink', 1)
							storage.drinks = storage.drinks-1
						else
							TriggerEvent('fsn_notify:displayNotification', 'There are no drinks', 'centerLeft', 4000, 'error')
						end
					else
						TriggerEvent('fsn_notify:displayNotification', 'You already have ecola!', 'centerLeft', 4000, 'error')
					end
				end
				if IsControlJustPressed(0,23) then
					if not fsn_HasItem('fries') then
						if storage.fries > 0 then
							TriggerEvent('fsn_inventory:item:add', 'fries', 1)
							storage.fries = storage.fries-1
						else
							TriggerEvent('fsn_notify:displayNotification', 'There are no fries', 'centerLeft', 4000, 'error')
						end
					else
						TriggerEvent('fsn_notify:displayNotification', 'You already have fries!', 'centerLeft', 4000, 'error')
					end
				end
				if IsControlJustPressed(0,29) then
					if not fsn_HasItem('burger') then
						if storage.burgers > 0 then
							TriggerEvent('fsn_inventory:item:add', 'burger', 1)
							storage.burgers = storage.burgers-1
						else
							TriggerEvent('fsn_notify:displayNotification', 'There are no burger', 'centerLeft', 4000, 'error')
						end
					else
						TriggerEvent('fsn_notify:displayNotification', 'You already have burger!', 'centerLeft', 4000, 'error')
					end
				end
			end
		end
		-- Storage add
		if GetDistanceBetweenCoords(-1197.462890625, -896.1552734375, 13.995164871216, GetEntityCoords(PlayerPedId()), true) < 5 then
			DrawMarker(1,-1197.462890625, -896.1552734375, 13.995164871216-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(-1197.462890625, -896.1552734375, 13.995164871216, GetEntityCoords(PlayerPedId()), true) < 1 then
				fsn_drawText3D(-1197.462890625, -896.1552734375, 13.995164871216, 'Burgers: '..storage.burgers..'/5\nFries: '..storage.fries..'/5\nDrinks: '..storage.drinks..'/5')
				SetTextComponentFormat("STRING")
				AddTextComponentString("~INPUT_PICKUP~ Store eCola\n~INPUT_SPECIAL_ABILITY_SECONDARY~ Store Burger\n~INPUT_ENTER~ Store Fries")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0,38) then
					if fsn_HasItem('ecola_drink') then
						if storage.drinks < 5 then
							TriggerEvent('fsn_inventory:item:take', 'ecola_drink', 1)
							storage.drinks = storage.drinks+1
						else
							TriggerEvent('fsn_notify:displayNotification', 'You cannot store any more drinks '..storage.drinks..'/5', 'centerLeft', 4000, 'error')
						end
					else
						TriggerEvent('fsn_notify:displayNotification', 'You dont have ecola!', 'centerLeft', 4000, 'error')
					end
				end
				if IsControlJustPressed(0,23) then
					if fsn_HasItem('fries') then
						if storage.fries < 5 then
							TriggerEvent('fsn_inventory:item:take', 'fries', 1)
							storage.fries = storage.fries+1
						else
							TriggerEvent('fsn_notify:displayNotification', 'You cannot store any more fries '..storage.fries..'/5', 'centerLeft', 4000, 'error')
						end
					else
						TriggerEvent('fsn_notify:displayNotification', 'You dont have fries!', 'centerLeft', 4000, 'error')
					end
				end
				if IsControlJustPressed(0,29) then
					if fsn_HasItem('burger') then
						if storage.fries < 5 then
							TriggerEvent('fsn_inventory:item:take', 'burger', 1)
							storage.burgers = storage.burgers+1
						else
							TriggerEvent('fsn_notify:displayNotification', 'You cannot store any more burgers '..storage.burgers..'/5', 'centerLeft', 4000, 'error')
						end
					else
						TriggerEvent('fsn_notify:displayNotification', 'You dont have burger!', 'centerLeft', 4000, 'error')
					end
				end
			end
		end
		-- Till
		if GetDistanceBetweenCoords(-1196.7224121094, -891.4462890625, 13.995155334473, GetEntityCoords(PlayerPedId()), true) < 5 then
			DrawMarker(1,-1196.7224121094, -891.4462890625, 13.995155334473-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(-1196.7224121094, -891.4462890625, 13.995155334473, GetEntityCoords(PlayerPedId()), true) < 1 then
				if currentorder ~= -1 then
					SetTextComponentFormat("STRING")
					AddTextComponentString("Press ~INPUT_PICKUP~ to sell your order\nPress ~INPUT_PUSH_TO_TALK~ to view your order")					
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				else
					SetTextComponentFormat("STRING")
					AddTextComponentString("Press ~INPUT_PICKUP~ to get an order")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				end
				if IsControlJustPressed(0, 249) then
					if currentorder ~= -1 then
						local myorder = table.concat(orders[currentorder].order,",")
						TriggerEvent('fsn_notify:displayNotification', 'Your order: '..myorder, 'centerLeft', 4000, 'info')
					end
				end
				if IsControlJustPressed(0,38) then
					if currentorder ~= -1 then
						local sold = true
						for k, item in pairs(orders[currentorder].order) do
							if not fsn_HasItem(item) then
								TriggerEvent('fsn_notify:displayNotification', 'You do not have: '..item, 'centerLeft', 4000, 'error')
								sold = false
							end
							if sold then
								if not washedhands then
									TriggerEvent('fsn_notify:displayNotification', 'You did not wash your hands so did not get a tip!', 'centerLeft', 4000, 'error')
								else
									local tip = math.random(1,100)
									TriggerEvent('fsn_notify:displayNotification', 'You got a <b>$'..tip..'</b> tip!', 'centerLeft', 4000, 'success')
									TriggerEvent('fsn_bank:change:walletAdd', tip)
								end
								local mini = orders[currentorder].price - 5
								local maxi = orders[currentorder].price + 10
								local cursale = math.random(mini, maxi)
								TriggerEvent('fsn_bank:change:walletAdd', cursale)
								TriggerEvent('fsn_notify:displayNotification', 'You got paid: $'..cursale, 'centerLeft', 4000, 'success')
								Citizen.Wait(500)
								currentorder = -1
								washedhands = false
							end
						end
					else
						local maff = lastorder + nextorder
						if currenttime >= maff then
							currentorder = math.random(1,#orders)
							lastorder = currenttime
							nextorder = math.random(120,300)
							Citizen.Wait(500)
							local myorder = table.concat(orders[currentorder].order,",")
							TriggerEvent('fsn_notify:displayNotification', 'You got a new order: '..myorder, 'centerLeft', 4000, 'info')
						else
							TriggerEvent('fsn_notify:displayNotification', 'There is no order waiting yet!', 'centerLeft', 4000, 'error')
						end
					end
				end
			end
		end
		-- Freezer 
		if GetDistanceBetweenCoords(-1197.1879882813, -899.86334228516, 13.995163917542, GetEntityCoords(PlayerPedId()), true) < 5 then
			DrawMarker(1,-1197.1879882813, -899.86334228516, 13.995163917542-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(-1197.1879882813, -899.86334228516, 13.995163917542, GetEntityCoords(PlayerPedId()), true) < 1 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("Press ~INPUT_SPECIAL_ABILITY_SECONDARY~ to get <b>burger</b>\nPress ~INPUT_ENTER~ to get <b>fries")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0,23) then
					if not fsn_HasItem('frozen_fries') then
						TriggerEvent('fsn_inventory:item:add', 'frozen_fries', 1)
					else
						TriggerEvent('fsn_notify:displayNotification', 'You already have a frozen fries!', 'centerLeft', 4000, 'error')
					end
				end
				if IsControlJustPressed(0,29) then
					if not fsn_HasItem('frozen_patty') then
						TriggerEvent('fsn_inventory:item:add', 'frozen_patty', 1)
					else
						TriggerEvent('fsn_notify:displayNotification', 'You already have a frozen fries!', 'centerLeft', 4000, 'error')
					end
				end
			end
		end
		-- Sink 
		if GetDistanceBetweenCoords(-1197.3479003906, -901.61151123047, 13.995161056519, GetEntityCoords(PlayerPedId()), true) < 5 then
			DrawMarker(1,-1197.3479003906, -901.61151123047, 13.995161056519-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(-1197.3479003906, -901.61151123047, 13.995161056519, GetEntityCoords(PlayerPedId()), true) < 1 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("Press ~INPUT_PICKUP~ to wash your hands")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0,38) then
					if washedhands then
						TriggerEvent('fsn_notify:displayNotification', 'Do you have OCD? You already washed your hands', 'centerLeft', 4000, 'error')
					else
						TriggerEvent('fsn_notify:displayNotification', 'You washed your hands', 'centerLeft', 4000, 'info')
						washedhands = true
					end
				end
			end
		end
		-- Prepare 
		if GetDistanceBetweenCoords(-1198.8013916016, -902.11535644531, 13.995160102844, GetEntityCoords(PlayerPedId()), true) < 5 then
			DrawMarker(1,-1198.8013916016, -902.11535644531, 13.995160102844-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(-1198.8013916016, -902.11535644531, 13.995160102844, GetEntityCoords(PlayerPedId()), true) < 1 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("Press ~INPUT_PICKUP~ to prepare a burger")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0,38) then
					local prepped = true
					local required = {'burger_bun', 'cooked_patty'}
					for k, item in pairs(required) do
						if not fsn_HasItem(item) then
							TriggerEvent('fsn_notify:displayNotification', 'You do not have: '..items_table[item].display_name, 'centerLeft', 4000, 'error')
							prepped = false
						else
							TriggerEvent('fsn_inventory:item:take', item, fsn_GetItemAmount(item))
						end
					end
					if prepped then
						TriggerEvent('fsn_notify:displayNotification', 'Prepping...', 'centerLeft', 1000, 'info')
						Citizen.Wait(1000)
						TriggerEvent('fsn_inventory:item:add', 'burger', 1)
					end
				end
			end
		end
		-- Grill 
		if GetDistanceBetweenCoords(-1202.4093017578, -896.89923095703, 13.995160102844, GetEntityCoords(PlayerPedId()), true) < 5 then
			DrawMarker(1,-1202.4093017578, -896.89923095703, 13.995160102844-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(-1202.4093017578, -896.89923095703, 13.995160102844, GetEntityCoords(PlayerPedId()), true) < 1 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("Press ~INPUT_PICKUP~ to cook a burger")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0,38) then
					if fsn_HasItem('frozen_patty') then
						TriggerEvent('fsn_inventory:item:take', 'frozen_patty', fsn_GetItemAmount('frozen_patty'))
						TriggerEvent('fsn_notify:displayNotification', 'Cooking...', 'centerLeft', 1000, 'info')
						Citizen.Wait(1000)
						TriggerEvent('fsn_inventory:item:add', 'cooked_patty', 1)
					else
						TriggerEvent('fsn_notify:displayNotification', 'You do not have a frozen patty!', 'centerLeft', 4000, 'error')
					end
				end
			end
		end
		-- Fryer 
		if GetDistanceBetweenCoords(-1200.6815185547, -899.34533691406, 13.995161056519, GetEntityCoords(PlayerPedId()), true) < 5 then
			DrawMarker(1,-1200.6815185547, -899.34533691406, 13.995161056519-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(-1200.6815185547, -899.34533691406, 13.995161056519, GetEntityCoords(PlayerPedId()), true) < 1 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("Press ~INPUT_PICKUP~ to cook fries")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0,38) then
					if fsn_HasItem('frozen_fries') then
						TriggerEvent('fsn_inventory:item:take', 'frozen_fries', fsn_GetItemAmount('frozen_fries'))
						TriggerEvent('fsn_notify:displayNotification', 'Cooking...', 'centerLeft', 1000, 'info')
						Citizen.Wait(1000)
						TriggerEvent('fsn_inventory:item:add', 'fries', 1)
					else
						TriggerEvent('fsn_notify:displayNotification', 'You do not have a frozen fries!', 'centerLeft', 4000, 'error')
					end
				end
			end
		end
		-- Oven 
		if GetDistanceBetweenCoords(-1203.0020751953, -895.39642333984, 13.995157241821, GetEntityCoords(PlayerPedId()), true) < 5 then
			DrawMarker(1,-1203.0020751953, -895.39642333984, 13.995157241821-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(-1203.0020751953, -895.39642333984, 13.995157241821, GetEntityCoords(PlayerPedId()), true) < 1 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("Press ~INPUT_PICKUP~ to get a <b>Bun</b>, <b>Lettuce</b> & <b>Tomato")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0,38) then
					if not fsn_HasItem('burger_bun') then
						TriggerEvent('fsn_inventory:item:add', 'burger_bun', 1)
					else
						TriggerEvent('fsn_notify:displayNotification', 'You already have a burger bun!', 'centerLeft', 4000, 'error')
					end
				end
			end
		end
		-- Drink Vendor 
		if GetDistanceBetweenCoords(-1199.1781005859, -894.56127929688, 13.995157241821, GetEntityCoords(PlayerPedId()), true) < 5 then
			DrawMarker(1,-1199.1781005859, -894.56127929688, 13.995157241821-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(-1199.1781005859, -894.56127929688, 13.995157241821, GetEntityCoords(PlayerPedId()), true) < 1 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("Press ~INPUT_PICKUP~ to pour <b>eCola")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0,38) then
					if not fsn_HasItem('ecola_drink') then
						TriggerEvent('fsn_inventory:item:add', 'ecola_drink', 1)
					else
						TriggerEvent('fsn_notify:displayNotification', 'You already have a eCola drink!', 'centerLeft', 4000, 'error')
					end
				end
			end
		end
	end
end)