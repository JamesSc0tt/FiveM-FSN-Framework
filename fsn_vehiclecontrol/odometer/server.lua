RegisterServerEvent('fsn_odometer:getMileage')
AddEventHandler('fsn_odometer:getMileage', function(plate)
    MySQL.ready(function()
        MySQL.Async.fetchScalar('SELECT `odometer` FROM `fsn_vehicles` WHERE `veh_plate` = @plate', { ['@plate'] = plate, }, function(result) 
            --print(json.encode(result))
        end)
    end)
end)

RegisterServerEvent('fsn_odometer:addMileage')
AddEventHandler('fsn_odometer:addMileage', function(plate, mileage)
    MySQL.ready(function()
        MySQL.Async.insert('UPDATE `fsn_vehicles` SET `odometer` = odometer + @mileage WHERE `veh_plate` = @plate', { ['@plate'] = plate, ['@mileage'] = mileage, },
        function(success) end)
    end)
end)

RegisterServerEvent('fsn_odometer:setMileage')
AddEventHandler('fsn_odometer:setMileage', function(plate, mileage)
    MySQL.ready(function()
        MySQL.Async.insert('UPDATE `fsn_vehicles` SET `odometer` = @mileage WHERE `veh_plate` = @plate', { ['@plate'] = plate, ['@mileage'] = mileage, },
        function(success) end)
    end)
end)

RegisterServerEvent('fsn_odometer:resetMileage')
AddEventHandler('fsn_odometer:resetMileage', function(plate)
    local mileage = 0
    TriggerEvent('fsn_odometer:setMileage',plate,mileage)
end)