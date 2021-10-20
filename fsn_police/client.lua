amicop = false
pdonduty = false ----------------- REMEMBER TO CHANGE THESE
policelevel = 0

function showLoadingPrompt(showText, showTime, showType)
  Citizen.CreateThread(function()
    Citizen.Wait(0)
    N_0xaba17d7ce615adbf("STRING") -- set type
    AddTextComponentString(showText) -- sets the text
    N_0xbd12f8228410d9b4(showType) -- show promt (types = 3)
    Citizen.Wait(showTime) -- show time
    N_0x10d373323e5b9c0d() -- remove promt
  end)
end

RegisterNetEvent('fsn_police:911r')
AddEventHandler('fsn_police:911r', function(nineoneone, at, msg)
  if pdonduty then
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^1 911R #'..nineoneone..' ('..at..') | ^0^r'..msg)
  end
end)

RegisterNetEvent('fsn_police:911')
AddEventHandler('fsn_police:911', function(nineoneone, at, msg)
  if pdonduty then
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^1 911 #'..nineoneone..' ('..at..') | ^0^r'..msg)
  end
end)

function fsn_PDDuty()
  if pdonduty then
    return true
  else
    return false
  end
end
function fsn_getPDLevel()
  return policelevel
end

function getNearestVeh()
local pos = GetEntityCoords(PlayerPedId())
		local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)

		local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
		local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
return vehicleHandle
end

RegisterNetEvent('fsn_police:putMeInVeh')
AddEventHandler('fsn_police:putMeInVeh', function()
  if not IsPedInAnyVehicle(PlayerPedId()) then
    local curpos = GetEntityCoords(PlayerPedId())
    local car = getNearestVeh()--GetClosestVehicle(curpos.x, curpos.y, curpos.z, 3.000, 0, 70)
    if IsVehicleSeatFree(car, 2) then
    	TaskWarpPedIntoVehicle(PlayerPedId(), car, 2)
    else
    	TaskWarpPedIntoVehicle(PlayerPedId(), car, 1)
    end
  else
    TaskLeaveVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId()), 16)
  end
end)

RegisterNetEvent('fsn_police:MDT:vehicledetails')
AddEventHandler('fsn_police:MDT:vehicledetails', function(name, wanted, car)
  if MDTOpen then
    -- js stuff for later
  else
    if not car then
      SetNotificationTextEntry("STRING");
      AddTextComponentString('Name: ~b~'..name..'~w~<br>Wanted: ~g~FALSE~w~<br>Status: ~r~STOLEN 10-99');
      SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "~g~MTD RESULT:~s~", "");
      DrawNotification(false, true);
    else
      if wanted then
        SetNotificationTextEntry("STRING");
        AddTextComponentString('Name: ~b~'..name..'~w~<br>Wanted: ~r~TRUE~w~<br>Status: ~g~LICIT');
        SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "~g~MTD RESULT:~s~", "");
        DrawNotification(false, true);
      else
        SetNotificationTextEntry("STRING");
        AddTextComponentString('Name: ~b~'..name..'~w~<br>Wanted: ~g~FALSE~w~<br>Status: ~g~LICIT');
        SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "~g~MTD RESULT:~s~", "");
        DrawNotification(false, true);
      end
    end
  end
end)

RegisterNetEvent('fsn_police:init')
AddEventHandler('fsn_police:init', function(pdlvl)
  TriggerServerEvent('fsn_police:requestUpdate')
  if pdlvl > 0 then
    amicop = true
    policelevel = pdlvl
  else
    amicop = false
    policelevel = 0
  end
end)

RegisterNetEvent('fsn_police:updateLevel')
AddEventHandler('fsn_police:updateLevel', function(pdlvl)
  TriggerServerEvent('fsn_police:requestUpdate')
  if pdlvl > 0 then
    TriggerEvent('fsn_notify:displayNotification', 'Your <span>police</span> whitelist has been updated to: '..pdlvl, 'centerLeft', 6000, 'info')
    amicop = true
    policelevel = pdlvl
  else
    TriggerEvent('fsn_notify:displayNotification', 'Your <span style="color:#72a8ff;font-weight:bold">police</span> whitelist has been removed.', 'centerLeft', 6000, 'error')
    amicop = false
    policelevel = 0
  end
end)

