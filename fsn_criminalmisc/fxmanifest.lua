--[[/	:FSN:	\]]--
fx_version 'adamant'
game 'gta5'

client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'
client_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@fsn_main/server_settings/sh_settings.lua'
server_script '@mysql-async/lib/MySQL.lua'
--[[/	:FSN:	\]]--

-- client
client_script 'client.lua'

-- handcuffs
client_script 'handcuffs/client.lua'
server_script 'handcuffs/server.lua'

-- robbing
client_script 'robbing/client.lua'
client_script 'robbing/cl_houses.lua'
client_script 'robbing/cl_houses-config.lua'
client_script 'robbing/cl_houses-build.lua'

-- streetracing
client_script 'streetracing/client.lua'
server_script 'streetracing/server.lua'

-- remapping
client_script 'remapping/client.lua'
server_script 'remapping/server.lua'

-- lockpicking
client_script 'lockpicking/client.lua'

-- weapon info
client_script 'weaponinfo/client.lua'
client_script 'weaponinfo/weapon_list.lua'
server_script 'weaponinfo/server.lua'

-- drugs
client_script 'drugs/client.lua'
client_script 'drugs/_streetselling/client.lua'
server_script 'drugs/_streetselling/server.lua'
client_script 'drugs/_weedprocess/client.lua'
client_script 'drugs/_effects/client.lua'

-- pawnstore
client_script 'pawnstore/cl_pawnstore.lua'

exports {
	"GetWeapons",
	"weaponInfo",
	"HoldingWeapon",
	"GetWeaponInfo"
}