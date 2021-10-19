local loc = {x = 183.01249694824, y = -1319.4348144531, z = 29.317804336548}
local bleep = false

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		local tyme = exports["fsn_timeandweather"]:getTime()
		if tyme[1] > 6 and tyme[1] < 10 then
			-- we r open
			--print'open'
			if bleep == false or not DoesBlipExist(bleep) then
				bleep = AddBlipForCoord(loc.x, loc.y, loc.z)
				SetBlipSprite(bleep, 277)
				SetBlipColour(bleep, 1)
				SetBlipAsShortRange(bleep, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString("Pawn Store")
				EndTextCommandSetBlipName(bleep)
			end
			if GetDistanceBetweenCoords(loc.x, loc.y, loc.z, GetEntityCoords(PlayerPedId()), false) < 10 then
				DrawMarker(25,loc.x, loc.y, loc.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(loc.x, loc.y, loc.z, GetEntityCoords(PlayerPedId()), false) < 1 then
					Util.DrawText3D(loc.x, loc.y, loc.z, '[E] Sell ~y~stolen items', {255,255,255,200}, 0.25)
					if IsControlJustPressed(0,38) then
						for k,v in pairs(unique_items) do
							if exports["fsn_inventory"]:fsn_HasItem(v.index) then
								local amt = exports["fsn_inventory"]:fsn_GetItemAmount(v.index)
								local price = math.random(100,300)
								TriggerEvent('fsn_inventory:item:take', v.index, amt)
								TriggerEvent('fsn_bank:change:walletAdd', amt*price)
							end
						end
					end
				end
			end
		else
			--print'not'
			--print(tyme[1])
			if bleep ~= false and DoesBlipExist(bleep) then
				RemoveBlip(bleep)
				bleep = false
			end
		end
	end
end)