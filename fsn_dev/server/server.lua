--  -------------------
--  BEGIN:       Locals
--  -------------------

local FSN

--  -------------------
--  END:         Locals
--  -------------------

--  -------------------
--  BEGIN:      Threads
--  -------------------

CreateThread(function()

    while not FSN do
        TriggerEvent('fsn:getFsnObject', function(fsnObject)
            FSN = fsnObject
        end)
    end

    Wait(1000)

end)

--  -------------------
--  END:        Threads
--  -------------------

--  -------------------
--  BEGIN:    Functions
--  -------------------

function isDeveloper(source)

    local playerId = source
    local identifiers = GetNumPlayerIdentifiers(playerId)
    local steamId

    for i = 0, identifiers - 1 do
        local id = GetPlayerIdentifier(playerId, i)
        if string.find(id, 'steam:') then
            steamId = id
            break
        end
    end

    local developers = Config.Developers
    local isDeveloper = false

    for i = 1, #Config.Developers do
        if developers[i] == steamId then
            isDeveloper = true
        elseif isDeveloper == false then
            isDeveloper = false
        end
    end

    if isDeveloper then
        return true
    else
        return false
    end

    return false
end

function fsn_GetDeveloperId(source)

    local playerId = source
    local identifier = GetPlayerName(playerId)

    --for i = 1, #identifiers do
        --steamId = identifiers[1]
    --end

    return identifier

end

