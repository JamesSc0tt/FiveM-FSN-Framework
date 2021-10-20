-- datastores
local dbug = false -- set to false to remove all default data from the datastore
local myUsername = 'unset'
local myNumber = '000-000-000'
local myName = 'nothing nothing'
local myChar = -1

RegisterNetEvent('fsn_phones:SYS:updateNumber')
AddEventHandler('fsn_phones:SYS:updateNumber', function(number)
	myNumber = number
	exports['mythic_notify']:DoCustomHudText('inform', 'New number: '..number, 10000)
end)
function fsn_NearestPlayersC(x, y, z, radius)
	local players = {}
	for id = 0, 128 do
		local ppos = GetEntityCoords(GetPlayerPed(id))
		if GetDistanceBetweenCoords(ppos.x, ppos.y, ppos.z, x, y, z) < radius then
			table.insert(players, #players+1, GetPlayerServerId(id))
		end
	end
  return players
end
RegisterNetEvent('fsn_phones:UTIL:displayNumber')
AddEventHandler('fsn_phones:UTIL:displayNumber', function()
	if init() and myNumber ~= '000-000-000' then
		local pos = GetEntityCoords(PlayerPedId())
	  TriggerServerEvent('fsn_phones:UTIL:chat', '^*^3phone# |^0^r '..myNumber, fsn_NearestPlayersC(pos.x, pos.y, pos.z, 5))
	else
		TriggerEvent('fsn_notify:displayNotification', 'You do not have a phone number!<br>Goto Lifeinvader to get a SIM Card!', 'centerLeft', 8000, 'error')
	end
end)

function init() -- function to check if the character has init'd
	if myNumber == '000-000-000' then
		--exports['mythic_notify']:DoCustomHudText('error', 'init() == false - head to life invader to get a phone number', 4000)
		print('init() == false - head to life invader to get a phone number')
		return true -- change to false before live
	elseif myUsername == 'unset'  then
		exports['mythic_notify']:DoCustomHudText('error', 'init() == false - your character has not been loaded properly, rejoin the server', 4000)
		return false -- change to false before live
	else
		return true
	end
end
local datastore = {
	calls = {
		{
			from = 'Logan Whitehead',
			number = '999-999-999',
			incoming = true,
			missed = false,
		},
		{
			from = 'Logan Whitehead',
			number = '999-999-999',
			incoming = false,
			missed = true,
		},
		{
			from = '123-123-126',
			number = '123-123-126',
			incoming = true,
			missed = true,
		},
	},
	contacts = {
		["999-999-999"] = {name = 'Logan Whitehead',status='offline'},
		["888-888-888"] = {name = 'Andre Awesome',status='online'},
	},
	messages = {
		["999-999-999"] = {
			preview = 'This is a preview of the text message...',
			texts = {
				{
					datetime = 999,
					text = 'this is a text',
					from = true,
				},
				{
					datetime = 999,
					text = 'i know this is a text',
					from = false,
				},
				{
					datetime = 999,
					text = 'are you sure? this is a text',
					from = true,
				},
			},
		}
	},
	emails = {
		{
			subject = 'I am a test email',
			image = 'https://images.unsplash.com/photo-1500622944204-b135684e99fd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
			body = 'Test email containing an image...',
		},
		{
			subject = 'RE: I am a test email',
			body = 'This one should not have an image attached...',
		},
	},
	tweets = {
		{
			username = 'jamessc0tt',
			tweet = 'I am a sexy tweet short and spout, here is my handle here is my spout',
			datetime = 999,
		},
	},
	adverts = {
		{
			name = 'Logan Whitehead',
			advert = 'Contact me for a good time xx',
			number = '999-999-999',
		}
	},
	transactions = {},
	vehicles = {}
}

RegisterNetEvent('fsn_phones:SYS:receiveGarage')
AddEventHandler('fsn_phones:SYS:receiveGarage', function(vehtbl)
	datastore['vehicles'] = vehtbl
	sendDataStore()
end)

local phoneEnabled = false
local messageActive = false

function sendDataStore()
	-- whitelist stuff
	local whitelists = exports['fsn_jobs']:inAnyWhitelist()
	local myWhitelists = {}
	if whitelists ~= false then
		for k,v in pairs(whitelists) do
			table.insert(myWhitelists, #myWhitelists+1, exports['fsn_jobs']:getWhitelistDetails(v))
		end
	end

	SendNUIMessage({
		type = 'update',
		messages = datastore['messages'],
		tweets = datastore['tweets'],
		adverts = datastore['adverts'],
		whitelists = myWhitelists,
		emails = datastore['emails'],
		contacts = datastore['contacts'],
		transactions = datastore['transactions'],
		calls = datastore['calls'],
		vehicles = datastore['vehicles'],
		balance = exports["fsn_main"]:fsn_GetBank(),
		vpn1 = exports["fsn_inventory"]:fsn_HasItem('vpn1'),
		vpn2 = exports["fsn_inventory"]:fsn_HasItem('vpn2')
	})
end

--[[
function isPhoneActive()
	if phoneEnabled then
		return true
	else
		return false
	end
end
]]

function togglePhone()
	if not init() then return end -- character has not been initiated
	local playerPed = PlayerPedId()
	if phoneEnabled then
		ClearPedTasks(playerPed)
		SetNuiFocus( false )
		SendNUIMessage({
			type = 'status',
			display = false,
		})
		--SetPauseMenuActive(true)
	else

		if not fsn_HasPhone() then -- if does not have phone return jack shit
			TriggerEvent('fsn_notify:displayNotification', 'You do not have a phone!<br>Visit a general store to get one.', 'centerLeft', 5000, 'error')
		return end
		
		SetNuiFocus( true, true )
		SendNUIMessage({
			type = 'status',
			display = true,
			phoneType = 'iphone', -- I'll set this dynamically in the future
			phonenumber = myNumber,
			username = myUsername,
		})
		if not IsPedInAnyVehicle(playerPed,  false) then
			PhonePlayIn()
			--TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STAND_MOBILE", 0, true);
		end
		TriggerServerEvent('fsn_phones:SYS:requestGarage')
		sendDataStore()
	end
	phoneEnabled = not phoneEnabled
end

-- disable nui focus every time the script is restarted 
SetNuiFocus( false )

RegisterNUICallback( "callContact", function(data, cb)
	ExecuteCommand('call '..data.pn)
end)
RegisterNUICallback( "removeContact", function(data, cb)
	if data.pn ~= '' then
		if datastore['contacts'][data.pn] then
			datastore['contacts'][data.pn] = nil
		end
		exports['mythic_notify']:DoCustomHudText('success', 'Contact removed.', 4000)
		sendDataStore()
	else
		exports['mythic_notify']:DoCustomHudText('error', 'Error removing contact:<br>There was an issue with your input.', 4000)
	end	
	TriggerServerEvent('fsn_phones:SYS:set:details', myNumber, 'contacts', datastore['contacts'])
end)
RegisterNUICallback( "updateAddContact", function(data, cb)
	if data.pn ~= '' and data.name ~= '' then
		if datastore['contacts'][data.pn] then
			datastore['contacts'][data.pn]['name'] = data.name
		else
			datastore['contacts'][data.pn] = {name = data.name, status='offline'}
		end
		exports['mythic_notify']:DoCustomHudText('success', 'Contact added/updated.', 4000)
		sendDataStore()
	else
		exports['mythic_notify']:DoCustomHudText('error', 'Error adding/updating contact:<br>There was an issue with your input.', 4000)
	end
	TriggerServerEvent('fsn_phones:SYS:set:details', myNumber, 'contacts', datastore['contacts'])
end)

RegisterNUICallback( "toggleWhitelist", function(data, cb)
	exports["fsn_jobs"]:toggleWhitelistClock(data['id'])
	togglePhone()
end)

RegisterNUICallback( "whitelistUser", function(data, cb)
	exports["fsn_jobs"]:addToWhitelist(data.wl, data.charid, data.lvl)
	togglePhone()
end)

RegisterNUICallback( "sendToServer", function(data, cb)
	if data.tweet then
		if dbug then print(':fsn_phones: new tweet: '..data.tweet) end
		if data.tweet == '' then
			exports['mythic_notify']:DoCustomHudText('error', 'ERROR: No content in tweet.', 4000)
			return
		end
		local twt = {
			username = myUsername,
			tweet = data.tweet
		}
		TriggerServerEvent('fsn_phones:SYS:sendTweet', twt)
		messageActive = false
	elseif data.message then
		-- do datastore stuff on client then send to update
		data.message.from = myNumber
		messageActive = false
		if datastore['messages'][data.message.to] then
			table.insert(datastore['messages'][data.message.to]['texts'], #datastore['messages'][data.message.to]['texts']+1, {
				datetime = 999,
				text = data.message.body,
				from = false,
			})
			datastore['messages'][data.message.to].preview = string.sub(data.message.body, 1, 37)..'...'
		else
			datastore['messages'][data.message.to] = {
				preview = string.sub(data.message.body, 1, 37)..'...',
				texts = {
					{
						datetime = 999,
						text = data.message.body,
						from = false,
					},
				},
			}
		end
		sendDataStore()
		TriggerServerEvent('fsn_phones:USE:sendMessage', data.message)
		exports['mythic_notify']:DoCustomHudText('success', 'Message sent to: '..data.message.to, 4000)
		TriggerServerEvent('fsn_phones:SYS:set:details', myNumber, 'messages', datastore['messages'])
	elseif data.advert then	
		if data.advert ~= '' then
			TriggerServerEvent('fsn_phones:USE:sendAdvert', data.advert, myName, myNumber)
			exports['mythic_notify']:DoCustomHudText('success', 'Advert added.', 4000)
		else
			exports['mythic_notify']:DoCustomHudText('error', 'ERROR Adding Advert:<br>No advert entered.', 4000)
		end
	end
end)

--[[
function toggleMessage()
	if not messageActive then
		messageActive = true
	else
		messageActive = false
	end
end

function toggleMessageInactive()
		messageActive = false
end
]]

RegisterNUICallback( "closePhone", function(data, cb)
	togglePhone()
	PhonePlayOut()
end)

--[[
RegisterNUICallback('messageactive', function(data, cb)
	toggleMessage()
end)

RegisterNUICallback('messageinactive', function(data, cb)
	toggleMessageInactive()
end)
]]
RegisterNetEvent('fsn_phones:GUI:notification')
AddEventHandler('fsn_phones:GUI:notification', function(icon, app, html, sound)
	if sound then
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2, 'demo', 0.1)
		--Citizen.Wait(200)
	end
	SendNUIMessage({
		type = 'notification',
		icon = icon,
		app = app,
		html = html
	})
end)


