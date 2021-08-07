fx_version 'bodacious'
games { 'gta5' }


description 'Garages for the server'

--[[/	:FSN:	\]]--
client_scripts { 
    '@fsn_main/cl_utils.lua',
    '@fsn_main/server_settings/sh_settings.lua'
}
server_scripts { 
    '@fsn_main/sv_utils.lua',
    '@fsn_main/server_settings/sh_settings.lua',
    '@mysql-async/lib/MySQL.lua'
}
--[[/	:FSN:	\]]--

client_scripts { 
    'client.lua',
}

server_scripts { 
    'server.lua',
}

ui_page "gui/ui.html"

files {
  'gui/ui.css',
  'gui/ui.html',
  'gui/ui.js'
}

-- exports
exports {
  'fsn_IsVehicleOwner',
  'fsn_GetVehicleVehIDP',
  'fsn_SpawnVehicle',
  'fsn_IsVehicleOwnerP',
  'getCarDetails'
}