function registerDeveloperCommands(source)

    -- Start of Developer Commands
    RegisterCommand('tuner', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source

        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('xgc-tuner:openTuner', playerId)

    end)

    RegisterCommand('inv', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source

        if not isDeveloper(playerId) then
            return
        end

        local targetId  = tonumber(args[1])
        local target    = FSN.GetPlayerFromId(targetId)

        if target then
            TriggerClientEvent('fsn_inventory:ply:request', targetId, playerId)
        else
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>That target either does not exist or was entered wrong.</div>',
                args = { }
            })
        end

    end)

    RegisterCommand('softlog', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_main:charMenu', playerId)

    end)

    RegisterCommand('reviveplayer', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local palyerId = source

        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_commands:police:pedrevive', playerId)

    end)

    RegisterCommand('carryplayer', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source 
        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_commands:police:pedcarry', playerId)

    end)

    RegisterCommand('addmoney', function(source, args, rawCommand)

        if source == 0 then
            local targetId = tonumber(args[1])
            local target = FSN.GetPlayerFromId(targetId)
            local amount = tonumber(args[2])

            if target then
                if amount then
                    TriggerClientEvent('fsn_bank:change:walletAdd', source, amount, targetId)
                else
                    print('^8You need to specify and amount.')
                end
            else
                print('^8Target not found. Either they do not exist or were entered wrong.')
            end
        else

            local playerId = source

            if not isDeveloper(playerId) then
                return
            end

            local targetId  = tonumber(args[1])
            local target    = FSN.GetPlayerFromId(targetId)
            local amount    = tonumber(args[2])

            if target then
                if amount then
                    TriggerClientEvent('fsn_bank:change:walletAdd', playerId, amount, targetId)
                else
                    TriggerClientEvent('chat:addMessage', players[j], {
                        template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>You need to specify an amount!</div>',
                        args = { }
                    })
                end
            else
                TriggerClientEvent('chat:addMessage', playerId, {
                    template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>That target either does not exist or was entered wrong.</div>',
                    args = { }
                })
            end
        end

    end)

    RegisterCommand('pdduty', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        local targetId  = tonumber(args[1])
        local target    = FSN.GetPlayerFromId(targetId)

        if target then
            TriggerClientEvent('fsn_police:command:duty', targetId)
        else
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>That target either does not exist or was entered wrong.</div>',
                args = { }
            })
        end

    end)

    RegisterCommand('setinfractions', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        local devName       = fsn_GetDeveloperId(playerId)
        local targetId      = tonumber(args[1])
        local target        = FSN.GetPlayerFromId(targetId)
        local license       = args[2]
        local infractions   = tonumber(args[3])

        if target then
            if license then
                if infractions then
                    TriggerClientEvent('fsn_licenses:setInfractions', targetId, license, infractions)
                    TriggerClientEvent('fsn_notify:displayNotification', targetId, ':FSN: A developer ('..devName..') set your '..license..' license infractions to '..infractions, 'centerLeft', 8000, 'info')
                    TriggerClientEvent('fsn_notify:displayNotification', playerId, ':FSN: You set '..targetId..'\'s '..license..' infractions to '..infractions, 'centerRight', 8000, 'success')
                else
                    TriggerClientEvent('chat:addMessage', playerId, {
                        template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>You need to specify the infraction number.</div>',
                        args = { }
                    })
                end
            else
                TriggerClientEvent('chat:addMessage', playerId, {
                    template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>You need to specify the license type.</div>',
                    args = { }
                })
            end
        else
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>That target either does not exist or was entered wrong.</div>',
                args = { }
            })
        end

    end)

    RegisterCommand('debug', function(source, args, rawCommand)
        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        -- Set up your own debuging code here. I use koil's debug its free on github should be pretty easy to implement

    end)

    RegisterCommand('insidedebug', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_apartments:instance:debug', playerId)

    end)

    RegisterCommand('mdt', function(source, args, rawCommand)
        
        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_police:MDT:toggle', playerId)

    end)

    RegisterCommand('revive', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_ems:reviveMe:force', playerId)

    end)

    RegisterCommand('xyz', function(source, args, rawcommand)
        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_developer:sendXYZ', playerId)

    end)

    RegisterCommand('spawnveh', function(source, args, rawCommand)

        if source == 0 then 
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        local model = args[1]

        if model then
            TriggerClientEvent('fsn_developer:spawnVehicle', playerId, model)
        else
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>That model does not exist or was entered wrong.</div>',
                args = { }
            })
        end

    end)

    RegisterCommand('getkeys', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_developer:getKeys', playerId)

    end)

    RegisterCommand('fixveh', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_developer:fixVehicle', playerId)

    end)

    RegisterCommand('dv', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_developer:deleteVehicle', playerId)

    end)

    RegisterCommand('giveitem', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        local targetId = tonumber(args[1])
        local target = FSN.GetPlayerFromId(targetId)
        local item = tostring(args[2])
        local amount = tonumber(args[3])

        print(targetId .. ' ' .. item .. ' ' .. amount)

        if target then
            if item then
                if amount then
                    TriggerEvent('fsn_inventory:item:add', targetId, item, amount)
                else
                    TriggerClientEvent('chat:addMessage', playerId, {
                        template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>You need to specify an amount!</div>',
                        args = { }
                    })
                end
            else
                TriggerClientEvent('chat:addMessage', playerId, {
                    template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>You need to specify an item!</div>',
                    args = { }
                })
            end
        else
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>That target either does not exist or was entered wrong.</div>',
                args = { }
            })
        end

    end)

    RegisterCommand('kill', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        local targetId = tonumber(args[1])
        local target = FSN.GetPlayerFromId(targetId)

        if target then
            TriggerClientEvent('fsn_ems:killMe', targetId)
        else
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 44, 44, 0.6); border-radius: 3px;"><strong>^8SYSTEM: ^7</strong><br>That target either does not exist or was entered wrong.</div>',
                args = { }
            })
        end

    end)

    RegisterCommand('tpm', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_teleporters:teleport:waypoint', playerId)

    end)

    RegisterCommand('tpc', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        local x = tonumber(args[1])
        local y = tonumber(args[2])
        local z = tonumber(args[3])

        TriggerClientEvent('fsn_teleporters:teleport:coordinates', playerId, x, y, z)

    end)

    RegisterCommand('noclip', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source
        if not isDeveloper(playerId) then
            return
        end

        TriggerClientEvent('fsn_developer:noClip:enabled', playerId)

    end)

    local playerId = source

    if isDeveloper(playerId) then

        --Put command chat suggestions here
        TriggerClientEvent('chat:addSuggestion', playerId, '/tuner', 'Open the vehicle tuner UI.', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/inv', 'Open the inventory of another player.', {
            { name = 'ID', help = 'The server ID of the target' },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/softlog', 'Softlog and select a new character from the charater screen.', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/reviveplayer', 'Revive the nearest player..', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/carryplayer', 'Carry the nearest player.', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/addmoney', 'Add money to a player.', {
            { name = 'Amount', help = 'The amount of money to add to their wallet' },
            { name = 'ID', help = 'The server ID of the target.' },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/pdduty', 'Force the on duty status of a player for police', {
            { name = 'ID', help = 'The server ID of the target', },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/setinfractions', 'Set infractions on a license for the specified target.', {
            { name = 'ID', help = 'The server ID of the target' },
            { name = 'License Type', help = 'The license type you want to set infractions on. ie: driver, weapon, etc' },
            { name = 'Amount', help = 'The amount of infractions to set' },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/debug', 'Enables object and player debugging(not implemented check code to implement your own)', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/insidedebug', 'Debugging of apartment instances.', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/mdt', 'Opens the police MDT.', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/revive', 'Force revive yourself', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/xyz', 'Get your current xyz and print them to the server console', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/spawnveh', 'Spawn the specified model.', {
            { name = 'model', help = 'Model of the car you want to spawn' },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/getkeys', 'Get the keys of the current vehicle you are in.', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/dv', 'Delete the current vehicle you are looking at.', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/fixveh', 'Fix your current vehicle.', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/giveitem', 'Give an item to a player', {
            { name = 'ID', help = 'The server ID of the target' },
            { name = 'Item', help = 'The name of the item to give' },
            { name = 'amount', help = 'The amount to give' },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/kill', 'Kills the specified target.', {
            { name = 'ID', help = 'The server ID of the target' },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/tpm', 'Teleport to the waypoint.', {
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/tpc', 'Teleport to the specified xyz.', {
            { name = 'X', help = 'X Coordinate' },
            { name = 'Y', help = 'Y Coordinate' },
            { name = 'Z', help = 'Z Coordinate' },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/noclip', 'Enable no clipping.', {
        })

    end

end


--  -------------------
--  END:      Functions
--  -------------------

--  -------------------
--  BEGIN:      Exports
--  -------------------

--  -------------------
--  END:        Exports
--  -------------------

--  -------------------
--  BEGIN:       Events
--  -------------------

RegisterServerEvent('fsn_developer:printXYZ')
AddEventHandler('fsn_developer:printXYZ', function(x,y,z,h)
  print('')
  print('XYZ Lua table:')
  print("{x = "..x..", y = "..y..", z = "..z.."}")
  print('')
  
  print('')
  print('XYZ JSON table:')
  print(json.encode({x=x,y=y,z=z}))
  
  print('')
  print('XYZH Lua table:')
  print("{x = "..x..", y = "..y..", z = "..z..", h = "..h.."}")
  
  print('')
  print('XYZH JSON table:')
  print(json.encode({x=x,y=y,z=z,h=h}))
  
  print('')
  print('XYZ GetCoords format:')
  print(x..", "..y..", "..z)
  print('')
end)

RegisterNetEvent('fsn_developer:enableDeveloperCommands')
AddEventHandler('fsn_developer:enableDeveloperCommands', function(source)

    local playerId = source

    registerDeveloperCommands(playerId)

end)

--Will register the chat suggestions and commands for the players when they connect if they are a developer.
RegisterNetEvent('fsn:playerReady')
AddEventHandler('fsn:playerReady', function()

    local playerId = source

    if isDeveloper(playerId) then
        TriggerEvent('fsn_developer:enableDeveloperCommands', playerId)
    end

end)

--  -------------------
--  END:         Events
--  -------------------

