local licenses = {}
local name = 'steve the mushroom'
local charid = 0

AddEventHandler('fsn_main:character', function(char)
  if char.char_licenses ~= '' then
    licenses = json.decode(char.char_licenses)
  else
    licenses = {}
  end
  name = char.char_fname..' '..char.char_lname
  charid = char.char_id
  if licenses["driver"] then
    TriggerServerEvent('fsn_licenses:check', 'driver', licenses['driver'].infractions, licenses['driver'].date, GetNetworkTime())
  end
end)

function fsn_NearestPlayersC(x, y, z, radius)
	local players = {}
	for _, id in ipairs(GetActivePlayers()) do
		local ppos = GetEntityCoords(GetPlayerPed(id))
		if GetDistanceBetweenCoords(ppos.x, ppos.y, ppos.z, x, y, z) < radius then
			table.insert(players, #players+1, GetPlayerServerId(id))
		end
	end
  return players
end

RegisterNetEvent('fsn_licenses:update')
AddEventHandler('fsn_licenses:update', function(type, status)

  TriggerEvent('fsn_notify:displayNotification', 'YOUR '..type..' LICENSE HAS BEEN '..status, 'centerLeft', 10000, 'alert')
  licenses[type].status = status
  TriggerServerEvent('fsn_licenses:update', charid, json.encode(licenses))
end)

RegisterNetEvent('fsn_licenses:showid')
AddEventHandler('fsn_licenses:showid', function()
  local pos = GetEntityCoords(PlayerPedId())
  TriggerServerEvent('fsn_licenses:chat', name, {
    type = 'id',
    charid = charid,
    job = exports.fsn_jobs:fsn_GetJob(),
  }, fsn_NearestPlayersC(pos.x, pos.y, pos.z, 5))
end)

RegisterNetEvent('fsn_licenses:infraction')
AddEventHandler('fsn_licenses:infraction', function(type, amt)
  licenses[type].infractions = licenses[type].infractions + amt
  TriggerServerEvent('fsn_licenses:update', charid, json.encode(licenses))
  TriggerServerEvent('fsn_licenses:check', type, licenses[type].infractions, licenses[type].date, GetNetworkTime())
end)

RegisterNetEvent('fsn_licenses:setinfractions')
AddEventHandler('fsn_licenses:setinfractions', function(type, amt)
  if amt <= 15 then
    licenses[type].status = 'ACTIVE'
  else
    licenses[type].status = 'SUSPENDED'
  end
  licenses[type].infractions = amt
  TriggerServerEvent('fsn_licenses:update', charid, json.encode(licenses))
end)

RegisterNetEvent('fsn_licenses:display')
AddEventHandler('fsn_licenses:display', function(type)
  local pos = GetEntityCoords(PlayerPedId())
  if type == 'all' then
    for k,v in pairs(licenses) do
      if licenses["driver"] then
        TriggerServerEvent('fsn_licenses:chat', name, licenses["driver"], fsn_NearestPlayersC(pos.x, pos.y, pos.z, 5))
      end
      if licenses["pilot"] then
        TriggerServerEvent('fsn_licenses:chat', name, licenses["pilot"], fsn_NearestPlayersC(pos.x, pos.y, pos.z, 5))
      end
      if licenses["weapon"] then
        TriggerServerEvent('fsn_licenses:chat', name, licenses["weapon"], fsn_NearestPlayersC(pos.x, pos.y, pos.z, 5))
      end
    end
  elseif type == 'driver' then
    if licenses["driver"] then
      TriggerServerEvent('fsn_licenses:chat', name, licenses["driver"], fsn_NearestPlayersC(pos.x, pos.y, pos.z, 5))
    else
      TriggerEvent('fsn_notify:displayNotification', 'You do not have a drivers license.', 'centerLeft', 4000, 'error')
    end
  elseif type == 'pilot' then
    if licenses["pilot"] then
      TriggerServerEvent('fsn_licenses:chat', name, licenses["pilot"], fsn_NearestPlayersC(pos.x, pos.y, pos.z, 5))
    else
      TriggerEvent('fsn_notify:displayNotification', 'You do not have a pilots license.', 'centerLeft', 4000, 'error')
    end
  elseif type == 'weapon' then
    if licenses["weapon"] then
      TriggerServerEvent('fsn_licenses:chat', name, licenses["weapon"], fsn_NearestPlayersC(pos.x, pos.y, pos.z, 5))
    else
      TriggerEvent('fsn_notify:displayNotification', 'You do not have a weapons license.', 'centerLeft', 4000, 'error')
    end
  end
end)

RegisterNetEvent('fsn_licenses:police:give')
AddEventHandler('fsn_licenses:police:give', function(type)
  licenses[type] = {}
  licenses[type].date = GetNetworkTime()
  licenses[type].type = type
  licenses[type].infractions = 0
  licenses[type].status = 'ACTIVE'
  TriggerServerEvent('fsn_licenses:update', charid, json.encode(licenses))
end)

function fsn_hasLicense(type)
  print('checking license type: '..tostring(type))
  if licenses[type] then
    return true
  else
    return false
  end
end

function fsn_getLicensePoints(type)
	if licenses[type] then
    return licenses[type].infractions
  else
    return 100
  end
end

---------------------------------------------------------- BUY PLACE
local blip = {x = 237.59239196777, y = -406.15228271484, z = 47.924365997314}
local license_stores = {
  {
    loc = {x = 233.22550964355, y = -410.34426879883, z = 48.11198425293},
    store = 'driver',
    cost = 500,
    text = 'Press ~INPUT_PICKUP~ to buy a drivers license (~g~$500~w~)'
  },
  {
    loc = {x = 238.16859436035, y = -412.05615234375, z = 48.11194229126},
    store = 'pilot',
    cost = 75000,
    text = 'Press ~INPUT_PICKUP~ to buy a pilots license (~g~$75,000~w~)'
  },
}
local function buyLicense(index)
  local store = license_stores[index]
  if store.store == 'driver' then
    if tonumber(exports.fsn_main:fsn_GetWallet()) >= store.cost then
      if licenses['driver'] then
        if licenses['driver'].status ~= 'EXPIRED' then
          TriggerEvent('fsn_notify:displayNotification', 'Your current license cannot be replaced', 'centerLeft', 4000, 'error')
        else
          TriggerEvent('fsn_bank:change:walletMinus', 250)
          TriggerEvent('fsn_notify:displayNotification', 'You updated your current license for <span style="color:limegreen">$250', 'centerLeft', 6000, 'success')

          licenses['driver'].date = GetNetworkTime()
          licenses['driver'].infractions = 0
          licenses['driver'].status = 'ACTIVE'
        end
      else
        licenses['driver'] = {}
        licenses['driver'].date = GetNetworkTime()
        licenses['driver'].type = 'driver'
        licenses['driver'].infractions = 0
        licenses['driver'].status = 'ACTIVE'

        TriggerEvent('fsn_bank:change:walletMinus', 500)
        TriggerEvent('fsn_notify:displayNotification', 'You bought a new license for <span style="color:limegreen">$500', 'centerLeft', 6000, 'success')

        TriggerServerEvent('fsn_licenses:update', charid, json.encode(licenses))
      end
    else
      TriggerEvent('fsn_notify:displayNotification', 'You do not have enough cash.', 'centerLeft', 4000, 'error')
    end
  elseif store.store == 'pilot' then
    if tonumber(exports.fsn_main:fsn_GetWallet()) >= store.cost then

    else
      TriggerEvent('fsn_notify:displayNotification', 'You do not have a enough cash.', 'centerLeft', 4000, 'error')
    end
  end
end
Citizen.CreateThread(function()
  local bleep = AddBlipForCoord(blip.x, blip.y, blip.z)
  SetBlipSprite(bleep, 498)
  SetBlipAsShortRange(bleep, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("License Center")
  EndTextCommandSetBlipName(bleep)
  while true do
    Citizen.Wait(0)
    for k, v in pairs(license_stores) do
      if GetDistanceBetweenCoords(v.loc.x,v.loc.y,v.loc.z,GetEntityCoords(PlayerPedId()), true) < 10 then
        DrawMarker(1,v.loc.x,v.loc.y,v.loc.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(v.loc.x,v.loc.y,v.loc.z,GetEntityCoords(PlayerPedId()), true) < 1 then
          SetTextComponentFormat("STRING")
          AddTextComponentString(v.text)
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
            buyLicense(k)
          end
        end
      end
    end
  end
end)
