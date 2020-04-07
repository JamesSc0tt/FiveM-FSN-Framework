resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

client_script 'client.lua'
server_script '@mysql-async/lib/MySQL.lua'
server_script 'server.lua'

-- whitelists
client_script 'whitelists/client.lua'
server_script 'whitelists/server.lua'

-- mechanic job
client_script 'mechanic/client.lua'
server_script 'mechanic/server.lua'

-- trucker job
client_script 'trucker/client.lua'


-- hunting job
client_script 'hunting/client.lua'

-- farming job
client_script 'farming/client.lua'

-- scrap job
client_script 'scrap/client.lua'

-- taxi job
client_script 'taxi/client.lua'
server_script 'taxi/server.lua'

-- garbage job
client_script 'garbage/client.lua'

-- news job
client_script 'news/client.lua'

-- tow job
client_script 'tow/client.lua'
server_script 'tow/server.lua'
-- delivery job
--client_script 'delivery/client.lua'

exports({
  'fsn_GetJob',
  'fsn_SetJob',
  
  -- [WHITELIST THINGS]
  'isWhitelisted',
  'getWhitelistDetails',
  'inAnyWhitelist',
  'toggleWhitelistClock',
  'isWhitelistClockedIn',
  'addToWhitelist'
})
server_export 'isPlayerClockedInWhitelist'