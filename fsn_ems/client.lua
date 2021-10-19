onduty_ems = {}
local bandw = false
local pulsing = false
RegisterNetEvent('fsn_ems:update')
AddEventHandler('fsn_ems:update', function(ems)
  onduty_ems = ems
end)

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsEntityDead(PlayerPedId()) then
      SetEntityHealth(PlayerPedId(), 150)
      TriggerEvent('fsn_ems:killMe')
    end
  end
end)

currenttime = 0
local deathtime = currenttime
local amidead = false
local canRespawn = false

function fsn_IsDead()
  return amidead
end
--fsn_ems:reviveMe:force
RegisterNetEvent('fsn_ems:reviveMe:force')
AddEventHandler('fsn_ems:reviveMe:force', function()
  amidead = false
  deathtime = 0
  NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, 0, false, false)
  TriggerEvent('fsn_inventory:use:drink', 100)
  TriggerEvent('fsn_inventory:use:food', 100)
  TriggerEvent('fsn_needs:stress:remove', 100)
  ClearTimecycleModifier()
  SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
end)

RegisterNetEvent('fsn_ems:reviveMe')
AddEventHandler('fsn_ems:reviveMe', function()
  amidead = false
  pulsing = false
  deathtime = 0
  NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, 0, false, false)
  TriggerEvent('fsn_inventory:use:drink', 100)
  TriggerEvent('fsn_inventory:use:food', 100)
  TriggerEvent('fsn_needs:stress:remove', 100)
  ClearTimecycleModifier()
  SetEntityHealth(PlayerPedId(), 105)
  if inbed then
    SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
	SetEntityCoords(PlayerPedId(), beds[mybed].bed.x, beds[mybed].bed.y, beds[mybed].bed.z)
	SetEntityHeading(PlayerPedId(), beds[mybed].bed.h)
	ExecuteCommand("e sleep")
  end
end)


DecorRegister("deadPly")
RegisterNetEvent('fsn_ems:killMe')
AddEventHandler('fsn_ems:killMe', function()
  if not amidead then
	DecorSetBool(PlayerPedId(), "deadPly", true)
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
    if IsPedInAnyVehicle(PlayerPedId()) then
  		local veh = GetVehiclePedIsIn(PlayerPedId(), false)
      TaskLeaveVehicle(PlayerPedId(), veh, 4160)
    end
    if exports.fsn_police:fsn_PDDuty() then
      local pos = GetEntityCoords(PlayerPedId())
      local coords = {
        x = pos.x,
        y = pos.y,
        z = pos.z
      }
      TriggerServerEvent('fsn_police:dispatch', coords, 4)
    end
    TriggerServerEvent('fsn_police:CAD:10-43', x, y, z)
    TriggerServerEvent('fsn_ems:CAD:10-43', x, y, z)
    amidead = true
    deathtime = currenttime
	SetTimecycleModifier("dying")
	SetTimecycleModifierStrength(1.0)
	bandw = false
	pulsing = true
  else
	DecorSetBool(PlayerPedId(), "deadPly", false)
  end
end)

-- thread to check if im dead
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if amidead then
      SetPedToRagdoll(PlayerPedId(), 1, 1000, 0, 0, 0, 0)
      local def = deathtime + 300
      if def > currenttime then
       -- (text,font,centre,x,y,scale,r,g,b,a)
        drawTxt('Wait '..tostring(def - currenttime)..' seconds to airlift ~b~||~w~ Wait for EMS',4,1,0.5,0.90,0.6,255,255,255,255)
        drawTxt('~r~DO NOT USE ANY MECHANICS WHILST DOWN, YOU CAN TALK',4,1,0.5,0.20,0.6,255,255,255,255)
      else
        if #onduty_ems > 0 then
          drawTxt('Type /airlift to airlift out ($5000)',4,1,0.5,0.90,0.6,255,255,255,255)
          canRespawn = true
        else
          drawTxt('Type /airlift to airlift out (~b~FREE~w~)',4,1,0.5,0.90,0.6,255,255,255,255)
          canRespawn = true
        end
        drawTxt('~r~DO NOT AIRLIFT IN AN ACTIVE SCENARIO',4,1,0.5,0.20,0.6,255,255,255,255)
      end
    end
  end
end)

-- thread to check if im dead
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    currenttime = currenttime + 1
  end
end)

