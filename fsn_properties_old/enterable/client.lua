local enterable_properties = {}
local char_id = 0
AddEventHandler('fsn_main:character', function(char)
  char_id = char.char_id
  TriggerServerEvent('fsn_properties:doors:request')
end)

TriggerServerEvent('fsn_properties:doors:request')

RegisterNetEvent('fsn_properties:doors:init')
AddEventHandler('fsn_properties:doors:init', function(tbl)
  enterable_properties = tbl
end)

RegisterNetEvent('fsn_properties:doors:init')
AddEventHandler('fsn_properties:doors:init', function(tbl)
  enterable_properties = tbl
  for k, v in pairs(enterable_properties) do
    if v.blip ~= false then
      local blip = AddBlipForCoord(v.blip.x, v.blip.y, v.blip.z)
      SetBlipSprite(blip, 350)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("House")
      EndTextCommandSetBlipName(blip)
    end
    --[[
    if v.rob_spot ~= false then
      local blip = AddBlipForCoord(v.rob_spot.x, v.rob_spot.y, v.rob_spot.z)
      SetBlipSprite(blip, 277)
      SetBlipColour(blip, 1)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Unknown")
      EndTextCommandSetBlipName(blip)
    end
    ]]
  end
end)
RegisterNetEvent('fsn_properties:doors:update')
AddEventHandler('fsn_properties:doors:update', function(tbl)
  enterable_properties = tbl
end)

AddEventHandler('fsn_properties:buy', function(id)
  local price = 0
  for k, _prop in pairs(enterable_properties) do
    if _prop.db_id == id then
      price = _prop.price
    end
  end
  if price ~= 0 then
    if exports.fsn_main:fsn_GetWallet() >= price then
      TriggerServerEvent('fsn_properties:enterable:buy', id, char_id)
    else
      TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 5000, 'error')
    end
  end
end)

