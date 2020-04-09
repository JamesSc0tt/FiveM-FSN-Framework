local apartments = {
	[1] = {occupied=false, inst=0},
	[2] = {occupied=false, inst=0},
	[3] = {occupied=false, inst=0},
	[4] = {occupied=false, inst=0},
	[5] = {occupied=false, inst=0},
	[7] = {occupied=false, inst=0},
	[8] = {occupied=false, inst=0},
	[9] = {occupied=false, inst=0},
	[10] = {occupied=false, inst=0},
	[11] = {occupied=false, inst=0},
	[12] = {occupied=false, inst=0},
	[13] = {occupied=false, inst=0},
	[14] = {occupied=false, inst=0},
	[15] = {occupied=false, inst=0},
	[16] = {occupied=false, inst=0},
	[17] = {occupied=false, inst=0},
	[18] = {occupied=false, inst=0},
	[19] = {occupied=false, inst=0},
	[20] = {occupied=false, inst=0},
	[21] = {occupied=false, inst=0},
	[22] = {occupied=false, inst=0},
	[23] = {occupied=false, inst=0},
	[24] = {occupied=false, inst=0},
	[25] = {occupied=false, inst=0},
	[26] = {occupied=false, inst=0},
	[27] = {occupied=false, inst=0},
	[28] = {occupied=false, inst=0},
	[29] = {occupied=false, inst=0},
	[30] = {occupied=false, inst=0},
	[31] = {occupied=false, inst=0},
	[32] = {occupied=false, inst=0},
	[33] = {occupied=false, inst=0},
	[34] = {occupied=false, inst=0},
	[35] = {occupied=false, inst=0},
	[36] = {occupied=false, inst=0},
	[37] = {occupied=false, inst=0},
	[38] = {occupied=false, inst=0},
	[39] = {occupied=false, inst=0},
	[40] = {occupied=false, inst=0},
	[41] = {occupied=false, inst=0},
	[42] = {occupied=false, inst=0},
	[43] = {occupied=false, inst=0},
	[44] = {occupied=false, inst=0},
	[45] = {occupied=false, inst=0},
	[46] = {occupied=false, inst=0},
	[47] = {occupied=false, inst=0},
	[48] = {occupied=false, inst=0},
	[49] = {occupied=false, inst=0},
	[50] = {occupied=false, inst=0},
	[51] = {occupied=false, inst=0}, 
}


function getAvailableAppt(source)
	for k, v in pairs(apartments) do
		if v.occupied == false then
			print(k..' is not owned, giving to '..source)
			v.occupied = true
			v.owner = source
			return k
		else
			if v.owner == source then
				print(source..' already owns '..k)
				return k
			end
		end
	end
end

RegisterServerEvent('fsn_apartments:getApartment')
AddEventHandler('fsn_apartments:getApartment', function(char_id)
  local source = source
	local appt = MySQL.Sync.fetchAll("SELECT * FROM `fsn_apartments` WHERE `apt_owner` = '"..char_id.."'")
	if #appt > 0 then
		local myappt = appt[1]
		local mynum = getAvailableAppt(source)
		local sendappt = {
			number = mynum,
			apptinfo = myappt
		}
		TriggerClientEvent('fsn_apartments:sendApartment', source, sendappt)
	else
		TriggerClientEvent('fsn_apartments:characterCreation', source)
	end
end)

AddEventHandler('playerDropped', function(reason)
    for k, v in pairs(apartments) do
		if v.owner == source then
			print(source..' disconnected('..reason..') setting appt '..k..' to unoccupied')
			v.occupied = false
		end
	end
end)

RegisterServerEvent('fsn_apartments:createApartment')
AddEventHandler('fsn_apartments:createApartment', function(char_id)
	local source = source
	--Citizen.CreateThread(function()
		print('creating new appt for '..char_id)
		local SQL = "INSERT INTO `fsn_apartments` (`apt_id`, `apt_owner`, `apt_inventory`, `apt_cash`, `apt_outfits`, `apt_utils`) VALUES (NULL, '"..char_id.."', '{}', '0', '{}', '{}');"
		MySQL.Sync.execute(SQL)
		--Citizen.Wait(1000)
		
		local appt = MySQL.Sync.fetchAll("SELECT * FROM `fsn_apartments` WHERE `apt_owner` = '"..char_id.."'")
		if #appt > 0 then
			local myappt = appt[1]
			local mynum = getAvailableAppt(source)
			local sendappt = {
				number = mynum,
				apptinfo = {
					apt_id = myappt.apt_id,
					apt_inventory = myappt.apt_inventory,
					apt_cash = myappt.apt_cash,
					apt_outfits = myappt.apt_outfits,
					apt_utils = myappt.apt_utils
				}
			}
			TriggerClientEvent('fsn_apartments:sendApartment', source, sendappt)
			print('sending appt '..myappt.apt_id..' to '..char_id)
		end
	--end)
end)

RegisterServerEvent('fsn_apartments:saveApartment')
AddEventHandler('fsn_apartments:saveApartment', function(appt)
--UPDATE `fsn_datastore`.`fsn_apartments` SET `apt_inventory` = '[]', `apt_cash` = '100', `apt_outfits` = '[]', `apt_utils` = '[]' WHERE `fsn_apartments`.`apt_id` = 4;
	--local SQL = "UPDATE fsn_apartments SET `apt_inventory` = '"..json.encode(appt.apt_inventory).."', `apt_cash` = '"..appt.apt_cash.."', `apt_outfits` = '"..json.encode(appt.apt_outfits).."', apt_utils` = '"..json.encode(appt.apt_utils).."' WHERE `apt_id` = '"..appt.apt_id.."'"
	MySQL.Sync.execute("UPDATE `fsn_apartments` SET `apt_inventory` = @inv, `apt_cash` = @cash, `apt_outfits` = @outfits, `apt_utils` = @utils WHERE `fsn_apartments`.`apt_id` = @id;", {
		['@id'] = appt.apt_id,
		['@inv'] = json.encode(appt.apt_inventory),
		['@cash'] = tonumber(appt.apt_cash),
		['@outfits'] = json.encode(appt.apt_outfits),
		['@utils'] = json.encode(appt.apt_utils)
	})
end)

--------------------------------------------------------- commands
function fsn_SplitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

AddEventHandler('chatMessage', function(source, auth, msg)
	local split = fsn_SplitString(msg, ' ')
	if split[1] == '/stash' then
		if split[2] == 'add' then
			if tonumber(split[3]) then
				TriggerClientEvent('fsn_apartments:stash:add', source, tonumber(split[3]))
			else
				TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:FSN:^0^r That is not a number.')
			end
		end
		if split[2] == 'take' then
			if tonumber(split[3]) then
				TriggerClientEvent('fsn_apartments:stash:take', source, tonumber(split[3]))
			else
				TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^1^*:FSN:^0^r That is not a number.')
			end
		end
	end
	if split[1] == '/outfit' then
		if split[2] == 'add' then
			if split[3] then
				TriggerClientEvent('fsn_apartments:outfit:add', source, split[3])
			end
		end
		if split[2] == 'use' then
			if split[3] then
				TriggerClientEvent('fsn_apartments:outfit:use', source, split[3])
			end
		end 
		if split[2] == 'remove' then 
			TriggerClientEvent('fsn_apartments:outfit:remove', source, split[3])
		end
		if split[2] == 'list' then 
			TriggerClientEvent('fsn_apartments:outfit:list', source)
		end
	end
end)