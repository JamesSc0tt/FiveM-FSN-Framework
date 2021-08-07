fx_version 'bodacious'
games { 'gta5' }


description 'Model Menu v3 by Frazzle :D'

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
	'gui.lua',
	'client.lua',
	'config.lua',
}

server_scripts { 
    'server.lua',
}

-- exports
exports {
	"isClothingOpen",
	"GetOutfit"
}
