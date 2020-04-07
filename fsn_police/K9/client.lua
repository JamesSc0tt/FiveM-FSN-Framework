local K9; local Toggle = false; local Sitting = false

RegisterNetEvent('fsn_police:ToggleK9')
AddEventHandler('fsn_police:ToggleK9', function(Model)
    if Toggle then
        if DoesEntityExist(K9) then
            SetEntityAsMissionEntity(K9, true, true)
            DeleteEntity(K9)
            Toggle = false
        end
        Toggle = false
    else
        Model = GetHashKey(Model)
        RequestModel(Model)
        while not HasModelLoaded(Model) do
            Citizen.Wait(50)
            RequestModel(Model)
        end

        local SpawnCoordinates = GetEntityCoords(PlayerPedId())
        K9 = CreatePed(28, Model, SpawnCoordinates.x, SpawnCoordinates.y, SpawnCoordinates.z, GetEntityHeading(PlayerPedId()), 1, 1)
        SetBlockingOfNonTemporaryEvents(K9)
        SetPedFleeAttributes(K9, 0, 0)
        SetPedRelationshipGroupHash(K9, GetHashKey('K9'))
        SetPedRelationshipGroupHash(PlayerPedId(), GetHashKey('Player'))
        SetRelationshipBetweenGroups(0, GetHashKey('K9'), GetHashKey('Player'))
        SetRelationshipBetweenGroups(0, GetHashKey('Player'), GetHashKey('K9'))
        TaskFollowToOffsetOfEntity(K9, PlayerPedId(), 0.5, 0.0, 0.0, 5.0, -1, 1.0, 1)
        SetPedKeepTask(K9, true)
        Toggle = true
    end
end)

RegisterNetEvent('fsn_police:Sit')
AddEventHandler('fsn_police:Sit', function()
    if Sitting then
        ClearPedTasksImmediately(K9)
        TaskFollowToOffsetOfEntity(K9, PlayerPedId(), 0.5, 0.0, 0.0, 5.0, -1, 1.0, 1)
        SetPedKeepTask(K9, true)
        Sitting = false
    else
        RequestAnimDict('creatures@rottweiler@amb@world_dog_sitting@idle_a')
        while not HasAnimDictLoaded('creatures@rottweiler@amb@world_dog_sitting@idle_a') do
            Citizen.Wait(50)
        end

        TaskPlayAnim(K9, 'creatures@rottweiler@amb@world_dog_sitting@idle_a', 'idle_b', 8.0, -8.0, -1, 2, 0.0, 0, 0, 0)
        Sitting = true
    end
end)

RegisterNetEvent('fsn_police:GetInVehicle')
AddEventHandler('fsn_police:GetInVehicle', function()
    if IsPedInAnyVehicle(K9, true) then
        TaskLeaveVehicle(K9, GetVehiclePedIsIn(K9, false), 256)
        TaskFollowToOffsetOfEntity(K9, PlayerPedId(), 0.5, 0.0, 0.0, 5.0, -1, 1.0, 1)
        SetPedKeepTask(K9, true)
    else
        local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(Vehicle) then
            TaskEnterVehicle(K9, Vehicle, 5000, 1, 2.0, 1, 0)
        end
    end
end)

RegisterNetEvent('fsn_police:k9:search:person:me')
AddEventHandler('fsn_police:k9:search:person:me', function(OfficerId)
    local Drugs = fsn_getIllegalItems()
    local Found = false
    for Key, Value in pairs(Drugs) do
        if exports['fsn_inventory']:fsn_HasItem(Value) then
            Found = true
        end
    end
    TriggerServerEvent('fsn_police:k9:search:person:end', Found, OfficerId)
end)

RegisterNetEvent('fsn_police:k9:search:person:finish')
AddEventHandler('fsn_police:k9:search:person:finish', function(Found)
    if Found then
        RequestAnimDict('creatures@rottweiler@amb@sleep_in_kennel@')
        while not HasAnimDictLoaded('creatures@rottweiler@amb@sleep_in_kennel@') do
            Citizen.Wait(50)
        end

        TaskPlayAnim(K9, 'creatures@rottweiler@amb@sleep_in_kennel@', 'sleep_in_kennel', 8.0, -8.0, -1, 2, 0.0, 0, 0, 0)
        TriggerEvent('fsn_notify:displayNotification', 'Your dog has detected an illegal substance', 'centerLeft', 2000, 'error')
        Citizen.Wait(2000)
        ClearPedTasksImmediately(K9)
        TaskFollowToOffsetOfEntity(K9, PlayerPedId(), 0.5, 0.0, 0.0, 5.0, -1, 1.0, 1)
        SetPedKeepTask(K9, true)
    else
        TriggerEvent('fsn_notify:displayNotification', 'Your dog did not detect anything', 'centerLeft', 2000, 'success')
    end
end)

AddRelationshipGroup('K9')
AddRelationshipGroup('Player')
