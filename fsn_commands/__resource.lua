client_script 'client.lua'
server_script '@mysql-async/lib/MySQL.lua'
server_script 'server.lua'

exports({
  'fsn_SplitString',
  'fsn_getHDC'
})
