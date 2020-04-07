resource_manifest_version "05cfa83c-a124-4cfa-a768-c24a5811d8f9"

local function shared_script(script)
	server_script(script)
	client_script(script)
end

server_script "utils/sh_luafun.lua"
server_script "utils/sv_db.lua"

server_script "main/sv_conn.lua"

client_script "misc/cl_antijumpspam.lua"
shared_script "misc/sh_branding.lua"

client_script "main/cl_player.lua"