local clockInStations = {
  {
    name = "Mission Row PD",
    x = 440.61553955078,
    y = -975.72308349609,
    z = 30.689582824707
  },
  {
    name = "Sandy Shores Sheriff's Office",
    x = 1851.7194824219,
    y = 3691.4135742188,
    z = 34.267078399658
  },
  {
    name = "Blaine County Sheriff's Office",
    x = -437.44024658203,
    y = 6003.3479492188,
    z = 31.720394424438
  }
}
--[[
local armoryStations = {
  {
    name = "Mission Row Armory",
    x = 461.45196533203,
    y = -980.94122314453,
    z = 30.689605712891
  },
  {
    name = "Sandy Shores Armory",
    x = 1850.7705078125,
    y = 3694.2854003906,
    z = 34.276874542236
  },
  {
    name = "Blaine County Armory",
    x = -438.38093896484,
    y = 6001.0734375,
    z = 31.720390609741
  }
}
]]

local onduty_police = {}
RegisterNetEvent('fsn_police:update')
AddEventHandler('fsn_police:update', function(cops)
  --print(':fsn_police: There are '..#cops..' on duty!')
  if #cops > 2 then
	print(':fsn_police: You can do shit')		
  else
	print(':fsn_police: You cannot do shit')			
  end
  onduty_police = cops
end)
function fsn_getCopAmt()
  return #onduty_police
end

--[[
policeWeapons = {
  ['WEAPON_STUNGUN'] = {
    index = "WEAPON_STUNGUN",
    name = "Stun Gun",
    amt = 1,
    customData = {
        weapon = 'true',
        ammo = 0,
        ammotype = 'none',
        quality = 'normal',
        Serial = 'PoliceIssued'
    }
  },
  ['WEAPON_FLARE'] = {
    index = "WEAPON_FLARE",
    name = "Flare",
    amt = 1,
    customData = {
        weapon = 'true',
        ammo = 100,
        ammotype = 'none',
        quality = 'normal',
        Serial = 'PoliceIssued'
    }
  },

  ['WEAPON_NIGHTSTICK'] = {
    index = "WEAPON_NIGHTSTICK",
    name = "Nightstick",
    amt = 1,
    customData = {
        weapon = 'true',
        ammo = 0,
        ammotype = 'none',
        quality = 'normal',
        Serial = 'PoliceIssued'
    }
  },
  ['WEAPON_FIREEXTINGUISHER'] = {
    index = "WEAPON_FIREEXTINGUISHER",
    name = "Fire Extinguisher",
    amt = 1,
    customData = {
        weapon = 'true',
        ammo = 200,
        ammotype = 'none',
        quality = 'normal',
        Serial = 'PoliceIssued'
    }
  },
  ['WEAPON_PISTOL'] = {
    index = "WEAPON_PISTOL",
    name = "Pistol",
    amt = 1,
    customData = {
        weapon = 'true',
        ammo = 200,
        ammotype = 'pistol_ammo',
        quality = 'normal',
        Serial = 'PoliceIssued'
    }
  },
  ['WEAPON_FLASHLIGHT'] = {
    index = "WEAPON_FLASHLIGHT",
    name = "Flashlight",
    amt = 1,
    customData = {
        weapon = 'true',
        ammo = 0,
        ammotype = 'none',
        quality = 'normal',
        Serial = 'PoliceIssued'
    }
  },
}

-- Leave for now might use this to check inventory if police already have the guns then to just give ammo. Will work on this when i get time -Crutchie
local function fsn_policeEquipped()
  -- maybe add other loadouts later?
  policeWeapons = {
    "WEAPON_STUNGUN",
    "WEAPON_FLARE",
    "WEAPON_NIGHTSTICK",
    --"WEAPON_CARBINERIFLE",
    --"WEAPON_PUMPSHOTGUN",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_COMBATPISTOL",
    "WEAPON_FLASHLIGHT",
    "WEAPON_KNIFE"
  }
  for i=1, #policeWeapons do
    if not HasPedGotWeapon(PlayerPedId(), GetHashKey(policeWeapons[i])) then
      return false
    end
  end
  return true
end
]]
local pdCarBlips = {}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(4000)
    if pdonduty then
      for k, v in pairs(pdCarBlips) do
        if not DoesEntityExist(v.ent) or not IsVehicleDriveable(v.ent) then
          RemoveBlip(v.blip)
          pdCarBlips[k] = nil
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if pdonduty then
      --[[
      for id = 0, 32 do
        if NetworkIsPlayerActive(id) then
          local ped = GetPlayerPed(id)
          if GetDistanceBetweenCoords(ped, PlayerPedId(), true) < 2 and ped ~= PlayerPedId() then
            if DecorGetBool(GetPlayerPed(id), "hardcuff") then
              showLoadingPrompt("[SHIFT + Y] uncuff "..GetPlayerServerId(id), 3000, 3)
            else
              showLoadingPrompt("[SHIFT + Y] cuff "..GetPlayerServerId(id), 3000, 3)
            end
            if IsControlPressed() then
              if IsControlJustPressed() then
                ExecuteCommand('pd c '..GetPlayerServerId(id))
              end
            end
          end
        end
      end
      ]]
      for _, id in ipairs(GetActivePlayers()) do
        if NetworkIsPlayerActive(id) then
          local ped = GetPlayerPed(id)
          if IsPedInAnyVehicle(ped) then
            local veh = GetVehiclePedIsUsing(ped)
            if GetVehicleClass(veh) == 18 and not pdCarBlips[GetVehicleNumberPlateText(veh)] then
              local pd_blip = AddBlipForEntity(veh)
              SetBlipSprite(pd_blip, 227)
              SetBlipColour(pd_blip, 3)
              SetBlipAsShortRange(pd_blip, true)
          	  BeginTextCommandSetBlipName("STRING")
              AddTextComponentString("Police Car")
              EndTextCommandSetBlipName(pd_blip)

              pdCarBlips[GetVehicleNumberPlateText(veh)] = {}
              pdCarBlips[GetVehicleNumberPlateText(veh)].ent = veh
              pdCarBlips[GetVehicleNumberPlateText(veh)].blip = pd_blip
            end
          end
        end
      end
    end
    for k, stn in pairs(clockInStations) do
      if GetDistanceBetweenCoords(stn.x,stn.y,stn.z,GetEntityCoords(PlayerPedId()), true) < 10 and amicop then
        DrawMarker(1,stn.x,stn.y,stn.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(stn.x,stn.y,stn.z,GetEntityCoords(PlayerPedId()), true) < 1 then
          if pdonduty == false then
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_PICKUP~ to ~g~clock in~w~ as ~b~police")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          else
            SetTextComponentFormat("STRING")
            AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~clock out~w~ as ~b~police")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          end
          if IsControlJustPressed(0,38) then
            if pdonduty then
              pdonduty = false
              TriggerEvent('fsn_notify:displayNotification', 'Thanks for your service!', 'centerLeft', 2000, 'info')
              exports.fsn_jobs:fsn_SetJob('Unemployed')
              for k, v in pairs(pdCarBlips) do
                RemoveBlip(v.blip)
                pdCarBlips[k] = nil
              end
              TriggerServerEvent('fsn_police:offDuty')
            else
              exports.fsn_jobs:fsn_SetJob('Police')
              pdonduty = true
              TriggerEvent('fsn_notify:displayNotification', 'You have clocked in as <span style="color: #42b6f4">police</span> (lvl: '..policelevel..') @ '..stn.name, 'centerLeft', 2000, 'info')
              TriggerServerEvent('fsn_police:onDuty', policelevel)
            end
          end
        end
      end
    end
    --[[for k, stn in pairs(armoryStations) do
      if GetDistanceBetweenCoords(stn.x,stn.y,stn.z,GetEntityCoords(PlayerPedId()), true) < 10 and pdonduty then
        DrawMarker(1,stn.x,stn.y,stn.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(stn.x,stn.y,stn.z,GetEntityCoords(PlayerPedId()), true) < 1 then
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_PICKUP~ to ~g~collect~w~ your weapons")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
              for k, v in pairs(policeWeapons) do
                --GiveWeaponToPed(PlayerPedId(), GetHashKey(v), 1000)
                --TriggerEvent('fsn_criminalmisc:weapons:add:police', GetHashKey(v), 250)
                TriggerEvent('fsn_inventory:items:add', v, 1)
              end
	            GiveWeaponComponentToPed(PlayerPedId(), 0x5EF9FEC4, 0x359B7AAE)-- Combat Pistol Flashlight
              AddArmourToPed(PlayerPedId(), 100)
              TriggerEvent('fsn_notify:displayNotification', 'You have <span style="color:red">checked out</span> <span style="color:#f4a442;font-weight:bold">STANDARD LOADOUT</span> from '..stn.name, 'centerLeft', 2000, 'info')
            end
          end
        end
      end]]
    end
end)
RegisterNetEvent('fsn_police:command:duty')
AddEventHandler('fsn_police:command:duty', function()
  if pdonduty then
    pdonduty = false
    TriggerEvent('fsn_notify:displayNotification', 'Thanks for your service!', 'centerLeft', 2000, 'info')
    for k, v in pairs(pdCarBlips) do
      RemoveBlip(v.blip)
      pdCarBlips[k] = nil
    end
    TriggerServerEvent('fsn_police:offDuty')
  else
    if policelevel > 0 then
      pdonduty = true
      TriggerEvent('fsn_notify:displayNotification', 'You have clocked in as <span style="color: #42b6f4">police</span> (lvl: '..policelevel..')', 'centerLeft', 2000, 'info')
      TriggerServerEvent('fsn_police:onDuty', policelevel)
	  SetPedRelationshipGroupHash(PlayerPedId(),GetHashKey('store_guards'))
    else
      TriggerEvent('fsn_notify:displayNotification', 'You are not a police officer!', 'centerLeft', 6000, 'error')
    end
  end
end)

--------------------------------------------- Handcuffing

Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local cuffed = false
local cuffed_hard = false
RegisterNetEvent('fsn_police:cuffs:startCuffed')
AddEventHandler('fsn_police:cuffs:startCuffed', function(srv_id)
	if not cuffed then
		local crimPed = GetPlayerPed(GetPlayerFromServerId(srv_id))
		SetEntityHeading(PlayerPedId(), GetEntityHeading(crimPed))
		SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(crimPed, 0.0, 0.45, 0.0))
		while not HasAnimDictLoaded('mp_arrest_paired') do
			RequestAnimDict('mp_arrest_paired')
			Citizen.Wait(5)
		end
		TaskPlayAnim(PlayerPedId(), "mp_arrest_paired", "crook_p2_back_right", 8.0, -8, -1, 32, 0, 0, 0, 0)
		Citizen.Wait(3500)
		cuffed = true
	end
end)
RegisterNetEvent('fsn_police:cuffs:startunCuffed')
AddEventHandler('fsn_police:cuffs:startunCuffed', function(srv_id)
	local crimPed = GetPlayerPed(GetPlayerFromServerId(srv_id))
	SetEntityHeading(PlayerPedId(), GetEntityHeading(crimPed))
	SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(crimPed, 0.0, 0.45, 0.0))
	DetachEntity(PlayerPedId(), true, false)
	Citizen.Wait(2200)
	cuffed = false
	cuffed_hard = false
	escorted = false
	escorted_id = 0
	Citizen.Wait(500)
	ClearPedTasks(PlayerPedId())
end)
RegisterNetEvent('fsn_police:cuffs:startCuffing')
AddEventHandler('fsn_police:cuffs:startCuffing', function()
	while not HasAnimDictLoaded('mp_arrest_paired') do
		RequestAnimDict('mp_arrest_paired')
		Citizen.Wait(5)
	end
	TaskPlayAnim(PlayerPedId(), "mp_arrest_paired", "cop_p2_back_right", 8.0, -8, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(300)
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2, 'handcuffs', 1.0)
	Citizen.Wait(2200)	
end)
RegisterNetEvent('fsn_police:cuffs:startunCuffing')
AddEventHandler('fsn_police:cuffs:startunCuffing', function()
	while not HasAnimDictLoaded('mp_arresting') do
		RequestAnimDict('mp_arresting')
		Citizen.Wait(5)
	end
	TaskPlayAnim(PlayerPedId(), "mp_arresting", "a_uncuff", 8.0, -8, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(2500)	
end)
RegisterNetEvent('fsn_police:cuffs:toggleHard')
AddEventHandler('fsn_police:cuffs:toggleHard', function()
	cuffed_hard = not cuffed_hard
end)

local escorting = false
local escorting_id = 0
local escorted = false
local escorted_id = 0
RegisterNetEvent('fsn_police:pd:toggleDrag')
AddEventHandler('fsn_police:pd:toggleDrag', function(player)
	if escorting then
		escorting = false
		escorting_player = false
	else
		escorting = true
		escorting_id = player
	end
end)
RegisterNetEvent('fsn_police:ply:toggleDrag')
AddEventHandler('fsn_police:ply:toggleDrag', function(officer)
	if not escorted then
		local myPed = PlayerPedId()
		local pdPed = GetPlayerPed(GetPlayerFromServerId(officer))
		if IsPedInAnyVehicle(PlayerPedId()) then
			TaskLeaveVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId()), 16)
		end
		AttachEntityToEntity(myPed, pdPed, 11816, 0.54, 0.44, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		escorted = true
	else
		DetachEntity(PlayerPedId(), true, false)
		escorted = false
	end
end)

