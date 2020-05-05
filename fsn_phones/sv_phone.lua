-- path for live server
local datastorePath = 'resources/'..GetCurrentResourceName()..'/datastore/'

local dbg = false -- misc notifications for the client
if dbg then
	-- path for james' pc
	datastorePath = 'F:/FiveM/zfsn_fxs-server/resources/[fsn]/fsn_phones/datastore/'
end

function createNumber()
	local created = false
	local num = 'not-defined-number'
	while not created do --Citizen.Wait(0)
		num = math.random(0,9)..math.random(0,9)..math.random(0,9)..'-'..math.random(0,9)..math.random(0,9)..math.random(0,9)..'-'..math.random(0,9)..math.random(0,9)..math.random(0,9)
		if not io.open(datastorePath..'contacts/'..num..'.txt', 'r') then
			
			local contactFile, err = io.open(datastorePath..'contacts/'..num..'.txt', 'a')
			if not contactFile then return print(err) end
			contactFile:write('[]')
			contactFile:close()
			
			local messagesFile = io.open(datastorePath..'messages/'..num..'.txt', 'a')
			messagesFile:write('[]')
			messagesFile:close()
			
			created = true
		end
	end
	if created then
		return num
	end
end

RegisterServerEvent('fsn_phones:SYS:request:details')
AddEventHandler('fsn_phones:SYS:request:details', function(num, details)
	local deets = {}
	
    local f = assert(io.open(datastorePath..details..'/'..num..'.txt', "rb"))
    local content = f:read("*all")
    f:close()

	deets = json.decode(content)
	
	TriggerClientEvent('fsn_phones:SYS:recieve:details', source, details, deets)
end)

RegisterServerEvent('fsn_phones:SYS:set:details')
AddEventHandler('fsn_phones:SYS:set:details', function(num, details, tbl)
	local detailsFile = io.open(datastorePath..details..'/'..num..'.txt', 'w')
	detailsFile:write(json.encode(tbl))
	detailsFile:close()
	
	if dbg then
		TriggerClientEvent('fsn_phones:GUI:notification', source, 'img/Apple/Contact.png', 'DEBUG', 'Your '..details..' have been updated.', true)
	end
end)

RegisterServerEvent('fsn_phones:SYS:requestGarage')
AddEventHandler('fsn_phones:SYS:requestGarage', function()
	local char_id = exports["fsn_main"]:fsn_CharID(source)
	local src = source
	MySQL.Async.fetchAll("SELECT * FROM fsn_vehicles where char_id = @charid", {['@charid'] = char_id }, function(tbl)
		TriggerClientEvent('fsn_phones:SYS:receiveGarage', src, tbl)
    end)
end)

--TriggerEvent('fsn_phones:SYS:set:details', '504-262-425', 'contacts', {{name='james',number='999-999-999'},{name='james',number='999-999-999'},{name='james',number='999-999-999'}})

RegisterServerEvent('fsn_phones:SYS:newNumber')
AddEventHandler('fsn_phones:SYS:newNumber', function(charid)
  local src = source
  local number = createNumber()
  MySQL.Async.execute('UPDATE `fsn_characters` SET `char_phone` = @number WHERE `fsn_characters`.`char_id` = @charid;', {['@charid'] = charid, ['@number'] = number}, function(rowsChanged)
    TriggerClientEvent('fsn_phones:SYS:updateNumber', src, number)
	TriggerEvent('fsn_main:updateCharNumber', charid, number)
	TriggerClientEvent('fsn_phones:GUI:notification', src, 'img/Apple/Contact.png', 'PHONE', 'Your phone number has been updated to:<br><b>'..number..'</b>', true)
    TriggerClientEvent('fsn_phones:USE:Email', src, {
		subject = 'Welcome to LifeInvader!',
		image = 'https://vignette.wikia.nocookie.net/gtawiki/images/b/b6/Lifeinvader-GTAV-Logo.png/revision/latest/scale-to-width-down/350?cb=20150929201009',
		body = 'Hi,<br><br>Welcome to LifeInvader, the home of all things technology. We\'ve just processed your request for a new mobile number and have charged your account $250.<br><br><b>New number: </b>'..number..'<br><br>Regards,<br>LifeInvader Team',
    })
  end)
end)

RegisterServerEvent('fsn_phones:UTIL:chat')
AddEventHandler('fsn_phones:UTIL:chat', function(str, players)
  for k, v in pairs(players) do
    TriggerClientEvent('chatMessage', v, '', {255,255,255}, str)
  end
end)

RegisterServerEvent('fsn_phones:USE:sendMessage')
AddEventHandler('fsn_phones:USE:sendMessage', function(msg)
	TriggerClientEvent('fsn_phones:USE:Message', -1, msg)
end)

RegisterServerEvent('fsn_phones:SYS:sendTweet')
AddEventHandler('fsn_phones:SYS:sendTweet', function(twt)
	twt.datetime = os.time()
	TriggerClientEvent('fsn_phones:USE:Tweet', -1, twt)
end)

local ads = {}
RegisterServerEvent('fsn_phones:USE:requestAdverts')
AddEventHandler('c', function()
	TriggerClientEvent('fsn_phones:SYS:updateAdverts', source, ads)
end)

RegisterServerEvent('fsn_phones:USE:sendAdvert')
AddEventHandler('fsn_phones:USE:sendAdvert', function(ad, name, num)
	for k, v in pairs(ads) do
		if v.playerid == source then
			ads[k] = nil
		end
	end
	table.insert(ads, #ads+1, {
		playerid = source,
		name = name,
		advert = ad,
		number = num
	})
	TriggerClientEvent('fsn_phones:SYS:updateAdverts', -1, ads)
end)
AddEventHandler('playerDropped', function()
	for k, v in pairs(ads) do
		if v.playerid == source then
			ads[k] = nil
			TriggerClientEvent('fsn_phones:SYS:updateAdverts', -1, ads)
		end
	end
end)