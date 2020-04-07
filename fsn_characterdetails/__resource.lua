client_script 'gui_manager.lua'

client_script 'facial/client.lua'
client_script 'tattoos/config.lua'
client_script 'tattoos/client.lua'

server_script 'facial/server.lua'
server_script 'tattoos/server.lua'

export 'GetPreviousTattoos'
export 'GetTattooCategory'

ui_page 'gui/ui.html'

files({
  'gui/ui.html',
  'gui/ui.css',
  'gui/ui.js'
})