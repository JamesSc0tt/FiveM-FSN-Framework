local armories = {
    {pos = vector3(461.45196533203, -980.94122314453, 30.689605712891), id = 'lspd_armory', busy = false },
    {pos = vector3(1854.7602539063, 3686.6662597656, 34.267070770264), id = 'bcso_armory', busy = false },
    {pos = vector3(-438.38093896484, 6001.0734375, 31.720390609741), id = 'paleto_armory', busy = false}
}

--[[
    Draw the fuckin markers my guy
]]

Util.Tick(function()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed, true)

    --print(policelevel)

    for k, armory in pairs(armories) do
        local dist = Util.GetVecDist(playerPos, armory.pos.xyz)
        local nearestDist, nearestPos = Util.PositionCheck(playerPos, armory.pos.xyz)
        local distance = 10.0
        local drawDistance = 2.0

        if dist < distance then
           nearestDist, nearestPos = Util.PositionCheck(playerPos, armory.pos.xyz)


            if nearestDist < distance and pdonduty then
                DrawMarker(27, armory.pos.x, armory.pos.y, armory.pos.z-1, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.4001, 255, 255, 255, 175, 0, 0, 0, 0)
                if nearestDist < drawDistance then
                    if not armory.busy then
                        Util.DrawText3D(armory.pos.x, armory.pos.y, armory.pos.z, '[E] Armory', false)
                        if IsControlJustReleased(0, Util.GetKeyNumber('E')) then
                            --print(armory.id)
                            TriggerServerEvent('fsn_police:armory:request', armory.id, policelevel)
                        end
                    else
                        Utils.DrawText3D(armory.pos.x, armory.pos.y, armory.pos.z, '~r~Armory in use.\nPlease try again later.', false)
                    end
                end
            end

        end
    end
end)

--[[
    Trigger that sexy ass inventory
]]

RegisterNetEvent('fsn_police:armory:request')
AddEventHandler('fsn_police:armory:request', function (armory_id)
    TriggerServerEvent('fsn_police:armory:request', armory_id, policelevel)
end)
