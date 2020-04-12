--[[/	:FSN:	\]]--
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'
client_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@mysql-async/lib/MySQL.lua'
--[[/	:FSN:	\]]--

-- Noclipping, inspired by
-- https://github.com/blattersturm/expeditious-execution/blob/master/resources/%5Bexpeditious%5D/execution-noclip
dependency "freecam"
client_script "cl_noclip.lua"