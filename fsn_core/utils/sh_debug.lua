Debug = { IsEnabled = false }

-- Make sure this only runs on fsn_main
-- Allows for @fsn_main/debug/sh_debug.lua in __resource.lua
if GetCurrentResourceName() == "fsn_main" then
	RegisterCommand("fsn_debug", function(src, args, raw)
		if args[1] == "true" or args[1] == false then
			TriggerEvent("fsn_main:debug_toggle", args[1] == "true")
		else
			print("'fsn_debug' = "..tostring(Debug.IsEnabled))
			print('Type: Boolean, Values: "false", "true"')
		end
	end)
end

AddEventHandler("fsn_main:debug_toggle", function(debug)
	Debug.IsEnabled = debug
end)

-- Print except only available with "fsn_debug true"
function Debug.Print(...)
	if Debug.IsEnabled then print(...) end
end

-- Just for pretty errors
function Debug.Trace(f, lvl, prefix)
	local max_src = 0
	local srcs = {}
	local traces  = {}
	for i = 0, 9 do -- Only want the 10 latest lines
		local info = f
			and debug.getinfo(f, lvl+i, "nSl")
			or  debug.getinfo(lvl+i, "nSl")
		if not info then break end

		srcs[i+1] = info.short_src
		if #info.short_src > max_src then
			max_src = #info.short_src
		end

		local cl = info.currentline
		local s = (":%-4s"):format(cl ~= -1 and cl or "?")

		if info.name then
			local fmt = " in %-7s '%s'"
			s = s..fmt:format(info.namewhat, info.name)
		end
		if info.linedefined ~= -1 then
			local fmt = " (def @ %d:%d)"
			s = s..fmt:format(info.linedefined, info.lastlinedefined)
		end
		traces[i+1] = s
	end

	for i, src in ipairs(srcs) do
		local padding = (" "):rep(max_src - #src)
		traces[i] = (prefix or "")..padding..src..traces[i]
	end
	return table.concat(traces, "\n")
end


-- Debug.Print test
--[[
Citizen.CreateThread(function()
	while true do
		Debug.Print("Very debug!")
		Citizen.Wait(1000)
	end
end)
--]]