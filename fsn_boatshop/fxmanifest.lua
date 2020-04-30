--[[/   :FIVEM MANIFEST SHIT:	\]]--
fx_version 'bodacious'
games { 'gta5' }
--[[/   :FIVEM MANIFEST SHIT:	\]]--

--[[/	:Globals:	\]]--
client_scripts { 
    '@fsn_main/cl_utils.lua',
    '@fsn_main/server_settings/sh_settings.lua',
}
server_scripts { 
    '@fsn_main/sv_utils.lua',
    '@fsn_main/server_settings/sh_settings.lua',
    '@mysql-async/lib/MySQL.lua'
}
--[[/	:Globals:	\]]--

client_scripts { 
    'cl_boatshop.lua',
    'cl_menu.lua',
}

server_scripts { 
    'sv_boatshop.lua',
}
