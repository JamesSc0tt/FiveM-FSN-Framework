Schemas = {}
local meta = {}

--[[
	This is for fancy error handling
	TODO: Move to fsn_core
]]
local errprefix = "^3[fsn_builders]^7 ^1ERROR:^7 "
local function drop_guard(err)
	local safe = false

	local meta = {
		__gc   = function() assert(safe, errprefix..err) end,
		__call = function() safe = true end
	}
	return setmetatable({}, meta)
end



--[[
	Schema types
]]
local types = {}


function types.string(field, val)
	return XML():inline(field, tostring(val))
end

function types.float(field, val)
	val = tonumber(val)
	val = ("%f"):format(val)
	return XML():void(field, {value=val})
end

function types.integer(field, val)
	val = tonumber(val)
	val = ("%d"):format(math.floor(val))
	return XML():void(field, {value=val})
end

function types.vector(field, val)
	local attrs = {
		x = ("%f"):format(tonumber(val.x or val[1])),
		y = ("%f"):format(tonumber(val.y or val[2])),
		z = ("%f"):format(tonumber(val.z or val[3]))
	}

	return XML():void(field, attrs)
end

function types.SubHandlingData(field, val)
	local xml = XML():open("SubHandlingData")
	for i=1, 3 do
		if val[i] then
			xml:append(val[i])
		else
			xml:void("Item", {type="NULL"})
		end
	end
	return xml:close()
end




--[[
	Schema loading
]]
local function env_for_schema(class)
	local cur_group = "None"
	local cur_field

	local env = {}
	function env.Group(group)
		cur_group = group
	end

	function env.Field(type)
		local guard = drop_guard("A field definition requires a field name")

		return function(field)
			guard()

			cur_field = {}
			cur_field.Group = cur_group
			cur_field.Type  = assert(types[type], "Unknown type "..type)

			Schemas[class][field] = cur_field
		end
	end

	for _, v in pairs({"Desc", "Doc", "Default", "Source", "Limit"}) do
		env[v] = function(str) cur_field[v] = str end
	end

	-- __index is so we can populate default values of arbitrary types
	-- Unfortunately this depends on the order of schema loads
	return setmetatable(env, { __index=Schemas })
end

local function serialize(class, data)
	local xml = XML():open("Item", {type=class})
	for f, fd in pairs(Schemas[class]) do
		local val = data[fd.Source or f]
			or assert(fd.Default, "No (default) value given for field "..f)
		xml:append(fd.Type(f, val))
	end
	return xml:close()
end

function LoadSchema(class, file)
	Schemas[class] = setmetatable({}, {
		__call = function(self, ...) return serialize(class, ...) end
	})

	-- Loading
	local err = errprefix.."Failed to %s ^0'^5"..file.."^0'^7"

	local code = assert(
		LoadResourceFile("fsn_builders", "schemas/"..file),
		err:format("load"))
	
	local fn = assert(
		load(code, "SCHEMA: schemas/"..file, "t", env_for_schema(class)),
		err:format("parse"))

	assert(pcall(fn))

	return Schemas[class]
end