--[[
	USE
		Uses of the phone, interactions from the server
]]--
RegisterNetEvent('fsn_phones:USE:Phone')
AddEventHandler('fsn_phones:USE:Phone', function()
	if init() then
		togglePhone()
	end
end)
RegisterNetEvent('fsn_phones:USE:Email')
AddEventHandler('fsn_phones:USE:Email', function(email)
	table.insert(datastore['emails'], #datastore['emails']+1, email)
	TriggerEvent('fsn_phones:GUI:notification', 'img/Apple/Mail.png', 'MAIL', '<b>'..string.sub(email.subject, 1, 30)..'</b><br>'..string.sub(email.body, 1,30), false)
end)
RegisterNetEvent('fsn_phones:USE:Message')
AddEventHandler('fsn_phones:USE:Message', function(msg)
	if dbug then print(':fsn_phones: Got txt message for: '..msg.to) end
	if msg.to == myNumber then
		if dbug then print(':fsn_phones: is for me') end
		local contact = false
		if datastore['contacts'][msg.from] then
			contact = datastore['contacts'][msg.from].name..' ('..msg.from..')'
		else
			contact = msg.from
		end
		
		if dbug then print(':fsn_phones: is from '..contact) end
		TriggerEvent('fsn_phones:GUI:notification', 'img/Apple/Messages.png', 'MESSAGES', '<b>'..contact..'</b><br>'..string.sub(msg.body, 1, 37), true)
		if datastore['messages'][msg.from] then 
			datastore['messages'][msg.from].preview = string.sub(msg.body, 1, 37)..'...'
			datastore['messages'][msg.from].contact = contact
			table.insert(datastore['messages'][msg.from]['texts'], #datastore['messages'][msg.from]['texts']+1, {
				datetime = msg.time,
				text = msg.body,
				from = true,
			})
		else
			datastore['messages'][msg.from] = {}
			datastore['messages'][msg.from].preview = string.sub(msg.body, 1, 37)..'...'
			datastore['messages'][msg.from].contact = contact
			datastore['messages'][msg.from]['texts'] = {}
			table.insert(datastore['messages'][msg.from]['texts'], #datastore['messages'][msg.from]['texts']+1, {
				datetime = msg.time,
				text = msg.body,
				from = true,
			})
		end
		sendDataStore()
		TriggerServerEvent('fsn_phones:SYS:set:details', myNumber, 'messages', datastore['messages'])
	end
