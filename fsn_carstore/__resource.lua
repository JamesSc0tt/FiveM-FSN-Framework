--[[/	:FSN:	\]]--
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'
client_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@mysql-async/lib/MySQL.lua'
--[[/	:FSN:	\]]--

client_script 'cl_carstore.lua'
client_script 'cl_menu.lua'
server_script 'vehshop_server.lua'
server_script 'sv_carstore.lua'

export 'ShowVehshopBlips'

ui_page 'gui/index.html'
files({
  'gui/index.html',
  'gui/index.js',
  'gui/index.css',
  'gui/logo.png',
})
