PLY = {}

local players = {}

PLY.functions = {}

PLY.functions.getplayerid = function(src)
	local p = false
	if players[src] then
		p = players[src]
	end
	for k,v in pairs(players) do
		if v ~= p then
			-- remove existing old players incase of reconnect
			players[k] = nil
		end
	end
end