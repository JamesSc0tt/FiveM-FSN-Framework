


Citizen.CreateThread(function()
    local bufferD = 0
    local isInDriverSeat = false
    while true do Citizen.Wait(1)
        local currentPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))
        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId() then
            isInDriverSeat = true
        else
            isInDriverSeat = false
        end
        --ensure player is in the driver's seat, and that the engine is running.
        --only works when speed is over zero.
        if isInDriverSeat then
            --make sure mileage is only calculated when engine is running.
            if GetIsVehicleEngineRunning(GetVehiclePedIsIn(PlayerPedId(), false)) then
                if Speed > 0.5 then --Speed is from carhud.lua
                    local timeA = GetGameTimer() -- save current time
                    Wait(1000) --wait one second
                    local timeB = GetGameTimer() -- get time after delay
                    local timeAB = timeB - timeA
                    distanceTraveled = ((Speed*0.000278)*timeAB)/1000 -- distance = ((speed converted to seconds) * time difference) / divided by 1000 to normalize
                    if distanceTraveled < 1 then -- prevents issue with sudden vehicle stops causing huge precision errors
                        bufferD = bufferD + distanceTraveled --adds to the buffer
                        if bufferD >= 1 then --auto save mileage every 1 mile/km
                            print('Updating mileage with current plate:',currentPlate)
                            TriggerServerEvent('fsn_odometer:addMileage',currentPlate,bufferD)
                            bufferD = 0
                        end
                        --print('mileage in buffer',bufferD)
                    end
                end
            end
        elseif ((not isInDriverSeat) and (bufferD >= 0.01)) then --trigger mileage update when leaving the driver's seat
            local currentPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), true))
            print('driver left seat - adding mileage to the vehicle',currentPlate)
            TriggerServerEvent('fsn_odometer:addMileage',currentPlate,bufferD)
            bufferD = 0
        end
    end
end)