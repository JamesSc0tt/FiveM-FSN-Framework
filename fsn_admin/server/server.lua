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

function isModerator(source)

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

    local Moderators = Config.Moderators
    local isModerator = false

    for i = 1, #Config.Moderators do
        if Moderators[i] == steamId then
            isModerator = true
        elseif isModerator == false then
            isModerator = false
        end
    end

    if isModerator then
        return true
    else
        return false
    end

    return false
end

function fsn_GetModeratorId(source)

    local playerId = source
    local identifier = GetPlayerName(playerId)

    --for i = 1, #identifiers do
        --steamId = identifiers[1]
    --end

    return identifier

end

function isAdmin(source)

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

    local Admins = Config.Admins
    local isAdmin = false

    for i = 1, #Config.Admins do
        if Admins[i] == steamId then
            isAdmin = true
        elseif isAdmin == false then
            isAdmin = false
        end
    end

    if isAdmin then
        return true
    else
        return false
    end

    return false
end

function fsn_GetAdminId(source)

    local playerId = source
    local identifier = GetPlayerName(playerId)

    --for i = 1, #identifiers do
        --steamId = identifiers[1]
    --end

    return identifier

end

function registerModeratorCommands(source)

    RegisterCommand('sc', function(source, args, rawCommand)

        if source == 0 then
          return
        end
    
        local playerId = source
        local playerIdentifier = GetPlayerIdentifiers(playerId)

        if not isModerator(playerId) then
            return
        end
       
        local players = GetPlayers()
        
    
        --for k, ply in pairs(GetPlayers()) do
        for j = 1, #players do
                       
            if isModerator(players[j]) then
    
                local adminName = fsn_GetModeratorId(players[j])
                local msg = rawCommand:sub(3)
                
                TriggerClientEvent('chat:addMessage', players[j], {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8SC [Mod] {0}:^7</strong><br>{1}</div>',
                args = { adminName, msg }
                })
    
            end
    
        end
      
      end)
    
end

