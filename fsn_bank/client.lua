local atms = {
  {name="ATM", id=207, x=-386.733, y=6045.953, z=31.501,bank=false},
  {name="ATM", id=207, x=-284.037, y=6224.385, z=31.187,bank=false},
  {name="ATM", id=207, x=-284.037, y=6224.385, z=31.187,bank=false},
  {name="ATM", id=207, x=-135.165, y=6365.738, z=31.101,bank=false},
  {name="BANK", id=207,x=-113.681, y=6469.424, z=31.626,bank=true},
  {name="ATM", id=207, x=-94.9690, y=6455.301, z=31.784,bank=false},
  {name="ATM", id=207, x=155.4300, y=6641.991, z=31.784,bank=false},
  {name="ATM", id=207, x=174.6720, y=6637.218, z=31.784,bank=false},
  {name="ATM", id=207, x=1703.138, y=6426.783, z=32.730,bank=false},
  {name="ATM", id=207, x=1735.114, y=6411.035, z=35.164,bank=false},
  {name="ATM", id=207, x=1702.842, y=4933.593, z=42.051,bank=false},
  {name="ATM", id=207, x=1967.333, y=3744.293, z=32.272,bank=false},
  {name="ATM", id=207, x=1821.917, y=3683.483, z=34.244,bank=false},
  {name="BANK", id=207, x=1174.532, y=2705.278, z=38.027,bank=true},
  {name="ATM", id=207, x=540.0420, y=2671.007, z=42.177,bank=false},
  {name="ATM", id=207, x=2564.399, y=2585.100, z=38.016,bank=false},
  {name="ATM", id=207, x=2558.683, y=349.6010, z=108.050,bank=false},
  {name="ATM", id=207, x=2558.051, y=389.4817, z=108.660,bank=false},
  {name="ATM", id=207, x=1077.692, y=-775.796, z=58.218,bank=false},
  {name="ATM", id=207, x=1139.018, y=-469.886, z=66.789,bank=false},
  {name="ATM", id=207, x=1168.975, y=-457.241, z=66.641,bank=false},
  {name="ATM", id=207, x=1153.884, y=-326.540, z=69.245,bank=false},
  {name="ATM", id=207, x=381.2827, y=323.2518, z=103.270,bank=false},
  {name="BANK", id=207, x=236.4638, y=217.4718, z=106.840,bank=true},
  {name="ATM", id=207, x=265.0043, y=212.1717, z=106.780,bank=false},
  {name="ATM", id=207, x=285.2029, y=143.5690, z=104.970,bank=false},
  {name="ATM", id=207, x=157.7698, y=233.5450, z=106.450,bank=false},
  {name="ATM", id=207, x=-164.568, y=233.5066, z=94.919,bank=false},
  {name="ATM", id=207, x=-1827.04, y=785.5159, z=138.020,bank=false},
  {name="ATM", id=207, x=-1409.39, y=-99.2603, z=52.473,bank=false},
  {name="ATM", id=207, x=-1205.35, y=-325.579, z=37.870,bank=false},
  {name="ATM", id=207, x=-1215.64, y=-332.231, z=37.881,bank=false},
  {name="ATM", id=207, x=-2072.41, y=-316.959, z=13.345,bank=false},
  {name="ATM", id=207, x=-2975.72, y=379.7737, z=14.992,bank=false},
  {name="BANK", id=207, x=-2962.60, y=482.1914, z=15.762,bank=true},
  {name="ATM", id=207, x=-2955.70, y=488.7218, z=15.486,bank=false},
  {name="ATM", id=207, x=-3044.22, y=595.2429, z=7.595,bank=false},
  {name="ATM", id=207, x=-3144.13, y=1127.415, z=20.868,bank=false},
  {name="ATM", id=207, x=-3241.10, y=996.6881, z=12.500,bank=false},
  {name="ATM", id=207, x=-3241.11, y=1009.152, z=12.877,bank=false},
  {name="ATM", id=207, x=-1305.40, y=-706.240, z=25.352,bank=false},
  {name="ATM", id=207, x=-538.225, y=-854.423, z=29.234,bank=false},
  {name="ATM", id=207, x=-711.156, y=-818.958, z=23.768,bank=false},
  {name="ATM", id=207, x=-717.614, y=-915.880, z=19.268,bank=false},
  {name="ATM", id=207, x=-526.566, y=-1222.90, z=18.434,bank=false},
  {name="ATM", id=207, x=-256.831, y=-719.646, z=33.444,bank=false},
  {name="ATM", id=207, x=-203.548, y=-861.588, z=30.205,bank=false},
  {name="ATM", id=207, x=112.4102, y=-776.162, z=31.427,bank=false},
  {name="ATM", id=207, x=112.9290, y=-818.710, z=31.386,bank=false},
  {name="ATM", id=207, x=119.9000, y=-883.826, z=31.191,bank=false},
  {name="ATM", id=207, x=-846.304, y=-340.402, z=38.687,bank=false},
  {name="ATM", id=207, x=-1204.35, y=-324.391, z=37.877,bank=false},
  {name="ATM", id=207, x=-1216.27, y=-331.461, z=37.773,bank=false},
  {name="ATM", id=207, x=-56.1935, y=-1752.53, z=29.452,bank=false},
  {name="ATM", id=207, x=-261.692, y=-2012.64, z=30.121,bank=false},
  {name="ATM", id=207, x=-273.001, y=-2025.60, z=30.197,bank=false},
  {name="BANK", id=207, x=314.187, y=-278.621, z=54.170,bank=true},
  {name="ATM", id=207, x=-351.534, y=-49.529, z=49.042,bank=false},
  {name="ATM", id=207, x=24.589, y=-946.056, z=29.357,bank=false},
  {name="ATM", id=207, x=-254.112, y=-692.483, z=33.616,bank=false},
  {name="ATM", id=207, x=-1570.197, y=-546.651, z=34.955,bank=false},
  {name="ATM", id=207, x=-1415.909, y=-211.825, z=46.500,bank=false},
  {name="ATM", id=207, x=-1430.112, y=-211.014, z=46.500,bank=false},
  {name="ATM", id=207, x=33.232, y=-1347.849, z=29.497,bank=false},
  {name="ATM", id=207, x=129.216, y=-1292.347, z=29.269,bank=false},
  {name="ATM", id=207, x=287.645, y=-1282.646, z=29.659,bank=false},
  {name="ATM", id=207, x=289.012, y=-1256.545, z=29.440,bank=false},
  {name="ATM", id=207, x=295.839, y=-895.640, z=29.217,bank=false},
  {name="ATM", id=207, x=1686.753, y=4815.809, z=42.008,bank=false},
  {name="ATM", id=207, x=2682.964, y=3286.649, z=55.241,bank=false},
  {name="ATM", id=207, x=-302.408, y=-829.945, z=32.417,bank=false},
  {name="ATM", id=207, x=5.134, y=-919.949, z=29.557,bank=false},
  {name="ATM", id=207, x=300.6111, y=-578.7202, z=43.2608,bank=false},
  {name="ATM", id=207, x=-42.0, y=-1106.140, z=26.4,bank=false},
  {name="BANK",id=207, x=150.619, y =-1039.235, z =29.377,bank=true},
  {name="BANK",id=207, x=-350.638, y=-48.618, z=49.036,bank=true},
  {name="BANK",id=207, x=-1213.288, y=-329.920, z=37.786,bank=true}

}

