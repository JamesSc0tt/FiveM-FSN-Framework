local errprefix = "^3[fsn_builders]^7 ^1ERROR:^7 "
--[[
	Translators
]]
local CCarHandlingData = LoadSchema("CCarHandlingData", "ccarhandlingdata.lua")
local CBikeHandlingData = LoadSchema("CBikeHandlingData", "cbikehandlingdata.lua")
local CHandlingData    = LoadSchema("CHandlingData", "chandlingdata.lua")

local function load_file(res, file)
	local err = errprefix.."Failed to %s ^0'^5@"..res.."/"..file.."^0'^7"

	local code = assert(
		LoadResourceFile(res, file),
		err:format("load"))
	
	local env = setmetatable({}, {
		__index = function(self, key) return Schemas[key] or _G[key] end
	})

	local fn = assert(
		load(code, "@"..res.."/"..file, "t", env),
		err:format("parse"))

	return fn()
end


--[[
	FiveM Builder
]]
local builder = {}

function builder.shouldBuild(res)
	return GetNumResourceMetadata(res, "fsn_handling") > 0
end

function builder.build(res, finished)
	local xml = XML():open("CHandlingDataMgr")
		:open("HandlingData")

	for i=1, GetNumResourceMetadata(res, "fsn_handling") do
		local file = GetResourceMetadata(res, "fsn_handling", i-1)
		xml:comment(file)

		local ok, ret = pcall(load_file, res, file)
		if not ok then finished(false, ret) end

		for _, handling in pairs(ret) do
			xml:append(handling)
		end
	end

	local out = xml:close()
		:close()
		:serialize()

	SaveResourceFile(res, "out/handling.meta", out, #out)
	finished(true)
end

local function factory() return builder end 
RegisterResourceBuildTaskFactory("fsn_handling", factory)