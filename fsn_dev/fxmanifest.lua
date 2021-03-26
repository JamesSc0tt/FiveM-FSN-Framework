--  -----------------------------
--  BEGIN:         FiveM Manifest
--  -----------------------------

fx_version  'cerulean'
games       { 'gta5' }

author      'Crutchie'
description 'FSN Developer'
version     '0.0.1'

--  -----------------------------
--  END:           FiveM Manifest
--  -----------------------------

--  -----------------------------
--  BEGIN: Client Scripts/Exports
--  -----------------------------

client_scripts {

    'client/client.lua',
    'client/cl_noclip.lua',

}

exports {

}

--  -----------------------------
--  END:   Client Scripts/Exports
--  -----------------------------

--  -----------------------------
--  BEGIN: Server Scripts/Exports
--  -----------------------------

server_scripts {

    '@mysql-async/lib/MySQL.lua',

    'config.lua',
    'server/server.lua',

}

server_exports {


}

--  -----------------------------
--  END:   Server Scripts/Exports
--  -----------------------------