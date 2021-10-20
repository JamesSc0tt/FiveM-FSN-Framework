local sellables = {"joint", "meth_rocks"}
local init = false
local areas = {}
RegisterNetEvent('fsn_criminalmisc:drugs:streetselling:send')
AddEventHandler('fsn_criminalmisc:drugs:streetselling:send', function(tbl)
	init = true
	areas = tbl
	for k, v in pairs(tbl) do
		if v.premium then
			if exports["fsn_inventory"]:fsn_HasItem('radio_receiver') then
				--[[
				TriggerEvent('fsn_phone:recieveMessage', {
				  sender = 'DarkWeb',
				  from_number = 666,
				  to_number = -1,
				  message = 'We just got word drugs are selling better in: '..v.name
				})
				]]--
				TriggerEvent('fsn_phones:USE:Email', {
					subject = '[DarkWeb] Update...',
					body = 'We just got word drugs are selling better in: '..v.name,
				})
				print('new premium is '..v.name..' ('..k..') and incity is '..tostring(v.incity))
			end
		end
	end
end)

Citizen.CreateThread(function()
	TriggerServerEvent('fsn_criminalmisc:drugs:streetselling:request')
end)

----------------------------------------------- system xx
function hasDrugs()
	for k, v in pairs(sellables) do
		if exports["fsn_inventory"]:fsn_HasItem(v) then
			return true
		end
	end
	return false
end

function getMyDrug()
	for k, v in pairs(sellables) do
		if exports["fsn_inventory"]:fsn_HasItem(v) then
			return v
		end
	end
	return false
end

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

function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end

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

local selling = false
local startsale = 0
local curtime = 0
local sold_peds = {}

