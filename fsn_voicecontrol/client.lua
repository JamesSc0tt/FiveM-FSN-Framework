function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

local UI = {
	x =  0.000,
	y = -0.001,
}

local settings = {
  voices = {
    [1] = "WHISPERING",
    [2] = "NORMAL",
    [3] = "SHOUT"
  },
  ranges = {
    [1] = 25.01,
    [2] = 25.01,
    [3] = 25.01
  },
  current = 2
}
NetworkSetVoiceActive(true)
Citizen.CreateThread(function()
  while true do Citizen.Wait(1)
    if NetworkIsPlayerTalking(PlayerId()) then
      drawTxt(UI.x + 0.517, UI.y + 1.434, 1.0,1.0,0.4, settings.voices[settings.current], 66, 220, 244, 255)
    else
      drawTxt(UI.x + 0.517, UI.y + 1.434, 1.0,1.0,0.4, settings.voices[settings.current], 255, 255, 255, 255)
    end
    if IsControlJustPressed(0, 58) then
      if settings.current ~= 3 then
        settings.current = settings.current+1
      else
        settings.current = 1
      end
    end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        NetworkSetTalkerProximity(settings.voices[settings.current])
        NetworkClearVoiceChannel()
        NetworkSetVoiceActive(true)
	end
end)
--[[
    PHONE CALL STUFFS
]]--
local onphone = false
local callwith = 0
local vchannel = 0
local holding = false
local _holding = false
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if onphone then
      if _holding then
        SetTextComponentFormat("STRING")
        AddTextComponentString("Call: "..tostring(callwith).."#"..tostring(vchannel).." // ~r~HOLD~w~ \n~INPUT_SCRIPTED_FLY_ZUP~: end")
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        if IsControlJustPressed(0,11) then
          TriggerServerEvent('fsn_voicecontrol:call:end', callwith)
        end
      elseif holding then
        SetTextComponentFormat("STRING")
        AddTextComponentString("Call: "..tostring(callwith).."#"..tostring(vchannel).." // ~o~HOLD~w~ \n~INPUT_SCRIPTED_FLY_ZUP~ unhold \n~INPUT_SCRIPTED_FLY_ZUP~: end")
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        if IsControlJustPressed(0,10) then
          TriggerServerEvent('fsn_voicecontrol:call:unhold', callwith)
        end
        if IsControlJustPressed(0,11) then
          TriggerServerEvent('fsn_voicecontrol:call:end', callwith)
        end
      else
        SetTextComponentFormat("STRING")
        AddTextComponentString("Call: "..tostring(callwith).."#"..tostring(vchannel).." // ~g~ACTIVE~w~ \n~INPUT_SCRIPTED_FLY_ZUP~ hold \n~INPUT_SCRIPTED_FLY_ZUP~ end")
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        if IsControlJustPressed(0,10) then
          TriggerServerEvent('fsn_voicecontrol:call:hold', callwith)
        end
        if IsControlJustPressed(0,11) then
          TriggerServerEvent('fsn_voicecontrol:call:end', callwith)
        end
      end
    end
  end
end)

RegisterNetEvent('fsn_voicecontrol:call:ring')
AddEventHandler('fsn_voicecontrol:call:ring', function(callfrom)
  local ringing = true
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)

        TriggerServerEvent('fsn_voicecontrol:call:answer', callfrom)
        ringing = false
    end
  end)
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if ringing then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'fsn_phonecall.ogg', 0.4)
        Citizen.Wait(2500)
      else
        break
      end
    end
  end)
end)
