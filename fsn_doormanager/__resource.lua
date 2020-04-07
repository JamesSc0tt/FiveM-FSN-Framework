-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

client_script 'cl_doors.lua'
server_script 'sv_doors.lua'

exports({
  'IsDoorLocked',
})