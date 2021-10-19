local positions = {
  [1] = {
    pos = {x = 112.29388427734, y = -1305.138671875, z = 29.269525527954},
    campos = {x = 113.06817626953, y = -1306.037109375, z = 29.718551635742, h = 34.424774169922},
    sitpos = {x = 112.76410675049, y = -1305.7038574219, z = 29.269525527954, h = 21.393161773682},
    dancerpos = {
      front = {x = 112.32679748535, y = -1305.0974121094, z = 29.269533157349, h = 200.47219848633},
      back = {x = 112.40575408936, y = -1305.1303710938, z = 29.269533157349, h = 26.611642837524},
    },
    inuse = false
  }
}
local hookers = {"Stripper01SFY", "Stripper02SFY", "StripperLiteSFY", "Hooker01SFY", "Hooker02SFY", "Hooker03SFY"}
local curbooth = -1
local stripper_cam = false
local stripper = false

RegisterNetEvent('fsn_stripclub:client:update')
AddEventHandler('fsn_stripclub:client:update', function(tbl)
  positions = tbl
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

function StartLapDance(id)
  if positions[id].inuse then
    TriggerEvent('fsn_notify:displayNotification', 'This booth is already in use numnuts', 'centerLeft', 3000, 'error')
  else
    curbooth = id
    TriggerServerEvent('fsn_stripclub:server:claimBooth', id)
    local pos = positions[id]
    SetEntityHeading(PlayerPedId(), pos.sitpos.h)
    SetEntityCoords(PlayerPedId(), pos.sitpos.x, pos.sitpos.y, pos.sitpos.z, true, true, true, false)
    TriggerEvent('fsn_emotecontrol:play', 'anim', 'switch@michael@sitting', 'idle')

    local mdl = -1360365899
    RequestModel(mdl)
    while not HasModelLoaded(mdl) do
        Citizen.Wait(1)
        RequestModel(mdl)
        print('loading model')
    end
    stripper = CreatePed(1, mdl, pos.dancerpos.front.x, pos.dancerpos.front.y, pos.dancerpos.front.z, pos.dancerpos.front.h, false, true)

    --stripper_cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    --SetCamCoord(stripper_cam, pos.campos.x, pos.campos.y, pos.campos.z)
    --local currot = GetCamRot(stripper_cam, 2)
    --AttachCamToEntity(stripper_cam, stripper, 0.0,0.0,-1.5, true)
    --RenderScriptCams(1, 0, 0, 1, 1)

    Citizen.Wait(500)
    DoScreenFadeIn(1000)
    FreezeEntityPosition(PlayerPedId(), true)
  end
end
DoScreenFadeIn(1000)
Citizen.CreateThread(function()
  local bleep = AddBlipForCoord(115.66896057129, -1296.7384033203, 29.269014358521)
  SetBlipSprite(bleep, 121)
  SetBlipScale(bleep, 0.8)
  SetBlipAsShortRange(bleep, true)
  BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Strip Club")
  EndTextCommandSetBlipName(bleep)
  while true do
    Citizen.Wait(0)
    if curbooth > 0 then
      local boof = positions[curbooth]
      local currot = GetCamRot(stripper_cam, 2)
      drawTxt('CamRot:\nX: '..currot.x..'\nY: '..currot.y..'\nZ: '..currot.z,4,0,20,20,0.6,255,255,255,255)

    else
      for k, v in pairs(positions) do
        if GetDistanceBetweenCoords(v.pos.x, v.pos.y, v.pos.z, GetEntityCoords(PlayerPedId()), true) < 5 then
          DrawMarker(1,v.pos.x, v.pos.y, v.pos.z-1,0,0,0,0,0,0,1.0, 1.0, 0.5,0,155,255,175,0,0,0,0)
          if GetDistanceBetweenCoords(v.pos.x, v.pos.y, v.pos.z, GetEntityCoords(PlayerPedId()), true) < 1 then
            if v.inuse then
              SetTextComponentFormat("STRING")
              AddTextComponentString("~r~This booth is already in use")
              DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            else
              SetTextComponentFormat("STRING")
              AddTextComponentString("Press ~INPUT_PICKUP~ to hire a stripper (~r~$500~w~)")
              DisplayHelpTextFromStringLabel(0, 0, 1, -1)
              if IsControlJustPressed(0, 51) then
                DoScreenFadeOut(1)
                StartLapDance(k)
              end
            end
          end
        end
      end
    end
  end
end)
