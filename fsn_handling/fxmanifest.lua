--[[/	:FSN:	\]]--
fx_version 'adamant'
game 'gta5'

client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'
client_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@mysql-async/lib/MySQL.lua'
--[[/	:FSN:	\]]--

dependency "fsn_builders"
fsn_handling "src/muscle.lua"
fsn_handling "src/compact.lua"
fsn_handling "src/coupes.lua"
fsn_handling "src/sports.lua"
fsn_handling "src/suvs.lua"
fsn_handling "src/sportsclassics.lua"
fsn_handling "src/offroad.lua"
fsn_handling "src/vans.lua"
fsn_handling "src/sedans.lua"
fsn_handling "src/government.lua"
fsn_handling "src/super.lua"
--fsn_handling "src/motorcycles.lua"

files { 'out/handling.meta', 'data/handling.meta' }
data_file 'HANDLING_FILE' 'out/handling.meta'
data_file 'HANDLING_FILE' 'data/handling.meta'
