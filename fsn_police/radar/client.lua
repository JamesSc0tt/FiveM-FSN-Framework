local radarEnabled = false
local freezeRadar = false
local front = ''
local rear = ''

RegisterNetEvent('fsn_police:radar:toggle')
AddEventHandler('fsn_police:radar:toggle', function()
  if pdonduty then
    radarEnabled = not radarEnabled
  else
    TriggerEvent('chatMessage', '', {255,255,255}, '^8^*:FSN:^r^0 You are not signed in as a police officer.')
  end
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
function formatSpeed(spd)
  if spd < 45 then
    return '~g~'..math.floor(spd)
  elseif spd < 80 then
    return '~o~'..math.floor(spd)
  else
    return '~r~'..math.floor(spd)
  end
end
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if radarEnabled and pdonduty and IsPedInAnyVehicle(PlayerPedId()) then
      if IsControlJustPressed(1, 135) then
        freezeRadar = not freezeRadar
      end
      -- I stole this from github lol
      -- https://github.com/Abreezy70/BrockALPR/blob/master/BrockALPR/speed.lua
      local veh = GetVehiclePedIsIn(PlayerPedId(), false)
			local coordA = GetOffsetFromEntityInWorldCoords(veh, 0.0, 1.0, 1.0)
			local coordB = GetOffsetFromEntityInWorldCoords(veh, 0.0, 105.0, 0.0)
			local frontcar = StartShapeTestCapsule(coordA, coordB, 3.0, 10, veh, 7)
			local a, b, c, d, e = GetShapeTestResult(frontcar)

      local bcoordB = GetOffsetFromEntityInWorldCoords(veh, 0.0, -105.0, 0.0)
			local rearcar = StartShapeTestCapsule(coordA, bcoordB, 3.0, 10, veh, 7)
			local f, g, h, i, j = GetShapeTestResult(rearcar)



      if not freezeRadar then
        if IsEntityAVehicle(e) then
          local fmodel = GetDisplayNameFromVehicleModel(GetEntityModel(e))
  				local fvspeed = GetEntitySpeed(e)*2.236936
  				local fplate = GetVehicleNumberPlateText(e)
          front = 'Plate: ~b~'..fplate..'~w~ | Model: ~b~'..fmodel..'~w~ | Speed: '..formatSpeed(fvspeed)
        end

        if IsEntityAVehicle(j) then
          local bmodel = GetDisplayNameFromVehicleModel(GetEntityModel(j))
  				local bvspeed = GetEntitySpeed(j)*2.236936
  				local bplate = GetVehicleNumberPlateText(j)
          rear = 'Plate: ~b~'..bplate..'~w~ | Model: ~b~'..bmodel..'~w~ | Speed: '..formatSpeed(bvspeed)
        end
      end
      --drawTxt(text,font,centre,x,y,scale,r,g,b,a)
      drawTxt('Radar:',4,0,0.003,0.38,0.5,255,255,255,255)
      drawTxt('Front | '..front,4,0,0.003,0.41,0.4,255,255,255,255)
      drawTxt('Rear  | '..rear,4,0,0.003,0.434,0.4,255,255,255,255)
      local ass = 'loading'
      if freezeRadar then
        ass = '~r~LOCKED'
      else
        ass = '~g~UNLOCKED'
      end
      drawTxt(ass,4,0,0.003,0.459,0.3,255,255,255,255)
    end
  end
end)
