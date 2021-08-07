fx_version 'bodacious'
games { 'gta5' }


description 'Benny Tuning for the server'

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
    'menu.lua',
    'cl_config.lua',	
    'cl_bennys.lua',
}
