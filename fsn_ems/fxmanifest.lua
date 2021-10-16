--[[/	:FSN:	\]]--
fx_version 'adamant'
game 'gta5'

client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'
client_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@mysql-async/lib/MySQL.lua'
--[[/	:FSN:	\]]--

client_script 'client.lua'
client_script 'cl_advanceddamage.lua'
client_script 'cl_volunteering.lua'
client_script 'cl_carrydead.lua'
client_script 'beds/client.lua'
client_script 'blip.lua'

server_script 'server.lua'
server_script 'sv_carrydead.lua'
server_script 'beds/server.lua'

exports({
  'fsn_IsDead',
  'fsn_EMSDuty',
  'fsn_getEMSLevel',
  'fsn_Airlift',
  'ems_isBleeding',
  'isCrouching',
  'carryingWho'
})