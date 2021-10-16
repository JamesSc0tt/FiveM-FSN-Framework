--[[/	:FSN:	\]]--
fx_version 'adamant'
game 'gta5'


--[[/	:Globals:	\]]--
client_scripts { 
  '@fsn_main/cl_utils.lua',
  '@fsn_main/server_settings/sh_settings.lua'
}
server_scripts { 
  '@fsn_main/sv_utils.lua',
  '@fsn_main/server_settings/sh_settings.lua',
  '@mysql-async/lib/MySQL.lua'
}
--[[/	:Globals:	\]]--
--[[/	:FSN:	\]]--

client_scripts { 

--[[/   :Main:  \]]--
'client.lua',
--[[/   :Main:  \]]--

'whitelists/client.lua',
'mechanic/client.lua',
'mechanic/mechmenu.lua',
'trucker/client.lua',
'hunting/client.lua',
'farming/client.lua',
'scrap/client.lua',
'taxi/client.lua',
'garbage/client.lua',
'news/client.lua',
'tow/client.lua',
--'delivery/client.lua'
}

server_scripts { 

--[[/ :Main:  \]]--
'server.lua',
--[[/ :Main:  \]]--

'whitelists/server.lua',
'mechanic/server.lua',
'taxi/server.lua',
'tow/server.lua',
}

exports {
'fsn_GetJob',
'fsn_SetJob',

-- [WHITELIST THINGS]
'isWhitelisted',
'getWhitelistDetails',
'inAnyWhitelist',
'toggleWhitelistClock',
'isWhitelistClockedIn',
'addToWhitelist'
}

server_export 'isPlayerClockedInWhitelist'