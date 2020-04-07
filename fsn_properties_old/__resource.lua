-- Tell FiveM's NUI system what the main html file is for this resource
ui_page "nui/ui.html"

-- Add the files that need to be used/loaded
files {
	"nui/ui.html",
	"nui/ui.js",
	"nui/ui.css"
}



client_script 'enterable/client.lua'
client_script 'nonenterable/client.lua'
client_script 'client.lua'

server_script '@mysql-async/lib/MySQL.lua'
server_script 'enterable/properties.lua'
server_script 'nonenterable/properties.lua'
server_script 'server.lua'