function fsn_Airlift()
  if amidead and canRespawn == true then
    canRespawn = false
    DoScreenFadeOut(200)
    TriggerEvent('fsn_bank:change:bankandwallet', 0, false)
    TriggerEvent('fsn_inventory:items:emptyinv')
		
    local hospital = {
      {x = 337.21597290039, y = -1396.1442871094, z = 32.5090675354},
      {x = 355.52011108398, y = -598.32464599609, z = 28.774812698364},
      {x = 1839.5141601563, y = 3672.0124511719, z = 34.276752471924},
      {x = -246.84455871582, y = 6331.107421875, z = 32.426181793213}
    }
    hospital = hospital[math.random(1, #hospital)]
    amidead = false
    deathtime = 0
    NetworkResurrectLocalPlayer(hospital.x, hospital.y, hospital.z, 0, false, false)
    TriggerEvent('fsn_inventory:use:drink', 100)
    TriggerEvent('fsn_inventory:use:food', 100)
    TriggerEvent('fsn_needs:stress:remove', 100)
    TriggerEvent('mythic_hospital:client:ResetLimbs') -- reset limbs/limp
    TriggerEvent('mythic_hospital:client:RemoveBleed') -- remove bleed
    Citizen.Wait(2000)
    DoScreenFadeIn(1500)
    ClearPedBloodDamage(PlayerPedId())
    if #onduty_ems > 0 then
      TriggerEvent('fsn_bank:change:bankMinus', 5000)
      TriggerEvent("pNotify:SendNotification", {text = "You have been charged $5000 for medical bills.",
        layout = "centerRight",
        timeout = 5000,
        progressBar = true,
        type = "info",
      })
    else
      TriggerEvent("pNotify:SendNotification", {text = "The Government will pay for your medical bills.",
        layout = "centerRight",
        timeout = 5000,
        progressBar = true,
        type = "info",
      })
    end
  end
end

------------------------------------------------- EMS system
amiems = true
emsonduty = false ----------------- REMEMBER TO CHANGE THESE
emslevel = 0

RegisterNetEvent('fsn_ems:911r')
AddEventHandler('fsn_ems:911r', function(nineoneone, at, msg)
  if emsonduty then
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^1 911R #'..nineoneone..' ('..at..') | ^0^r'..msg)
  end
end)

RegisterNetEvent('fsn_ems:911')
AddEventHandler('fsn_ems:911', function(nineoneone, at, msg)
  if emsonduty then
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^1 911 #'..nineoneone..' ('..at..') | ^0^r'..msg)
  end
end)

function fsn_EMSDuty()
  return emsonduty
end

function fsn_getEMSLevel()
  return emslevel
end
AddEventHandler('fsn_main:character', function(char)
  TriggerServerEvent('fsn_ems:requestUpdate')
  if char.char_ems > 0 then
    amiems = true
    emslevel = char.char_ems
  else
    amiems = true
    emslevel = 3
  end
end)

RegisterNetEvent('fsn_ems:updateLevel')
AddEventHandler('fsn_ems:updateLevel', function(emslvl)
  TriggerServerEvent('fsn_ems:requestUpdate')
  if emslvl > 0 then
    TriggerEvent('fsn_notify:displayNotification', 'Your <span>EMS</span> whitelist has been updated to: '..emslvl, 'centerLeft', 6000, 'info')
    amiems = true
    emslevel = emslvl
  else
    TriggerEvent('fsn_notify:displayNotification', 'Your <span style="color:#72a8ff;font-weight:bold">EMS</span> whitelist has been removed.', 'centerLeft', 6000, 'error')
    amiems = false
    emslevel = 0
  end
end)
local clockInStations = {
{x = 1191.9343261719, y = -1474.7747802734, z = 34.859516143799},
{x = 310.27493286133, y = -599.16485595703, z = 43.291816711426}
}
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    for k, hosp in pairs(clockInStations) do
      if GetDistanceBetweenCoords(hosp.x,hosp.y,hosp.z,GetEntityCoords(PlayerPedId()), true) < 10 and amiems then
        DrawMarker(1,hosp.x,hosp.y,hosp.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(hosp.x,hosp.y,hosp.z,GetEntityCoords(PlayerPedId()), true) < 1 then
          if emsonduty then
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~clock out~w~ as ~p~EMS")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          else
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_PICKUP~ to ~g~clock in~w~ as ~p~EMS")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          end
          if IsControlJustPressed(0,38) then
            if emsonduty then
              emsonduty = false
              TriggerEvent('fsn_notify:displayNotification', 'Thanks for your service!', 'centerLeft', 2000, 'info')
              TriggerServerEvent('fsn_ems:offDuty')
              exports.fsn_jobs:fsn_SetJob('Unemployed')
            else
              emsonduty = true
              TriggerEvent('fsn_notify:displayNotification', 'You have clocked in as <span style="color: #f45942">EMS</span> (lvl: '..emslevel..')', 'centerLeft', 6000, 'info')
              TriggerServerEvent('fsn_ems:onDuty', emslevel)
              exports.fsn_jobs:fsn_SetJob('EMS')
            end
          end
        end
      end
    end
  end
end)

local dispatch_calls = {}
local disp_id = 0
local last_disp = 0
RegisterNetEvent('fsn_jobs:ems:request')
AddEventHandler('fsn_jobs:ems:request', function(tbl)
  if exports.fsn_police:fsn_PDDuty() then
    if #onduty_ems < 2 then
      TriggerEvent('fsn_police:dispatchcall', tbl, 9)
    end
    local var1, var2 = GetStreetNameAtCoord(x, y, z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
    local sname = GetStreetNameFromHashKey(var1)
    TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:DISPATCH:^0^r (10-47) EMS requested @ ^4'..sname)
  end
  if emsonduty then
    local x = tbl.x
    local y = tbl.y
    local var1, var2 = GetStreetNameAtCoord(x, y, z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
    local sname = GetStreetNameFromHashKey(var1)
    TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:DISPATCH:^0^r (10-47) EMS requested @ ^4'..sname)
    disp_id = #dispatch_calls+1
    last_disp = currenttime
    table.insert(dispatch_calls, disp_id, {
      type = 'ems call',
      cx = x,
      cy = y
    })
    SetNotificationTextEntry("STRING");
    AddTextComponentString('Location: ~y~'..sname);
    SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "DISPATCH", "");
    DrawNotification(false, true);
	TriggerEvent("fsn_main:blip:add", "ems", "ALERT: EMS Request", 310, x, y, z)
  end
end)
Citizen.CreateThread(function()
   while true do
     Citizen.Wait(0)
     if disp_id ~= 0 then
       if last_disp + 10 > currenttime then
         SetTextComponentFormat("STRING")
         AddTextComponentString("Press ~INPUT_MP_TEXT_CHAT_TEAM~ to ~g~accept~w~ the call\nPress ~INPUT_PUSH_TO_TALK~ to ~r~decline~w~ the call")
         DisplayHelpTextFromStringLabel(0, 0, 1, -1)
         if IsControlJustPressed(0, 246) then
           SetNewWaypoint(dispatch_calls[disp_id].cx, dispatch_calls[disp_id].cy)
           last_disp = 0
         end
         if IsControlJustPressed(0, 249) then
           last_disp = 0
         end
       end
     end
   end
end)

local hospitals = {
  {
    name = 'Crusade Road Emergency Unit',
    x = 295.42825317383,
    y = -1446.8900146484,
    z = 29.966619491577
  }
}
local healing = false
local healstart = 0
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for k, hosp in pairs(hospitals) do
      if GetDistanceBetweenCoords(hosp.x,hosp.y,hosp.z,GetEntityCoords(PlayerPedId()), true) < 10 and not healing then
        DrawMarker(1,hosp.x,hosp.y,hosp.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(hosp.x,hosp.y,hosp.z,GetEntityCoords(PlayerPedId()), true) < 1 then
          SetTextComponentFormat("STRING")
		  if #onduty_ems > 0 then
        	AddTextComponentString("Press ~INPUT_PICKUP~ to see a doctor (FREE)")
		  else
        	AddTextComponentString("Press ~INPUT_PICKUP~ to see a doctor ($5000)")		  
		  end
        	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
			  if #onduty_ems > 0 then
				TriggerEvent('fsn_notify:displayNotification', 'As there are no EMS, your medical bills were covered by the state.', 'centerLeft', 6000, 'info')
				TriggerEvent('fsn_ems:reviveMe')
			  else
				TriggerEvent('fsn_notify:displayNotification', 'EMS were available, so your bank has been charged $5000', 'centerLeft', 6000, 'info')  
				TriggerEvent('fsn_ems:reviveMe')
				TriggerEvent('fsn_bank:change:bankMinus', 5000)
			  end
          end
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	if pulsing then
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		DoScreenFadeIn(1000)
		Citizen.Wait(20000)
	end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
	if GetEntityHealth(PlayerPedId()) < 130 then
		if not bandw then
			SetTimecycleModifier("dying")
			SetTimecycleModifierStrength(1.0)
			bandw = true
		end
	else
		if not amidead then
			ClearTimecycleModifier()
			bandw = false
			pulsing = false
		end
	end
  end
end)
