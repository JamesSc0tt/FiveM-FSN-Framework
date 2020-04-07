resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

dependency "connectqueue"
dependency "mysql-async"

server_script '@mysql-async/lib/MySQL.lua'
server_script "@connectqueue/connectqueue.lua"

server_script "server.lua"
server_script "administration.lua"