function registerAdminCommands()

    RegisterCommand('sc', function(source, args, rawCommand)

        if source == 0 then
          return
        end
    
        local playerId = source

        if not isAdmin(playerId) then
            return
        end
       
        local players = GetPlayers()
        
    
        --for k, ply in pairs(GetPlayers()) do
        for j = 1, #players do
                         
            if isAdmin(players[j]) then
    
                local adminName = fsn_GetAdminId(players[j])
                local msg = rawCommand:sub(3)
                
                TriggerClientEvent('chat:addMessage', players[j], {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8SC [Admin] {0}:^7</strong><br>{1}</div>',
                args = { adminName, msg }
                })
    
            end
    
        end
      
    end)

    RegisterCommand('adminmenu', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source

        if not isAdmin(playerId) then
            return
        end

        TriggerClientEvent('chat:addMessage', playerId, {
            template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8System: ^7</strong><br>The admin menu is not yet implemented!</div>',
            args = {  }
        })

    end)

    RegisterCommand('amenu', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source

        if not isAdmin(playerId) then
            return
        end

        TriggerClientEvent('chat:addMessage', playerId, {
            template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8System: ^7</strong><br>The admin menu is not yet implemented!</div>',
            args = {}
        })

    end)

    RegisterCommand('freeze', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source

        if not isAdmin(playerId) then
            return
        end

        local targetId  = tonumber(args[1])
        local target    = FSN.GetPlayerFromId(targetId)

        if target then
            local targetName = GetPlayerName(target.ply_id)
            local adminName = GetPlayerName(playerId)
            print(target.ply_id)
            TriggerClientEvent('fsn_admin:FreezeMe', target.ply_id, adminName)
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8System: ^7</strong><br>You toggled the frozen status of {0}</div>',
                args = { targetName }
            })
        else
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8System: ^7</strong><br>That target either doesn\'t exist or was entered wrong.</div>',
                args = {  }
            })
        end

    end)

    RegisterCommand('announce', function(source, args, rawCommand)

        if source == 0 then
            local msg = rawCommand:sub(9)

            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8SERVER ANNOUNCEMENT: ^7</strong><br>{0}</div>',
                args = { msg }
            })
        else

            local playerId = source

            if not isAdmin(playerId) then
                return
            end

            local adminName = fsn_GetAdminId(playerId)
            local msg = rawCommand:sub(9)

            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8[{0}] Announcement: ^7</strong><br>{1}</div>',
                args = { adminName, msg }
            })
        end

    end)

    RegisterCommand('goto', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source

        if not isAdmin(playerId) then
            return
        end

        local targetId = tonumber(args[1])
        local target = FSN.GetPlayerFromId(targetId)

        if target then
            TriggerClientEvent('fsn_admin:requestXYZ', target.ply_id, playerId, target.ply_id)
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8System: ^7</strong> You teleported to {0}.</div>',
                args = { target.ply_id }
            })
        else
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8System: ^7</strong><br>That target either doesn\'t exist or was entered wrong.</div>',
                args = {  }
            })
        end

    end)

    RegisterCommand('bring', function(source, args, rawCommand)

        if source == 0 then
            return
        end

        local playerId = source

        if not isAdmin(playerId) then
            return
        end

        local targetId = tonumber(args[1])
        local target = FSN.GetPlayerFromId(targetId)

        if target then
            TriggerClientEvent('fsn_admin:requestXYZ', playerId, target.ply_id, playerId)
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8System: ^7</strong> You brought {0} to you.</div>',
                args = { target.ply_id }
            })
        else
            TriggerClientEvent('chat:addMessage', playerId, {
                template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8System: ^7</strong><br>That target either doesn\'t exist or was entered wrong.</div>',
                args = {  }
            })
        end

    end)

    RegisterCommand('kick', function(source, args, rawCommand)

        if source == 0 then
            local targetId = tonumber(args[1])
            local target = FSN.GetPlayerFromId(targetId)
            local reason = rawCommand:sub(7)

            if target then
                if reason then
                    DropPlayer(target.ply_id, 'You have been kicked by the server for: ' .. reason)
                end
            end
        else

            local playerId = source

            if not isAdmin(playerId) then
                return
            end

            local targetId = tonumber(args[1])
            local target = FSN.GetPlayerFromId(targetId)
            local reason = rawCommand:sub(7)
            local adminName = fsn_GetAdminId(playerId)

            if target then
                if reason then
                    DropPlayer(target.ply_id, 'You have been kicked for: ' .. reason .. ' by: ' .. adminName)
                else
                    TriggerClientEvent('chat:addMessage', playerId, {
                        template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8System: ^7</strong><br>You need to specify a reason.</div>',
                        args = {  }
                    })
                end
            else
                TriggerClientEvent('chat:addMessage', playerId, {
                    template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8System: ^7</strong><br>That target either doesn\'t exist or was entered wrong.</div>',
                    args = {  }
                })
            end

        end
    end)

    RegisterCommand('ban', function(source, args, rawCommand)

        local times = {
            ['1d']=86400,
            ['2d']=172800,
            ['3d']=259200,
            ['4d']=354600,
            ['5d']=432000,
            ['6d']=518400,
            ['1w']=604800,
            ['2w']=1209600,
            ['3w']=1814400,
            ['1m']=2629743,
            ['2m']=529486,
            ['perm'] = 999999999999999999
        }

        if source == 0 then
            local targetId = tonumber(args[1])
            local target = FSN.GetPlayerFromId(targetId)
            local reason = rawCommand:sub(5)
            local length = args[2]

            if target then
                if reason and length then
                    local unbanTime = os.time() + times[length]
                    local steamId = GetPlayerIdentifiers(target.ply_id)

                    for i = 1, #GetPlayerIdentifiers(target) do
                        if string.match(steamId[1], 'steam:') then
                            steamId = steamId[1]
                        end
                    end
                        
                    MySQL.Async.execute('UPDATE fsn_users SET banned = @unban, banned_r = @reason, WHERE steamid = @steamId', {
                        ['@unban'] = unbanTime,
                        ['@reason'] = reason,
                        ['@steamId'] = steamId,
                    }, function(rowsChanged)
                    end)
                    DropPlayer(target.ply_id, 'You have beend banned for: ' .. reason .. ' by the server. Time: '.. length)
                end
            else

            end
        else

            local playerId = source

            if not isAdmin(playerId) then 
                return
            end

            local targetId = tonumber(args[1])
            local target = FSN.GetPlayerFromId(targetId)
            local reason = rawCommand:sub(5)
            local length = args[2]

            if target then
                if reason and length then
                    local unbanTime = os.time() + times[length]
                    local steamId = GetPlayerIdentifiers(target)
                    local adminName = fsn_GetAdminId(playerId)

                    for i = 1, #GetPlayerIdentifiers(target.ply_id) do
                        if string.match(steamId[1], 'steam:') then
                            steamId = steamId[1]
                        end
                    end
                        
                    MySQL.Async.execute('UPDATE fsn_users SET banned = @unban, banned_r = @reason, WHERE steamid = @steamId', {
                        ['@unban'] = unbanTime,
                        ['@reason'] = reason,
                        ['@steamId'] = steamId,
                    }, function(rowsChanged)
                    end)
                    DropPlayer(target.ply_id, 'You have beend banned for: ' .. reason .. ' by ' ..adminName.. '. Time: '.. length)
                end
            else
                TriggerClientEvent('chat:addMessage', playerId, {
                    template = '<div style="padding: 0.5vw; background-color: rgba(44, 95, 148, 0.6); border-radius: 3px;"><strong>^8System: ^7</strong><br>That target either doesn\'t exist or was entered wrong.</div>',
                    args = {  }
                })
            end
        end
    end)

