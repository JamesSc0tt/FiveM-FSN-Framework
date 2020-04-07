server_script '@mysql-async/lib/MySQL.lua'
client_script 'client.lua'

-- judge
client_script 'judges/client.lua'
server_script 'judges/server.lua'

-- attorney
client_script 'attorneys/client.lua'
server_script 'attorneys/server.lua'