local judges = {'steam:11000010e0828a9', 'steam:110000101c2956e', 'steam:11000010620e2e0', 'steam:110000108e0a227'}

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

function fsn_isJudge(src)
  local sid = GetPlayerIdentifiers(src)
  sid = sid[1]
  for k, v in pairs(judges) do
    if v == sid then
      return true
    end
  end
  return false
end

function judgeCPIC(id, src)
  local res = {}
  local idee = exports.fsn_main:fsn_CharID(id)
  MySQL.Async.fetchAll('SELECT * FROM `fsn_tickets` WHERE `receiver_id` = @id', {['@id'] = idee}, function(results)
    for k, v in pairs(results) do
      local ass = os.date("*t", v.ticket_date)
      v.ticket_date = ass.hour..':'..ass.min..' '..ass.month..'/'..ass.day..'/'..ass.year
    end
    TriggerClientEvent('fsn_police:database:CPIC:search:result', src, results)
  end)
end

AddEventHandler('chatMessage', function(source, auth, msg)
	local split = fsn_SplitString(msg, ' ')
	if split[1] == '/judge' then
		if fsn_isJudge(source) then
			if split[2] == 'msg' then
				local msg = table.concat(split, " ", 3, #split)
				TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1JUDGE ANNOUNCEMENT |^0^r '..msg)
			end
			if split[2] == 'cpic' then
				judgeCPIC(tonumber(split[3]), source)
			end
			if split[2] == 'pay' then
				TriggerClientEvent('fsn_bank:change:walletAdd', tonumber(split[3]), tonumber(split[4]))
			end
			if split[2] == 'bill' then
				TriggerEvent('fsn_police:ticket', tonumber(split[3]), tonumber(split[4]))
			end
			if split[2] == 'jail' then
				TriggerEvent('fsn_jail:sendsuspect', source, tonumber(split[3]), tonumber(split[4])*60)
			end
			if split[3] == 'license' then
				if split[3] == 'check' then
				
				end
				if split[3] == 'give' then
				
				end
				if split[3] == 'revoke' then
				
				end
				if split[3] == 'infractions' then
					if split[4] == 'set' then
						TriggerClientEvent('fsn_licenses:setinfractions', split[5], split[6], tonumber(split[7]))
						TriggerClientEvent('fsn_notify:displayNotification', split[5], ':FSN: A judge ('..source..') set your '..split[6]..' license infractions to '..split[7], 'centerLeft', 8000, 'info')
					end
					if split[4] == 'add' then
					
					end
					if split[4] == 'minus' then
					
					end
				end
			end
			if split[2] == 'setlock' then
				if split[3] == 'true' then
					TriggerClientEvent('fsn_doj:judge:toggleLock', -1, true)
					TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1JUDGE ANNOUNCEMENT |^0^r The courtroom has been locked')
				elseif split[3] == 'false' then
					TriggerClientEvent('fsn_doj:judge:toggleLock', -1, false)
					TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1JUDGE ANNOUNCEMENT |^0^r The courtroom has been unlocked')
				else
					TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1:fsn_doj:^0^r Provide true/false')
				end
			end
			if split[2] == 'remand' then
				TriggerClientEvent('fsn_doj:court:remandMe', tonumber(split[3]), source)
			end
			if split[2] == 'car' then
				local cars = {
					[1] = 'p90d',
					[2] = 'm5f90'
				}
				local car = tonumber(split[3])
				if cars[car] then
					TriggerClientEvent('fsn_doj:judge:spawnCar', source, cars[car])
				else
					TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1:fsn_doj:^0^r Unrecognised car')
				end
			end
		else
			TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1:fsn_doj:^0^r You are not a judge, you cannot use this function')
		end
	end
end)
