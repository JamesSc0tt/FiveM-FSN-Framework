local db_users = DB.NewTable "fsn_users" {
	user_id     = {type="number", auto=true},
	name        = {type="string"},
	steamid     = {type="string"},
	admin_lvl   = {type="number", def="0", auto=true},
	priority    = {type="number", def="0", auto=true},
	connections = {type="number", def="0"},
	banned      = {type="number", def="0"},
	banned_r    = {type="string", def=""}
}

local function on_connect(name, def)
	def.update("\xE2\x8F\xB3Checking identifiers")
	-- They must have a steam identifier
	local si = luafun.grep("^steam:", GetPlayerIdentifiers(source))
	if si:is_null() then
		local msg = "No SteamID detected. "
		msg = msg.."Make sure steam is running and try restarting FiveM"
		return "\xE2\x9A\xA0\xEF\xB8\x8F"..msg
	end
	si = si:head()

	def.update("\xE2\x8F\xB3Waiting on the database")
	while not DB.IsReady do Citizen.Wait(0) end

	-- Get the user if it exists
	local user = Citizen.Await(db_users{steamid=si}:get())
	Citizen.Wait(0) -- Citizen.Await is hella funky atm

	-- Add (and return) user if it doesn't exist
	if not user then
		def.update("\xE2\x8F\xB3Creating your user")
		user = Citizen.Await(db_users:insert{steamid=si, name=name})
		Citizen.Wait(0) -- Citizen.Await is hella funky atm
		def.update("\xE2\x8F\xB3Waiting on the database")
	end

	-- Check if the user is banned
	if user.banned == -1 then
		local msg = "\xF0\x9F\x9B\x91You've been permanently banned from FSN"
		return msg.."\n\xF0\x9F\x93\x9CReason: "..user.banned_r
	elseif user.banned > os.time() then
		local msg = "\xF0\x9F\x9B\x91You've been banned from FSN\n"
		msg = msg.. "\xE2\x8F\xB0Banned until "..os.date("%c", user.banned)
		return msg.."\n\xF0\x9F\x93\x9CReason: "..user.banned_r
	end

	-- Update connection count
	local conns = user.connections + 1
	Citizen.Await(db_users{steamid=si}:update({connections = conns}))
end

AddEventHandler("playerConnecting", function(name, _, deferral)
	deferral.defer()
	local err = on_connect(name, deferral)
	if err then
		deferral.done(err)
		CancelEvent()
	else
		deferral.update("\xF0\x9F\x91\x8D")
		Citizen.Wait(250)
		deferral.done()
	end
end)