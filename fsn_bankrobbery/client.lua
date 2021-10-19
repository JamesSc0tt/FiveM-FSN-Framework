local current_time = 0
local cracking = false
local start_time = 0
local cracking_id = 0

canrob = true
RegisterNetEvent('fsn_bankrobbery:timer')
AddEventHandler('fsn_bankrobbery:timer', function(state)
	if canrob ~= state then
		canrob = state
		print('fsn_bankrobbery: canrob = '..tostring(state))
	end
end)

function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.2, 0.2)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
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
function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end
function resultDisplay(accepted)
  if not accepted then
    Citizen.CreateThread(function()
      while true do
        Citizen.Wait(0)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        break
      end
    end)
  else
    Citizen.CreateThread(function()
      local time = current_time
      while true do
        Citizen.Wait(0)
        if current_time > time + 10000 then
          drawTxt('~g~CODE ACCEPTED',4,1,0.5,0.25,0.6,255,255,255,255)
        end
      end
    end)
  end
end
local bankdoors = {
  -- LEGION SQUARE
  [1] = {hash=2121050683,x=148.026,y=-1044.363,z=29.506,tx=148.026,ty=-1044.363,tz=29.506,unlocked=false,unlocktime=0,keypad={
    x = 146.794,
    y = -1046.035,
    z = 29.36807,
    crackattempts = 0,
    code = 0,
    difficulty = 4 --amount of numbers in the lock
  }, status={
    openh = 141.799,
    closedh = 249.846,
    status = 'closed'
  }, vault={robbed=false,x = 149.14091491699, y = -1048.4520263672, z = 29.346370697021}},
  -- VINEWOOD
  [2] = {hash=961976194,x=255.228,y=223.976,z=102.393,tx=255.228,ty=223.976,tz=102.393,unlocked=false,unlocktime=0,keypad={
    x = 253.19821166992,
    y = 228.48191833496,
    z = 101.68326568604,
    crackattempts = 0,
    code = 0,
    difficulty = 6 --amount of numbers in the lock
  }, status={
    openh = 36.399,
    closedh = 159.324,
    status = 'closed'
  }, vault={robbed=false,x = 262.9462890625, y = 214.70375061035, z = 101.68346405029}},
  -- PALETO
  [3] = {hash=-1185205679,x=-104.604,y=6473.443,z=31.79,tx=-104.604,ty=6473.443,tz=31.79,unlocked=false,unlocktime=0,keypad={
    x = -105.55908966064,
    y = 6471.998046875,
    z = 31.626714706421,
    crackattempts = 0,
    code = 0,
    difficulty = 4 --amount of numbers in the lock
  }, status={
    --openh = 45.200,
    --closedh = 162.799,
    openh = 162.799,
    closedh= 45.200,
    status = 'closed'
  }, vault={robbed=false, x = -104.92517852783, y = 6476.5268554688, z = 31.626726150513}},
  -- RT68
  [4] = {hash=2121050683,x=1175.542,y=2710.861,z=38.22,tx=1175.542,ty=2710.861,tz=38.22,unlocked=false,unlocktime=0,keypad={
    x = 1175.9526367188,
    y = 2712.880859375,
    z = 38.088054656982,
    crackattempts = 0,
    code = 0,
    difficulty = 4 --amount of numbers in the lock
  }, status={
    --openh = 1075.216,
    --closedh = 1169.855,
    openh = 1075.216,
    closedh= 1168.855,
    status = 'closed'
  }, vault={robbed=false, x = 1173.1298828125, y = 2716.0144042969, z = 38.066310882568}},
  -- Great Ocean
  [5] = {hash=-63539571,x=-2958.538,y=482.270,z=15.83,tx=-2958.538,ty=482.270,tz=15.83,unlocked=false,unlocktime=0,keypad={
    x = -2956.4716796875,
    y = 481.78286743164,
    z = 15.69709777832,
    crackattempts = 0,
    code = 0,
    difficulty = 4 --amount of numbers in the lock
  }, status={
    --openh = -2975.538,
    --closedh = -2883.538,
    openh = -2975.538,
    closedh= -2883.538,
    status = 'closed'
  }, vault={robbed=false, x = -2953.1357421875, y = 484.44955444336, z = 15.675388336182}},
}
local banklocations = {

}

AddEventHandler('fsn_main:character', function()
  TriggerServerEvent('fsn_bankrobbery:init')
end)

