fx_version 'cerulean'
games { 'gta5' }


description 'Characterdetails for the server'

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
    'gui_manager.lua',
    'facial/client.lua',
    'tattoos/config.lua',
    'tattoos/client.lua',
}

server_scripts { 
    'facial/server.lua',
    'tattoos/server.lua',
}

ui_page "gui/ui.html"

files {
  'gui/ui.html',
  'gui/ui.css',
  'gui/ui.js'
}

-- exports
exports {
  'GetPreviousTattoos',
  'GetTattooCategory',
}
