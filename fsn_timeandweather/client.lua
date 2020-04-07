CurrentWeather = 'EXTRASUNNY'
local lastWeather = CurrentWeather
local baseTime = 0
local timeOffset = 0
local timer = 0
local freezeTime = false
local blackout = false

RegisterNetEvent('fsn_timeandweather:updateWeather')
AddEventHandler('fsn_timeandweather:updateWeather', function(NewWeather, newblackout)
    CurrentWeather = 'EXTRASUNNY'
    blackout = newblackout
end)
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		SetWeatherTypeNow('EXTRASUNNY')
	end
end)
--[[
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
        if lastWeather ~= CurrentWeather then
            lastWeather = 'EXTRASUNNY'
            SetWeatherTypeOverTime('EXTRASUNNY', 15.0)
            Citizen.Wait(15000)
        end
        Citizen.Wait(100000) -- Wait 0 seconds to prevent crashing.
        SetBlackout(blackout)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist('EXTRASUNNY')
        SetWeatherTypeNow('EXTRASUNNY')
        SetWeatherTypeNowPersist('EXTRASUNNY')
    end
end)
]]

RegisterNetEvent('fsn_timeandweather:updateTime')
AddEventHandler('fsn_timeandweather:updateTime', function(base, offset, freeze)
    freezeTime = freeze
    timeOffset = offset
    baseTime = base
end)

Citizen.CreateThread(function()
    local hour = 0
    local minute = 0
	function getTime()
		return {hour, minute}
	end
    while true do
        Citizen.Wait(0)
        local newBaseTime = baseTime
        if GetGameTimer() - 500  > timer then
            newBaseTime = newBaseTime + 0.25
            timer = GetGameTimer()
        end
        if freezeTime then
            timeOffset = timeOffset + baseTime - newBaseTime
        end
        baseTime = newBaseTime
        hour = math.floor(((baseTime+timeOffset)/60)%24)
        minute = math.floor((baseTime+timeOffset)%60)
        NetworkOverrideClockTime(hour, minute, 0)
    end
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('fsn_timeandweather:requestSync')
end)

-- Display a notification above the minimap.
function ShowNotification(text, blink)
    if blink == nil then blink = false end
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(blink, false)
end

RegisterNetEvent('fsn_timeandweather:notify')
AddEventHandler('fsn_timeandweather:notify', function(message, blink)
    ShowNotification(message, blink)
end)CurrentWeather = 'EXTRASUNNY'
local lastWeather = CurrentWeather
local baseTime = 0
local timeOffset = 0
local timer = 0
local freezeTime = false
local blackout = false

RegisterNetEvent('fsn_timeandweather:updateWeather')
AddEventHandler('fsn_timeandweather:updateWeather', function(NewWeather, newblackout)
    CurrentWeather = NewWeather
    blackout = newblackout
end)

Citizen.CreateThread(function()
    while true do
        if lastWeather ~= CurrentWeather then
            lastWeather = CurrentWeather
            SetWeatherTypeOverTime(CurrentWeather, 15.0)
            Citizen.Wait(15000)
        end
        Citizen.Wait(100) -- Wait 0 seconds to prevent crashing.
        SetBlackout(blackout)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist(lastWeather)
        SetWeatherTypeNow(lastWeather)
        SetWeatherTypeNowPersist(lastWeather)
        if lastWeather == 'XMAS' then
            SetForceVehicleTrails(true)
            SetForcePedFootstepsTracks(true)
        else
            SetForceVehicleTrails(false)
            SetForcePedFootstepsTracks(false)
        end
    end
end)

RegisterNetEvent('fsn_timeandweather:updateTime')
AddEventHandler('fsn_timeandweather:updateTime', function(base, offset, freeze)
    freezeTime = freeze
    timeOffset = offset
    baseTime = base
end)

Citizen.CreateThread(function()
    local hour = 0
    local minute = 0
    while true do
        Citizen.Wait(0)
        local newBaseTime = baseTime
        if GetGameTimer() - 500  > timer then
            newBaseTime = newBaseTime + 0.25
            timer = GetGameTimer()
        end
        if freezeTime then
            timeOffset = timeOffset + baseTime - newBaseTime
        end
        baseTime = newBaseTime
        hour = math.floor(((baseTime+timeOffset)/60)%24)
        minute = math.floor((baseTime+timeOffset)%60)
        NetworkOverrideClockTime(hour, minute, 0)
    end
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('fsn_timeandweather:requestSync')
end)

-- Display a notification above the minimap.
function ShowNotification(text, blink)
end

RegisterNetEvent('fsn_timeandweather:notify')
AddEventHandler('fsn_timeandweather:notify', function(message, blink)
    ShowNotification(message, blink)
end)
