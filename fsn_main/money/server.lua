local moneystore = {}

RegisterNetEvent('fsn_main:money:initChar')
AddEventHandler('fsn_main:money:initChar', function(src, cid, cash, balance)
	local exists = false
	for k, v in pairs(moneystore) do
		if v.char_id == cid then
			v.wallet = cash
			v.ply_id = src
			v.bank = balance
			exists = true
			return
		end
	end
	if not exists then
		moneystore[#moneystore+1] = {
			char_id = cid,
			ply_id = src,
			wallet = cash,
			bank = balance
		}
	end
	Citizen.Wait(500)
	TriggerClientEvent('fsn_main:money:update', src, cash, balance)
	TriggerEvent('fsn_main:updateMoneyStore', moneystore)
end)

RegisterServerEvent('fsn_main:money:wallet:GiveCash')
AddEventHandler('fsn_main:money:wallet:GiveCash', function(src, ply, amt)
	-- TODO: Investigate if all the tonumbers are needed
	ply = tonumber(ply)
	if not tonumber(amt) or tonumber(amt) < 1 then
		TriggerClientEvent('fsn_notify:displayNotification', src, 'There was an issue with your input', 'centerRight', 4000, 'error')
		return
	end
	if tonumber(amt) > 25000 then
		TriggerClientEvent('fsn_notify:displayNotification', src, 'You cannot give over $25000, use an ATM', 'centerRight', 4000, 'error')
		return
	end
	for k,v in pairs(moneystore) do
		if v.ply_id == src then
			if v.wallet >= tonumber(amt) then
				for key, rec in pairs(moneystore) do
					if rec.ply_id == ply then
						rec.wallet = rec.wallet + tonumber(amt)
						TriggerClientEvent('fsn_main:money:updateSilent', ply, rec.wallet, rec.bank)
						
						TriggerClientEvent('fsn_notify:displayNotification', ply, 'You got $'..amt..' from '..src, 'centerRight', 4000, 'success')
						--Citizen.Wait(500)
						--TriggerClientEvent('fsn_main:gui:money:addMoney', ply, amt, newamt)
						
					end
				end
				v.wallet = v.wallet - tonumber(amt)
				TriggerClientEvent('fsn_main:money:updateSilent', src, v.wallet, v.bank)
				
				TriggerClientEvent('fsn_notify:displayNotification', src, 'You gave $'..amt..' to '..ply, 'centerRight', 4000, 'info')
				
				TriggerEvent('fsn_main:logging:addLog', src, 'money', 'Character('..fsn_CharID(src)..') gave $'..amt..' to Character('..fsn_CharID(ply)..')')
				--Citizen.Wait(500)
			else
				TriggerClientEvent('fsn_notify:displayNotification', src, 'You don\'t have that amount!', 'centerRight', 4000, 'error')
			end
		end
	end
end)

RegisterServerEvent('fsn_main:money:wallet:Set')
AddEventHandler('fsn_main:money:wallet:Set', function(ply, amt)
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				v.wallet = tonumber(amt)
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_money` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.wallet})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:money:changeAmount', ply, amt)
			else 
				print('fsn_main:money:wallet:Set tried to set money to a non numeric value')
			end
		end
	end
end)

RegisterServerEvent('fsn_main:money:bank:Set')
AddEventHandler('fsn_main:money:bank:Set', function(ply, amt)
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				v.bank = tonumber(amt)
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_bank` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.bank})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:bank:changeAmount', ply, amt)
			else 
				print('fsn_main:money:bank:Set tried to set bank to a non numeric value')
			end
		end
	end
end)

RegisterServerEvent('fsn_main:money:wallet:Add')
AddEventHandler('fsn_main:money:wallet:Add', function(ply, amt)
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				local newamt = v.wallet + tonumber(amt)
				v.wallet = newamt
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_money` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.wallet})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:money:addMoney', ply, amt, newamt)
				if amt > 0 then
					TriggerEvent('fsn_main:logging:addLog', ply, 'money', 'Character('..fsn_CharID(ply)..') added $'..amt..' to their CASH')
				end
			else
				print('fsn_main:money:Add tried to add to wallet a non numerical value')
			end
		end
	end
end)

RegisterServerEvent('fsn_main:money:bank:Add')
AddEventHandler('fsn_main:money:bank:Add', function(ply, amt)
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				local newamt = v.bank + tonumber(amt)
				v.bank = newamt
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_bank` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.bank})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:bank:addMoney', ply, amt, newamt)
				if amt > 0 then
					TriggerEvent('fsn_main:logging:addLog', ply, 'money', 'Character('..fsn_CharID(ply)..') added $'..amt..' to their BANK')
				end
			else
				print('fsn_main:money:bank:Add tried to add to bank a non numerical value')
			end
		end
	end
end)

RegisterServerEvent('fsn_main:money:wallet:Minus')
AddEventHandler('fsn_main:money:wallet:Minus', function(ply, amt)
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				local newamt = v.wallet - tonumber(amt)
				v.wallet = newamt
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_money` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.wallet})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:minusMoney', ply, amt, newamt)
				TriggerClientEvent('fsn_phones:SYS:addTransaction', ply, {
					title = os.date("%c"),
					trantype = 'CREDIT',
					systype = 'credit',
					tranamt = amt
				})
				TriggerEvent('fsn_main:logging:addLog', ply, 'money', 'Character('..fsn_CharID(ply)..') spent $'..amt..' from their CASH')
			else
				print('fsn_main:money:wallet:Minus tried to minus wallet a non numerical value')
			end
		end
	end
end)

RegisterServerEvent('fsn_main:money:bank:Minus')
AddEventHandler('fsn_main:money:bank:Minus', function(ply, amt)
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			if tonumber(amt) then
				local newamt = v.bank - tonumber(amt)
				v.bank = newamt
				MySQL.Sync.execute("UPDATE `fsn_characters` SET `char_bank` = @money WHERE `char_id` = @id", {['@id'] = v.char_id, ['@money'] = v.bank})
				TriggerClientEvent('fsn_main:money:updateSilent', ply, v.wallet, v.bank)
				Citizen.Wait(500)
				TriggerClientEvent('fsn_main:gui:bank:minusMoney', ply, amt, newamt)
				TriggerClientEvent('fsn_phones:SYS:addTransaction', ply, {
					title = os.date("%c"),
					trantype = 'DEBIT',
					systype = 'debit',
					tranamt = amt
				})
				TriggerEvent('fsn_main:logging:addLog', ply, 'money', 'Character('..fsn_CharID(ply)..') spent $'..amt..' from their BANK')
			else
				print('fsn_main:money:bank:Minus tried to minus wallet a non numerical value')
			end
		end
	end
end)


function fsn_GetWallet( ply )
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			return v.wallet
		end
	end
end

function fsn_GetBank( ply )
	for k, v in pairs(moneystore) do
		if v.ply_id == ply then
			return v.bank
		end
	end
end