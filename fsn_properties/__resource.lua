-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

ui_page "nui/ui.html"
files {
	"nui/ui.html",
	"nui/ui.js",
	"nui/ui.css"
}


client_script 'cl_manage.lua'
client_script 'cl_properties.lua'

server_script '@mysql-async/lib/MySQL.lua'
server_script 'sv_conversion.lua'
server_script 'sv_properties.lua'