end

function registerModeratorSuggestions(source)

    local playerId = source

    if isModerator(playerId) then
        TriggerClientEvent('chat:addSuggestion', playerId, '/sc', 'Talk in staff chat.', {
            { name = 'Message', help = 'Message to send.', },
        })
    end

end

function registerAdminSuggestions(source)

    local playerId = source

    if isAdmin(playerId) then
        TriggerClientEvent('chat:addSuggestion', playerId, '/sc', 'Talk in staff chat.', {
            { name = 'Message', help = 'Message to send.', },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/adminmenu', 'The admin menu is not yet implemented.', {
            { },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/amenu', 'The admin menu is not yet implemented.', {
            { name = 'Message', help = 'Message to send.', },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/freeze', 'Freeze the target you specify.', {
            { name = 'ID', help = 'The server ID of the target', },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/goto', 'Teleport to the target you specify.', {
            { name = 'ID', help = 'The server ID of the target', },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/bring', 'Bring the target you specify to your location.', {
            { name = 'ID', help = 'The server ID of the target', },
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/kick', 'Kick the specified target from the server.', {
            { name = 'ID', help = 'The server ID of the target', },
            { name = 'reason', help = 'The reason you are kicking the target from the server.'},
        })

        TriggerClientEvent('chat:addSuggestion', playerId, '/ban', 'Ban the target from the server.', {
            { name = 'ID', help = 'The server ID of the target', },
            { name = 'Length', help = 'A valid length for the ban: 1d, 2d, 3d, 4d, 5d, 6d. 1w, 2w, 3w, 1m, 2m, perm'},
            { name = 'Reason', help = 'The reason for the ban'},
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

RegisterNetEvent('fsn_admin:enableAdminCommands')
AddEventHandler('fsn_admin:enableAdminCommands', function(source)

    local playerId = source

    registerAdminSuggestions(playerId)

end)

RegisterNetEvent('fsn_admin:enableModeratorCommands')
AddEventHandler('fsn_admin:enableModeratorCommands', function(source)

    local playerId = source

    registerModeratorSuggestions(playerId)
    registerModeratorCommands(playerId)

end)

--Will register the chat suggestions and commands for the players when they connect if they are an admin or moderator.
RegisterNetEvent('fsn:playerReady')
AddEventHandler('fsn:playerReady', function()

    local playerId  = source

    Wait(1000)

    if isAdmin(playerId) then
        TriggerEvent('fsn_admin:enableAdminCommands', playerId)
    end

    if isModerator(playerId) then
        TriggerEvent('fsn_admin:enableModeratorCommands', playerId)
    end

end)

-- This is here to register the admin commands so the server can use them without having an admin connect.
AddEventHandler('onResourceStart', function(resourceName)
    Wait(100)

    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    registerAdminCommands()
end)

--  -------------------
--  END:         Events
--  -------------------

