function SplitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function print_table(node)
    -- to make output beautiful
    local function tab(amt)
        local str = ""
        for i=1,amt do
            str = str .. "\t"
        end
        return str
    end

    local cache, stack, output = {},{},{}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k,v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k,v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then

                if (string.find(output_str,"}",output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str,"\n",output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output,output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "["..tostring(k).."]"
                else
                    key = "['"..tostring(k).."']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. tab(depth) .. key .. " = "..tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. tab(depth) .. key .. " = {\n"
                    table.insert(stack,node)
                    table.insert(stack,v)
                    cache[node] = cur_index+1
                    break
                else
                    output_str = output_str .. tab(depth) .. key .. " = '"..tostring(v).."'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. tab(depth-1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. tab(depth-1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. tab(depth-1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output,output_str)
    output_str = table.concat(output)

    print(output_str)
end

function checkBan(source, setKickReason)
	local src = source
	updateIdentifiers(src)
	
	for k, v in pairs(GetPlayerIdentifiers(src)) do
		--print('>>>    :fsn_main: (sv_bans.lua) Checking bans for Player('..src..'), Identifier('..v..')')
		sql = "SELECT * FROM `fsn_bans` WHERE `ban_identifier` = '"..v.."'"
		--print('>>>>>>>>>>> '..sql)
		local check = MySQL.Sync.fetchAll(sql)
		if check[1] then
			if check[1].ban_expire >= os.time() or check[1].ban_expire == -1 then
				local reason = 'your ban is weirdly formatted, ask jamessc0tt'
				if check[1]['ban_expire'] == -1 then
					print(':fsn_main: (sv_bans.lua) - Player('..src..') is PERM banned, Identifier('..v..') - dropping player.')
					reason = ':FSN: You are banned from Fusion Roleplay. \n\nBanID: '..check[1]['ban_id']..'\nReason: '..check[1]['ban_reason']..'\nExpires: Never\n\nAppeal this ban @ fsn.life/forums\n\n'
				else
					print(':fsn_main: (sv_bans.lua) - Player('..src..') is banned until Date('..check[1]['ban_expire']..'), Identifier('..v..') - dropping player.')
                    reason = ':FSN: You are banned from Fusion Roleplay. \n\nBanID: '..check[1]['ban_id']..'\nReason: '..check[1]['ban_reason']..'\nExpires: '..check[1]['ban_expire']..'\n\nAppeal this ban @ fsn.life/forums\n\n'
                    -- unban date needs to be formatted properly jamesy
				end
				DropPlayer(src, reason)
				if setKickReason then
					setKickReason(reason)
				end
				CancelEvent()
			end
		end
	end
end

function updateIdentifiers(src)
	
	local steamid = GetPlayerIdentifiers(src)[1]
	if not steamid then print('trying to update identifiers for player('..src..') failed') return else print(':fsn_main: (sv_bans.lua) Updating identifiers for Player('..src..') with SteamID('..steamid..')') end
	local sql = MySQL.Sync.fetchAll("SELECT * FROM `fsn_users` WHERE `steamid` = '"..steamid.."'")
	if sql[1] then
        local myIdentifiers = sql[1]['identifiers']
		if myIdentifiers then
			myIdentifiers = json.decode(myIdentifiers)
		else
			myIdentifiers = {}
		end
		for k, v in pairs(GetPlayerIdentifiers(src)) do
			--print('checking identifier: '..v)
			local split = SplitString(v, ':')
			local iType = split[1]
			if not myIdentifiers[iType] then
				myIdentifiers[iType] = {}
			end
			local exists = false
			for key, value in pairs(myIdentifiers[iType]) do
				if value == v then
					exists = true
				end
			end
			if not exists then
				table.insert(myIdentifiers[iType], #myIdentifiers[iType]+1, v)
			end
		end
		local update = json.encode(myIdentifiers)
		--print(':fsn_main: Updating user_id('..sql[1]['user_id']..') identifiers\n to '..update)
		
		MySQL.Sync.execute("UPDATE `fsn_users` SET `identifiers` = '"..update.."' WHERE `user_id` = "..sql[1]['user_id']..";")
	end
	
end

--AddEventHandler("playerConnecting", checkBan)
