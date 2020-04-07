-- path for live server
local datastorePath = '/home/fivem/live/1/resources/[fsn]/fsn_inventory/pd_locker/datastore.txt'

local dbg = false
if dbg then
	-- path for james' pc
	datastorePath = 'F:/FiveM/zfsn_fxs-server/resources/[fsn]/fsn_inventory/pd_locker/datastore.txt'
end

local inuse = false

RegisterServerEvent('fsn_inventory:locker:request')
AddEventHandler('fsn_inventory:locker:request', function()
	if inuse then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'The locker is already in use' })
	else
		local deets = {}
	
		local f = assert(io.open(datastorePath, "rb"))
		local content = f:read("*all")
		f:close()
		if content == '' then 
			for i=1,60 do table.insert(deets, #deets+1, {index=false}) end
		else
			deets = json.decode(content)
		end
		
		inuse = true
		TriggerClientEvent('fsn_inventory:pd_locker:recieve', source, 1, deets)
	end
end)

RegisterServerEvent('fsn_inventory:locker:save')
AddEventHandler('fsn_inventory:locker:save', function(tbl)
	local detailsFile = io.open(datastorePath, "w")
	detailsFile:write(json.encode(tbl))
	detailsFile:close()
	
	inuse = false
end)

RegisterServerEvent('fsn_inventory:locker:empty')
AddEventHandler('fsn_inventory:locker:empty', function()
	local detailsFile = io.open(datastorePath, "w")
	detailsFile:write('')
	detailsFile:close()
	
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Locker emptied' })
end)
