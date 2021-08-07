fx_version 'bodacious'
games { 'gta5' }


description 'Apartments for the server'

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
    'cl_instancing.lua',	

}

server_scripts {
    'server.lua',
    'sv_instancing.lua',	

}

ui_page "gui/ui.html"

files {
	"gui/ui.html",
	"gui/ui.js",
	"gui/ui.css"
}


-- exports
exports {
	"inInstance",
	"isNearStorage",
	"EnterMyApartment"
}
