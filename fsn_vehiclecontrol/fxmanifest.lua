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

-- ODOMETER
client_script 'odometer/client.lua'
server_script 'odometer/server.lua'

-- FUEL
client_script 'fuel/client.lua'
server_script 'fuel/server.lua'

-- SPEED CAMERAS
client_script 'speedcameras/client.lua'

-- COMPASS
client_script 'compass/essentials.lua'
client_script 'compass/compass.lua'
client_script 'compass/streetname.lua'

-- CARHUD
client_script 'carhud/carhud.lua'

-- DAMAGE
client_script 'damage/config.lua'
client_script 'damage/client.lua'
client_script 'damage/cl_crashes.lua'

-- ENGINE
client_script 'engine/client.lua'

-- KEYS
server_script 'keys/server.lua'

-- INVENTORY
client_script 'inventory/client.lua'
server_script 'inventory/server.lua'

-- CARWASH
client_script 'carwash/client.lua'

-- TRUNK
client_script 'trunk/client.lua'
server_script 'trunk/server.lua'

-- HOLDUP
client_script 'holdup/client.lua'

-- Aircontrol
client_script 'aircontrol/aircontrol.lua'

exports({
  'GetVehicleInventory'
})