local moneys = 0
local banks = 0

RegisterNetEvent('fsn_bank:change:bankandwallet')
RegisterNetEvent('fsn_bank:request:both')
RegisterNetEvent('fsn_bank:update:both')
AddEventHandler('fsn_bank:update:both', function(wallet, bank)
  moneys = wallet
  banks = bank
  SendNUIMessage({
    type = 'update',
    updateType = 'wallet&bank',
    wallet = wallet,
    bank = bank
  })
end)

local atmDisplay = false
Citizen.CreateThread(function()
  for k, v in pairs(atms) do
    if v.bank then
      v.blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(v.blip, v.id)
      SetBlipAsShortRange(v.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Bank")
      EndTextCommandSetBlipName(v.blip)
    end
  end
  while true do
    Citizen.Wait(0)
    for k, atm in pairs(atms) do
      if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, atm.x, atm.y, atm.z) < 1 then
        if not atmDisplay then
          SetTextComponentFormat("STRING")
          AddTextComponentString("Press ~INPUT_PICKUP~ to access the "..atm.name)
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
            TriggerEvent('fsn_bank:request:both')
            while not HasAnimDictLoaded('amb@prop_human_atm@male@base') do
              RequestAnimDict('amb@prop_human_atm@male@base')
              Citizen.Wait(5)
            end
            if not IsEntityPlayingAnim(PlayerPedId(), 'amb@prop_human_atm@male@base', 'base', 3) then
              FreezeEntityPosition(PlayerPedId(), 1)
              TaskPlayAnim(PlayerPedId(), 'amb@prop_human_atm@male@base', 'base', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
            end
            SetNuiFocus(true,true)
            SendNUIMessage({
              type = 'displayATM',
			  bank = atm.bank,
              enable = true
            })
            atmDisplay = true
          end
        end
      end
    end
  end
end)
local function fsn_closeATM()
  FreezeEntityPosition(PlayerPedId(), 0)
  SetEntityCollision(PlayerPedId(), 1, 1)
	ClearPedTasks(PlayerPedId())
  SetNuiFocus(false,false)
  TriggerEvent('fsn_main:displayBankandMoney')
  SendNUIMessage({
    type = 'displayATM',
    enable = false
  })
  atmDisplay = falses
end
RegisterNUICallback('depositMoney', function(tbl)
  if tbl.atbank == 'false' or tbl.atbank == false then
	fsn_closeATM()
	TriggerEvent('fsn_notify:displayNotification', 'You cannot deposit money at an ATM!', 'centerRight', 4000, 'error')
	return
  end
  if not tonumber(tbl.deposit) or tonumber(tbl.deposit) < 1 then
	fsn_closeATM()
	TriggerEvent('fsn_notify:displayNotification', 'There was an issue with your input!', 'centerRight', 4000, 'error')
	return
  end
  if tonumber(tbl.deposit) > 500000 then
	fsn_closeATM()
	TriggerEvent('fsn_notify:displayNotification', 'Maximum deposit of $500,000', 'centerRight', 4000, 'error')
	return
  end
  if tonumber(moneys) >= tonumber(tbl.deposit) then
    local new_wallet = moneys - tbl.deposit
    local new_bank = banks + tbl.deposit
    moneys = moneys - tbl.deposit
    banks = banks + tbl.deposit
	TriggerEvent('fsn_phones:SYS:addTransaction', {
		title = 'Bank Deposit',
		trantype = 'CREDIT',
		systype = 'credit',
		tranamt = tbl.deposit
	})
    TriggerEvent('fsn_bank:change:bankandwallet', new_wallet, new_bank)
	TriggerServerEvent('fsn_main:logging:addLog', GetPlayerServerId(PlayerId()), 'money', 'Character('..exports["fsn_main"]:fsn_CharID(GetPlayerServerId(PlayerId()))..') deposited $'..tbl.deposit)
  else
	TriggerEvent('fsn_notify:displayNotification', 'You don\'t have enough money!', 'centerRight', 4000, 'error')
  end
  fsn_closeATM()
end)

RegisterNUICallback('withdrawMoney', function(tbl)
  if not tonumber(tbl.withdraw) or tonumber(tbl.withdraw) < 1 then
	fsn_closeATM()
	TriggerEvent('fsn_notify:displayNotification', 'There was an issue with your input!', 'centerRight', 4000, 'error')
	return
  end
  if tonumber(tbl.withdraw) > 500000 then
	fsn_closeATM()
	TriggerEvent('fsn_notify:displayNotification', 'Maximum withdraw of $500,000', 'centerRight', 4000, 'error')
	return
  end
  if tonumber(tbl.withdraw) then
    if tonumber(banks) >= tonumber(tbl.withdraw) then
      local new_wallet = moneys + tbl.withdraw
      local new_bank = banks - tbl.withdraw
      moneys = moneys + tbl.withdraw
      banks = banks - tbl.withdraw
	  local title = 'ATM Withdraw'
	  if tbl.atbank then
		title = 'Bank Withdraw'
	  end
	  TriggerEvent('fsn_phones:SYS:addTransaction', {
		title = title,
		trantype = 'DEBIT',
		systype = 'debit',
		tranamt = tbl.withdraw
	})
      TriggerEvent('fsn_bank:change:bankandwallet', new_wallet, new_bank)
	  TriggerServerEvent('fsn_main:logging:addLog', GetPlayerServerId(PlayerId()), 'money', 'Character('..exports["fsn_main"]:fsn_CharID(GetPlayerServerId(PlayerId()))..') withdrew $'..tbl.withdraw)
    else
  		TriggerEvent('fsn_notify:displayNotification', 'There isn\'t enough in the account!', 'centerRight', 4000, 'error')
    end
  else
    TriggerEvent('fsn_notify:displayNotification', 'There\'s an issue with what you entered', 'centerRight', 4000, 'error')
  end
  fsn_closeATM()
end)

RegisterNUICallback('transferMoney', function(tbl)
	if not tonumber(tbl.transferAmount) or tonumber(tbl.transferAmount) < 1 then
	fsn_closeATM()
	TriggerEvent('fsn_notify:displayNotification', 'There was an issue with your input!', 'centerRight', 4000, 'error')
	return
  end
  if tonumber(tbl.transferAmount) > 500000 then
	fsn_closeATM()
	TriggerEvent('fsn_notify:displayNotification', 'Maximum transfer of $500,000', 'centerRight', 4000, 'error')
	return
  end
  if tonumber(tbl.transferAmount) and tonumber(tbl.transferTo) then
    if tonumber(banks) >= tonumber(tbl.transferAmount) then
      TriggerServerEvent('fsn_bank:transfer', tbl.transferTo, tbl.transferAmount)
    else
      TriggerEvent('fsn_notify:displayNotification', 'There isn\'t enough in the account!', 'centerRight', 4000, 'error')
    end
  else
    TriggerEvent('fsn_notify:displayNotification', 'There\'s an issue with what you entered', 'centerRight', 4000, 'error')
  end
  fsn_closeATM()
end)

RegisterNUICallback('toggleGUI', function()
  fsn_closeATM()
end)