RegisterNetEvent('fsn_bankrobbery:init')
AddEventHandler('fsn_bankrobbery:init', function(tbl)
  for k, v in pairs(tbl) do
    local door = bankdoors[k]
    if v[1] == 'open' then
      door.status.status = v[1]
      TriggerEvent('fsn_bankrobbery:openDoor', k)
    elseif v[1] == 'closed' then
      door.status.status = v[1]
      TriggerEvent('fsn_bankrobbery:closeDoor', k)
    end
  end
end)

RegisterNetEvent('fsn_bankrobbery:openDoor')
AddEventHandler('fsn_bankrobbery:openDoor', function(id)
  local door = bankdoors[id]
  local _door = GetClosestObjectOfType(door.x, door.y, door.z, 1.0, door.hash, false, false, false)
  if GetDistanceBetweenCoords(GetEntityCoords(_door), GetEntityCoords(PlayerPedId())) < 10 then
    --PlaySound(-1, "DOOR_OPEN", "CABLE_CAR_SOUNDS", 0, 0, 1)
    PlaySoundFromEntity(-1, "DOOR_OPEN", _door, 'CABLE_CAR_SOUNDS', 0,0 )
  end
  Wait(1000)
  SetEntityHeading(_door, door.status.openh)
  door.status.status = 'open'
end)

RegisterNetEvent('fsn_bankrobbery:closeDoor')
AddEventHandler('fsn_bankrobbery:closeDoor', function(id)
  local door = bankdoors[id]
  local _door = GetClosestObjectOfType(door.x, door.y, door.z, 1.0, door.hash, false, false, false)
  if GetDistanceBetweenCoords(GetEntityCoords(_door), GetEntityCoords(PlayerPedId())) < 10 then
    --PlaySound(-1, "DOOR_OPEN", "CABLE_CAR_SOUNDS", 0, 0, 1)
    PlaySoundFromEntity(-1, "DOOR_CLOSE", _door, 'CABLE_CAR_SOUNDS', 0,0 )
  end
  Wait(1000)
  SetEntityHeading(_door, door.status.closedh)
  door.status.status = 'closed'
end)

