-- Load MySQL
DB = { IsReady = false }
local drivers = {}
local active_driver

do
	-- On ready handling
	local on_ready = {}
	function ready()
		DB.IsReady = true
		for _, cb in pairs(on_ready) do cb() end
	end
	function DB.OnReady(cb)
		table.insert(on_ready, cb)
		if DB.IsReady then cb() end
	end

	-- On not ready handling
	local on_not_ready = {}
	function not_ready()
		DB.IsReady = false
		for _, cb in pairs(on_not_ready) do cb() end
	end
	function DB.OnNotReady(cb)
		table.insert(on_not_ready, cb)
		if not DB.IsReady then cb() end
	end

	-- Event handlers
	local res = "mysql-async"
	AddEventHandler("onResourceStart", function(resource)
		if res ~= resource then return end
		while GetResourceState(res) == "starting" do Citizen.Wait(0) end
		if GetResourceState(res) ~= "started" then return end
		ready()
	end)
	AddEventHandler("onResourceStop", function(resource)
		if res ~= resource then return end
		not_ready()
	end)
	Citizen.CreateThread(function()
		while GetResourceState(res) == "starting" do Citizen.Wait(0) end
		if GetResourceState(res) ~= "started" then return end
		ready()
	end)
end

-- Based on
-- https://dev.mysql.com/doc/refman/8.0/en/string-functions.html#function_quote
-- Please always surround this by single qoutes
-- Ex: "SELECT * FROM x WHERE x = '"..escape(var).."'"
-- NOT SAFE FOR USE WITH LIKE STATEMENTS
local function escape(var)
	return tostring(var):gsub("\00","\\0")
	                    :gsub("\\","\\\\")
	                    :gsub("'","\\'")
end

--[[
	DB.Table"table"({
		[columnname: string]={ type: string, def: any, auto=false }
		...
	}) -> DBTable
		Represents a table in a database

		To get a "filtered" a "Table" simply call it with some conditions
		Table{column={comparison_operator, value}} -> Table -- Filtered Table
		Table{column=value} is the same as Table{column={"=", value}}
		Note: This can only be done once
]]
-- Methods of our "class", only named this so it looks fancy in navigation
local Table = {}
local function newtbl(ident, struct, filter)
	return setmetatable({
		ident = ident, struct = struct, filter = filter
	},{
		__index = Table,
		__call = function(self, f)
			return self.filter
				and error("Can't filter a already filtered table")
				or  newtbl(self.ident, self.struct, f)
		end
	})
end
function DB.NewTable(table_identifier)
	return function(structure)
		return newtbl(table_identifier, structure)
	end
end

--[[
	Table:destringify(row: table)
		De-stringifies row from the db, kinda internal
]]
local loaders = { string = tostring, number = tonumber }
function Table:destringify(...)
	local struct = self.struct
	local a = luafun.iter(...)
		:filter(function(col, val)
			return struct[col]-- and (self.struct[col].load ~= false)
		end)
		:map(function(col, val)
			return col, loaders[self.struct[col].type](val)
		end)
		:tomap()
	return a
end
--[[
	Table:stringify(row: table)
		Stringifies row for the db, kinda internal
]]
local savers = { string = tostring, number = tostring }
function Table:stringify(row)
	return luafun.iter(row)
		:filter(function(col, val)
			return self.struct[col]
		end)
		:map(function(col, val)
			return col, savers[self.struct[col].type](val)
		end)
		:tomap()
end


--[[
	Table:get() -> Promise({column=value})
	Table:get(offset=0, limit: number) -> Promise(Iter({column=value}))
]]
function Table:get(offset, limit)
	if not self.filter then
		error("Can't get a unfiltered table, pls ask kng")
	end

	-- self:get() returns the first item of :get(0, 1)
	if not offset then
		return active_driver.get(self, 0, 1)
			:next(function(rows)
				return rows:nth(1)
			end)
	end
	-- self:get(5) is the same as :get(0, 5)
	if not limit then
		offset, limit = 0, offset
	end

	return active_driver.get(self, offset, limit)
end

function Table:update(data)
	if not self.filter then
		error("Can't update a unfiltered table, it's a bad idea")
	end

	return active_driver.update(self, data)
end

function Table:insert(data)
	if self.filter then
		error("Can't insert into a filtered table")
	end

	return active_driver.insert(self, data)
end


--[[
	MySQL driver
]]
drivers.MySQL = {}
active_driver = drivers.MySQL
--[[
	MySQL driver
		Utilities
]]
local function detable(tbl, delim)
	local function fmt(col, val)
		return ("`"..col.."` = '"..escape(val).."'")
	end
	return table.concat(luafun.map(fmt, tbl):totable(), delim)
end



local function execute(fun, query, msg)
	local id = string.char(math.random(97, 122))
	print("Executing query with id ^0"..id.."^7:")
	print(query)

	local p = promise.new()

	local time = GetGameTimer()
	-- {["\t"]="\t"} is because C# thinks it's a array if it's empty
	exports['mysql-async'][fun]({}, query, {["\t"]="\t"}, function(x)
		local time = GetGameTimer()-time

		msg = msg:format(type(x) == "table" and #x or x)
		print("Query ^0"..id.."^7 took ^0"..time.."^7 ms: "..msg)

		p:resolve(x)
	end)

	return p
end

function drivers.MySQL.get(tbl, offset, limit)
	-- Build the query
	local query = ("SELECT * FROM %s\n\tWHERE %s\n\tLIMIT %s, %s")
		:format(tbl.ident, detable(tbl.filter," AND "), offset, limit)

	-- Execute the query
	return execute("mysql_fetch_all", query, "Returned ^0%s^7 rows")
		:next(function(rows)
			return luafun.iter(rows)
				:map(function(row)
					return tbl:destringify(row)
				end)
		end)
end


function drivers.MySQL.update(tbl, data)
	-- Clean up data
	data = tbl:stringify(data)

	-- Build the query
	local query = ("UPDATE %s\n\tSET %s\n\tWHERE %s")
		:format(tbl.ident, detable(data,", "), detable(tbl.filter," AND "))

	-- Execute the query
	return execute("mysql_execute", query, "Modified ^0%s^7 rows")
end

function drivers.MySQL.insert(tbl, data)
	-- Clean up data
	data = tbl:stringify(data)
	for col, v in pairs(tbl.struct) do
		if not (data[col] or v.auto or v.def) then
			error("No value, .auto or .def for column '"..col.."'")
		elseif v.def and not (data[col] or v.auto) then
			data[col] = v.def
		end
	end

	-- Build the query
	local query = ("INSERT INTO %s\n\tSET %s")
		:format(tbl.ident, detable(data,", "))

	-- Execute the query
	return execute("mysql_insert", query, "Insert row with auto inc id ^0%s^7")
		:next(function(auto_inc_id)
			-- Return a close enough version of the inserted item
			local new = luafun.iter(tbl.struct)
				:map(function(col, v)
					return col, data[col] or v.def or auto_inc_id
				end)
			return tbl:destringify(new)
		end)
end