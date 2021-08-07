fx_version 'bodacious'
games { 'gta5' }


description 'Builders for the framework'

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

server_scripts { 
    'xml.lua',
    'schema.lua',
    'handling_builder.lua'
}
