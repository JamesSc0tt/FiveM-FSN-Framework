local clienttime = 0
local hunger = 100
local thirst = 100
local stress = 0

function fsn_thirst()
	return thirst
end

function fsn_hunger()
	return hunger
end

function fsn_stress()
	return stress
end

local UI = {
	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y
}
local init = false

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

AddEventHandler('fsn_inventory:initChar', function()
  init = true
	hunger = 0
	thirst = 0
	stress = 0
end)

--[[
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if init then
			if IsPedInAnyVehicle(GetPlayerPed(-1)) then
	      drawRct(UI.x + 0.0149, UI.y + 0.797, 0.1569,0.0140,0,0,0,130) -- bar at top
	      drawRct(UI.x + 0.0149, UI.y + 0.800, 0.07718,0.0080,255,255,255,60) -- sub-bar (hunger)
	      drawRct(UI.x + 0.0941, UI.y + 0.800, 0.07718,0.0080,255,255,255,60) -- sub-bar (thirst)


	      local hunger_bar = 0.07718 / 100
	      hunger_bar = hunger_bar * hunger

	      local thirst_bar = 0.07718 / 100
	      thirst_bar = thirst_bar * thirst
	      drawRct(UI.x + 0.0149, UI.y + 0.800, hunger_bar,0.0080,17, 160, 41,130) -- main-bar (hunger)
	      drawRct(UI.x + 0.0942, UI.y + 0.800, thirst_bar,0.0080,0, 250, 255,130) -- main-bar (thirst)
			else --0.97695
				drawRct(UI.x + 0.0149, UI.y + 0.96295, 0.1569,0.0140,0,0,0,130) -- bar at top
	      drawRct(UI.x + 0.0149, UI.y + 0.9663, 0.07718,0.0080,255,255,255,60) -- sub-bar (hunger)
	      drawRct(UI.x + 0.0941, UI.y + 0.9663, 0.07718,0.0080,255,255,255,60) -- sub-bar (thirst)


	      local hunger_bar = 0.07718 / 100
	      hunger_bar = hunger_bar * hunger

	      local thirst_bar = 0.07718 / 100
	      thirst_bar = thirst_bar * thirst
	      drawRct(UI.x + 0.0149, UI.y + 0.9663, hunger_bar,0.0080,17, 160, 41,130) -- main-bar (hunger)
	      drawRct(UI.x + 0.0942, UI.y + 0.9663, thirst_bar,0.0080,0, 250, 255,130) -- main-bar (thirst)
			end

      --drawRct(UI.x + 0.0149, UI.y + 0.800, 0.07715,0.0080,17, 160, 41,130) -- main-bar (hunger)
      --drawRct(UI.x + 0.0942, UI.y + 0.800, 0.07715,0.0080,0, 250, 255,130) -- main-bar (hunger)
    end
  end
end)
]]--
local paused = false
RegisterNetEvent('fsn_hungerandthirst:pause')
RegisterNetEvent('fsn_hungerandthirst:unpause')
AddEventHandler('fsn_hungerandthirst:pause', function()
	paused = true
	TriggerEvent('fsn_notify:displayNotification', 'Hunger, thirst, and stress usage has been paused', 'centerRight', 3000, 'info')
end)
AddEventHandler('fsn_hungerandthirst:unpause', function()
	TriggerEvent('fsn_notify:displayNotification', 'Hunger, thirst, and stress usage has been reactivated', 'centerRight', 3000, 'info')
	paused = false
end)

local notifstarve = false
local notifthirst = false
local ded = false
RegisterNetEvent('fsn_ems:reviveMe')
AddEventHandler('fsn_ems:reviveMe', function()
	ded = false
end)
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    clienttime = clienttime + 1
    if clienttime / 1000 == math.floor(clienttime) / 1000 and init then
      if hunger - 0.006 <= 0 then
		local helf = GetEntityHealth(GetPlayerPed(-1))-3
		print(helf)
		if helf < 105 and not ded then
			TriggerEvent('fsn_ems:killMe')
			TriggerEvent('fsn_notify:displayNotification', 'You forgot to eat!', 'centerLeft', 5000, 'error')
			ded = true
		else
			if not ded then
				SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1))-2)
			end
			if notifstarve == false then
				TriggerEvent('fsn_notify:displayNotification', 'You are <b>STARVING', 'centerLeft', 3000, 'info')
				notifstarve = true
			end
		end
      else
		if not paused then
			hunger = hunger - 0.005
		end
		notifstarve = false
      end
      if thirst - 0.007 <= 0 then
		local helf = GetEntityHealth(GetPlayerPed(-1))-3
		print(helf)
		if helf < 105 and not ded then
			TriggerEvent('fsn_ems:killMe')
			TriggerEvent('fsn_notify:displayNotification', 'You forgot to drink!', 'centerLeft', 5000, 'error')
			ded = true
		else
			if not ded then
				SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1))-2)
			end
			if notifthirst == false then
				TriggerEvent('fsn_notify:displayNotification', 'You are <b>THIRSTY', 'centerLeft', 3000, 'info')
				notifthirst = true
			end
		end
      else
		if not paused then
			thirst = thirst - 0.01
		end
		notifthirst = false
      end
    end	
  end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local playerPed = GetPlayerPed(-1)
		if IsPedShooting(playerPed)  and not exports.fsn_police:fsn_PDDuty() then
			TriggerEvent('fsn_stress:stressingOut', 1)
		elseif IsPedShooting(playerPed)  and exports.fsn_police:fsn_PDDuty() then
			TriggerEvent('fsn_stress:stressingOut', 0.1)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(10)
		if stress >= 100 then
			Citizen.Wait(2000)
			ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.10)
		elseif stress >= 90 then
			Citizen.Wait(2000)
			ShakeGameplayCam('MEDIUM_EXPLOSION_SHAKE', 0.06)
		elseif stress >= 50 then
			Citizen.Wait(4000)
			ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
		elseif stress >= 25 then
			Citizen.Wait(6000)
			ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.04)
		end
	end
end)

RegisterNetEvent('fsn_inventory:use:food')
AddEventHandler('fsn_inventory:use:food', function(relief)
  if hunger + relief >= 100 then
    hunger = 100
  else
    hunger = hunger + hunger
  end
end)

RegisterNetEvent('fsn_inventory:use:drink')
AddEventHandler('fsn_inventory:use:drink', function(relief)
  if thirst + relief >= 100 then
    thirst = 100
  else
    thirst = thirst + relief
  end
end)

RegisterNetEvent('fsn_stress:stressingOut')
AddEventHandler('fsn_stress:stressingOut', function(anxiety)
	if stress + anxiety >= 100 then
		stress = 100
	else
		stress = stress + anxiety
	end
end)

RegisterNetEvent('fsn_stress:removeStress')
AddEventHandler('fsn_stress:removeStress', function(relief)
	if stress - relief <= 0 then
		stress = 0
	else
		stress = stress - relief
	end
end)
