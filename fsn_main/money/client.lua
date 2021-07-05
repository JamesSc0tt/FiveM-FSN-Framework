local wallet = 0
local bank = 0

function fsn_GetWallet()
	return wallet
end

function fsn_GetBank()
	return bank
end

function fsn_CanAfford(amt)
	return wallet >= amt
end

RegisterNetEvent('fsn_main:money:updateSilent')
AddEventHandler('fsn_main:money:updateSilent', function(cash, balance)
	wallet = cash
	bank = balance
end)

RegisterNetEvent('fsn_main:money:update')
AddEventHandler('fsn_main:money:update', function(cash, balance)
	wallet = cash
	bank = balance
	Citizen.Wait(500)
	TriggerEvent('fsn_main:gui:both:display', cash, balance)
end)

AddEventHandler('fsn_bank:request:both', function()
  TriggerEvent('fsn_bank:update:both', wallet, bank)
end)

RegisterNetEvent('fsn_main:displayBankandMoney')
AddEventHandler('fsn_main:displayBankandMoney', function()
	Citizen.Wait(500)
	TriggerEvent('fsn_main:gui:both:display', wallet, bank)
end)

RegisterNetEvent('fsn_police:search:start:money')
AddEventHandler('fsn_police:search:start:money', function(officerid)
  TriggerServerEvent('fsn_police:search:end:money', officerid, {wallet=wallet,bank=bank})
end)

AddEventHandler('fsn_bank:change:bankandwallet', function(cash, balance)
  if wallet == false then
	TriggerServerEvent('fsn_main:money:wallet:Set', GetPlayerServerId(PlayerId()), wallet)
  else
    TriggerServerEvent('fsn_main:money:wallet:Set', GetPlayerServerId(PlayerId()), cash)
  end
  if bank == false then
	TriggerServerEvent('fsn_main:money:bank:Set', GetPlayerServerId(PlayerId()), bank)
  else
	TriggerServerEvent('fsn_main:money:bank:Set', GetPlayerServerId(PlayerId()), balance)
  end
end)

RegisterNetEvent('fsn_bank:change:walletAdd')
RegisterNetEvent('fsn_bank:change:walletMinus')
AddEventHandler('fsn_bank:change:walletAdd', function(amount, targetId)
	--TriggerServerEvent('fsn_main:money:wallet:Add', GetPlayerServerId(PlayerId()), amt)
  if targetId == nil then
    TriggerServerEvent('fsn_main:money:wallet:Add', GetPlayerServerId(PlayerId()), amount)
  else
    TriggerServerEvent('fsn_main:money:wallet:Add', targetId, amount)
  end
	Citizen.Wait(500)
	TriggerEvent('fsn_main:gui:money:change', wallet, amount)
end)

AddEventHandler('fsn_bank:change:walletMinus', function(amt)
  TriggerServerEvent('fsn_main:money:wallet:Minus', GetPlayerServerId(PlayerId()), amt)
  Citizen.Wait(500)
  -- TODO: Investigate if -1 * amt can be used (check if amt is ever a string)
  amt = tonumber('-'..amt)
  TriggerEvent('fsn_main:gui:money:change', wallet, amt)
end)

RegisterNetEvent('fsn_bank:change:bankAdd')
RegisterNetEvent('fsn_bank:change:bankMinus')
AddEventHandler('fsn_bank:change:bankAdd', function(amt)
	TriggerServerEvent('fsn_main:money:bank:Add', GetPlayerServerId(PlayerId()), amt)
	Citizen.Wait(500)
	TriggerEvent('fsn_main:gui:bank:change', bank, amt)
end)

AddEventHandler('fsn_bank:change:bankMinus', function(amt)
	TriggerServerEvent('fsn_main:money:bank:Minus', GetPlayerServerId(PlayerId()), amt)
	Citizen.Wait(500)
  -- TODO: Investigate if -1 * amt can be used (check if amt is ever a string)
	amt = tonumber('-'..amt)
	TriggerEvent('fsn_main:gui:bank:change', current_character.char_bank, amt)
end)

-------------------------------------------- LSCustoms
-- TODO: Move to LSCutsoms?
AddEventHandler("fsn_lscustoms:check",function(title, data, cost, value)
  if wallet >= cost then
    TriggerEvent("fsn_lscustoms:receive", source, title, data, value)
    TriggerEvent('fsn_bank:change:walletMinus', cost)
  else
    TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
  end
end)

AddEventHandler("fsn_lscustoms:check2", function(title, data, cost, value, back)
  if wallet >= cost then
    TriggerEvent("fsn_lscustoms:receive2", source, title, data, value, back)
    TriggerEvent('fsn_bank:change:walletMinus', cost)
  else
    TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
  end
end)

AddEventHandler("fsn_lscustoms:check3",function(title, data, cost, mod, back, name, wtype)
  if wallet >= cost then
    TriggerEvent("fsn_lscustoms:receive3", source, title, data, mod, back, name, wtype)
    TriggerEvent('fsn_bank:change:walletMinus', cost)
  else
    TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
  end
end)