------------------------------------------------- MENU
AddEventHandler('fsn_properties:menu:access:allow', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    Citizen.CreateThread(function()
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
      local editOpen = true
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        Wait(0)
        drawTxt('Input #ID',4,1,0.5,0.35,0.6,255,255,255,255)
        drawTxt('~r~DO NOT USE THE OVERHEAD NUMBER, USE #ID FROM THEIR ID CARD.',4,1,0.5,0.49,0.4,255,255,255,255)
        if UpdateOnscreenKeyboard() ~= 0 then
          editOpen = false
          if UpdateOnscreenKeyboard() == 1 then
            res = tostring(GetOnscreenKeyboardResult())
            TriggerServerEvent('fsn_properties:enterable:access:allow', id, res)
          end
          break
        end
      end
    end)
  end
end)
AddEventHandler('fsn_properties:menu:access:view', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    local str = table.concat(_property.coowners,", ",1,#_property.coowners)
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^4:fsn_properties:^0^r #IDs with access to this property: '..str)
    TriggerEvent('fsn_notify:displayNotification', 'Check the chatbox!!', 'centerLeft', 5000, 'info')
  end
end)
AddEventHandler('fsn_properties:menu:access:revoke', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    Citizen.CreateThread(function()
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
      local editOpen = true
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        Wait(0)
        drawTxt('Input #ID',4,1,0.5,0.35,0.6,255,255,255,255)
        drawTxt('~r~DO NOT USE THE OVERHEAD NUMBER, USE #ID FROM THEIR ID CARD.',4,1,0.5,0.49,0.4,255,255,255,255)
        if UpdateOnscreenKeyboard() ~= 0 then
          editOpen = false
          if UpdateOnscreenKeyboard() == 1 then
            res = tostring(GetOnscreenKeyboardResult())
            usr = false
            for k, v in pairs(_property.coowners) do
              if v == res then
                usr = true
              end
            end
            if usr then
              TriggerServerEvent('fsn_properties:enterable:access:revoke', id, res)
            else
              TriggerEvent('fsn_notify:displayNotification', 'This #ID does not have access to your property.', 'centerLeft', 5000, 'error')
            end
          end
          break
        end
      end
    end)
  end
end)

local items = {
  ["dirty money"] = "dirty_money",
  ["repair kit"] = "repair_kit",
  ["uncooked meat"] = "uncooked_meat",
  ["cooked_meat"] = "cooked_meat",
  ["beef jerky"] = "beef jerky",
  ["cupcake"] = "cupcake",
  ["microwave burrito"] = "microwave_burrito",
  ["panini"] = "panini",
  ["pepsi"] = "pepsi",
  ["pepsi max"] = "pepsi_max",
  ["water"] = "water",
  ["coffee"] = "coffee",
  ["lockpick"] = "lockpick",
  ["handcuffs"] = "handcuffs",
  ["phone"] = "phone",
  ["2g weed"] = "2g_weed",
  ["joint"] = "joint",
  ["acetone"] = "acetone",
  ["phosphorus"] = "phosphorus",
  ["meth rocks"] = "meth_rocks",
  ["packaged cocaine"] = "packaged_cocaine",
}
AddEventHandler('fsn_properties:menu:inventory:deposit', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    Citizen.CreateThread(function()
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 64)
      local editOpen = true
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        Wait(0)
        drawTxt('What would you like to deposit?',4,1,0.5,0.35,0.6,255,255,255,255)
        drawTxt('~y~You should type it as it were to appear in your inventory!',4,1,0.5,0.52,0.4,255,255,255,255)
        if UpdateOnscreenKeyboard() ~= 0 then
          editOpen = false
          if UpdateOnscreenKeyboard() == 1 then
            item = string.lower(tostring(GetOnscreenKeyboardResult()))
            item = items[item]
            if item then
              DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 6)
              local editOpen = true
              while UpdateOnscreenKeyboard() == 0 or editOpen do
                Wait(0)
                drawTxt('How many would you like to deposit?',4,1,0.5,0.35,0.6,255,255,255,255)
                --drawTxt('~r~DO NOT USE THE OVERHEAD NUMBER, USE #ID FROM THEIR ID CARD.',4,1,0.5,0.49,0.4,255,255,255,255)
                if UpdateOnscreenKeyboard() ~= 0 then
                  editOpen = false
                  if UpdateOnscreenKeyboard() == 1 then
                    amount = tonumber(GetOnscreenKeyboardResult())
					if amount then
						if amount > 500000 then
							TriggerEvent('fsn_notify:displayNotification', 'Can only deposit up to 500,000 of an object', 'centerLeft', 5000, 'error')
						else
							if exports.fsn_inventory:fsn_GetItemAmount(item) >= amount then
							  local _item = exports.fsn_inventory:fsn_GetItemDetails(item).display_name
							  TriggerServerEvent('fsn_properties:enterable:inventory:enter', id, item, _item, amount)
							  --print('removing '..amount..' '..item)
							  TriggerEvent('fsn_inventory:item:take', item, amount)
							else
							  TriggerEvent('fsn_notify:displayNotification', 'You dont have enough!', 'centerLeft', 5000, 'error')
							end
						end
					else
						TriggerEvent('fsn_notify:displayNotification', 'Can you enter a number pls', 'centerLeft', 5000, 'error')
					end
                  end
                end
              end
            else
              TriggerEvent('fsn_notify:displayNotification', 'You entered an invalid value<br>Not all objects are able to be stored in a property!', 'centerLeft', 5000, 'error')
            end
          end
        end
      end
    end)
  end
end)

AddEventHandler('fsn_properties:menu:inventory:take', function(item, propid)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == propid then
      _property = v
    end
  end
  if _property then
    Citizen.CreateThread(function()
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 6)
      local editOpen = true
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        Wait(0)
        drawTxt('How many would you like to take?',4,1,0.5,0.35,0.6,255,255,255,255)
        if UpdateOnscreenKeyboard() ~= 0 then
          editOpen = false
          if UpdateOnscreenKeyboard() == 1 then
            amt = tonumber(GetOnscreenKeyboardResult())
			if amt and amt < 500001 then
				TriggerServerEvent('fsn_properties:enterable:inventory:take', propid, item, amt)
			else
				TriggerEvent('fsn_notify:displayNotification', 'Can only withdraw up to 500,000 of an object', 'centerLeft', 5000, 'error')
			end
          end
        end
      end
    end)
  end
end)

AddEventHandler('fsn_properties:menu:weapon:take', function(propid, weapon)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == propid then
      _property = v
    end
  end
  if _property then
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weapon), 250, false, true)
    TriggerServerEvent('fsn_properties:enterable:weapon:take', propid, weapon)
  end
end)