end)
RegisterNetEvent('fsn_phones:USE:Tweet')
AddEventHandler('fsn_phones:USE:Tweet', function(tweet)
	--[[
	local id = #datastore['tweets']+1
	table.insert(datastore['tweets'], id, {
		username = tweet.username, 
		tweet = tweet.tweet,
		datetime = tweet.time
	})
	]]
	datastore['tweets'] = Util.PrependTable(datastore['tweets'], {
		username = tweet.username, 
		tweet = tweet.tweet,
		datetime = tweet.time
	})
	if string.find(tweet.tweet, '@'..myUsername) or string.find(tweet.tweet, myUsername) then
		datastore['tweets'][id].mention = true
		TriggerEvent('fsn_phones:GUI:notification', 'img/Apple/Twitter.png', 'TWITTER', '<b>Mentioned by: @'..tweet.username..'</b><br>'..tweet.tweet, true)
	else
		TriggerEvent('fsn_phones:GUI:notification', 'img/Apple/Twitter.png', 'TWITTER', 'A new tweet has been posted!', false)
	end
	sendDataStore()
end)
RegisterNetEvent('fsn_phones:SYS:updateAdverts')
AddEventHandler('fsn_phones:SYS:updateAdverts', function(tbl)
	datastore['adverts'] = tbl
	sendDataStore()
end)

