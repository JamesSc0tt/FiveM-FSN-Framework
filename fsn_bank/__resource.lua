--[[/	:FSN:	\]]--
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'
client_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@mysql-async/lib/MySQL.lua'
--[[/	:FSN:	\]]--

ui_page 'gui/index.html'
files({
  'gui/index.html',
  'gui/index.js',
  'gui/index.css',
  'gui/atm_logo.png',
  'gui/atm_button_sound.mp3'
})
