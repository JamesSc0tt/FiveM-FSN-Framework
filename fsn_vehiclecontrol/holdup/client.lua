local vehicle_colours = {
	'Black',
	'Graphite',
	'Black Steel',
	'Silver',
	'Bluish Silver',
	'Rolled Steel',
	'Shadow Silver',
	'Stone Silver',
	'Midnight Silver',
	'Cast Iron Silver',
	'Anthractite Black',
	'Matte Black',
	'Matte Gray',
	'Light Gray',
	'Util Black',
	'Util Black Poly',
	'Util Dark Silver',
	'Util Silver',
	'Util Gun Metal',
	'Util Shadow Silver',
	'Worn Black',
	'Worn Graphite',
	'Worn Silver Gray',
	'Worn Silver',
	'Worn Blue Silver',
	'Worn Shadow Silver',
	'Red',
	'Torino Red',
	'Formula Red',
	'Blaze Red',
	'Grace Red',
	'Garnet Red',
	'Sunset Red',
	'Cabernet Red',
	'Candy Red',
	'Sunrise Orange',
	'Gold',
	'Orange',
	'Red',
	'Dark Red',
	'Matte Orange',
	'Yellow',
	'Util Red',
	'Util Bright Red',
	'Util Garnet Red',
	'Worn Red',
	'Worn Golden Red',
	'Worn Dark Red',
	'Dark Green',
	'Metallic Racing Green',
	'Sea Green',
	'Olive Green',
	'Bright Green',
	'Metalic Gasoline Green',
	'Matte Lime Green',
	'Dark Green',
	'Worn Green',
	'Worn Sea Wash',
	'Metallic Midnight Blue',
	'Metallic Dark Blue',
	'Galaxy Blue',
	'Dark Blue',
	'Saxon Blue',
	'Blue',
	'Mariner Blue',
	'Harbor Blue',
	'Diamond Blue',
	'Surf Blue',
	'Nautical Blue',
	'Ultra Blue',
	'Schafter Purple',
	'Metallic Ultra Blue',
	'Racing Blue',
	'Light Blue',
	'Util Midnight Blue',
	'Util Blue',
	'Util Sea Foam Blue',
	'Util Lightening Blue',
	'Util Maui Blue Poly',
	'Util Bright Blue',
	'Slate Blue',
	'Dark Blue',
	'Blue',
	'Matte Midnight Blue',
	'Worn Dark Blue',
	'Worn Blue',
	'Baby Blue',
	'Yellow',
	'Race Yellow',
	'Bronze',
	'Dew Yellow',
	'Metallic Lime',
	'Metalic Champagne',
	'Feltzer Brown',
	'Creek Brown',
	'Chocolate Brown',
	'Maple Brown',
	'Saddle Brown',
	'Straw Brown',
	'Moss Brown',
	'Bison Brown',
	'Woodbeech Brown',
	'Beechwood Brown',
	'Straw Brown',
	'Sandy Brown',
	'Bleached Brown',
	'Cream',
	'Util Brown',
	'Util Medium Brown',
	'Util Light Brown',
	'Ice White',
	'Frost White',
	'Worn Honey Beige',
	'Worn Brown',
	'Dark Brown',
	'Worn Straw Beige',
	'Brushed Steel',
	'Brushed Black Steel',
	'Brushed Alluminum',
	'Chrome',
	'Worn Off-White',
	'Util Off-White',
	'Worn Orange',
	'Worn Light Orange',
	'Pea Green',
	'Worn Taxi Yellow',
	'Police Blue',
	'Green',
	'Matte Brown',
	'Worn Orange',
	'Ice White',
	'Worn White',
	'Worn Olive Army Green',
	'Pure White',
	'Hot Pink',
	'Salmon Pink',
	'Pfistrer Pink',
	'Bright Orange',
	'Green',
	'Flourescent Blue',
	'Midnight Blue',
	'Midnight Purple',
	'Wine Red',
	'Hunter Green',
	'Bright Purple',
	'Midnight Purple',
	'Carbon Black',
	'Matte Purple',
	'Matte Dark Purple',
	'Metallic Lava Red',
	'Olive Green',
	'Matte Olive Orab',
	'Dark Earth',
	'Desert Tan',
	'Matte Foilage Green',
	'Default Alloy',
	'Epsilon Blue',
	'Pure Gold',
	'Brushed Gold',
	'Secret Gold'
}
function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.3, 0.3)
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

local heldpeds = {}

local holding = false
local holdingstart = 0
local holdingped = false
local holdingcar = false
local holdingnotif = false
local curtime = 0

function fsn_FindNearbyPed(Distance)
    local TargetPed
    local Handle, Ped = FindFirstPed()
    repeat
        local DistanceBetween = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(Ped), true)
        if DoesEntityExist(Ped) and not IsPedAPlayer(Ped) and DistanceBetween <= Distance then
            TargetPed = Ped
        end

    Success, Ped = FindNextPed(Handle)
    until not Success

    EndFindPed(Handle)
    return TargetPed