AddEventHandler('fsn_properties:menu:weapon:deposit', function(pid)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == pid then
      _property = v
    end
  end
  if _property then
    local savingWeapons = {
      "WEAPON_KNIFE",
      "WEAPON_NIGHTSTICK",
      "WEAPON_HAMMER",
      "WEAPON_BAT",
      "WEAPON_GOLFCLUB",
      "WEAPON_CROWBAR",
      "WEAPON_PISTOL",
      "WEAPON_COMBATPISTOL",
      "WEAPON_APPISTOL",
      "WEAPON_PISTOL50",
      "WEAPON_MICROSMG",
      "WEAPON_SMG",
      "WEAPON_ASSAULTSMG",
      "WEAPON_ASSAULTRIFLE",
      "WEAPON_CARBINERIFLE",
      "WEAPON_ADVANCEDRIFLE",
      "WEAPON_MG",
      "WEAPON_COMBATMG",
      "WEAPON_PUMPSHOTGUN",
      "WEAPON_SAWNOFFSHOTGUN",
      "WEAPON_ASSAULTSHOTGUN",
      "WEAPON_BULLPUPSHOTGUN",
      "WEAPON_STUNGUN",
      "WEAPON_SNIPERRIFLE",
      "WEAPON_SMOKEGRENADE",
      "WEAPON_BZGAS",
      "WEAPON_MOLOTOV",
      "WEAPON_FIREEXTINGUISHER",
      "WEAPON_PETROLCAN",
      "WEAPON_SNSPISTOL",
      "WEAPON_SPECIALCARBINE",
      "WEAPON_HEAVYPISTOL",
      "WEAPON_BULLPUPRIFLE",
      "WEAPON_HOMINGLAUNCHER",
      "WEAPON_PROXMINE",
      "WEAPON_SNOWBALL",
      "WEAPON_VINTAGEPISTOL",
      "WEAPON_DAGGER",
      "WEAPON_FIREWORK",
      "WEAPON_MUSKET",
      "WEAPON_MARKSMANRIFLE",
      "WEAPON_HEAVYSHOTGUN",
      "WEAPON_GUSENBERG",
      "WEAPON_HATCHET",
      "WEAPON_COMBATPDW",
      "WEAPON_KNUCKLE",
      "WEAPON_MARKSMANPISTOL",
      "WEAPON_BOTTLE",
      "WEAPON_FLAREGUN",
      "WEAPON_FLARE",
      "WEAPON_REVOLVER",
      "WEAPON_SWITCHBLADE",
      "WEAPON_MACHETE",
      "WEAPON_FLASHLIGHT",
      "WEAPON_MACHINEPISTOL",
      "WEAPON_DBSHOTGUN",
      "WEAPON_COMPACTRIFLE"
    }
    local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
    for k, v in pairs(savingWeapons) do
      if GetHashKey(v) == weapon then
        submitting = v
      end
    end
    if submitting then
      RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(submitting))
      TriggerServerEvent('fsn_properties:enterable:weapon:enter', pid, GetHashKey(submitting), submitting)
    else
      TriggerEvent('fsn_notify:displayNotification', 'You cannot put this weapon in your property', 'centerLeft', 5000, 'error')
    end
  end
end)

AddEventHandler('fsn_properties:menu:money:withdraw', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    Citizen.CreateThread(function()
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
      local editOpen = true
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        Wait(0)
        drawTxt('What would you like to withdraw?',4,1,0.5,0.35,0.6,255,255,255,255)
        drawTxt('~r~Do NOT include the dollar symbol ($)',4,1,0.5,0.49,0.4,255,255,255,255)
        if UpdateOnscreenKeyboard() ~= 0 then
          editOpen = false
          if UpdateOnscreenKeyboard() == 1 then
            amount = tonumber(GetOnscreenKeyboardResult())
			if amount <= 100000 then
				TriggerServerEvent('fsn_properties:enterable:money:withdraw', id, amount)
			else
				TriggerEvent('fsn_notify:displayNotification', 'Maximum withdraw of $100,000', 'centerLeft', 5000, 'error')
			end
          end
        end
      end
    end)
  end
end)

