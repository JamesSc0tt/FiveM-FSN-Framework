RegisterNetEvent('AnimSet:default');
AddEventHandler('AnimSet:default', function()
    ResetPedMovementClipset(PlayerPedId(), 0)
    AnimSet = "default";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Hurry');
AddEventHandler('AnimSet:Hurry', function()
    RequestAnimSet("move_m@hurry@a")
    while not HasAnimSetLoaded("move_m@hurry@a") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@hurry@a", true)
    AnimSet = "move_m@hurry@a";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Business');
AddEventHandler('AnimSet:Business', function()
    RequestAnimSet("move_m@business@a")
    while not HasAnimSetLoaded("move_m@business@a") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@business@a", true)
    AnimSet = "move_m@business@a";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Brave');
AddEventHandler('AnimSet:Brave', function()
    RequestAnimSet("move_m@brave")
    while not HasAnimSetLoaded("move_m@brave") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@brave", true)
    AnimSet = "move_m@brave";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Tipsy');
AddEventHandler('AnimSet:Tipsy', function()
    RequestAnimSet("move_m@drunk@slightlydrunk")
    while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@drunk@slightlydrunk", true)
    AnimSet = "move_m@drunk@slightlydrunk";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Injured');
AddEventHandler('AnimSet:Injured', function()
    RequestAnimSet("move_m@injured")
    while not HasAnimSetLoaded("move_m@injured") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@injured", true)
    AnimSet = "move_m@injured";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:ToughGuy');
AddEventHandler('AnimSet:ToughGuy', function()
    RequestAnimSet("move_m@tough_guy@")
    while not HasAnimSetLoaded("move_m@tough_guy@") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@tough_guy@", true)
    AnimSet = "move_m@tough_guy@";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Sassy');
AddEventHandler('AnimSet:Sassy', function()
    RequestAnimSet("move_m@sassy")
    while not HasAnimSetLoaded("move_m@sassy") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@sassy", true)
    AnimSet = "move_m@sassy";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Sad');
AddEventHandler('AnimSet:Sad', function()
    RequestAnimSet("move_m@sad@a")
    while not HasAnimSetLoaded("move_m@sad@a") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@sad@a", true)
    AnimSet = "move_m@sad@a";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Posh');
AddEventHandler('AnimSet:Posh', function()
    RequestAnimSet("move_m@posh@")
    while not HasAnimSetLoaded("move_m@posh@") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@posh@", true)
    AnimSet = "move_m@posh@";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)




RegisterNetEvent('AnimSet:Alien');
AddEventHandler('AnimSet:Alien', function()
    RequestAnimSet("move_m@alien")
    while not HasAnimSetLoaded("move_m@alien") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@alien", true)
    AnimSet = "move_m@alien";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:NonChalant');
AddEventHandler('AnimSet:NonChalant', function()
    RequestAnimSet("move_m@non_chalant")
    while not HasAnimSetLoaded("move_m@non_chalant") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@non_chalant", true)
    AnimSet = "move_m@non_chalant";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)


RegisterNetEvent('AnimSet:Hobo');
AddEventHandler('AnimSet:Hobo', function()
    RequestAnimSet("move_m@hobo@a")
    while not HasAnimSetLoaded("move_m@hobo@a") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@hobo@a", true)
    AnimSet = "move_m@hobo@a";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)




RegisterNetEvent('AnimSet:Money');
AddEventHandler('AnimSet:Money', function()
    RequestAnimSet("move_m@money")
    while not HasAnimSetLoaded("move_m@money") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@money", true)
    AnimSet = "move_m@money";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)


RegisterNetEvent('AnimSet:Swagger');
AddEventHandler('AnimSet:Swagger', function()
    RequestAnimSet("move_m@swagger")
    while not HasAnimSetLoaded("move_m@swagger") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@swagger", true)
    AnimSet = "move_m@swagger";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Joy');
AddEventHandler('AnimSet:Joy', function()
    RequestAnimSet("move_m@joy")
    while not HasAnimSetLoaded("move_m@joy") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@joy", true)
    AnimSet = "move_m@joy";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Moon');
AddEventHandler('AnimSet:Moon', function()
    
    RequestAnimSet("move_m@powerwalk")
    while not HasAnimSetLoaded("move_m@powerwalk") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@powerwalk", true)
    AnimSet = "move_m@powerwalk";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Shady');
AddEventHandler('AnimSet:Shady', function()
    RequestAnimSet("move_m@shadyped@a")
    while not HasAnimSetLoaded("move_m@shadyped@a") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@shadyped@a", true)
    AnimSet = "move_m@shadyped@a";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Tired');
AddEventHandler('AnimSet:Tired', function()
    RequestAnimSet("move_m@tired")
    while not HasAnimSetLoaded("move_m@tired") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_m@tired", true)
    AnimSet = "move_m@tired";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:Sexy');
AddEventHandler('AnimSet:Sexy', function()
    RequestAnimSet("move_f@sexy")
    while not HasAnimSetLoaded("move_f@sexy") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_f@sexy", true)
    AnimSet = "move_f@sexy";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)

RegisterNetEvent('AnimSet:ManEater');
AddEventHandler('AnimSet:ManEater', function()
    RequestAnimSet("move_f@maneater")
    while not HasAnimSetLoaded("move_f@maneater") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_f@maneater", true)
    AnimSet = "move_f@maneater";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)


RegisterNetEvent('AnimSet:ChiChi');
AddEventHandler('AnimSet:ChiChi', function()
    RequestAnimSet("move_f@chichi")
    while not HasAnimSetLoaded("move_f@chichi") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), "move_f@chichi", true)
    AnimSet = "move_f@chichi";
    TriggerServerEvent("police:setAnimData",AnimSet)
end)