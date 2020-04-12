Char = {}

--[[
	Storage
]]
Char.Chars = {}

function Char.BySteam(steamid)
	local chars = Char.Chars[steamid]
	return chars and luafun.iter(chars)
		:map(function(char_id)
			return Char.ByCharId(char_id)
		end)
end

function Char.ByCharId(char_id)
	return Char.Chares[char_id]
end


local db_chars = DB.NewTable "fsn_characters" {
	char_id        = {type="number", auto=true},
	steamid        = {type="string"},
	char_fname     = {type="string"},
	char_lname     = {type="string"},
	char_dob       = {type="string"}, -- VARCHAR(10)v
	char_desc      = {type="string"},
	char_twituname = {type="string", def="notset", auto=true}, -- VARCHAR(20)
	char_licenses  = {type="string"},
	char_phone     = {type="number", def="-1", auto=true},
	char_contacts  = {type="string"},
	char_jailtime  = {type="number", def="0", auto=true},
	char_money     = {type="number"},
	char_bank      = {type="number"},
	char_model     = {type="string"},
	mdl_extras     = {type="string"},
	char_details   = {type="string", def="[]", auto=true}, -- VARCHAR(65000)
	char_inventory = {type="string"},
	char_weapons   = {type="string"},
	char_police    = {type="number", def="0", auto=true},
	char_ems       = {type="number", def="0", auto=true},
	char_doi       = {type="number", def="0", auto=true}
}

local queries = {}

function Char.LoadBySteam(steam_id)
	
end


AddEventHandler("fsn_core:char:request", function(char_id)
	if type(char_id) == "number" then
		Char.LoadChar()
	else
		local si = luafun.grep("^steam:", GetPlayerIdentifiers(source)):head()
		Char.LoadChars(si)
	end
end)