AddEventHandler('fsn_properties:menu:money:deposit', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    Citizen.CreateThread(function()
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
      local editOpen = true
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        Wait(0)
        drawTxt('What would you like to deposit?',4,1,0.5,0.35,0.6,255,255,255,255)
        drawTxt('~r~Do NOT include the dollar symbol ($)',4,1,0.5,0.49,0.4,255,255,255,255)
        if UpdateOnscreenKeyboard() ~= 0 then
          editOpen = false
          if UpdateOnscreenKeyboard() == 1 then
            amount = tonumber(GetOnscreenKeyboardResult())
			if amount <= 100000 then
				if exports.fsn_main:fsn_GetWallet() >= amount then
				  TriggerEvent('fsn_bank:change:walletMinus', amount)
				  TriggerServerEvent('fsn_properties:enterable:money:deposit', id, amount)
				else
					TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this.', 'centerLeft', 5000, 'error')
				end
			else
				TriggerEvent('fsn_notify:displayNotification', 'Maximum deposit of $100,000', 'centerLeft', 5000, 'error')
			end
          end
        end
      end
    end)
  end
end)
local robbing = false
local robbery = 0
AddEventHandler('fsn_properties:menu:robbery', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    if robbery + 300000 > GetNetworkTime() then
      TriggerEvent('fsn_notify:displayNotification', 'This cannot be robbed yet', 'centerLeft', 5000, 'error')
      return
    end
    local time = 0
    robbery = GetNetworkTime()
    robbing = true
    Citizen.CreateThread(function()
      while true do
        Citizen.Wait(1000)
        time = time + 1
        if not robbing then
          break
        end
        if time == 300 then
          -- WIN WOO
          TriggerEvent('fsn_notify:displayNotification', 'Property robbed', 'centerLeft', 5000, 'success')
          robbing=false
          break
        end
      end
    end)
    Citizen.CreateThread(function()
      while true do
        Citizen.Wait(0)
        if not robbing then
          break
        end
        if GetDistanceBetweenCoords(_property.blip.x, _property.blip.y, _property.blip.z, GetEntityCoords(GetPlayerPed(-1)), true) < 4 then
          drawTxt('~r~Robbing Property',4,1,0.5,0.35,0.6,255,255,255,255)
          drawTxt('Wait ~b~'..fsn_SplitString(tostring(time-300), '-')[1]..'~w~ seconds',4,1,0.5,0.40,0.4,255,255,255,255)
        else
          TriggerEvent('fsn_notify:displayNotification', 'You got too far away from the property', 'centerRight', 5000, 'error')
          robbing = false
          break
        end
      end
    end)
  end
end)

AddEventHandler('fsn_properties:menu:police:search', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    TriggerEvent('chatMessage', '', {255,255,255}, '^1SEARCH |^0 Money: $'.._property.money)
    local invstr = ' '
    for k, v in pairs(_property.inventory) do
      invstr = '['..v.amount..'X] '..v.item_name..invstr..', '
    end
    TriggerEvent('chatMessage', '', {255,255,255}, '^1SEARCH |^0 Inventory: '..invstr)
    local wepstr = ' '
    for k, v in pairs(_property.weapons) do
      wepstr = '['..v.amount..'X] '..k..wepstr
    end
    TriggerEvent('chatMessage', '', {255,255,255}, '^1SEARCH |^0 Weapons: '..wepstr)
  end
end)

AddEventHandler('fsn_properties:menu:police:seize', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    TriggerServerEvent('fsn_properties:enterable:police:seize', id)
  end
end)

AddEventHandler('fsn_properties:menu:police:empty', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    TriggerServerEvent('fsn_properties:enterable:police:empty', id)
  end
end)

AddEventHandler('fsn_properties:menu:police:breach', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    for key, value in pairs(_property.doors) do
      TriggerServerEvent('fsn_properties:door:unlock', _property.db_id, key)
    end
    TriggerEvent('fsn_notify:displayNotification', 'You breached all the doors in this building', 'centerLeft', 5000, 'success')
  end
end)

AddEventHandler('fsn_properties:menu:rent:check', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    TriggerServerEvent('fsn_properties:enterable:checkRent', id)
  end
end)