RegisterNetEvent('fsn_phones:SYS:recieve:details')
AddEventHandler('fsn_phones:SYS:recieve:details', function(details, tbl)
	datastore[details] = tbl
	sendDataStore()
end)

RegisterNetEvent('fsn_phones:SYS:addTransaction')
AddEventHandler('fsn_phones:SYS:addTransaction', function(tran)
	print 'got transaction'
	--table.insert(datastore['transactions'], #datastore['transactions']+1, tran)
	datastore['transactions'] = Util.PrependTable(datastore['transactions'], tran)
	sendDataStore()
end)
RegisterNetEvent('fsn_phones:SYS:addCall')
RegisterNetEvent('fsn_phones:SYS:addCall', function(num, incoming, missed)
	local name = num
	if datastore['contacts'][num] then
		name = datastore['contacts'][num].name
	end
	datastore['calls'] = Util.PrependTable(datastore['calls'], {
		from = name,
		number = num,
		incoming = incoming,
		missed = missed,
	})
	--[[
	table.insert(datastore['calls'], #datastore['calls']+1, {
		from = name,
		number = num,
		incoming = incoming,
		missed = missed,
	})
	]]--
	sendDataStore()
end)

AddEventHandler('fsn_main:character', function(char)
	myChar = char.char_id
	myName = char.char_fname..' '..char.char_lname
	-- twitter usernames, n stuff
	if char.char_twituname ~= 'notset' then
		myUsername = char.char_twituname
	else 
		myUsername = string.sub(char.char_fname, 1, 1)..char.char_lname
	end
	-- migration from old phone system
	if char.char_phone and char.char_phone ~= '' then
		if not string.find(char.char_phone, '-') then
			  TriggerEvent('chatMessage', '', {255,255,255}, '^1OUR PHONE SYSTEM HAS BEEN UPDATED, HEAD TO LIFE-INVADER TO GET A NEW NUMBER!')
		else
			myNumber = char.char_phone
			if dbg then print(':fsn_phones: My number is: '..myNumber) end
			
			-- request saved data from the server
			TriggerServerEvent('fsn_phones:SYS:request:details', myNumber, 'contacts')
			TriggerServerEvent('fsn_phones:SYS:request:details', myNumber, 'messages')
			
			TriggerServerEvent('fsn_phones:SYS:updateAdverts')
		end
	end
	
	if not dbug then
		datastore['messages'] = {}
		datastore['transactions'] = {}
		datastore['calls'] = {}
		datastore['tweets'] = {}
		datastore['emails'] = {}
		datastore['adverts'] = {}
		datastore['contacts'] = {}
		sendDataStore()
	end
end)