Citizen.CreateThread(function()
  for k, v in pairs(bankdoors) do
    local blip = AddBlipForCoord(v.keypad.x, v.keypad.y, v.keypad.z)
    SetBlipSprite(blip, 277)
    SetBlipColour(blip, 1)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Unknown")
    EndTextCommandSetBlipName(blip)
  end
  while true do
    Citizen.Wait(0)
    if cracking then
      local rem = start_time + 750
      if rem < current_time then
        TaskPlayAnim(PlayerPedId(), 'mp_heists@keypad@', 'exit', 8.0, 1.0, -1, 0, 1.0, 0, 0, 0)
        cracking = false
        FreezeEntityPosition(PlayerPedId(), false)
        local code = ''
        local door = bankdoors[cracking_id]
        for i=1,door.keypad.difficulty do
          code = code..tostring(math.random(0,9))
        end
        door.keypad.code = code
        door.keypad.crackattempts = 1
        TriggerEvent('fsn_notify:displayNotification', 'Keypad cracking succeeded code: <b>'..door.keypad.code, 'centerLeft', 5000, 'success')
        DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", door.keypad.difficulty)
        local editOpen = true
        while UpdateOnscreenKeyboard() == 0 or editOpen do
          drawTxt('Input a ~b~'..door.keypad.difficulty..'~w~ digit code:',4,1,0.5,0.35,0.6,255,255,255,255)
          drawTxt('~r~CRACKED CODE: ~g~'..code,4,1,0.5,0.30,0.6,255,255,255,255)
          if UpdateOnscreenKeyboard() ~= 0 then
            editOpen = false
            if UpdateOnscreenKeyboard() == 1 then
              codeinput = tostring(GetOnscreenKeyboardResult())
              if codeinput == door.keypad.code then
                resultDisplay(true)
                door.unlocked = true
              else
                resultDisplay(false)
                if door.keypad.crackattempts > 3 then
                  local pos = GetEntityCoords(PlayerPedId())
                  local coords = {
                    x = pos.x,
                    y = pos.y,
                    z = pos.z
                  }
                  TriggerServerEvent('fsn_police:dispatch', coords, 7)
                end
                DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", door.keypad.difficulty)
                editOpen = true
                door.keypad.crackattempts = door.keypad.crackattempts + 1
              end
            end
          end
        Wait(1)
        end
      else
        drawTxt('||||||||| ~r~CRACKING IN PROGRESS~w~ |||||||||',4,1,0.5,0.30,0.6,255,255,255,255)
        drawTxt('~b~'..tostring(rem - current_time)..'~w~s remaining!',4,1,0.5,0.35,0.6,255,255,255,255)
      end
    end
    for k, door in pairs(bankdoors) do
      if GetDistanceBetweenCoords(door.x, door.y, door.z, GetEntityCoords(PlayerPedId()), true) < 40 then
        if GetDistanceBetweenCoords(door.vault.x, door.vault.y, door.vault.z, GetEntityCoords(PlayerPedId()), true) < 10 and door.unlocked then
          DrawMarker(1,door.vault.x, door.vault.y, door.vault.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
          if GetDistanceBetweenCoords(door.vault.x, door.vault.y, door.vault.z, GetEntityCoords(PlayerPedId()), true) < 2 then
            if door.vault.robbed == false then
              SetTextComponentFormat("STRING")
            	AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~rob~w~ the vault")
            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
              if IsControlJustPressed(0,38) then
				if exports['fsn_inventory']:fsn_HasItem('drill') then
					if exports['fsn_inventory']:fsn_HasItem('modified_drillbit') then
						TriggerServerEvent('fsn_bankrobbery:payout', k, exports['fsn_inventory']:fsn_HasItem('modified_drillbit'))
					else
						if math.random(1,100) > 50 then
							TriggerEvent('fsn_inventory:item:take', 'drill', 1)
							TriggerEvent('chatMessage', 'FSN', {255,0,0}, 'The vault destroyed your drillbit and broke the drill, consider getting a modified drillbit!')
							TriggerEvent('chatMessage', 'FSN', {255,0,0}, 'You didn\'t get far enough into the vault to get any money!')
						else
							TriggerEvent('fsn_inventory:item:take', 'drill', 1)
							TriggerEvent('chatMessage', 'FSN', {255,0,0}, 'The vault destroyed your drillbit and broke the drill, consider getting a modified drillbit!')
							TriggerServerEvent('fsn_bankrobbery:payout', k, exports['fsn_inventory']:fsn_HasItem('modified_drillbit'))
						end
					end
					door.vault.robbed = true
				else
					TriggerEvent('fsn_notify:displayNotification', 'You don\'t have anything to open the vault with...', 'centerLeft', 5000, 'error')
				end
              end
            else
              SetTextComponentFormat("STRING")
            	AddTextComponentString("~r~You already emptied the vault")
            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            end
          end
        end
        local _door = GetClosestObjectOfType(door.x, door.y, door.z, 1.0, door.hash, false, false, false)
        local CurrentHeading = GetEntityHeading(_door)
        if door.status.status == 'closed' then
          if CurrentHeading ~= door.status.closedh then
            SetEntityHeading(_door, door.status.closedh)
          end
        else
          if CurrentHeading ~= door.status.openh then
            SetEntityHeading(_door, door.status.openh)
          end
        end
      else
        if door.unlocked then
          door.unlocked = false
          door.keypad.crackattempts = 0
          door.keypad.code = 0
          TriggerEvent('fsn_notify:displayNotification', 'You no longer have access to the vault!', 'centerRight', 5000, 'error')
          TriggerServerEvent('fsn_bankrobbery:vault:close', k)
        end
      end
      if GetDistanceBetweenCoords(door.x, door.y, door.z, GetEntityCoords(PlayerPedId()), true) < 10 then
        local _door = GetClosestObjectOfType(door.x, door.y, door.z, 1.0, door.hash, false, false, false)
        local CurrentHeading = GetEntityHeading(_door)
        if door.unlocked == true or exports.fsn_police:fsn_PDDuty() then
          --[[
          fsn_drawText3D(door.tx,door.ty,door.tz+0.5, '~y~Hold [UP ARROW] to open door\nDEBUG: '..CurrentHeading)
          if IsControlPressed(1,27) then
            SetEntityHeading(_door, round(CurrentHeading, 1) -  0.4)
  					CurrentHeading = GetEntityHeading(_door)
          end
          ]]
          if GetDistanceBetweenCoords(door.x, door.y, door.z, GetEntityCoords(PlayerPedId()), true) < 2 then
            if door.status.status == 'open' then
              fsn_drawText3D(door.tx,door.ty,door.tz, 'Press [E] to ~r~close~w~ the vault!')
              if IsControlJustPressed(1,51) then
                TriggerServerEvent('fsn_bankrobbery:vault:close', k)
              end
            else
              fsn_drawText3D(door.tx,door.ty,door.tz, 'Press [E] to ~g~open~w~ the vault!')
              if IsControlJustPressed(1,51) then
                TriggerServerEvent('fsn_bankrobbery:vault:open', k)
              end
            end
          end
        else
          if GetDistanceBetweenCoords(door.keypad.x, door.keypad.y, door.keypad.z, GetEntityCoords(PlayerPedId()), true) < 0.5 then
            if exports['fsn_police']:fsn_getCopAmt() >= 3 then
				if not canrob then
					SetTextComponentFormat("STRING")
				  AddTextComponentString("~r~A bank has been robbed too recently")
				  DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				else
              if not cracking then
                SetTextComponentFormat("STRING")
                AddTextComponentString("Press ~INPUT_PICKUP~ to input a code\nPress ~INPUT_LOOK_BEHIND~ to begin cracking")
                DisplayHelpTextFromStringLabel(0, 0, 1, -1)
              end
              if IsControlJustPressed(1,51) and not cracking then
                ---------------------------------------------------
                if door.keypad.crackattempts == 0 then
                  local code = ''
                  for i=1,door.keypad.difficulty do
                    code = code..tostring(math.random(0,9))
                  end
                  door.keypad.code = code
                end
                ---------------------------------------------------
                --print(door.keypad.code)
                door.keypad.crackattempts = door.keypad.crackattempts + 1
                DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", door.keypad.difficulty)
                local editOpen = true
          			while UpdateOnscreenKeyboard() == 0 or editOpen do
                  drawTxt('Input a ~b~'..door.keypad.difficulty..'~w~ digit code:',4,1,0.5,0.30,0.6,255,255,255,255)
          				if UpdateOnscreenKeyboard() ~= 0 then
          					editOpen = false
                    if UpdateOnscreenKeyboard() == 1 then
                      codeinput = tostring(GetOnscreenKeyboardResult())
                      if codeinput == door.keypad.code then
                        resultDisplay(true)
                        door.unlocked = true
                      else
                        resultDisplay(false)
                        if door.keypad.crackattempts > 3 then
                          local pos = GetEntityCoords(PlayerPedId())
                          local coords = {
                            x = pos.x,
                            y = pos.y,
                            z = pos.z
                          }
                          TriggerServerEvent('fsn_police:dispatch', coords, 7)
                        end
                        DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", door.keypad.difficulty)
                        editOpen = true
                        door.keypad.crackattempts = door.keypad.crackattempts + 1
                      end
                    end
          				end
          			Wait(1)
          	    end
              end
              if IsControlJustPressed(1, 26) and not cracking then
          			local pos = GetEntityCoords(PlayerPedId())
          			local coords = {
          				x = pos.x,
          				y = pos.y,
          				z = pos.z
          			}
          			TriggerServerEvent('fsn_police:dispatch', coords, 7)
					TriggerServerEvent('fsn_bankrobbery:start')
                while not HasAnimDictLoaded('mp_heists@keypad@') do
                  RequestAnimDict('mp_heists@keypad@')
                  Citizen.Wait(5)
                end
                RequestAnimSet( "move_ped_crouched" )
                while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do
                    Citizen.Wait( 100 )
                end
                SetPedMovementClipset( PlayerPedId(), "move_ped_crouched", 0.25 )
                FreezeEntityPosition(PlayerPedId(), true)
                TaskPlayAnim(PlayerPedId(), 'mp_heists@keypad@', 'enter', 8.0, 1.0, -1, 0, 1.0, 0, 0, 0)
                Citizen.Wait(1)
                TaskPlayAnim(PlayerPedId(), 'mp_heists@keypad@', 'idle_a', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
                start_time = current_time
                cracking_id = k
                cracking = true
				TriggerServerEvent('fsn_bankrobbery:start')
              end
			  end
            else
              SetTextComponentFormat("STRING")
              AddTextComponentString("~r~Not enough cops for a heist ("..exports['fsn_police']:fsn_getCopAmt().."/3)")
              DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            end
          else
            if door.keypad.code ~= 0 then
              TriggerEvent('fsn_notify:displayNotification', 'You walked away therefor the bank has reset the code!', 'centerLeft', 5000, 'error')
              door.keypad.crackattempts = 0
              door.keypad.code = 0
            end
            if cracking then
              TriggerEvent('fsn_notify:displayNotification', 'Keypad cracking failed', 'centerLeft', 5000, 'error')
              cracking = false
              start_time = 0
            end
          end
        end
      end
    end
  end
end)
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    current_time = current_time + 1
  end
end)


----------------------------------------------- DRILL ROBBERY
--{x = 20.005674362183, y = -1772.4578857422, z = 29.547077178955, h = 189.60456848145}
--{x = 2701.7890625, y = 3454.84375, z = 55.907398223877, h = 294.06103515625}


-----------------------
-- LostMC Robbery
-----------------------
local safe = {x = 977.23968505859, y = -104.10308074951, z = 74.845184326172}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetDistanceBetweenCoords(safe.x, safe.y, safe.z, GetEntityCoords(PlayerPedId())) < 2 then
			SetTextComponentFormat("STRING")
            AddTextComponentString("HINT: Use your lockpick")
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
		end 
	end
end)