AddEventHandler('fsn_properties:menu:rent:pay', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    if exports.fsn_main:fsn_GetWallet() >= _property.price then
      TriggerServerEvent('fsn_properties:enterable:payRent', id)
    else
      TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!<br>Pay it soon before your lease expires!', 'centerLeft', 5000, 'error')
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for propertyk, property in pairs(enterable_properties) do
      if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, property.blip.x, property.blip.y, property.blip.z, true) < 80 then
        ------------------------------------------ Management section
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, property.blip.x, property.blip.y, property.blip.z, true) < 5 then
          DrawMarker(1,property.blip.x,property.blip.y,property.blip.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
          if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, property.blip.x, property.blip.y, property.blip.z, true) < 1 and not menuEnabled and not robbing then
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_PICKUP~ to view the property")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0,38) then
              if property.owner ~= -1 then
                TriggerEvent('chatMessage', '', {255,255,255}, '^*^4:fsn_properties:^0^r This property (#'..property.db_id..') is owned by '..property.owner)
                if exports.fsn_police:fsn_getPDLevel() > 6 then hc = true else hc = false end
                local hasKeys = false for k, v in pairs(property.coowners) do if v == tostring(char_id) then hasKeys = true end end
                if property.owner == char_id then propertyOwner = true hasKeys = true else propertyOwner = false end
                menuEnabled = not menuEnabled
                if hasKeys or hc then
                  SetNuiFocus( true, true )
              		SendNUIMessage({
              			showmenu = true,
                    updateProperty = true,
                    owned = true,
                    property_id = property.db_id,
                    inventory = json.encode(property.inventory),
                    weapons = json.encode(property.weapons),
                    money = property.money,
                    propertyOwner = propertyOwner,
                    propertyAccess = hasKeys,
                    policeHC = hc,
                  })
                else
                  TriggerEvent('fsn_notify:displayNotification', 'You do not have the keys to this property', 'centerLeft', 5000, 'error')
                  SetNuiFocus( true, true )
                	SendNUIMessage({
                		showmenu = true,
                    updateProperty = true,
                    owned = true,
                    robbery = true,
                    property_id = property.db_id,
                    propertyOwner = false,
                    propertyAccess = false
                  })
                end
              else
                TriggerEvent('chatMessage', '', {255,255,255}, '^*^4:fsn_properties:^0^r This property (#'..property.db_id..') is available to rent!')
                menuEnabled = not menuEnabled
                SetNuiFocus( true, true )
            		SendNUIMessage({
            			showmenu = true,
                  updateProperty = true,
                  owned = false,
                  price = property.price,
                  property_id = property.db_id,
                })
              end
  					end
          end
        end
        --[[
        ------------------------------------------ Robbery stuff
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, property.rob_spot.x, property.rob_spot.y, property.rob_spot.z, true) < 5 then
          DrawMarker(1,property.rob_spot.x,property.rob_spot.y,property.rob_spot.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,255,0,0,175,0,0,0,0)
          if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, property.rob_spot.x, property.rob_spot.y, property.rob_spot.z, true) < 1 then
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_RELOAD~ to ~r~ROB~w~ the property")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0,45) then

  					end
          end
        end
        ]]
        ------------------------------------------ Door stuff
        for _doork, _door in pairs(property.doors) do
          local door = GetClosestObjectOfType(_door.loc.x, _door.loc.y, _door.loc.z, 1.0, _door.hash, false, false, false)
          if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, _door.loc.x, _door.loc.y, _door.loc.z, true) < 10 then
            if _door.locked then
              FreezeEntityPosition(door, true)
            else
              FreezeEntityPosition(door, false)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, _door.loc.x, _door.loc.y, _door.loc.z, true) < 2 then
              if property.owner == char_id then
                if _door.locked then
                  fsn_drawText3D(_door.text.x, _door.text.y, _door.text.z, "[E] ~g~Unlock")
                  if IsControlJustPressed(0,38) then
                    TriggerServerEvent('fsn_properties:door:unlock', propertyk, _doork)
                  end
                else
                  fsn_drawText3D(_door.text.x, _door.text.y, _door.text.z, "[E] ~r~Lock")
                  if IsControlJustPressed(0,38) then
                    TriggerServerEvent('fsn_properties:door:lock', propertyk, _doork)
                  end
                end
              else
                if _door.locked then
                  fsn_drawText3D(_door.text.x, _door.text.y, _door.text.z, "~r~LOCKED")
                  FreezeEntityPosition(door, true)
                else
                  FreezeEntityPosition(door, false)
                end
              end
            end
          end
        end
        ----------------------------------------------------
      end
    end
  end
end)
