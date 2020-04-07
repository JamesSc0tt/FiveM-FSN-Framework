client_script 'client.lua'
server_script 'server.lua'

ui_page 'gui/ui.html'

files({
  'gui/ui.css',
  'gui/ui.html',
  'gui/ui.js'
})

exports({
  'fsn_IsVehicleOwner',
  'getCarDetails'
})

-- Server scripts
server_script '@mysql-async/lib/MySQL.lua'