local LostMC = {x = 968.58111572266, y = -124.5368347168, z = 74.353042602539}
local LostMCSpawns = {
	{x = 983.84216308594, y = -125.27745056152, z = 73.956123352051},
	{x = 988.02655029297, y = -102.91876220703, z = 74.848731994629},
	{x = 970.61346435547, y = -112.27017211914, z = 74.353126525879},
	{x = 965.49530029297, y = -116.83283996582, z = 74.353126525879},
	{x = 959.42755126953, y = -120.9056930542, z = 74.963409423828},
	{x = 981.80786132813, y = -142.21360778809, z = 74.235298156738}
}
local LostMCModels = {1330042375,1032073858,850468060,-96953009}
local start = 0
RegisterNetEvent('fsn_bankrobbery:LostMC:spawn')
AddEventHandler('fsn_bankrobbery:LostMC:spawn', function()
	--[[ bye bye mc spawns
	local mypeds = {}
	for k, v in pairs(LostMCSpawns) do
		local mdl = LostMCModels[math.random(1, #LostMCModels)]
		print('making mdl: '..mdl)
		RequestModel(mdl)
		while not HasModelLoaded(mdl) do
			Wait(1)
			RequestModel(mdl)
		end
		local ped = CreatePed(4, mdl, v.x, v.y, v.z+1, true, true)
		table.insert(mypeds, #mypeds+1, ped)
		GiveWeaponToPed(ped, "WEAPON_PISTOL", 200, false, true)
		TaskCombatPed(ped, PlayerPedId(), 0, 16)
		SetPedCombatRange(ped, 2)
		SetPedCombatMovement(ped, 2)
	end
	for k, v in pairs(LostMCSpawns) do
		local mdl = LostMCModels[math.random(1, #LostMCModels)]
		print('making mdl: '..mdl)
		RequestModel(mdl)
		while not HasModelLoaded(mdl) do
			Wait(1)
			RequestModel(mdl)
		end
		local ped = CreatePed(4, mdl, v.x, v.y, v.z+1, true, true)	
		table.insert(mypeds, #mypeds+1, ped)
		GiveWeaponToPed(ped, "WEAPON_PISTOL", 200, false, true)
		TaskCombatPed(ped, PlayerPedId(), 0, 16)
		SetPedCombatRange(ped, 2)
		SetPedCombatMovement(ped, 2)
		SetCanAttackFriendly(ped, false, false)
		SetPedCanBeTargettedByTeam(ped, false, false)
	end
	start = current_time
	while true do
		Citizen.Wait(0)
		local ped = exports["fsn_entfinder"]:getPedNearCoords(LostMC.x, LostMC.y, LostMC.z, 100)
		ClearPedTasksImmediately(ped)
		TaskCombatPed(ped, PlayerPedId(), 0, 16)
		local maff = start + 30
		if maff < current_time then
			for k, v in pairs(mypeds) do
				DeleteEntity(v)		
			end
			break
		end
	end
	]]--
end)

-----------------------
-- Hardware Robbery
-----------------------
local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end

    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)

    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next

    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end
function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

local hardware_loc = {x = 2701.7890625, y = 3454.84375, z = 55.907398223877, h = 294.06103515625}
local exploded_truck = false
local truck = 'mule3'
local lockpicked = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetDistanceBetweenCoords(hardware_loc.x, hardware_loc.y, hardware_loc.z, GetEntityCoords(PlayerPedId())) < 50 then
			for obj in EnumerateVehicles() do
				if GetDistanceBetweenCoords(hardware_loc.x, hardware_loc.y, hardware_loc.z, GetEntityCoords(obj)) < 5 then
					if GetEntityModel(obj) == GetHashKey(truck) then
						exploded_truck = obj
					end
				end
			end
			if exploded_truck then
				if DoesEntityExist(exploded_truck) then
					if GetDistanceBetweenCoords(2698.2124023438, 3453.1557617188, 56.79305267334, GetEntityCoords(PlayerPedId())) < 0.5 then
						if not lockpicked then
							SetTextComponentFormat("STRING")
							AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~lockpick~w~ the ~y~truck")
							DisplayHelpTextFromStringLabel(0, 0, 1, -1)
						end
						if IsControlJustPressed(0, 38) then
							while ( not HasAnimDictLoaded( "mini@safe_cracking" ) ) do
								RequestAnimDict( "mini@safe_cracking" )
								Citizen.Wait( 5 )
							end
							TaskPlayAnim(PlayerPedId(), "mini@safe_cracking", "idle_base", 8.0, 1.0, 12000, 2, 0, 0, 1, 1 )
							FreezeEntityPosition(PlayerPedId(), true)
							Citizen.Wait(12000)
							FreezeEntityPosition(PlayerPedId(), false)
							SetVehicleDoorOpen(exploded_truck, 2, false, false)
							SetVehicleDoorOpen(exploded_truck, 3, false, false)
							lockpicked = true
						end
					end
					if GetDistanceBetweenCoords(2701.4072265625, 3454.7998046875, 56.821979522705, GetEntityCoords(PlayerPedId())) < 0.5 and lockpicked then
						SetTextComponentFormat("STRING")
						AddTextComponentString("Press ~INPUT_PICKUP~ to pickup the drill")
						DisplayHelpTextFromStringLabel(0, 0, 1, -1)
						if IsControlJustPressed(0, 38) then
							while not HasAnimDictLoaded('pickup_object') do
								RequestAnimDict('pickup_object')
								Citizen.Wait(5)
							end
							TaskPlayAnim(PlayerPedId(), 'pickup_object', 'pickup_low', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
							DeleteObject(obj)
							Citizen.Wait(1000)
							ClearPedTasks(PlayerPedId())
							TriggerEvent('fsn_inventory:item:add', 'drill', 1)
						end
					end
				else
					exploded_truck = false
				end
			else
				Citizen.Wait(500)
				RequestModel(GetHashKey(truck))
				while not HasModelLoaded(GetHashKey(truck)) do
					Wait(1)
					RequestModel(GetHashKey(truck))
				end
				exploded_truck = CreateVehicle(GetHashKey(truck), hardware_loc.x, hardware_loc.y, hardware_loc.z, true, true)
				lockpicked = false
				SetEntityHeading(exploded_truck, hardware_loc.h)
				--SetVehicleDoorOpen(exploded_truck, 2, false, false)
				--SetVehicleDoorOpen(exploded_truck, 3, false, false)
				SetVehicleBodyHealth(exploded_truck, 200)
				SetEntityMaxSpeed(exploded_truck, 0.0)
				
				while not HasModelLoaded(-617072343) do
					Wait(1)
					RequestModel(-617072343)
				end
				local vehc = GetEntityCoords(exploded_truck)
				obj = CreateObject(-617072343, vehc["x"],vehc["y"],vehc["z"], 1, 0, 0)
				--SetEntityCoords(saw, 2702.9184570313, 3454.943359375, 56.904981231689, 1, 0, 0, 1)
				--PlaceObjectOnGroundProperly(saw)
				
				local vehc = GetEntityCoords(exploded_truck)
				--local obj = CreateObject(GetHashKey("prop_cs_cardbox_01"),vehc["x"],vehc["y"],vehc["z"], 1, 0, 0)

				local x = math.random(10) / 10
				if math.random(100) > 50 then
					x = x - x - x
				end

				local y = math.random(10) / 10
				if math.random(100) > 50 then
					y = y - y - y
				end

				AttachEntityToEntity(obj, exploded_truck, GetEntityBoneIndexByName(exploded_truck, 'bodyshell'), x, y, 0.2, 0, 0, 0, 1, 1, 0, 1, 0, 1)
			end
		end
	end
end)
-----------------------
-- Timer, I really need to confine all these to 1 in fsn_main - todo
-----------------------
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    current_time = current_time + 1
  end
end)
