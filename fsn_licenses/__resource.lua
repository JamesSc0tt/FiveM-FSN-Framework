-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

client_script 'client.lua'
client_script 'cl_desk.lua'
server_script 'sv_desk.lua'

server_script '@mysql-async/lib/MySQL.lua'
server_script 'server.lua'

exports({
  'fsn_hasLicense',
  'fsn_getLicensePoints'
})