--[[
	Lifeinvader
		Used to purchase a new number
]]--
local stores = {
	vector3(-1082.1314697266, -247.65126037598, 37.763290405273)
}
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
		local playerPed = PlayerPedId()
		local playerPos = GetEntityCoords(playerPed)
		for k, v in pairs(stores) do
			--if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(PlayerPedId()), true) < 10 then
			if Util.GetVecDist(playerPos, v.xyz) < 2 then
				--DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
				Util.DrawText3D(v.x,v.y,v.z, 'Press ~g~[ E ] ~w~ to get a new simcard!')
				--if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(PlayerPedId()), true) < 1 then
				 if Util.GetVecDist(playerPos, v.xyz) < 1 then 
					--SetTextComponentFormat("STRING")
					--AddTextComponentString("Press ~INPUT_PICKUP~ to get a ~b~simcard~w~ ($250)")
					--DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustPressed(0,38) then
						if exports["fsn_main"]:fsn_CanAfford(250) then
							TriggerServerEvent('fsn_phones:SYS:newNumber', myChar)
						else
							exports['mythic_notify']:DoCustomHudText('error', 'You cannot afford $250!', 3000)
						end
					end
				end
			end
		end
	end
end)

function fsn_HasPhone()
	return exports['fsn_inventory']:fsn_HasItem('phone')
end

-- Animation shit

local myPedId = nil

local phoneProp = 0
local phoneModel = "prop_amb_phone"
-- OR "prop_npc_phone"
-- OR "prop_npc_phone_02"
-- OR "prop_cs_phone_01"

local currentStatus = 'out'
local lastDict = nil
local lastAnim = nil
local lastIsFreeze = false

function PhonePlayText ()
	PhonePlayAnim('text')
end

function PhonePlayOut ()
	PhonePlayAnim('out')
end

function PhonePlayIn () 
	if currentStatus == 'out' then
		PhonePlayText()
	end
end

function PhonePlayCall ()
	PhonePlayAnim('call')
end

local ANIMS = {
	['cellphone@'] = {
		['out'] = {
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_call_listen_base',
		},
		['text'] = {
			['out'] = 'cellphone_text_out',
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_text_to_call',
		},
		['call'] = {
			['out'] = 'cellphone_call_out',
			['text'] = 'cellphone_call_to_text',
			['call'] = 'cellphone_text_to_call',
		}
	},
	['anim@cellphone@in_car@ps'] = {
		['out'] = {
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_call_in',
		},
		['text'] = {
			['out'] = 'cellphone_text_out',
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_text_to_call',
		},
		['call'] = {
			['out'] = 'cellphone_horizontal_exit',
			['text'] = 'cellphone_call_to_text',
			['call'] = 'cellphone_text_to_call',
		}
	}
}

function newPhoneProp()
	deletePhone()
	RequestModel(phoneModel)
	while not HasModelLoaded(phoneModel) do
		Citizen.Wait(1)
	end
	phoneProp = CreateObject(GetHashKey(phoneModel), 1.0, 1.0, 1.0, 1, 1, 0)
	local bone = GetPedBoneIndex(myPedId, 28422)
	AttachEntityToEntity(phoneProp, myPedId, bone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
end

function deletePhone ()
	if phoneProp ~= 0 then
		Citizen.InvokeNative(0xAE3CBE5BF394C9C9 , Citizen.PointerValueIntInitialized(phoneProp))
		--DeleteEntity(GetHashKey(phoneProp))
		phoneProp = 0
	end
end

--[[
	out || text || Call ||
--]]
function PhonePlayAnim (status, freeze, force)
	if currentStatus == status and force ~= true then
		return
	end

	myPedId = PlayerPedId()
	local freeze = freeze or false

	local dict = "cellphone@"
	if IsPedInAnyVehicle(myPedId, false) then
		dict = "anim@cellphone@in_car@ps"
	end
	Util.LoadAnimDict(dict)

	local anim = ANIMS[dict][currentStatus][status]
	if currentStatus ~= 'out' then
		StopAnimTask(myPedId, lastDict, lastAnim, 1.0)
	end
	local flag = 50
	if freeze == true then
		flag = 14
	end
	TaskPlayAnim(myPedId, dict, anim, 3.0, -1, -1, flag, 0, false, false, false)

	if status ~= 'out' and currentStatus == 'out' then
		Citizen.Wait(380)
		newPhoneProp()
	end

	lastDict = dict
	lastAnim = anim
	lastIsFreeze = freeze
	currentStatus = status

	if status == 'out' then
		Citizen.Wait(180)
		deletePhone()
		StopAnimTask(myPedId, lastDict, lastAnim, 1.0)
	end

end