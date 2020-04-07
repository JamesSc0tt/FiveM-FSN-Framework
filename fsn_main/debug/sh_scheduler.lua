-- TODO: Fix RPC __call and InvokeRpcEvent relying curThread
--[[
	Based on https://github.com/citizenfx/fivem/blob/master/data/shared/citizen/scripting/lua/scheduler.lua
	Thread in this case refers to a coroutine
]]

-- Keeps track of our coroutines
local threads = {}
local is_sv = IsDuplicityVersion()

--[[
	Citizen.CreateThread(f: function)
		Tells the scheduler to manage function *f*
		For use with Citizen.Wait and Citizen.Await
]]
function Citizen.CreateThread(f)
	local i = #threads+1
	threads[i] = {
		c = coroutine.create(f),
		added_trace = Debug.Trace(nil, 2, "> ")
	}
	return i
end


--[[
	Citizen.CreateThreadNow(f: function)
		Does Ctizen.CreateThread(f) and then runs it
]]
function Citizen.CreateThreadNow(f)
	Citizen.RunThread(threads[Citizen.CreateThread(f)])
end


--[[
	Citizen.SetTimeout(ms: number, cb: function)
		CreateThread with a initial timeout of *ms* milliseconds
]]
function Citizen.SetTimeout(ms, cb)
	local i = Citizen.CreateThread(cb)
	threads[i].nextWake = GetGameTimer() + ms
end


--[[
	Citizen.Wait(ms: number)
		Tells the scheduler to wait *ms* milliseconds

		The default scheduler sets nextWake with upvalues
		this version will instead yield our next nextWake
]]
function Citizen.Wait(ms)
	coroutine.yield(GetGameTimer() + ms)
end
Wait = Citizen.Wait -- TODO: Replace with a custom error ("Don't use this")


--[[
	Citizen.Await(f: promise)
		Waits until the given promise *f* has finished

		Errors if not in a coroutine
]]
function Citizen.Await(f)
	error("Not implemented") -- TODO: Implement
end

--[[
	Citizen.RunThread(t: thread)
		Executes a thread, mainly internal
]]
-- Allows us to switch between debug and prod
local thread_runner
function Citizen.RunThread(t)
	local ok, nextWake = thread_runner(t)
	if ok then
		t.nextWake = nextWake
	else
		local msg = "ERROR: "..nextWake
		print(is_sv and ("^1"..msg.."^7") or msg)
		print(Debug.Trace(t.c, 0, "> "))
	end
end

-- Handles all our threads
Citizen.SetTickRoutine(function()
	local time = GetGameTimer()

	for i = #threads, 1, -1 do
		local t = threads[i]

		if coroutine.status(t.c) == "dead" then
			-- This only works since we're going down from #threads
			table.remove(threads, i)
		elseif time >= (t.nextWake or 0) then
			Citizen.RunThread(t)
		end
	end
end)


-- We have 2 thread_runners: production and debug
do
	-- Produciton
	local function runner_prod(t) return coroutine.resume(t.c) end
	thread_runner = runner_prod

	-- "sub frame" means it doesn't need a new game frame for a new value
	local sub_frame_time = IsDuplicityVersion()
		and GetGameTimer
		or  function() return exports["fsn_main"]:sub_frame_time() end

	-- Debug, warns if a coroutine takes more than 2ms
	local function runner_debug(t)
		local time = sub_frame_time()
		local ok, nextWake = coroutine.resume(t.c)
		time = sub_frame_time()-time

		if time >= 2 then
			local msg = "WARN: A thread took "..time.."ms"
			print(is_sv and ("^3"..msg.."^7") or msg)
			print(Debug.Trace(t.c, 1, "> "))

			if t.added_trace then
				local msg = "The thread was created here"
				print(is_sv and ("^3"..msg.."^7") or msg)
				print(t.added_trace)
			end
		end

		return ok, nextWake
	end

	AddEventHandler("fsn_main:debug_toggle", function(debug)
		thread_runner = debug and runner_debug or runner_prod
	end)
end

-- Thread warning test
--[[
local sub_frame_time = IsDuplicityVersion()
	and GetGameTimer
	or  function() return exports["fsn_main"]:sub_frame_time() end

local function thread_test()
	local last = sub_frame_time()
	while true do
		local pre = sub_frame_time()
		print("This should be 5s: ", pre-last)
		for i=1, 2^25 do end
		local post = sub_frame_time()
		print("Busy waited for ", post-pre)
		last = post
		local function wait_indirection_a()
			local function wait_indirection_c()
				--nonexistantfunction()
				Citizen.Wait(5000)
			end
			wait_indirection_c()
		end

		local function wait_indirection_b()
			wait_indirection_a()
		end
		wait_indirection_b()
	end
end

do
	local function add_indirection_a()
		local function add_indirection_c()
			Citizen.CreateThread(thread_test)
		end
		add_indirection_c()
	end

	local function add_indirection_b()
		add_indirection_a()
	end
	add_indirection_b()
end
--]]