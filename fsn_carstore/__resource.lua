-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

client_script 'cl_carstore.lua'
client_script 'cl_menu.lua'
server_script 'vehshop_server.lua'
server_script 'sv_carstore.lua'

export 'ShowVehshopBlips'

server_script '@mysql-async/lib/MySQL.lua'
