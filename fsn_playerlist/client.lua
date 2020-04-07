local ignorePlayerNameDistance = false
local disPlayerNames = 15

current_characters = {}
RegisterNetEvent('fsn_main:updateCharacters')
AddEventHandler('fsn_main:updateCharacters', function(tbl)
  current_characters = tbl
end)

function fsn_drawPlayerId(x,y,z, text, talking) -- some useful function, use it if you want!
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        if talking then
          SetTextColour(0, 0, 255, 255)
        end
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local isPlayerMenuActive = false
current_characters = {}
RegisterNetEvent('fsn_main:updateCharacters')
AddEventHandler('fsn_main:updateCharacters', function(tbl)
  current_characters = tbl
end)

function fsn_displayPlayerMenu()
  local players = {}
  for _, i in ipairs(GetActivePlayers()) do --for i=0,49 do
    if NetworkIsPlayerActive(i) then
      local idee = 0
      for k, v in pairs(current_characters) do
        if GetPlayerServerId(i) == v.ply_id then
          idee = k
        end
      end
      if GetPlayerPed(i) then
        local character = current_characters[idee]
        if character then
          table.insert(players, #players+1, {
            ply_id = character.ply_id,
            ply_name = character.ply_name,
            char_name = character.char_fname..' '..character.char_lname
          })
        end
      end
    end
  end
  --[[
  players = json.encode(players)
  SendNUIMessage({
    enable = true,
    players = players
  })
  ]]
TriggerEvent('chatMessage', '', {255,255,255}, '^1^*NOTICE |^0^r Use "/playerinfo ID" for reporting.')
  --if #players < 2 then
  --  TriggerEvent('chatMessage', '', {255,255,255}, '^8You are alone in the server. You may be instanced. View ^6http://servers.fivem.net/^8 to see if there are other online players.')
  --end
  isPlayerMenuActive = true
end

local function fsn_hidePlayerMenu()
  if isPlayerMenuActive then
    --[[
    SendNUIMessage({
      enable = false
    })
    ]]
    isPlayerMenuActive = false
  end
end

Citizen.CreateThread(function()
  while true do
    for i=0,99 do
      N_0x31698aa80e0223f8(i)
    end
    for _, id in ipairs(GetActivePlayers()) do --for id = 0, 31 do
      if NetworkIsPlayerActive(id) then
        ped = GetPlayerPed(id)
        x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
        x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
        distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
        if ((distance < disPlayerNames)) and IsControlPressed(0,20) then
          if NetworkIsPlayerTalking(id) then
            fsn_drawPlayerId(x2, y2, z2+1, tostring(GetPlayerServerId(id)), true)
          else
            fsn_drawPlayerId(x2, y2, z2+1, tostring(GetPlayerServerId(id)), false)
          end
        end
      end
    end
    Citizen.Wait(0)
    if IsControlJustPressed(0,20) then
      TriggerEvent('chatMessage', '', {255,255,255}, '^1^*NOTICE |^0^r Use "/playerinfo ID" for reporting.')
    --  fsn_displayPlayerMenu()
    --else
    --  fsn_hidePlayerMenu()
    end
  end
end)