DecorRegister("pd_cuff")
DecorRegister("pd_cuff_hard")

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2500)
		if cuffed and not cuffed_hard then
			if IsPedRunning(PlayerPedId()) then
				SetPedToRagdoll(PlayerPedId(), 1, 1000, 0, 0, 0, 0)
				Citizen.Wait(math.random(2000,5000))
			end
		end
	end
end)
Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if amicop and pdonduty then
			for _, id in ipairs(GetActivePlayers()) do
				if NetworkIsPlayerActive(id) then
					local ped = GetPlayerPed(id)
					if ped ~= PlayerPedId() then
						if GetDistanceBetweenCoords(GetEntityCoords(ped, false), GetEntityCoords(PlayerPedId(),false), true) < 2 then
							if DecorGetBool(ped, "pd_cuff") then
								if DecorGetBool(ped, "pd_cuff_hard") then
									Util.DrawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, '~b~POLICE CUFFED~w~\n[LSHIFT+E] Soft Cuff\n[Y] Toggle Escort\n[H] Un-cuff', {255,255,255,255}, 0.25)
								else
									Util.DrawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, '~b~POLICE CUFFED~w~\n[LSHIFT+E] Hard Cuff\n[Y] Toggle Escort\n[H] Un-cuff', {255,255,255,255}, 0.25)
								end
								if IsControlPressed(0,21) then --lshift
									if IsControlJustPressed(0, 38) then
										-- E toggle hard
										TriggerServerEvent('fsn_police:cuffs:toggleHard', GetPlayerServerId(id))
									end
								end
								if IsControlJustPressed(0, 246) then
									-- Y toggle escort
									TriggerServerEvent('fsn_police:cuffs:toggleEscort', GetPlayerServerId(id))
								end
								if IsControlJustPressed(0, 74) then
									-- H toggle cuffs
									TriggerServerEvent('fsn_police:cuffs:requestunCuff', GetPlayerServerId(id))							
								end
							else
								showLoadingPrompt("[SHIFT + Y] to cuff "..GetPlayerServerId(id), 3000, 3)
								if IsControlPressed(0,21) then
									if IsControlJustPressed(0, 246) then
										TriggerServerEvent('fsn_police:cuffs:requestCuff', GetPlayerServerId(id))
									end
								end 
							end 
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
		-- cuff stuff
		if cuffed then
			DecorSetBool(PlayerPedId(), "pd_cuff", true)
			if cuffed_hard then
				DecorSetBool(PlayerPedId(), "pd_cuff_hard", true)
				for i=1,345 do
					if i > 10 and i ~= 249 and i ~= 25 and i ~= 245 then
						DisableControlAction(1, i, true)
					end
				end
				DisableControlAction(0, 63, false)
				DisableControlAction(0, 63, false)
				DisableControlAction(0, 64, false)
				DisableControlAction(0, 59, false)
				DisableControlAction(0, 278, false)
				DisableControlAction(0, 279, false)
				DisableControlAction(0, 68, false)
				DisableControlAction(0, 69, false)
				DisableControlAction(0, 75, false)
				DisableControlAction(0, 76, false)
				DisableControlAction(0, 102, false)
				DisableControlAction(0, 81, false)
				DisableControlAction(0, 82, false)
				DisableControlAction(0, 83, false)
				DisableControlAction(0, 84, false)
				DisableControlAction(0, 85, false)
				DisableControlAction(0, 86, false)
				DisableControlAction(0, 106, false)
				DisableControlAction(0, 25, false)
			else
				DecorSetBool(PlayerPedId(), "pd_cuff_hard", false)
				DisableControlAction(1, 18, true)
				DisableControlAction(1, 24, true)
				DisableControlAction(1, 69, true)
				DisableControlAction(1, 92, true)
				DisableControlAction(1, 106, true)
				DisableControlAction(1, 122, true)
				DisableControlAction(1, 135, true)
				DisableControlAction(1, 142, true)
				DisableControlAction(1, 144, true)
				DisableControlAction(1, 176, true)
				DisableControlAction(1, 223, true)
				DisableControlAction(1, 229, true)
				DisableControlAction(1, 237, true)
				DisableControlAction(1, 257, true)
				DisableControlAction(1, 329, true)
				DisableControlAction(1, 80, true)
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 250, true)
				DisableControlAction(1, 263, true)
				DisableControlAction(1, 310, true)
				DisableControlAction(1, 22, true)
				DisableControlAction(1, 55, true)
				DisableControlAction(1, 76, true)
				DisableControlAction(1, 102, true)
				DisableControlAction(1, 114, true)
				DisableControlAction(1, 143, true)
				DisableControlAction(1, 179, true)
				DisableControlAction(1, 193, true)
				DisableControlAction(1, 203, true)
				DisableControlAction(1, 216, true)
				DisableControlAction(1, 255, true)
				DisableControlAction(1, 298, true)
				DisableControlAction(1, 321, true)
				DisableControlAction(1, 328, true)
				DisableControlAction(1, 331, true)
				DisableControlAction(0, 63, false)
				DisableControlAction(0, 64, false)
				DisableControlAction(0, 59, false)
				DisableControlAction(0, 278, false)
				DisableControlAction(0, 279, false)
				DisableControlAction(0, 68, false)
				DisableControlAction(0, 69, false)
				DisableControlAction(0, 75, false)
				DisableControlAction(0, 76, false)
				DisableControlAction(0, 102, false)
				DisableControlAction(0, 81, false)
				DisableControlAction(0, 82, false)
				DisableControlAction(0, 83, false)
				DisableControlAction(0, 84, false)
				DisableControlAction(0, 85, false)
				DisableControlAction(0, 86, false)
				DisableControlAction(0, 106, false)
				DisableControlAction(0, 25, false)
			end
			while not HasAnimDictLoaded('mp_arresting') do
				RequestAnimDict('mp_arresting')
				Citizen.Wait(5)
			end
			if not IsEntityPlayingAnim(PlayerPedId(), 'mp_arresting', 'idle', 3) and not IsPedRagdoll(PlayerPedId()) then
				TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
			end
		else
			DecorSetBool(PlayerPedId(), "pd_cuff", false)
			DecorSetBool(PlayerPedId(), "pd_cuff_hard", false)
			if cuffed_hard then
				cuffed_hard = not cuffed_hard
			end
		end
	end
end)

--------------------------------------------- No wanted xx
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPed = PlayerPedId()
    local playerLocalisation = GetEntityCoords(playerPed)
    ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
  end
end)
Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
	  for i = 1, 12 do
			EnableDispatchService(i, false)
		end
      if GetPlayerWantedLevel(PlayerId()) ~= 0 then
        SetPlayerWantedLevel(PlayerId(), 0, false)
			  SetPoliceIgnorePlayer(PlayerId(), true)
		    SetDispatchCopsForPlayer(PlayerId(), false)
        SetPlayerWantedLevelNow(PlayerId(), false)
      end
      DisablePlayerVehicleRewards(PlayerId())
    end
end)

local IllegalItems = {
  '2g_weed',
  'joint',
  'acetone',
  'meth_rocks',
  'packaged_cocaine'
}

function fsn_getIllegalItems()
  return IllegalItems
end

SetNuiFocus(true,true)