end

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if IsPlayerFreeAiming(PlayerId()) and not exports['fsn_police']:fsn_PDDuty() and exports["fsn_criminalmisc"]:HoldingWeapon() then
			local ped = fsn_FindNearbyPed(10)
			if ped and IsPlayerFreeAimingAtEntity(PlayerId(), ped) then
				if IsPedInAnyVehicle(ped) then
					local speed = GetEntitySpeed(GetVehiclePedIsIn(ped, false)) * 3.6
					if speed > 3 then
						--ClearPedTasksImmediately(ped)
						fsn_drawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, '~r~scare me')
						holding = true
						holdingped = ped
						holdingstart = curtime
						holdingcar = GetVehiclePedIsIn(ped) 						
						TaskLeaveVehicle(ped, GetVehiclePedIsIn(ped), 256)
						exports["fsn_progress"]:fsn_ProgressBar(58, 133, 255,'Holding up',9)
						if not holdingnotif then 
							TriggerEvent('fsn_notify:displayNotification', 'Holding up for keys...', 'centerRight', 3000, 'info')
							if math.random(1,100) < 85 then
								local pos = GetEntityCoords(PlayerPedId())
								local coords = {
									x = pos.x,
									y = pos.y,
									z = pos.z
								}
								local colour = table.pack(GetVehicleColours(holdingcar))
								colour = colour[1]
								colour = vehicle_colours[colour+1]
								local vehicle = GetDisplayNameFromVehicleModel(GetEntityModel(holdingcar))
								local plate = GetVehicleNumberPlateText(holdingcar)
								TriggerServerEvent('fsn_police:dispatch', coords, 10, '10-60 (ARMED Carjacking) | Vehicle: '..vehicle..' | Plate: '..plate..' | Color: '..colour)
							end
							holdingnotif = true
						end
					end
				else
					if holdingped then
						if ped == holdingped then
							TaskStandStill(ped, 3000)
							if not IsEntityPlayingAnim(ped, 'random@mugging3', "handsup_standing_base", 3) then
								RequestAnimDict('random@mugging3')
								TaskPlayAnim(holdingped, "random@mugging3", "handsup_standing_base", 4.0, -4, -1, 49, 0, 0, 0, 0)
							end
							local maff = 0
							if holdingcar then
								maff = holdingstart + 12
							else
								maff = holdingstart + 20
							end
							if maff < curtime then
								table.insert(heldpeds, #heldpeds+1, {holdingped, true})
								if holdingcar then
									if math.random(0,100) > 25 then
										table.insert(myKeys, {GetVehicleNumberPlateText(holdingcar),true})
										TriggerEvent('fsn_notify:displayNotification', 'You got keys to the car!', 'centerRight', 3000, 'success')
										holding = false
										holdingstart = 0
										holdingped = false
										holdingcar = false
										holdingnotif = false
									else
										TriggerEvent('fsn_notify:displayNotification', 'No keys for you sucka', 'centerRight', 3000, 'error')
										holding = false
										holdingstart = 0
										holdingped = false
										holdingcar = false
										holdingnotif = false
									end
								else
									TriggerEvent('fsn_notify:displayNotification', 'You just robbed some poor local for...', 'centerLeft', 3000, 'info')
									if math.random(1,100) < 25 then
										TriggerEvent('fsn_inventory:item:add', 'dirty_money', math.random(50,1000))
									else
										local amt = math.random(25,400)
										TriggerEvent('fsn_notify:displayNotification', '$'..amt, 'centerLeft', 3000, 'info')
										TriggerEvent('fsn_bank:change:walletAdd', amt)
										if math.random(1,100) < 60 then
											if math.random(1, 100) > 60 then TriggerEvent('fsn_inventory:item:add', 'lockpick', math.random(1,2)) end
											if math.random(1, 100) > 70 then TriggerEvent('fsn_inventory:item:add', 'zipties', 1) end
											if math.random(1, 100) > 65 then TriggerEvent('fsn_inventory:item:add', 'joint', math.random(1,3)) end
											if math.random(1, 100) > 80 then TriggerEvent('fsn_inventory:item:add', 'phosphorus', math.random(1,2)) end
											if math.random(1, 100) < 5 then TriggerEvent('fsn_inventory:item:add', 'packaged_cocaine', 1) end
										end
									end	
									
									if math.random(1,100) < 10 then
										TriggerEvent('fsn_inventory:item:add', 'keycard', 1)
									end
									holding = false
									holdingstart = 0
									holdingped = false
									holdingcar = false
									holdingnotif = false
									--print 'held up a person without keys'
								end 
							end
						end
					else
						if not table.contains(heldpeds, ped) and not IsEntityDead(ped) then
							holding = true
							holdingped = ped
							holdingstart = curtime					
							exports["fsn_progress"]:fsn_ProgressBar(58, 133, 255,'Robbing',21)
							if not holdingnotif then 
								--TriggerEvent('fsn_notify:displayNotification', 'Robbing...', 'centerRight', 3000, 'info')
								if math.random(1,100) < 40 then
									local pos = GetEntityCoords(PlayerPedId())
									local coords = {
										x = pos.x,
										y = pos.y,
										z = pos.z
									}
									TriggerServerEvent('fsn_police:dispatch', coords, 14, '10-32 | Reported ARMED holdup')
								end
								holdingnotif = true
							end
						else
							fsn_drawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, '~r~Not Available Yet')
						end
					end
				end
			end
		else
			if holding then
				exports["fsn_progress"]:removeBar()
			end
			holding = false
			holdingstart = 0
			holdingped = false
			holdingcar = false
			
			
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		curtime = curtime+1
	end
end)


function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end