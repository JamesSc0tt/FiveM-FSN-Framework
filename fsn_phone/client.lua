local stores = {
	{x = -1082.1314697266, y = -247.65126037598, z = 37.763290405273}
}
local character = {}
local phoneEnabled = false
local contacts = {}
local adverts = {}

function fsn_NearestPlayersC(x, y, z, radius)
	local players = {}
	for id = 0, 31 do
		local ppos = GetEntityCoords(GetPlayerPed(id))
		if GetDistanceBetweenCoords(ppos.x, ppos.y, ppos.z, x, y, z) < radius then
			table.insert(players, #players+1, GetPlayerServerId(id))
		end
	end
  return players
end

RegisterNetEvent('fsn_phone:displayNumber')
AddEventHandler('fsn_phone:displayNumber', function()
	if character.char_phone and character.char_phone ~= -1 then
		local pos = GetEntityCoords(GetPlayerPed(-1))
	  TriggerServerEvent('fsn_phone:chat', '^*^3phone# |^0^r '..character.char_phone, fsn_NearestPlayersC(pos.x, pos.y, pos.z, 5))
	else
		TriggerEvent('fsn_notify:displayNotification', 'You do not have a phone number!<br>Goto Lifeinvader to get one', 'centerLeft', 8000, 'error')
	end
end)

AddEventHandler('fsn_main:character', function(char)
  character = char
	if character.char_contacts ~= '' then
		contacts = json.decode(character.char_contacts)
	end
end)

RegisterNetEvent('fsn_phone:togglePhone')
AddEventHandler('fsn_phone:togglePhone', function()
	--if character.char_phone == nil then
	--	print(':fsn_phone: INIT FAILED FOR FSN_PHONE')
	--	return
	--end
	if not exports.fsn_inventory:fsn_HasPhone() then
		TriggerEvent('fsn_notify:displayNotification', 'You do not have a phone!<br>Visit a general store to get one.', 'centerLeft', 5000, 'error')
	return end
	if character.char_phone == -1 then
		seemcard = false
	else
		seemcard = true
	end
	if phoneEnabled then
		SetNuiFocus( false )
		SendNUIMessage({
			displayPhone = false
		})
		phoneEnabled = false
	else
		SetNuiFocus( true, true )
		SendNUIMessage({
			displayPhone = true,
			number = character.char_phone,
			simcard = seemcard
		})
		SendNUIMessage({
			updateContacts = true,
			contacts = contacts
		})
		if not IsPedInAnyVehicle(GetPlayerPed(-1),  false) then
			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_STAND_MOBILE", 0, true);
		end
		phoneEnabled = true
		local whitelists = exports['fsn_jobs']:inAnyWhitelist()
		local myWhitelists = {}
		if whitelists ~= false then
			for k,v in pairs(whitelists) do
				table.insert(myWhitelists, #myWhitelists+1, exports['fsn_jobs']:getWhitelistDetails(v))
			end
		end
		SendNUIMessage({
			updateWhitelists = true,
			whitelists = myWhitelists
		})
		SendNUIMessage({
			updateAdverts = true,
			ads = adverts
		})
 	end
end)

RegisterNUICallback( "toggleWhitelist", function(data, cb)
	exports["fsn_jobs"]:toggleWhitelistClock(data['id'])
	TriggerEvent('fsn_phone:togglePhone')
end)

RegisterNUICallback( "disablePhone", function(data, cb)
	FreezeEntityPosition(GetPlayerPed(-1), 0)
	SetEntityCollision(GetPlayerPed(-1), 1, 1)
	ClearPedTasks(GetPlayerPed(-1))
	TriggerEvent('fsn_phone:togglePhone')
end)

RegisterNUICallback('placeAdvert', function(data)
	-- 'fsn_phone:adverts:add', function(name, num, txt)
	TriggerServerEvent('fsn_phone:adverts:add', character.char_fname..' '..character.char_lname, character.char_phone, data.ad)
end)

RegisterNetEvent('fsn_phone:sound')
AddEventHandler('fsn_phone:sound', function(snd)
	SendNUIMessage({
		type = 'sound',
		sound = snd,
	})
end)

RegisterNetEvent('fsn_phone:updateNumber')
AddEventHandler('fsn_phone:updateNumber', function(number)
  character.char_phone = number
	TriggerServerEvent('fsn_main:updateCharNumber', character.char_id, character.char_phone)
end)

RegisterNetEvent('fsn_phone:recieveMessage')
AddEventHandler('fsn_phone:recieveMessage', function(msg)
  if tonumber(msg.to_number) == tonumber(character.char_phone) or tonumber(msg.to_number) == -1 then
		if msg.sender == false then
			for k, v in pairs(contacts) do
				if tonumber(v.number) == tonumber(msg.from_number) then
					msg.sender = v.name
				end
			end
			if msg.sender == false then
				msg.sender = 'UNKNOWN CONTACT'
			end
		end
		PlaySound(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
		--TriggerServerEvent('InteractSound_SV:PlayOnAll', 'demo', 1.0)
		--TriggerServerEvent('InteractSound_SV:PlayOnSource', 'fsn_phonecall', 1.0)
		--TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'fsn_phonecall', 1.0)
		SetNotificationTextEntry("STRING");
		AddTextComponentString(msg.message);
		SetNotificationMessage("CHAR_LIFEINVADER", "CHAR_LIFEINVADER", true, 1, msg.sender.." ("..tostring(msg.from_number)..")", "Text Message");
		DrawNotification(false, true);
		SendNUIMessage({
			addMessage = true,
			contact = msg.sender,
			number = msg.from_number,
			message = msg.message
		})
  end
end)

RegisterNUICallback( "sendText", function( data, cb )
	if not data.num or not character.char_phone or not data.msg then
		TriggerEvent('chatMessage', '', {255,255,255}, '^*^3phone# |^0^r ^1An error occured sending your message')
	return end
	if data.num == '' or character.char_phone == '' or data.msg == '' then
		TriggerEvent('chatMessage', '', {255,255,255}, '^*^3phone# |^0^r ^1An error occured sending your message')
	return end
	TriggerServerEvent('fsn_phone:sendMessage', data.num, character.char_phone, data.msg)
end)

RegisterNUICallback( "deleteContact", function( data, cb )
	if data.luaid then
		contacts[data.luaid] = nil
		TriggerEvent('fsn_notify:displayNotification', 'Contact deleted', 'centerRight', 5000, 'success')
	else
		TriggerEvent('fsn_notify:displayNotification', 'Error occured deleting contact', 'centerRight', 5000, 'error')
	end
	SendNUIMessage({
		updateContacts = true,
		contacts = contacts
	})
	TriggerServerEvent('fsn_phone:db:updateContacts', character.char_id, json.encode(contacts))
end)

RegisterNUICallback( "updateContact", function( data, cb )
	print('updating contact')
	if data.luaid and data.name and data.number and contacts[data.luaid] then
		contacts[data.luaid].name = data.name
		contacts[data.luaid].number = data.number
		TriggerEvent('fsn_notify:displayNotification', 'Contact updated', 'centerRight', 5000, 'success')
	else
		TriggerEvent('fsn_notify:displayNotification', 'Error occured updating contact', 'centerRight', 5000, 'error')
	end
	SendNUIMessage({
		updateContacts = true,
		contacts = contacts
	})
	TriggerServerEvent('fsn_phone:db:updateContacts', character.char_id, json.encode(contacts))
end)

RegisterNUICallback( "addContact", function( data, cb )
	if data.name and data.number then
		table.insert(contacts,#contacts+1,{luaid=#contacts+1,name=data.name,number=data.number})
		TriggerEvent('fsn_notify:displayNotification', 'Contact added', 'centerRight', 5000, 'success')
	else
		TriggerEvent('fsn_notify:displayNotification', 'Error occured adding contact', 'centerRight', 5000, 'error')
	end
	SendNUIMessage({
		updateContacts = true,
		contacts = contacts
	})
	TriggerServerEvent('fsn_phone:db:updateContacts', character.char_id, json.encode(contacts))
end)

RegisterNUICallback('requestGarage', function( data, cb )
	TriggerServerEvent('fsn_garage:phone:requestAll')
end)

RegisterNUICallback('storeVehicle', function( data, cb )
	TriggerEvent('fsn_cargarage:checkStatus', data.plate)
end)

RegisterNetEvent('fsn_garage:phone:recieveAll')
AddEventHandler('fsn_garage:phone:recieveAll', function(tbl)
	print('you got '..#tbl..' cars')
	SendNUIMessage({
		updateGarage = true,
		vehicles = tbl
	})
end)

Citizen.CreateThread( function()
	for k, store in pairs(stores) do
		local blip = AddBlipForCoord(store.x, store.y, store.z)
		SetBlipSprite(blip, 365)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Lifeinvader")
		EndTextCommandSetBlipName(blip)
	end
	while true do
		Citizen.Wait(0)
		for k, v in pairs(stores) do
			if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
				DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
				if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
					SetTextComponentFormat("STRING")
					AddTextComponentString("Press ~INPUT_PICKUP~ to get a ~b~simcard~w~ ($250)")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustPressed(0,38) then
						TriggerServerEvent('fsn_phone:purchased', character.char_id)
					end
				end
			end
		end
	end
end)

--Citizen.CreateThread( function()
	--while true do
		--Citizen.Wait(0)
		--DisableControlAction(0, 199, true)
		--if IsDisabledControlPressed(0,199) and not phoneEnabled then
			--TriggerEvent('fsn_phone:togglePhone')
			--Citizen.Wait(500)
		--end
	--end
--end)

TriggerServerEvent('fsn_phone:adverts:request')
RegisterNetEvent('fsn_phone:adverts:update')
AddEventHandler('fsn_phone:adverts:update', function(ads)
	adverts = ads
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		for k, v in pairs(adverts) do
			if not NetworkIsPlayerActive(GetPlayerFromServerId(source)) then
				TriggerServerEvent('fsn_phone:adverts:remove', v.number)
			end
		end
	end
end)