function getPed()
	local peds = exports.fsn_entfinder:getPeds(false)
	if peds then
		for key, ped in pairs(peds) do
			if GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(PlayerPedId()), true) < 3 and ped ~= PlayerPedId() then 
				return ped
			end
		end
	end
	return false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local radioxyz = {x = 567.08984375, y = -3127.2580566406, z = 18.768598556519}
		if GetDistanceBetweenCoords(radioxyz.x, radioxyz.y, radioxyz.z, GetEntityCoords(PlayerPedId()), true) < 10 then
			DrawMarker(1,radioxyz.x, radioxyz.y, radioxyz.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(radioxyz.x, radioxyz.y, radioxyz.z, GetEntityCoords(PlayerPedId()), true) < 2 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("~INPUT_PICKUP~ attempt to steal radio component")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0, 38) then
					TriggerServerEvent('fsn_criminalmisc:drugs:streetselling:radio')
				end
			end
		end
		if init and hasDrugs() and not IsPedInAnyVehicle(PlayerPedId()) then
			local drug = getMyDrug()
			local myarea = string.upper(GetNameOfZone(GetEntityCoords(PlayerPedId())))
			if areas[myarea] and areas[myarea].enabled and areas[myarea].drugs[drug] then
				local obj = getPed()--fsn_FindNearbyPed(1.5)
				if obj and IsPedHuman(obj) and not table.contains(sold_peds, obj) and not IsEntityDead(obj) and not IsPedAPlayer(obj) then
					if not selling then
						if IsControlPressed(0, 19) then
							fsn_drawText3D(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, '[~g~E~w~] Sell ~b~'..drug)
							if IsControlJustPressed(0, 38) then
								if math.random(1,100) > areas[myarea].callpercentage then
									local pos = GetEntityCoords(obj)
									local coords = {
									  x = pos.x,
									  y = pos.y,
									  z = pos.z
									}
									TriggerServerEvent('fsn_police:dispatch', coords, 3)
									if math.random(0,100) < 5 then
										if exports["fsn_inventory"]:fsn_HasItem('radio_receiver') then
											TriggerEvent('fsn_phone:recieveMessage', {
											  sender = 'DarkWeb',
											  from_number = 666,
											  to_number = -1,
											  message = 'PD radio just muttered something about someone selling in '..areas[myarea].name..' if that\'s you, bounce!'
											})
										end
									end
								end
							if math.random(0,100) > areas[myarea].sellpercentage then
								selling = true
								TaskLookAtEntity(obj, PlayerPedId(), 9000, 2084, 3)
								TaskStandStill(obj, 9000)
								startsale = curtime
								selling_item = drug
							else
							  TriggerEvent('fsn_notify:displayNotification', 'They are not interested...', 'centerLeft', 3000, 'error')
							  TriggerEvent('fsn_needs:stress:add', 10)
							  table.insert(sold_peds, #sold_peds+1, {obj, true})
							end
						end
					end
					else
						local selltime = startsale + 9
						if selltime > curtime then
							fsn_drawText3D(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, 'Selling')
							TaskStandStill(obj, 9000)
						else
							fsn_drawText3D(GetEntityCoords(obj).x, GetEntityCoords(obj).y, GetEntityCoords(obj).z, 'Sold')
							local finishtime = selltime + 3
							while not HasAnimDictLoaded('mp_safehouselost@') do
								RequestAnimDict('mp_safehouselost@')
								Citizen.Wait(5)
							end
							TaskPlayAnim(PlayerPedId(), 'mp_safehouselost@', 'package_dropoff', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
							TaskPlayAnim(obj, 'mp_safehouselost@', 'package_dropoff', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
							if finishtime < curtime then
								selling = false
								
								-- work out amount
								if exports["fsn_inventory"]:fsn_GetItemAmount(selling_item) < areas[myarea].drugs[drug].avg then
								  sold_amount = exports["fsn_inventory"]:fsn_GetItemAmount(selling_item)
								else
									local mini = areas[myarea].drugs[drug].avg - math.floor(areas[myarea].drugs[drug].avg / 2)
									local maxi = areas[myarea].drugs[drug].avg + math.ceil(areas[myarea].drugs[drug].avg / 2)
									sold_amount = math.random(mini, maxi)
									if areas[myarea].premium then
										local extra = math.random(1,5)
										sold_amount = sold_amount + extra
										TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:FSN:^0^r ^2 This is a premium area, so you sold an extra '..extra..' items')
									end
								end
								
								-- state stuff
								if drug == 'joint' then
									TriggerEvent('fsn_evidence:ped:addState', 'Slight aroma of weed', 'UPPER_BODY', 300)
								elseif drug == 'meth_rocks' then
									TriggerEvent('fsn_evidence:ped:addState', 'Empty packet with\nmeth residue\nhanging out of\npocket...', 'UPPER_BODY', 60)
								end
								
								-- work out pricing
								local preece = areas[myarea].drugs[drug].value * 2
								local mini = preece - math.floor(preece / 2)
								local maxi = preece + math.ceil(preece / 2)
								local price = 0
								if exports["fsn_police"]:fsn_getCopAmt() > 2 then
									local buff = math.random(10,20)
									local ploos = areas[myarea].drugs[drug].value / 100 * buff
									price = math.random(mini, maxi) + ploos
									TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:FSN:^0^r ^2 Risk is increased so you earned an extra '..buff..'%!')
								else
									price = math.random(mini, maxi)
									--price = math.random(mini, maxi) / 2
									--TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:FSN:^0^r ^2 There aren\'t many cops online, so your earnings are halved.')									
								end
								if areas[myarea].premium then
									local extra = math.random(10,50)
									price = math.random(mini, maxi) + extra
									TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:FSN:^0^r ^2 This is a premium area, so you earned an extra $'..extra..' per item.')
								else
									TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:FSN:^0^r ^2 This is not a premium area.')
								end
								if areas[myarea].incity == false then
									TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:FSN:^0^r ^2 This area is not in the city, so you may earn less.')
									TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:FSN:^0^r ^2 If you think this is an error report "'..myarea..'" to a developer.')
									if math.random(1,100) > 50 then
										price = price / 2
									end
								end
								price = price * sold_amount
								TriggerEvent('fsn_notify:displayNotification', 'They bought '..sold_amount..' '..exports["fsn_inventory"]:fsn_GetItemDetails(drug).name..' for '..price..'DM', 'centerLeft', 3000, 'info')
								TriggerEvent('fsn_inventory:item:add', 'dirty_money', price)
								TriggerEvent('fsn_inventory:item:take', selling_item, sold_amount)
								TriggerEvent('fsn_needs:stress:add', 10)

								table.insert(sold_peds, #sold_peds+1, {obj, true})
								Citizen.Wait(3000)
							end
						end
					end
				else
					if selling then
						TriggerEvent('fsn_notify:displayNotification', 'The transaction was cancelled...', 'centerLeft', 3000, 'error')
						selling = not selling
					end
				end
			else
				--print('area '..myarea..' does not exist/is disabled so you cannot sell here')
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do Citizen.Wait(1000)
		curtime = curtime + 1
	end
end)
